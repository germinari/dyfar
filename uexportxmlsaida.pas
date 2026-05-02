unit uExportXMLSaida;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Spin, EditBtn, Buttons, ComCtrls, ACBrNFe, ACBrNFeDANFeRLClass, ZDataset;

type

  { TfrmExportXMLSaida }

  TfrmExportXMLSaida = class(TForm)
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbxMes: TComboBox;
    ckbGerarPDF: TCheckBox;
    DirectoryEdit1: TDirectoryEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ProgressBar1: TProgressBar;
    spAno: TSpinEdit;
    ZQuery1: TZQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmExportXMLSaida: TfrmExportXMLSaida;

implementation

uses dateutils, WagVclUtils, BDSqlUtils, udbConnect, sistema_config;

{$R *.lfm}

{ TfrmExportXMLSaida }

procedure TfrmExportXMLSaida.FormCreate(Sender: TObject);
begin
  spAno.Value:= YearOf(date);
  cbxMes.Items.AddStrings( StringListMeses() );
  cbxMes.ItemIndex:= MonthOf(Date);
end;

procedure TfrmExportXMLSaida.BitBtn1Click(Sender: TObject);
Var qry : TZQuery;
    dtini, dtfim : TDateTime;
    pasta , stmp: String;
    relatorio : TStringList;
    firstNF, lastNF, n: LongInt;
begin
     StartWait;
     try
      relatorio := TStringList.Create;
      dtini := StartOfAMonth(spAno.Value,cbxMes.ItemIndex);
      dtfim := EndOfAMonth(spAno.Value,cbxMes.ItemIndex);
      {
      qry   := ExecSqlQuery(dbConnect.ZConnection1,'Select nf.id,nf.chave_nfe,nx.xml_str,nf.status_nfe '+
                                           'FROM nfsaida_xml nx '+
                                           'Left Join nfsaida nf ON nx.nfsaida=nf.id '+
                                           'Where nf.dataemissao Between ''%s'' and ''%s''',
                  [DateToStr(dtini),
                   DateToStr(dtfim)]);
       }
      { and status_nfe in (%s)   ,
                           StatusNFe2Str( StatusNFeValid )}
      pasta := NormalDir(DirectoryEdit1.Directory)+Format('xml_sai_%.4d%.2d/',[spAno.Value,cbxMes.ItemIndex]);
      if Not DirectoryExists(pasta) then
         ForceDirectories(pasta);

      relatorio.Add('Relatorio de NF-e');
      relatorio.Add('Referente a .: %s/%.4d',[cbxMes.Text, spAno.Value]);
      relatorio.Add('-------------------------------------------------------------');

      stmp := ExecSql(dbConnect.ZConnection1,'Select max(numeroctlform) From nfsaida Where date_part(''month'',dataemissao)=%d '+
                                             'and date_part(''year'',dataemissao)=%d',
                                             [MonthOf(dtini-1), YearOf(dtini-1)]);
      relatorio.Add('Ultima NF-e do mes anterior : ' + stmp);

      firstNF := StrtoInt(ExecSql(dbConnect.ZConnection1,'Select min(numeroctlform) From nfsaida Where date_part(''month'',dataemissao)=%d '+
                                             'and date_part(''year'',dataemissao)=%d',
                                             [cbxMes.ItemIndex, spAno.Value]));
      relatorio.Add('Primeira NF-e do mes........: %d',[firstNF]);

      lastNF := StrtoInt(ExecSql(dbConnect.ZConnection1,'Select max(numeroctlform) From nfsaida Where date_part(''month'',dataemissao)=%d '+
                                             'and date_part(''year'',dataemissao)=%d',
                                             [cbxMes.ItemIndex, spAno.Value]));
      relatorio.Add('Ultima NF-e do mes..........: %d',[lastNF]);
      relatorio.Add('-------------------------------------------------------------');
      relatorio.Add('');


      ProgressBar1.Visible := True;
      ProgressBar1.Max:= lastNF - firstNF;//qry.RecordCount;
      ProgressBar1.Position:= 0;
//      While not qry.Eof do begin
      for n := firstNF to lastNF do
      begin                                                                     //nx.xml_str
          qry := ExecSqlQuery(dbConnect.ZConnection1,'Select nf.id,nf.chave_nfe,nf.status_nfe '+
                                                   'FROM nfsaida nf '+
                                                   'Where nf.numeroctlform=%d',
                                                   [n]);


        Application.ProcessMessages;
        ProgressBar1.Position:= ProgressBar1.Position + 1;
        Update;
        {snfIniciada , snfPendente   , snfErro,
                   snfDenegada , snfAutorizada , snfContingencia,
                   snfCancelada, snfInutilizada, snfEPEC}
        if qry.IsEmpty then
        begin
          stmp := ExecSql(dbConnect.ZConnection1,'Select count(*) From nfe_inutilizacao where numero=%d',[n]);
          if StrToIntDef(stmp,0) > 0 then
             relatorio.Add('NF-e %.6d Inutilizada',[n])
          else
             relatorio.Add('NF-e %.6d Nao localizada',[n]);

          continue;

        end;
        if Str2StatusNFe(qry.FieldByName('status_nfe').AsString) = snfAutorizada then
        Begin
          ExportXMLToFile(dbConnect.ZConnection1,'nfsaida_xml','nfsaida',qry.FieldByName('id').AsString,
                                                  'xml_str', pasta + qry.FieldByName('chave_nfe').AsString+'-nfe.xml' );
          if ckbGerarPDF.Checked then
          begin
            ACBrNFe1.NotasFiscais.Clear;
            ACBrNFe1.NotasFiscais.LoadFromFile(pasta + qry.FieldByName('chave_nfe').AsString+'-nfe.xml');
            ACBrNFe1.DANFE.PathPDF := pasta;
            ACBrNFe1.DANFE.ExpandeLogoMarca:= True;
            ACBrNFe1.DANFE.Logo    := obtemPathSistemaNFe(tpsImagens)+'logo_nfe.jpg';
            ACBrNFe1.NotasFiscais.ImprimirPDF;
          end;
        end else
          relatorio.Add(qry.FieldByName('chave_nfe').AsString+#9+qry.FieldByName('status_nfe').AsString);
        qry.Next;
      end;
      ShowMessage('Exportação concluída.');
      ProgressBar1.Visible := False;
     finally
       relatorio.SaveToFile(pasta + Format('/relatorio_nfe_%.4d%.2d',[spAno.Value,cbxMes.ItemIndex])+'.txt');
       StopWait;
     end;
end;


initialization
 RegisterClass(TfrmExportXMLSaida);

end.

