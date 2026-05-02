unit ucadtran;

{$MODE Delphi}

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBCtrls, DB, Menus, DBActns, ActnList, ImgList, ComCtrls,
  Buttons, WAGDBNavigator, rxdbdateedit, ACBrValidador, ACBrCEP, ZDataset,
  ZSqlUpdate, udbConnect, ZConnection, EditBtn, LMessages, LCLType;

type

  { TfCadTran }
  NewTypeNav = class( TDbNavigator );

  TfCadTran = class(TForm)
    ACBrCEP1: TACBrCEP;
    ACBrValidador1: TACBrValidador;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBDateEdit1: TRxDBDateEdit;
    DBDateEdit2: TRxDBDateEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBNavigator3: TDBNavigator;
    dsTransportatora: TDataSource;
    GroupBox6: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    qryTransportadorabairro: TStringField;
    qryTransportadoracep: TStringField;
    qryTransportadoracidade: TStringField;
    qryTransportadoracnpj: TStringField;
    qryTransportadoracomplemento: TStringField;
    qryTransportadoracontato: TStringField;
    qryTransportadoradatacadastro: TDateField;
    qryTransportadoraemail: TStringField;
    qryTransportadoraemail_nfe: TStringField;
    qryTransportadoraemviarxml: TBooleanField;
    qryTransportadoraemviarxml_faturar: TBooleanField;
    qryTransportadoraendereco: TStringField;
    qryTransportadorafunccontato: TStringField;
    qryTransportadoraid: TLongintField;
    qryTransportadoraie: TStringField;
    qryTransportadoralicenca_autorizacao: TStringField;
    qryTransportadoralicenca_numero: TStringField;
    qryTransportadoralicenca_validade: TDateField;
    qryTransportadoranome: TStringField;
    qryTransportadoraobstransp: TMemoField;
    qryTransportadoratelefone1: TStringField;
    qryTransportadoratelefone2: TStringField;
    qryTransportadorauf: TStringField;
    SpeedButton1: TSpeedButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    PopupMenu1: TPopupMenu;
    PorNome1: TMenuItem;
    PorCdigo1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    Label18: TLabel;
    DBMemo1: TDBMemo;
    qryTransportadora: TZQuery;
    WAGDBNavigator1: TWAGDBNavigator;
    updTransportadora: TZUpdateSQL;
    procedure DBDateEdit2AcceptDate(Sender: TObject; var ADate: TDateTime;
      var AcceptDate: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure acFecharExecute(Sender: TObject);
    procedure FormShortCut(var Msg: TLMKey; var Handled: Boolean);
    procedure PorNome1Click(Sender: TObject);
    procedure qryTransportadoraBeforePost(DataSet: TDataSet);
    procedure qryTransportadoralicenca_autorizacaoChange(Sender: TField);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure PorCdigo1Click(Sender: TObject);
    procedure tbTransportadoraBeforeDelete(DataSet: TDataSet);
    procedure tbTransportadoraieValidate(Sender: TField);
    procedure FormResize(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure WAGDBNavigator1AfterScroll(Sender: TObject);
    procedure qryTransportadoraAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadTran: TfCadTran;

implementation

{$R *.lfm}
                            //CheckDoc, uDados,uLocateDlg,
uses WagVclUtils, BDSqlUtils, uUser, uSearch, TDIPageControl;

procedure TfCadTran.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfCadTran.DBDateEdit2AcceptDate(Sender: TObject;
  var ADate: TDateTime; var AcceptDate: Boolean);
begin
      DBDateEdit2.DataSource.DataSet.Edit;
end;

procedure TfCadTran.FormCreate(Sender: TObject);
begin
  dbConnect.setImageForDBNavigator(DBNavigator3);
  WAGDBNavigator1.Open;
end;

procedure TfCadTran.acFecharExecute(Sender: TObject);
begin
     ClosePageThisForm( self );
end;

procedure TfCadTran.FormShortCut(var Msg: TLMKey; var Handled: Boolean);
begin
  if msg.CharCode = VK_F2 then begin
     PorCdigo1.Click;
     Handled := True;
  end;
  if msg.CharCode = VK_F3 then begin
     PorNome1.Click;
     Handled := True;
  end;
end;

procedure TfCadTran.PorNome1Click(Sender: TObject);
var ret : Variant;
begin
  ret := ShowSearchModal(dbConnect.ZConnection1,'transportadora','id,nome','id','nome',true,WAGDBNavigator1.Where);
  if VarIsBlank(ret) then exit;
  WAGDBNavigator1.KeyValue:= ret;
end;

procedure TfCadTran.qryTransportadoraBeforePost(DataSet: TDataSet);
begin
  ACBrValidador1.Documento:=qryTransportadoracnpj.Asstring;
  ACBrValidador1.TipoDocto:= docCNPJ;
  if Not ACBrValidador1.Validar then
     MessageDlg('CNPJ não confere.',mtError,[mbOk],0);
  ACBrValidador1.Documento  := qryTransportadoraie.Asstring;
  ACBrValidador1.Complemento:= qryTransportadorauf.Asstring; ;
  ACBrValidador1.TipoDocto  := docInscEst;

end;

procedure TfCadTran.qryTransportadoralicenca_autorizacaoChange(Sender: TField);
begin
   if qryTransportadora.State = dsInsert then exit;

   if CheckAcessModulo(dbConnect.ZConnection1,'TfCadTran','licenca_sanitaria') <> ACESSO_PERMITIDO then begin
      ShowSemAcesso();
      qryTransportadora.Cancel;
      AbortSilent;
   end;
    if RetVar2String(Sender.OldValue) = RetVar2String(Sender.Value) then exit;
   ExecSql(dbConnect.ZConnection1,'INSERT INTO dedo_duro_novo(usuario, modulo, acao) '+
           'VALUES (''%s'', ''%s'', ''%s'')',
            [uUser.UsuarioAtual.userApelido,
             'TfCadTran.licenca_sanitaria',
             Format('Transportadora %s ,alterado %s de %s para %s',[qryTransportadoraid.AsString,Sender.FieldName,RetVar2String(Sender.OldValue),RetVar2String(Sender.Value)])]);
end;

procedure TfCadTran.SpeedButton1Click(Sender: TObject);
begin
    if ACBrCEP1.BuscarPorCEP(DBEdit8.Text) > 0 then begin
       EditTable(qryTransportadora);
       qryTransportadoraendereco.ASString:=  ACBrCEP1.Enderecos[0].Logradouro;
       qryTransportadoracidade.ASString  :=  ACBrCEP1.Enderecos[0].Municipio;
       qryTransportadorabairro.ASString  :=  ACBrCEP1.Enderecos[0].Bairro;
       qryTransportadorauf.ASString      :=  ACBrCEP1.Enderecos[0].UF;
    end;
end;

procedure TfCadTran.ToolButton13Click(Sender: TObject);
begin
  PopupMenu1.Items[0].Click;
end;

procedure TfCadTran.PorCdigo1Click(Sender: TObject);
var ret : Variant;
begin
  ret := ShowSearchModal(dbConnect.ZConnection1,'transportadora','id,nome','id','id',true,WAGDBNavigator1.Where);
  if VarIsBlank(ret) then exit;
  WAGDBNavigator1.KeyValue:= ret;
end;

procedure TfCadTran.tbTransportadoraBeforeDelete(DataSet: TDataSet);
begin
 ConfirmDelete('Você esta prestes a eliminar o cadastro do CLIENTE atual'+#10+
               'Tem certeza que quer continuar ?');
end;

procedure TfCadTran.tbTransportadoraieValidate(Sender: TField);
begin
  if Length(ValidarIE(qryTransportadoraie.AsString,qryTransportadorauf.AsString)) > 0 then
     MessageDlg('Validação','Inscrição estadual não é valida. Verifique !',mtError,[mbOK],0);
end;

procedure TfCadTran.FormResize(Sender: TObject);
begin
    CenterControl(GroupBox1);
end;

procedure TfCadTran.ToolButton6Click(Sender: TObject);
begin
  qryTransportadora.Delete;
end;

procedure TfCadTran.WAGDBNavigator1AfterScroll(Sender: TObject);
begin
  qryTransportadora.close;
  qryTransportadora.ParamByName('id').AsString := WAGDBNavigator1.KeyValue;
  OpenTable( qryTransportadora );
end;

procedure TfCadTran.qryTransportadoraAfterPost(DataSet: TDataSet);
Var id : Integer;
begin
   id  := qryTransportadoraid.ASInteger;
   WAGDBNavigator1.Refresh(qryTransportadoraid.ASInteger);
   WAGDBNavigator1.KeyValue:= id;
end;

end.
