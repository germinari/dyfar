unit uDistribuicaoNFe;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  rxmemds, rxdbgrid, ACBrNFe, ACBrNFeDANFeRLClass, ZDataset, ZSqlUpdate,
  ACBrDFeSSL, Grids, DBGrids, Spin;

type

  { TfrmDistribuicaoNFe }

  TfrmDistribuicaoNFe = class(TForm)
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    Button1: TButton;
    btDownloadNFe: TButton;
    btManifestar: TButton;
    btVerXML: TButton;
    btVerDANFE: TButton;
    cbxLimite: TComboBox;
    DataSource1: TDataSource;
    edNSU: TEdit;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    RxDBGrid1: TRxDBGrid;
    ZQuery1: TZQuery;
    ZQuery1baixado: TBooleanField;
    ZQuery1chave_nfe: TStringField;
    ZQuery1cnpj: TStringField;
    ZQuery1data_hora: TDateTimeField;
    ZQuery1evento_registrado: TStringField;
    ZQuery1nnfe: TStringField;
    ZQuery1nsu: TLongintField;
    ZQuery1oid_xml: TLongintField;
    ZQuery1selecionado: TBooleanField;
    ZQuery1ssitdfe: TStringField;
    ZQuery1tipo_evento: TStringField;
    ZQuery1vnf: TFloatField;
    ZQuery1xnome: TStringField;
    ZUpdateSQL1: TZUpdateSQL;
    procedure Button1Click(Sender: TObject);
    procedure btDownloadNFeClick(Sender: TObject);
    procedure btManifestarClick(Sender: TObject);
    procedure btVerXMLClick(Sender: TObject);
    procedure btVerDANFEClick(Sender: TObject);
    procedure cbxLimiteChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RxDBGrid1CellClick(Column: TColumn);
  private
    procedure obtemNFeChave(const chave_nfe: String);
    procedure obtemNovosEventos;
    procedure openEventos;
  public
      qry: TZQuery;
  end;

var
  frmDistribuicaoNFe: TfrmDistribuicaoNFe;

implementation

uses sistema_config, udbConnect, strutils, dateutils, ACBrUtil, pcnAuxiliar,
  pcnConversao, BDSqlUtils, pcnConversaoNFe, WagVclUtils;

{$R *.lfm}

{ TfrmDistribuicaoNFe }

procedure TfrmDistribuicaoNFe.Button1Click(Sender: TObject);
begin
    if Length(edNSU.Text) = 44 then
       obtemNFeChave( edNSU.Text )
    else
       obtemNovosEventos();
end;

procedure TfrmDistribuicaoNFe.btManifestarClick(Sender: TObject);
Var xJust , lMsg: String;
    opcoes : Array[0..3] of String = ('Ciência da Emissão', 'Confirmação da Operação', 'Desconhecimento da Operação','Operação não Realizada');
    res: Integer;
    evento : TpcnTpEvento;
    idLote: LongInt;
begin

   {teManifDestConfirmacao,teManifDestCiencia, teManifDestDesconhecimento, teManifDestOperNaoRealizada}
   res := InputCombo('Tipo de manifestação','Selecione tipo',opcoes);
   case res of
      0 : evento := teManifDestCiencia;  //210210
      1 : evento := teManifDestConfirmacao;//210200
      2 : evento := teManifDestDesconhecimento;//210220
      3 : evento := teManifDestOperNaoRealizada;//210220
      else exit;
   end;             //'210200', '210210', '210220','210240'
