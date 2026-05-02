unit uCadFornecedor;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, StdCtrls, ActnList, DbCtrls, Buttons, Menus, DBGrids, LCLType,
  ACBrValidador, ACBrGIF, ACBrCEP, ZDataset, ZSqlUpdate, rxtoolbar, rxlookup,
  rxdbdateedit, WAGDBNavigator, db, ExtendedNotebook;

type

  { TfrmCadFornecedor }
  TMeuDBNavigator  = class( TDbNavigator );

  TfrmCadFornecedor = class(TForm)
    ACBrCEP1: TACBrCEP;
    ACBrValidador1: TACBrValidador;
    acLocalizar: TAction;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    ActionList1: TActionList;
    btCep: TSpeedButton;
    DBDateEdit1: TRxDBDateEdit;
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
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBGrid1: TDBGrid;
    DBMemo1: TDBMemo;
    DBNavigator2: TDBNavigator;
    dsFornecedorLista: TDatasource;
    DBGrid2: TDBGrid;
    dsContatos: TDatasource;
    DBNavigator1: TDBNavigator;
    dsFornecedor: TDatasource;
    ExtendedNotebook1: TExtendedNotebook;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
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
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    mnSomenteAtivos: TMenuItem;
    mnSomenteInativos: TMenuItem;
    PopupMenu1: TPopupMenu;
    qryContatosemail: TStringField;
    qryContatosfornecedor: TLongintField;
    qryContatosid: TLongintField;
    qryContatosnome: TStringField;
    qryContatostelefones: TStringField;
    qryFornecedorbairro: TStringField;
    qryFornecedorcep: TStringField;
    qryFornecedorcidade: TStringField;
    qryFornecedorcnpj: TStringField;
    qryFornecedorcomplemento: TStringField;
    qryFornecedorcontato: TStringField;
    qryFornecedordatacadastro: TDateField;
    qryFornecedoremail: TStringField;
    qryFornecedorendereco: TStringField;
    qryFornecedorfantasia: TStringField;
    qryFornecedorfax: TStringField;
    qryFornecedorid: TLongintField;
    qryFornecedorinscestadual: TStringField;
    qryFornecedorListafantasia: TStringField;
    qryFornecedorListaid: TLongintField;
    qryFornecedorListanome: TStringField;
    qryFornecedornome: TStringField;
    qryFornecedorobservacao: TMemoField;
    qryFornecedorplano_contas: TLongintField;
    qryFornecedorstatus: TStringField;
    qryFornecedortelefone1: TStringField;
    qryFornecedortelefone2: TStringField;
    qryFornecedoruf: TStringField;
    qryFornecedoruf_nome: TStringField;
    qryFornecedorvplano_contas: TStringField;
    qryFornecedorwebpage: TStringField;
    ScrollBox1: TScrollBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    WAGDBNavigator1: TWAGDBNavigator;
    qryFornecedor: TZQuery;
    qryContatos: TZQuery;
    qryFornecedorLista: TZReadOnlyQuery;
    updFornecedor: TZUpdateSQL;
    procedure btCepClick(Sender: TObject);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure ExtendedNotebook1Change(Sender: TObject);
    procedure ExtendedNotebook1Resize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure mnSomenteAtivosClick(Sender: TObject);
    procedure qryContatosNewRecord(DataSet: TDataSet);
    procedure qryFornecedorAfterPost(DataSet: TDataSet);
    procedure qryFornecedorcnpjValidate(Sender: TField);
    procedure qryFornecedorinscestadualValidate(Sender: TField);
    procedure qryFornecedorNewRecord(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure WAGDBNavigator1AfterScroll(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    procedure   OpenFornecedor( KeyValue : Integer);

  end; 

var
  frmCadFornecedor: TfrmCadFornecedor;

implementation

{$R *.lfm}

Uses udbConnect, WagVclUtils, TDIPageControl, BDSqlUtils, uSearch,
  WagGoogleAPI, Variants, strutils;

{ TfrmCadFornecedor }

procedure TfrmCadFornecedor.MenuItem1Click(Sender: TObject);
var ret : Variant;
begin
  ret := ShowSearchModal(dbConnect.ZConnection1,'fornecedores','id,nome','id','id',true);
  if VarIsBlank(ret) then exit;
  WAGDBNavigator1.KeyValue:= ret;
end;

procedure TfrmCadFornecedor.MenuItem2Click(Sender: TObject);
var ret : Variant;
begin
  ret := ShowSearchModal(dbConnect.ZConnection1,'fornecedores','id,nome','id','nome',true);
  if VarIsBlank(ret) then exit;
  WAGDBNavigator1.KeyValue:= ret;
end;

procedure TfrmCadFornecedor.MenuItem3Click(Sender: TObject);
var ret : Variant;
begin
  ret := ShowSearchModal(dbConnect.ZConnection1,'fornecedores','id,cnpj,nome','id','cnpj',true);
  if VarIsBlank(ret) then exit;
  WAGDBNavigator1.KeyValue:= ret;
end;

procedure TfrmCadFornecedor.mnSomenteAtivosClick(Sender: TObject);
Var where : string;
begin
    //mnSomenteAtivos.Checked:= Not mnSomenteAtivos.Checked;
    if mnSomenteAtivos.Checked then begin
       //WAGDBNavigator1.Where := 'status ilike ''ATIVO'''
       where := 'status ilike ''ATIVO''';
    end else begin
       //WAGDBNavigator1.Where := 'status ilike ''INATIVO''';
       where := 'status ilike ''INATIVO''';
    end;

    qryFornecedorLista.Close;
    qryFornecedorLista.SQL.Clear;
    qryFornecedorLista.SQL.Text := 'Select id,nome,fantasia From fornecedores '+
                            Format('Where %s ',[where])+
                                   'Order by id ';
    OpenTable( qryFornecedorLista );
    WAGDBNavigator1.Where := where;
    WAGDBNavigator1.Refresh;
end;

procedure TfrmCadFornecedor.qryContatosNewRecord(DataSet: TDataSet);
begin
  qryContatosfornecedor.ASinteger := qryFornecedorid.AsInteger;
end;

procedure TfrmCadFornecedor.qryFornecedorAfterPost(DataSet: TDataSet);
Var id : Integer;
begin
   id  := qryFornecedorid.ASInteger;
   WAGDBNavigator1.Refresh( qryFornecedorid.ASInteger );
   WAGDBNavigator1.KeyValue:= id;
end;

procedure TfrmCadFornecedor.qryFornecedorcnpjValidate(Sender: TField);
begin
  if Length(ValidarCNPJ(qryFornecedorcnpj.AsString)) > 0 then
     MessageDlg('Validação','CNPJ não é valido. Verifique !',mtError,[mbOK],0);
end;

procedure TfrmCadFornecedor.qryFornecedorinscestadualValidate(Sender: TField);
begin
  if Length(ValidarIE(qryFornecedorinscestadual.AsString,qryFornecedoruf.AsString)) > 0 then
     MessageDlg('Validação','Inscrição estadual não é valida. Verifique !',mtError,[mbOK],0);
end;

procedure TfrmCadFornecedor.qryFornecedorNewRecord(DataSet: TDataSet);
Var cnpj : String;
    i : Integer;
begin
   if not InputQuery('Novo cadastro','Digite o CNPJ ou CPF',cnpj) then Abort;
   cnpj := DelCharss(cnpj,'/.-');
   i := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select id From fornecedores Where limpa_cnpj(cnpj)=''%s''',[cnpj]),0);
   if i > 0 then begin
      qryFornecedor.Cancel;
      WAGDBNavigator1.KeyValue:= i;
      Abort;
   end;
   if Length(ValidarCNPJouCPF(cnpj)) > 0 then
      Raise Exception.Create('CNPJ ou CPF com erro.');
   if Length(cnpj) > 12 then
      qryFornecedorcnpj.AsString := FormatarDocumento(docCNPJ,cnpj)
   else
      qryFornecedorcnpj.AsString := FormatarDocumento(docCPF,cnpj);
end;

procedure TfrmCadFornecedor.SpeedButton1Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'situacao_cadastro','descricao','descricao','descricao',true);
  if VarIsBlank(ret) then exit;
  EditTable(qryFornecedor);
  qryFornecedorstatus.ASString := ret;
end;

procedure TfrmCadFornecedor.SpeedButton2Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'cidades','nome,nome_uf','nome','nome',true,'sigla='+ QuotedStr(qryFornecedoruf.AsString));
  if VarIsBlank(ret) then exit;
  EditTable(qryFornecedor);
  qryFornecedorcidade.ASString := ret;
end;

procedure TfrmCadFornecedor.btCepClick(Sender: TObject);
Var s : String;
begin
    if ACBrCEP1.BuscarPorCEP(DBEdit5.text) > 0 then begin
//    cep := TWagCEP.Create;
//    cep.CEP := DBEdit5.text;
//    if cep.execute then begin
      InputQuery('Qual o número','Digite o número',s);
      EditTable(qryFornecedor);
      qryFornecedorendereco.AsString:= UpperCase(ACBrCEP1.Enderecos[0].Logradouro + ',' + s);
      qryFornecedorcidade.AsString  := UpperCase(ACBrCEP1.Enderecos[0].Municipio);
      qryFornecedorbairro.AsString  := UpperCase(ACBrCEP1.Enderecos[0].Bairro);
      qryFornecedoruf.AsString      := UpperCase(ACBrCEP1.Enderecos[0].UF);
      qryFornecedoruf_nome.AsString := ExecSql(dbConnect.ZConnection1,'Select nome From unidade_federacao Where upper(sigla)=''%s''',[UpperCase(qryFornecedoruf.AsString)]);
      Exit;
//    end;
    end;
    MessageDlg('Não foi possível localizar o CEP',mtError,[mbOk],0);
end;

procedure TfrmCadFornecedor.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
     btCep.Click;
end;

procedure TfrmCadFornecedor.DBGrid2DblClick(Sender: TObject);
begin
  WAGDBNavigator1.KeyValue := qryFornecedorListaid.AsInteger;
  ExtendedNotebook1.PageIndex:= 1;
end;

procedure TfrmCadFornecedor.DBGrid2TitleClick(Column: TColumn);
begin
  qryFornecedorLista.Close;
  qryFornecedorLista.Sql.clear;
  qryFornecedorLista.Sql.Add('Select id,nome,fantasia From fornecedores ');
  qryFornecedorLista.SortedFields:= Column.FieldName;
  OpenTable( qryFornecedorLista );
end;

procedure TfrmCadFornecedor.ExtendedNotebook1Change(Sender: TObject);
begin
    ExtendedNotebook1Resize(nil);
end;

procedure TfrmCadFornecedor.ExtendedNotebook1Resize(Sender: TObject);
begin
    CenterControl(GroupBox2);
    CenterControl(GroupBox7);
end;

procedure TfrmCadFornecedor.FormCreate(Sender: TObject);
begin
  dbConnect.setImageForDBNavigator(dbnavigator1);
  WAGDBNavigator1.Open;
  OpenTable( qryFornecedorLista );
end;

procedure TfrmCadFornecedor.FormResize(Sender: TObject);
begin
  CenterControl(GroupBox2);
  CenterControl(GroupBox7);
end;

procedure TfrmCadFornecedor.SpeedButton3Click(Sender: TObject);
var ret : Variant;
    s : String;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'plano_contas','conta,descricao','id,conta,descricao','conta',true);
  if VarIsBlank(ret) then exit;
  EditTable(qryFornecedor);
  qryFornecedorplano_contas.AsString := ret[0];
  s := ret[1];
  qryFornecedorvplano_contas.ASString:= Format('%s-%s',[String(ret[1]),String(ret[2])]);
  //DBEdit16.text := s;//Format('%s-%s',[ret[1],ret[2]]);
