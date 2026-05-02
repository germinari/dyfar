unit uExportXMLEntrada;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Spin, EditBtn, Buttons, ComCtrls, ZDataset;

type

  { TfrmExportXMLEntrada }

  TfrmExportXMLEntrada = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbxMes: TComboBox;
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
  frmExportXMLEntrada: TfrmExportXMLEntrada;

implementation

uses dateutils, WagVclUtils, BDSqlUtils, udbConnect;

{$R *.lfm}

{ TfrmExportXMLEntrada }

procedure TfrmExportXMLEntrada.FormCreate(Sender: TObject);
begin
  spAno.Value:= YearOf(date);
  cbxMes.Items.AddStrings( StringListMeses() );
  cbxMes.ItemIndex:= MonthOf(Date);
end;

procedure TfrmExportXMLEntrada.BitBtn1Click(Sender: TObject);
Var qry : TZQuery;
    dtini, dtfim : TDateTime;
    pasta : String;
begin
     StartWait;
     try
      dtini := StartOfAMonth(spAno.Value,cbxMes.ItemIndex);
      dtfim := EndOfAMonth(spAno.Value,cbxMes.ItemIndex);
      qry   := ExecSqlQuery(dbConnect.ZConnection1,'Select nf.id,nf.chave_nfe,nx.xml_str from nfentrada_xml nx Left Join nfentrada nf ON nx.nfentrada=nf.id Where nf.dataentrada Between ''%s'' and ''%s''',
                          [DateToStr(dtini),DateToStr(dtfim)]);
      pasta := NormalDir(DirectoryEdit1.Directory)+Format('xml_ent_%.4d%.2d/',[spAno.Value,cbxMes.ItemIndex]);
      if Not DirectoryExists(pasta) then
         ForceDirectories(pasta);
      ProgressBar1.Visible := True;
      ProgressBar1.Max:= qry.RecordCount;
      ProgressBar1.Position:= 0;
      While not qry.Eof do begin
        Application.ProcessMessages;
        ProgressBar1.Position:= ProgressBar1.Position + 1;
        Update;
        //if qry.FieldByName('xml').AsInteger > 0 then
        ExportXMLToFile(dbConnect.ZConnection1,'nfentrada_xml','nfentrada',qry.FieldByName('id').AsString,
                                                'xml_str', pasta + qry.FieldByName('chave_nfe').AsString+'-nfe.xml' );

        qry.Next;
      end;
      ShowMessage('Exportação concluída.');
      ProgressBar1.Visible := False;
     finally
       StopWait;
     end;
end;


initialization
 RegisterClass(TfrmExportXMLEntrada);

end.