//teManifDestConfirmacao,teManifDestCiencia, teManifDestDesconhecimento, teManifDestOperNaoRealizada
   //qry := InicializaConfigNFe(ACBrNFe1);
   xJust := '';
   if evento in [teManifDestDesconhecimento,teManifDestOperNaoRealizada] then
   begin
     if Not InputQuery('Justificativa','Uma Justificativa é obrigatório.',xJust) then
        Raise Exception.Create('Uma Justificativa é obrigatório.');
   end;
   idLote:= DateTimeToDosDateTime(Now());//FormatDateTimeBr(Now(),'yymmddhhnn');
   ACBrNFe1.EventoNFe.Evento.Clear;
   with ACBrNFe1.EventoNFe.Evento.New do
  begin
    InfEvento.cOrgao   := 91;
    infEvento.chNFe    := ZQuery1chave_nfe.AsString;
    infEvento.CNPJ     := qry.FieldByName('cnpj').AsString;
    infEvento.dhEvento := ZQuery1data_hora.AsDateTime;// now;
    infEvento.tpEvento := evento;//teManifDestConfirmacao;
    infEvento.detEvento.xJust := xJust;
  end;
   if ACBrNFe1.EnviarEvento(idLote) then
   begin
       with AcbrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento do
       begin
         lMsg:=
         'Id: '+Id+#13+
         'tpAmb: '+TpAmbToStr(tpAmb)+#13+
         'verAplic: '+verAplic+#13+
         'cOrgao: '+IntToStr(cOrgao)+#13+
         'cStat: '+IntToStr(cStat)+#13+
         'xMotivo: '+xMotivo+#13+
         'chNFe: '+chNFe+#13+
         'tpEvento: '+TpEventoToStr(tpEvento)+#13+
         'xEvento: '+xEvento+#13+
         'nSeqEvento: '+IntToStr(nSeqEvento)+#13+
         'CNPJDest: '+CNPJDest+#13+
         'emailDest: '+emailDest+#13+
         'dhRegEvento: '+DateTimeToStr(dhRegEvento)+#13+
         'nProt: '+nProt;
         if cStat = 128 then
         begin
           ExecSql(dbConnect.ZConnection1,'UPDATE nfentrada_md SET evento_registrado=''%s'' '+
                 'WHERE nsu=%d',
                 [TpEventoToStr(tpEvento),
                  ZQuery1nsu.AsInteger]);
           ZQuery1.Edit;
           ZQuery1evento_registrado.AsString := TpEventoToStr(tpEvento);
           PostTable(ZQuery1);
         end;
       end;
       ShowMessage(lMsg);
  end;
end;

procedure TfrmDistribuicaoNFe.btVerXMLClick(Sender: TObject);
var
  filename, xml: String;
begin
  if not ZQuery1baixado.AsBoolean then
     Raise Exception.Create('Só é possível visualizar XML baixados.');
  xml := ExecSql(dbConnect.ZConnection1,'Select lo_get(oid_xml) From nfentrada_md Where nsu=%s',[ZQuery1nsu.AsString]);
  filename := GetTempDir + ZQuery1chave_nfe.AsString + '-nfe.xml';
  SaveStringToFile(xml,filename);
  OpenURL(filename);
end;

procedure TfrmDistribuicaoNFe.btVerDANFEClick(Sender: TObject);
var
  xml: String;
begin
  if not ZQuery1baixado.AsBoolean then
     Raise Exception.Create('Só é possível visualizar DANFE de XML baixados.');
  xml := ExecSql(dbConnect.ZConnection1,'Select lo_get(oid_xml) From nfentrada_md Where nsu=%s',[ZQuery1nsu.AsString]);
  ACBrNFe1.NotasFiscais.Clear;
  ACBrNFe1.NotasFiscais.LoadFromString(xml,true);
  ACBrNFe1.DANFE.Logo := '';
  ACBrNFe1.DANFE.Site := '';
  ACBrNFe1.DANFE.ExpandeLogoMarca := False;
  ACBrNFe1.DANFE.MostraPreview:= True;
  ACBrNFe1.DANFE.ImprimirDANFE();
end;

procedure TfrmDistribuicaoNFe.cbxLimiteChange(Sender: TObject);
begin
   openEventos;
end;

procedure TfrmDistribuicaoNFe.FormCreate(Sender: TObject);
begin
   edNSU.Text := ExecSql(dbConnect.ZConnection1,'Select max(nsu) from nfentrada_md');
   Label1.Caption := 'Último NSU '+edNSU.Text;
   qry := InicializaConfigNFe(ACBrNFe1, 2);
   openEventos
end;

procedure TfrmDistribuicaoNFe.RxDBGrid1CellClick(Column: TColumn);
begin
  btVerXML.Enabled   := ZQuery1baixado.AsBoolean;
  btVerDANFE.Enabled := ZQuery1baixado.AsBoolean;
end;

procedure TfrmDistribuicaoNFe.obtemNFeChave(const chave_nfe: String);
var
 cUFAutor, CNPJ, ultNSU, ANSU, baixado: string;
 ok: boolean;
 i: Integer;
 qryTmp: TZQuery;