end;

procedure TfrmCadFornecedor.SpeedButton4Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'unidade_federacao','sigla,nome','sigla,nome','nome',true);
  if VarIsBlank(ret) then exit;
  EditTable(qryFornecedor);
  qryFornecedoruf.ASString      := ret[0];
  qryFornecedoruf_nome.ASString := ret[1];
end;

procedure TfrmCadFornecedor.SpeedButton5Click(Sender: TObject);
begin
    FileExecute( GetExeNavegador + ' '+ qryFornecedorwebpage.Asstring);
end;

procedure TfrmCadFornecedor.SpeedButton6Click(Sender: TObject);
Var GoogleMaps : TGoogleMaps;
begin
     GoogleMaps := TGoogleMaps.Create;
     GoogleMaps.Endereco := ExtractWord(1,qryFornecedorendereco.AsString,[',']);;
     GoogleMaps.Numero   := ExtractWord(2,qryFornecedorendereco.AsString,[',']);;
     GoogleMaps.Cidade   := qryFornecedorcidade.AsString;
     GoogleMaps.Uf       := qryFornecedoruf.AsString;
     GoogleMaps.Cep      := qryFornecedorcep.AsString;
     GoogleMaps.Navegador:= nvDefault;
     GoogleMaps.Execute;
end;

procedure TfrmCadFornecedor.ToolButton1Click(Sender: TObject);
begin
    ClosePageThisForm(Self);
end;

procedure TfrmCadFornecedor.ToolButton9Click(Sender: TObject);
begin
  ConfirmDelete;
  qryFornecedor.Delete;
  WAGDBNavigator1.Refresh;
end;

procedure TfrmCadFornecedor.WAGDBNavigator1AfterScroll(Sender: TObject);
begin
  OpenFornecedor(WAGDBNavigator1.KeyValue);
end;

procedure TfrmCadFornecedor.OpenFornecedor(KeyValue: Integer);
begin
   qryFornecedor.Close;
   qryFornecedor.ParamByName('id').AsInteger := KeyValue;
   OpenTable( qryFornecedor );

   qryContatos.Close;
   OpenTable( qryContatos );
end;

end.

