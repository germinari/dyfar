unit uCadEmpresa;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, Forms, Controls, Graphics, Dialogs,
  ComCtrls, DbCtrls, StdCtrls, Buttons, ExtCtrls, ExtDlgs, WAGDBNavigator,
  ACBrNFe, rxdbcomb, udbConnect, db, ZDataset;

type

  { TfrmCadEmpresa }

  TfrmCadEmpresa = class(TForm)
    ACBrNFe1: TACBrNFe;
    btImportarCertificado: TSpeedButton;
    btExportarCertificado: TSpeedButton;
    btImportarCertificado1: TSpeedButton;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    DBEdit53: TDBEdit;
    dsBoletoConfig: TDataSource;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBEdit1: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    DividerBevel1: TDividerBevel;
    DividerBevel2: TDividerBevel;
    dsEmpresa: TDataSource;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label4: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label5: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label6: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    OpenDialog1: TOpenDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    PageControl1: TPageControl;
    Panel1: TPanel;
    qryBoletoConfigaceite: TBooleanField;
    qryBoletoConfigagencia: TStringField;
    qryBoletoConfigagencia_digito: TStringField;
    qryBoletoConfigbanco: TLongintField;
    qryBoletoConfigcaracteristica_titulo: TLongintField;
    qryBoletoConfigcarteira: TStringField;
    qryBoletoConfigcodigo_cedente: TStringField;
    qryBoletoConfigcodigo_transmissao: TStringField;
    qryBoletoConfigconvenio: TStringField;
    qryBoletoConfigemitido_por: TStringField;
    qryBoletoConfigespecie_doc: TStringField;
    qryBoletoConfigespecie_moeda: TStringField;
    qryBoletoConfigid: TLongintField;
    qryBoletoConfiglayout: TLongintField;
    qryBoletoConfiglocal_pagamento: TStringField;
    qryBoletoConfigmodalidade: TStringField;
    qryBoletoConfignome: TStringField;
    qryBoletoConfignumero_conta: TStringField;
    qryBoletoConfignumero_conta_digito: TStringField;
    qryBoletoConfignumero_res: TStringField;
    qryBoletoConfigorientacoes: TMemoField;
    qryBoletoConfigtipo_carteira: TLongintField;
    qryBoletoConfigtipo_documento: TLongintField;
    qryBoletoConfigtipo_inscricao: TLongintField;
    qryEmpresa: TZQuery;
    qryEmpresaabreviacao: TStringField;
    qryEmpresaaliquota_sn: TFloatField;
    qryEmpresabairro: TStringField;
    qryEmpresacep: TStringField;
    qryEmpresacidade: TStringField;
    qryEmpresacnpj: TStringField;
    qryEmpresacomplemento: TStringField;
    qryEmpresacrt: TLongintField;
    qryEmpresacsc: TStringField;
    qryEmpresadados_adcionais: TMemoField;
    qryEmpresadh_vcto_certificado: TDateTimeField;
    qryEmpresafantasia: TStringField;
    qryEmpresafone: TStringField;
    qryEmpresagera_direito_credito: TBooleanField;
    qryEmpresaid: TLongintField;
    qryEmpresaid_csc: TStringField;
    qryEmpresaie: TStringField;
    qryEmpresaie_substituto: TStringField;
    qryEmpresalogradouro: TStringField;
    qryEmpresanome: TStringField;
    qryEmpresanumero: TStringField;
    qryEmpresanum_serie_certificado: TStringField;
    qryEmpresapathnfe: TStringField;
    qryEmpresapath_certificado: TStringField;
    qryEmpresapcbs: TFloatField;
    qryEmpresapibsmun: TFloatField;
    qryEmpresapibsuf: TFloatField;
    qryEmpresaresponsavel: TStringField;
    qryEmpresasenha_cert_digital: TStringField;
    qryEmpresasmtphost: TStringField;
    qryEmpresasmtpporta: TStringField;
    qryEmpresasmtpsenha: TStringField;
    qryEmpresasmtpssl: TBooleanField;
    qryEmpresasmtptls: TBooleanField;
    qryEmpresasmtpusuario: TStringField;
    qryEmpresatributos_totais: TMemoField;
    qryEmpresauf: TStringField;
    qryEmpresaultima_nfce_autorizada: TLongintField;
    qryEmpresaultima_nfe_autorizada: TLongintField;
    qryEmpresawebpage: TStringField;
    RxDBComboBox1: TRxDBComboBox;
    RxDBComboBox11: TRxDBComboBox;
    RxDBComboBox2: TRxDBComboBox;
    RxDBComboBox3: TRxDBComboBox;
    RxDBComboBox4: TRxDBComboBox;
    RxDBComboBox5: TRxDBComboBox;
    RxDBComboBox6: TRxDBComboBox;
    RxDBComboBox7: TRxDBComboBox;
    RxDBComboBox8: TRxDBComboBox;
    btLogoNFe: TSpeedButton;
    btVisualizarSenha: TSpeedButton;
    btLogoSistema: TSpeedButton;
    SpeedButton4: TSpeedButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    qryBoletoConfig: TZQuery;
    procedure btExportarCertificadoClick(Sender: TObject);
    procedure btImportarCertificado1Click(Sender: TObject);
    procedure btVisualizarSenhaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure qryEmpresaAfterPost(DataSet: TDataSet);
    procedure btLogoNFeClick(Sender: TObject);
    procedure btImportarCertificadoClick(Sender: TObject);
    procedure btLogoSistemaClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure WAGDBNavigator1AfterScroll(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmCadEmpresa: TfrmCadEmpresa;

implementation

uses BDSqlUtils, WagVclUtils, DBBlobImage, LazFileUtils, ACBrBoleto,
  ACBrBoletoConversao, ACBrUtil, sistema_config, uSelecionarCertificado,
  typinfo, strutils;

{$R *.lfm}

{ TfrmCadEmpresa }

procedure TfrmCadEmpresa.ToolButton12Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadEmpresa.FormCreate(Sender: TObject);
Var i : Integer;
    cob : TACBrTipoCobranca;
begin
  //WAGDBNavigator1.Open;
  i := 0;
  for TACBrTipoCobranca(cob) in TACBrTipoCobranca do begin
    RxDBComboBox1.Items.Add(GetEnumName(TypeInfo(TACBrTipoCobranca), i));
    RxDBComboBox1.Values.Add(IntTostr( i) );
    i += 1;
  end;

  i := 0;
  for TACBrCaracTitulo(cob) in TACBrCaracTitulo do begin
    RxDBComboBox2.Items.Add(GetEnumName(TypeInfo(TACBrCaracTitulo), i));
    RxDBComboBox2.Values.Add(IntTostr( i) );
    i += 1;
  end;
  i := 0;
  for TACBrResponEmissao(cob) in TACBrResponEmissao do begin
    RxDBComboBox3.Items.Add(GetEnumName(TypeInfo(TACBrResponEmissao), i));
    RxDBComboBox3.Values.Add(IntTostr( i) );
    i += 1;
  end;

  i := 0;
  for TACBrTipoCarteira(cob) in TACBrTipoCarteira do begin
    RxDBComboBox4.Items.Add(GetEnumName(TypeInfo(TACBrTipoCarteira), i));
    RxDBComboBox4.Values.Add(IntTostr( i) );
    i += 1;
  end;
  i := 1;
  for TACBrTipoDocumento(cob) in TACBrTipoDocumento do begin
    RxDBComboBox5.Items.Add(GetEnumName(TypeInfo(TACBrTipoDocumento), i));
    RxDBComboBox5.Values.Add(IntTostr( i) );
    i += 1;
  end;
  i := 0;
  for TACBrPessoa(cob) in TACBrPessoa do begin
    RxDBComboBox6.Items.Add(GetEnumName(TypeInfo(TACBrPessoa), i));
    RxDBComboBox6.Values.Add(IntTostr( i) );
    i += 1;
  end;

  i := 0;
  for TACBrBolLayOut(cob) in TACBrBolLayOut do begin
    RxDBComboBox7.Items.Add(GetEnumName(TypeInfo(TACBrBolLayOut), i));
    RxDBComboBox7.Values.Add(IntTostr( i) );
    i += 1;
  end;
  OpenTable( qryBoletoConfig );
  WAGDBNavigator1AfterScroll(nil);
end;

procedure TfrmCadEmpresa.btVisualizarSenhaClick(Sender: TObject);
begin
  if DBEdit21.PasswordChar = '*' then
     DBEdit21.PasswordChar := char(0)
  else DBEdit21.PasswordChar := char('*');
end;

procedure TfrmCadEmpresa.btExportarCertificadoClick(Sender: TObject);
Var filename, destFile,senha : String;
    qry : TZQuery;
begin
  if EstaVazio( qry.FieldByName('path_certificado').AsString ) then
  begin
     Raise Exception.Create('Não há certificado para exportar.');
  end;
  if Not SelectDirectory('Selecione a pasta de destino', HomeDir(),destFile) then exit;
  StartWait;
  try
    filename := AppendPathDelim( destFile ) + qryEmpresapath_certificado.AsString;
    qry := ExecSqlQuery(dbConnect.ZConnection1,'SELECT empresa, extencao,tipo_dado, dado, id,dh_atualizado '+
                          'FROM empresa_arquivos Where empresa=%d and tipo_dado=''%s''',
                          [qryEmpresaid.AsInteger,'certificado']);
    ExportaFileFromDB(qry,'dado',filename );
    if Not FileExists(FileName) then
       Raise Exception.Create('Houve um erro ao exportada certificado digital.');
    StopWait;
    MessageDlg(Format('Certificado exportado com sucesso para : %s ',[filename]),mtInformation,[mbOk],0);
  finally
    StopWait;
  end;
end;

procedure TfrmCadEmpresa.btImportarCertificado1Click(Sender: TObject);
var
  I: Integer;
  senha: String;
  vListaCertificados: TStringList;
begin
  InicializaConfigNFe(ACBrNFe1, qryEmpresaid.AsInteger );
  frSelecionarCertificado := TfrSelecionarCertificado.Create(Self);
  try
    //ACBrNFe1.Configuracoes.Geral.ListarCertificados(vListaCertificados);
    ACBrNFe1.SSL.LerCertificadosStore;
    For I := 0 to ACBrNFe1.SSL.ListaCertificados.Count-1 do
    begin
      with ACBrNFe1.SSL.ListaCertificados[I] do
      begin
        if (CNPJ <> '') then
        begin
          with frSelecionarCertificado.StringGrid1 do
          begin
            RowCount := RowCount + 1;
            Cells[ 0, RowCount-1] := NumeroSerie;
            Cells[ 1, RowCount-1] := RazaoSocial;
            Cells[ 2, RowCount-1] := CNPJ;
            Cells[ 3, RowCount-1] := FormatDateBr(DataVenc);
            Cells[ 4, RowCount-1] := Certificadora;
          end;
        end;
      end;
    end;

    frSelecionarCertificado.ShowModal;

    if frSelecionarCertificado.ModalResult = mrOK then
    begin
      senha := PasswordBox('Certificado Digital','Digite a senha do certificado.');
      EditTable(qryEmpresa);
      qryEmpresanum_serie_certificado.AsString := frSelecionarCertificado.StringGrid1.Cells[ 0,
                                                     frSelecionarCertificado.StringGrid1.Row];
      qryEmpresasenha_cert_digital.asstring   := senha;
      qryEmpresapath_certificado.AsString := '';
      PostTable(qryEmpresa);
    end;
  finally
     frSelecionarCertificado.Free;
  end;
end;

procedure TfrmCadEmpresa.PageControl1Change(Sender: TObject);
Var qry : TZQuery;
begin
  if PageControl1.ActivePage = TabSheet2 then begin
    qry := ExecSqlQuery(dbConnect.ZConnection1,'SELECT empresa, extencao,tipo_dado, dado, id FROM empresa_arquivos Where empresa=%d and tipo_dado=''%s''',
                        [qryEmpresaid.AsInteger,'logo_nfe']);
    ExibeFoto(qry,'dado',Image1);
    qry := ExecSqlQuery(dbConnect.ZConnection1,'SELECT empresa, extencao,tipo_dado, dado, id FROM empresa_arquivos Where empresa=%d and tipo_dado=''%s''',
                        [qryEmpresaid.AsInteger,'logo']);
    ExibeFoto(qry,'dado',Image2);
  end;
end;

procedure TfrmCadEmpresa.qryEmpresaAfterPost(DataSet: TDataSet);
Var id : Integer;
begin
//  id := qryEmpresaid.AsInteger;
//  WAGDBNavigator1.Refresh;
//  WAGDBNavigator1.KeyValue:= id;
end;

procedure TfrmCadEmpresa.btLogoNFeClick(Sender: TObject);
Var qry : TZQuery;
  oid: LongInt;
Begin
  if not OpenPictureDialog1.Execute then exit;

  qry := ExecSqlQuery(dbConnect.ZConnection1,'SELECT id, dh_cadastro, nome, extensao, tipo_dado, oid_documento '+
                                             'FROM gestao_documentos '+
                                             'Where tipo_dado=''LOGO_NFE'' '+
                                             'Order by id');
  oid := qry.FieldByName('oid_documento').AsInteger;
  IF oid > 0 then
  Begin
     OverrideFileToServer(dbConnect.ZConnection1,oid,OpenPictureDialog1.FileName);
     qry.Edit
  end else
  Begin

     qry.Append;
     oid := ImportFileToServer(dbConnect.ZConnection1,OpenPictureDialog1.FileName);
  end;
  qry.FieldByName('nome').AsString           := ReplaceStr(ExtractFileNameOnly(OpenPictureDialog1.FileName),' ','_');
  qry.FieldByName('tipo_dado').AsString      := 'LOGO_NFE';
  qry.FieldByName('extensao').AsString       := ExtractFileExt(OpenPictureDialog1.FileName);
  qry.FieldByName('dh_cadastro').AsDateTime  := Now();
  qry.FieldByName('oid_documento').AsInteger := oid;
  PostTable(qry);
(*
  //SELECT empresa, extencao, dado, id FROM empresa_arquivos;
  {CREATE TYPE tipodado AS ENUM ('certificado', 'logo_nfe', 'logo', 'image');}
  if not OpenPictureDialog1.Execute then exit;
  qry := ExecSqlQuery(dbConnect.ZConnection1,'SELECT empresa, extencao,tipo_dado, dado, id, dh_atualizado FROM empresa_arquivos Where empresa=%d and tipo_dado=''%s''',
                      [qryEmpresaid.AsInteger,'logo_nfe']);
  if qry.RecordCount > 0 then
     qry.Edit
  else
     qry.Append;
  qry.FieldByName('empresa').AsInteger := qryEmpresaid.AsInteger;
  qry.FieldByName('tipo_dado').AsString:= 'logo_nfe';
  qry.FieldByName('extencao').AsString := ExtractFileExt(OpenPictureDialog1.FileName);
  qry.FieldByName('dh_atualizado').AsDateTime := Now();
  ImportaFileToDB(qry,'dado',OpenPictureDialog1.FileName);
  //ImportaFoto(qry,'dado',OpenPictureDialog1.FileName);
  PostTable(qry);
  *)
  Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TfrmCadEmpresa.btImportarCertificadoClick(Sender: TObject);
Var filename, destFile,senha : String;
    qry : TZQuery;
    oid: LongInt;
begin
  if not OpenDialog1.Execute then exit;
  senha := PasswordBox('Certificado Digital','Digite a senha do certificado.');
  StartWait;
  try
    ACBrNFe1.SSL.ArquivoPFX := OpenDialog1.FileName;
    ACBrNFe1.SSL.Senha      := senha;
    ACBrNFe1.SSL.CarregarCertificado;

    EditTable(qryEmpresa);
    qryEmpresadh_vcto_certificado.AsString  := DateTimeToStr(ACBrNFe1.SSL.CertDataVenc);
//    qryEmpresanum_serie_certificado.AsString:= ReplaceStr(ExtractFileNameOnly(OpenDialog1.FileName),' ','_');
    qryEmpresapath_certificado.AsString     := ReplaceStr(ExtractFileName(OpenDialog1.FileName),' ','_');
    qryEmpresasenha_cert_digital.asstring   := senha;
    PostTable(qryEmpresa);

{    if OpenDialog1.FileName <> destFile then
       CopyFile(OpenDialog1.FileName, destFile );
    ForceDirectories( obtemPathSistemaNFe(tpsCERT) );
    destFile := obtemPathSistemaNFe( tpsCERT ) + ExtractFileName(OpenDialog1.FileName);
}
    {Carrego no banco de dados}
    qry := ExecSqlQuery(dbConnect.ZConnection1,'SELECT id, dh_cadastro, nome, extensao, tipo_dado, oid_documento '+
                                              'FROM gestao_documentos '+
                                              'Where tipo_dado=''CERTIFICADO'' '+
                                              'Order by id');
    oid := qry.FieldByName('oid_documento').AsInteger;
    IF oid > 0 then
    Begin
       OverrideFileToServer(dbConnect.ZConnection1,oid,OpenDialog1.FileName);
       qry.Edit
    end else
    Begin
       qry.Append;
       oid := ImportFileToServer(dbConnect.ZConnection1,OpenDialog1.FileName);
    end;
    //Salva o nome sem extensão , ao carregar o arquivo ele poe a estensão
    qry.FieldByName('nome').AsString           := ReplaceStr(ExtractFileNameOnly(OpenDialog1.FileName),' ','_');
    qry.FieldByName('tipo_dado').AsString      := 'CERTIFICADO';
    qry.FieldByName('extensao').AsString       := ExtractFileExt(OpenDialog1.FileName);
    qry.FieldByName('oid_documento').AsInteger := oid;
    qry.FieldByName('dh_cadastro').AsDateTime  := Now();
    PostTable(qry);
    saveToDiskArquivos;
    (*
    qry := ExecSqlQuery(dbConnect.ZConnection1,'SELECT empresa, extencao,tipo_dado, dado, id,dh_atualizado FROM empresa_arquivos Where empresa=%d and tipo_dado=''%s''',
                          [qryEmpresaid.AsInteger,'certificado']);
    if qry.RecordCount > 0 then
       qry.Edit
    else
       qry.Append;
    qry.FieldByName('empresa').AsInteger := qryEmpresaid.AsInteger;
    qry.FieldByName('tipo_dado').AsString:= 'certificado';
    qry.FieldByName('extencao').AsString := ExtractFileExt(OpenDialog1.FileName);
    qry.FieldByName('dh_atualizado').AsDateTime := Now();
    ImportaFileToDB(qry,'dado',OpenDialog1.FileName);
    PostTable(qry);
    *)
    //InicializaConfigNFCe(ACBrNFe1, qryEmpresaid.AsInteger);
    //InicializaConfigNFe(ACBrNFe1 , qryEmpresaid.AsInteger);
  finally
    StopWait;
  end;

end;

procedure TfrmCadEmpresa.btLogoSistemaClick(Sender: TObject);
Var qry : TZQuery;
  oid: LongInt;
begin
  if not OpenPictureDialog1.Execute then exit;

  qry := ExecSqlQuery(dbConnect.ZConnection1,'SELECT id, dh_cadastro, nome, extensao, tipo_dado, oid_documento '+
                                             'FROM gestao_documentos '+
                                             'Where tipo_dado=''LOGO'' '+
                                             'Order by id');
  oid := qry.FieldByName('oid_documento').AsInteger;
  IF oid > 0 then
  Begin
     OverrideFileToServer(dbConnect.ZConnection1,oid,OpenPictureDialog1.FileName);
     qry.Edit
  end else
  Begin
     qry.Append;
     oid := ImportFileToServer(dbConnect.ZConnection1,OpenPictureDialog1.FileName);
  end;
  qry.FieldByName('nome').AsString           := ReplaceStr(ExtractFileNameOnly(OpenPictureDialog1.FileName),' ','_');
  qry.FieldByName('tipo_dado').AsString      := 'LOGO';
  qry.FieldByName('extensao').AsString       := ExtractFileExt(OpenPictureDialog1.FileName);
  qry.FieldByName('dh_cadastro').AsDateTime  := Now();
  qry.FieldByName('oid_documento').AsInteger := oid;
  PostTable(qry);



  //SELECT empresa, extencao, dado, id FROM empresa_arquivos;
  {CREATE TYPE tipodado AS ENUM ('certificado', 'logo_nfe', 'logo', 'image');}
(*  if not OpenPictureDialog1.Execute then exit;
  qry := ExecSqlQuery(dbConnect.ZConnection1,'SELECT empresa, extencao,tipo_dado, dado, id,dh_atualizado FROM empresa_arquivos Where empresa=%d and tipo_dado=''%s''',
                      [qryEmpresaid.AsInteger,'logo']);
  if qry.RecordCount > 0 then
     qry.Edit
  else
     qry.Append;
  qry.FieldByName('empresa').AsInteger := qryEmpresaid.AsInteger;
  qry.FieldByName('tipo_dado').AsString:= 'logo';
  qry.FieldByName('extencao').AsString := ExtractFileExt(OpenPictureDialog1.FileName);
  qry.FieldByName('dh_atualizado').AsDateTime := Now();
//ImportaFoto(qry,'dado',OpenPictureDialog1.FileName);
  ImportaFileToDB(qry,'dado',OpenPictureDialog1.FileName);
  PostTable(qry);
*)
  Image2.Picture.LoadFromFile(OpenPictureDialog1.FileName);

end;

procedure TfrmCadEmpresa.SpeedButton4Click(Sender: TObject);
Var qry : TZQuery;
  FileName: String;
  oid: Integer;
begin
  //SELECT empresa, extencao, dado, id FROM empresa_arquivos;
  FileName := 'C:\lazarus\lcl\languages\lclstrconsts.pt_BR.po';
  qry := ExecSqlQuery(dbConnect.ZConnection1,'SELECT id, dh_cadastro, nome, extensao, tipo_dado, oid_documento '+
                                             'FROM gestao_documentos '+
                                             'Where tipo_dado=''TRADUCAO'' '+
                                             'Order by id');
  IF qry.RecordCount = 0 then
     oid := ImportFileToServer(dbConnect.ZConnection1,FileName);
  qry.Append;
  qry.FieldByName('nome').AsString           := 'lclstrconsts.pt_BR.po';
  qry.FieldByName('tipo_dado').AsString      := 'TRADUCAO';
  qry.FieldByName('extensao').AsString       := ExtractFileExt(FileName);
  qry.FieldByName('dh_cadastro').AsDateTime  := Now();
  qry.FieldByName('oid_documento').AsInteger := oid;
  PostTable(qry);
end;

procedure TfrmCadEmpresa.ToolButton8Click(Sender: TObject);
begin
  ConfirmDelete;
  qryEmpresa.Delete;
  //WAGDBNavigator1.Refresh;
end;

procedure TfrmCadEmpresa.WAGDBNavigator1AfterScroll(Sender: TObject);
begin
  qryEmpresa.Close;
  qryEmpresa.ParamByName('id').AsInteger := 2;//WAGDBNavigator1.KeyValue;
  OpenTable( qryEmpresa );
  //qryEmpresa.Last;
end;


initialization
  RegisterClass(TfrmCadEmpresa);


end.