begin
(*
    ACBrNFe1.Configuracoes.WebServices.Visualizar:= True;
//    ACBrNFe1.WebServices.StatusServico.Executar;
    CNPJ     := qry.FieldByName('cnpj').AsString;
    cUFAutor := qry.FieldByName('uf').AsString;
    ultNSU   := '';
    ANSU     := '';
    StartWait;
    try
        ACBrNFe1.DistribuicaoDFePorChaveNFe( UFtoCUF(cUFAutor),CNPJ,chave_nfe);
        if ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.cStat = 138 then
        begin
            RxMemoryData1.CloseOpen;
            for i := 0 to ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Count - 1 do
            begin
                //procNFe_v4.00.
                  if ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].schema = schresNFe then
                  begin
                    qryTmp := ExecSqlQuery(dbConnect.ZConnection1,'Select oid_xml,tpevento From nfentrada_manifestacao Where nsu=%d',[StrToIntDef(ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].NSU,0)]);
                    RxMemoryData1.AppendRecord([ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].resDFe.chDFe,
                                                ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].resDFe.xNome,
                                                ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].resDFe.CNPJCPF,
                                                ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].resDFe.IE,
                                                ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].resDFe.dhEmi,
                                                ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].resDFe.dhRecbto,
                                                ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].resDFe.vNF,
                                                ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].NSU,
                                                tpNFToStr(ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.tpNF),
                                                SituacaoDFeToStr(ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.cSitDFe),
                                                (qryTmp.FieldByName('oid_xml').AsInteger > 0),
                                                false,
                                                qryTmp.FieldByName('tpevento').AsString
                                                ]);
                  end;
//////                  if ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].schema = schprocNFe then
//////                  begin
//////                     qryTmp := ExecSqlQuery(dbConnect.ZConnection1,'Select oid_xml,tpevento From nfentrada_manifestacao Where nsu=%d',[StrToIntDef(ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].NSU,0)]);
//////                     RxMemoryData1.AppendRecord([ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].resDFe.chDFe,
//////                                                 ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].resDFe.xNome,
//////                                                 ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].resDFe.CNPJCPF,
//////                                                 ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].resDFe.IE,
//////                                                 ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].resDFe.dhEmi,
//////                                                 ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].resDFe.dhRecbto,
//////                                                 ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].resDFe.vNF,
//////                                                 ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].NSU,
//////                                                 tpNFToStr(ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.tpNF),
//////                                                 SituacaoDFeToStr(ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.cSitDFe),
//////                                                 (qryTmp.FieldByName('oid_xml').AsInteger > 0),
//////                                                 false,
//////                                                 qryTmp.FieldByName('tpevento').AsString
//////                                                 ]);
////////                     oid:= ImportFileToServer(dbConnect.ZConnection1,obtemPathSistemaNFe(tpsTmp)+ACBrNFe1.WebServices.DistribuicaoDFe.NomeArq);
//////                    ExecSql(dbConnect.ZConnection1,'INSERT INTO nfentrada_manifestacao('+
//////                                                'chave_nfe, csitnfe, tpevento, nsu, data_evento, protocolo) '+
//////                                                'VALUES(''%s'', %s, %s, %s, ''%s'', ''%s'')',
//////                                                 [ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].resDFe.chDFe,
//////                                                  RxMemoryData1status.AsString,
//////                                                  TpEventoToStr(ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].procEvento.tpEvento),
//////                                                  ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].NSU,
//////                                                  DateTimeToStr(dhRegEvento),
//////                                                  nProt]);
//////                     ExecSql(dbConnect.ZConnection1,'INSERT INTO nfentrada_manifestacao(chave_nfe, csitnfe, tpevento, nsu, data_evento, protocolo, oid_xml) '+
//////                                                    'VALUES('', 0, 0, 0, '', '', 0);
//////                                                    'On Conflict',
//////                                                    [ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].resDFe.chDFe,
//////                                                     ]);
//////
//////                     Update nfentrada_manifestacao Set oid_xml=%d Where nsu=%s',[oid, RxMemoryData1nsu.AsString]);
//////                     RxMemoryData1.Edit;
//////                     RxMemoryData1baixada.AsBoolean := True;
//////                     RxMemoryData1.Post;
//////
//////                  end;
            end;
        end;
    finally
      StopWait;
    end;
*)
end;

procedure TfrmDistribuicaoNFe.obtemNovosEventos;
var
 cUFAutor, CNPJ, ultNSU, ANSU, baixado, chavenfe, chave_nfe, xNome,
   sSitDFe, descEvento, evento_registrado: string;
 ok: boolean;
 i,ultimoNSU,maxNSU: Integer;
 qryTmp: TZQuery;
 data_hora: TDateTime;
 vNF: Currency;
begin
    InicializaConfigNFe(ACBrNFe1,2);
    ACBrNFe1.Configuracoes.WebServices.Visualizar:= false;
    CNPJ     := qry.FieldByName('cnpj').AsString;
    cUFAutor := qry.FieldByName('uf').AsString;
    ultNSU   := '';
    ANSU     := '';
    ultimoNSU:= StrToIntDef(edNSU.Text,0);
    maxNSU   := StrToIntDef(edNSU.Text,0)+1;
    StartWait;
    try
        //while (ultimoNSU < maxNSU ) do
        begin
              ACBrNFe1.DistribuicaoDFePorUltNSU( UFtoCUF(cUFAutor),CNPJ, IntTostr(ultimoNSU));
              if ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.cStat = 138 then
              begin
                  Label1.Caption := Format('ultNSU=%d , maxNSU=%d ',
                                           [StrToIntDef(ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU,0),
                                            StrToIntDef(ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.maxNSU,0)]);
                  ultimoNSU:= StrToIntDef(ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU,0);
                  maxNSU   := StrToIntDef(ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.maxNSU,0);
                  edNSU.Text := ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU;
                  Label2.Visible := (ultimoNSU < maxNSU);
                  for i := 0 to ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Count - 1 do
                  begin
                     vNF   := 0.00;
                     xNome := '';
                     sSitDFe:= '';
                     sSitDFe   := SituacaoDFeToStr(ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.cSitDFe);
                     evento_registrado := '-99999';
                     if ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].schema = schresNFe then
                     begin
                        chave_nfe := ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.chDFe;
                        vNF   := ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.vNF;
                        xNome := ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.xNome;
                        data_hora := ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.dhEmi;
                        sSitDFe   := SituacaoDFeToStr(ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.cSitDFe);
                        evento_registrado := '';
                     end;
                     if ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].schema = schresEvento then
                     begin
                        chave_nfe := ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resEvento.chDFe;
                        data_hora := ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resEvento.dhEvento;
                        xNome := ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resEvento.xEvento;
                        evento_registrado := TpEventoToStr(ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resEvento.tpEvento);
                     end;

                     if ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].schema = schprocEventoNFe then
                     begin
                        chave_nfe := ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].procEvento.chDFe;
                        data_hora := ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].procEvento.dhEvento;
                        evento_registrado := TpEventoToStr(ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].procEvento.tpEvento);
                     end;

                     if ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].schema = schprocNFe then
                     begin
                        chave_nfe := ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.chDFe;
                        data_hora := ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.dhEmi;
                        evento_registrado := '000000';
                     end;
                     SetDecimalSeparator;
                     try

                        ExecSql(dbConnect.ZConnection1,'INSERT INTO nfentrada_md(nsu, tipo_evento, data_hora, chave_nfe, vnf, xnome,ssitdfe,evento_registrado) '+
                                                       'VALUES(%s, ''%s'', ''%s'', ''%s'',%f, ''%s'', ''%s'',''%s'')',
                                                       [ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].NSU,
                                                        SchemaDFeToStr(ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].schema),
                                                        DateToyyyymmddhhmmss(data_hora),
                                                        chave_nfe,
                                                        vNF,
                                                        xNome,
                                                        sSitDFe,
                                                        evento_registrado]);
                     Except
                       ExecSql(dbConnect.ZConnection1,'UPDATE nfentrada_md SET tipo_evento=''%s'', '+
                       'data_hora=''%s'', chave_nfe=''%s'', vnf=%f, xnome=''%s'', ssitdfe=''%s'', evento_registrado=''%s'' '+
                       'WHERE nsu=%d',
                       [SchemaDFeToStr(ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].schema),
                        DateToyyyymmddhhmmss(data_hora),
                        chave_nfe,
                        vNF,
                        xNome,
                        sSitDFe,
                        evento_registrado,
                        StrToIntDef(ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.docZip.Items[i].NSU,0)]);
                     end;
                     RestoreDecimalSeparator;
                  end;
              end;
              if ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.cStat = 137 then
              //Nenhum documento localizado
              begin
                 ExecSql(dbConnect.ZConnection1,'INSERT INTO nfentrada_md(nsu, tipo_evento, data_hora) '+
                                                'VALUES(%s, ''ultNSU'', ''%s'')',
                                                [ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.ultNSU,
                                                 DateToyyyymmddhhmmss(ACBrNFe1.WebServices.DistribuicaoDFe.RetDistDFeInt.dhResp)]);
              end;
        end;{While}
        edNSU.Text := ExecSql(dbConnect.ZConnection1,'Select max(nsu) from nfentrada_md');
        Label1.Caption := 'Último NSU '+edNSU.Text;
        openEventos;
    finally
      StopWait;
    end;
end;

procedure TfrmDistribuicaoNFe.openEventos;
begin
  ZQuery1.Close;
  ZQuery1.Sql.Clear;
  ZQuery1.Sql.Add('SELECT false as selecionado,(coalesce(oid_xml,0) > 0) as baixado, nsu,tipo_evento ,');
  ZQuery1.Sql.Add('data_hora , chave_nfe ,');
  ZQuery1.Sql.Add('substr(chave_nfe,7,14)::::varchar(14) AS cnpj,');
  ZQuery1.Sql.Add('substr(chave_nfe,26,9)::::varchar(9) AS nnfe ,');
  ZQuery1.Sql.Add('vnf,xnome,ssitdfe, oid_xml, evento_registrado');
  ZQuery1.Sql.Add('FROM nfentrada_md nm');
  ZQuery1.Sql.Add('WHERE tipo_evento = ''resNFe''');
  ZQuery1.Sql.Add('Order by nsu desc');
  case cbxLimite.ItemIndex of
     0 :   ZQuery1.Sql.Add('Limit 50');
     1 :   ZQuery1.Sql.Add('Limit 100');
     2 :   ZQuery1.Sql.Add('Limit All');
  end;
  OpenTable( ZQuery1 );
end;

procedure TfrmDistribuicaoNFe.btDownloadNFeClick(Sender: TObject);
var
  i, oid: Integer;
  ok: boolean;
  filename: RawByteString;
  //id: String;
begin
   //qry := InicializaConfigNFe(ACBrNFe1);
   //RxMemoryData1.First;
   //while not RxMemoryData1.Eof do
   begin
       //if RxMemoryData1selecionado.AsBoolean and (Not RxMemoryData1baixada.AsBoolean) then
       begin
           //if not(StrToTpEvento(ok,RxMemoryData1tpevento.AsString) in [teManifDestConfirmacao,teManifDestCiencia]) then
           //   ShowMessage('Para fazer o download é necessário manifestar ciencia ou confirmação da operação.')
           //else
           begin
               ACBrNFe1.DistribuicaoDFePorChaveNFe( UFtoCUF(qry.FieldByName('uf').AsString),qry.FieldByName('cnpj').AsString,ZQuery1chave_nfe.AsString);
               if ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.cStat = 138 then
               begin
                  for i := 0 to ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Count - 1 do
                  begin
                     filename := obtemPathSistemaNFe(tpsTmp)+ACBrNFe1.WebServices.DistribuicaoDFe.NomeArq;
                     if FileExists(filename) then
                     begin
                        if ZQuery1oid_xml.AsInteger > 0 then
                           OverrideFileToServer(dbConnect.ZConnection1,ZQuery1oid_xml.AsInteger,obtemPathSistemaNFe(tpsTmp)+ACBrNFe1.WebServices.DistribuicaoDFe.NomeArq)
                        else
                        begin
                           oid:= ImportFileToServer(dbConnect.ZConnection1,obtemPathSistemaNFe(tpsTmp)+ACBrNFe1.WebServices.DistribuicaoDFe.NomeArq);
                           ExecSql(dbConnect.ZConnection1,'Update nfentrada_md Set oid_xml=%d Where nsu=%s',[oid, ZQuery1nsu.AsString]);
                        end;
                      end;
                  end;
               end else
               begin
                 ShowMessageFmt('%d-%s',[ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.cStat,
                                         ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.xMotivo]);
                 Exit;
               end;
           end;
       end;
      //RefreshTable( ZQuery1 );
   end;
   RefreshTable( ZQuery1 );
   ShowMessage('Feito download de todas as notas selecionadas.');
end;

end.

