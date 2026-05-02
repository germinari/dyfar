unit uCadEmpregados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, StdCtrls, ActnList, DbCtrls, Buttons, Menus, EditBtn, Spin,
  ACBrValidador, ACBrCEP, ZDataset, ZSqlUpdate, rxtoolbar, rxlookup, rxdbdateedit,
  rxdbcomb, rxdbgrid, rxcurredit, WAGDBNavigator, RLReport, db, memds,
  ExtendedNotebook, DBGrids;

type

  { TfrmCadEmpregados }
  TMeuDBNavigator  = class( TDbNavigator );

  TfrmCadEmpregados = class(TForm)
    ACBrCEP1: TACBrCEP;
    ACBrValidador1: TACBrValidador;
    acLocalizar: TAction;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    ActionList1: TActionList;
    btDelVenda: TSpeedButton;
    DBEdit18: TDBEdit;
    DBEdit3: TDBEdit;
    DBText3: TDBText;
    edFilterData: TEdit;
    edFilterData1: TEdit;
    edFilterData2: TEdit;
    edFilterData3: TEdit;
    edFilterData4: TEdit;
    edTotal: TCurrencyEdit;
    DBEdit16: TDBEdit;
    DBText1: TDBText;
    DBText2: TDBText;
    edCodigo: TEditButton;
    edLote: TEditButton;
    dsProdutosConsig: TDatasource;
    DBDateEdit1: TRXDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBMemo1: TDBMemo;
    DBNavigator1: TDBNavigator;
    dsEmpregados: TDatasource;
    edCodBarras: TEditButton;
    edDescricao: TEditButton;
    ExtendedNotebook1: TExtendedNotebook;
    edQuantidade: TFloatSpinEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
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
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    qryEmpregadosapelido: TStringField;
    qryEmpregadosassinatura_email: TMemoField;
    qryEmpregadosbairro: TStringField;
    qryEmpregadoscep: TStringField;
    qryEmpregadoscidade: TStringField;
    qryEmpregadoscomissao: TFloatField;
    qryEmpregadoscomplemento: TStringField;
    qryEmpregadoscpf: TStringField;
    qryEmpregadosdataadmissao: TDateField;
    qryEmpregadosemail: TStringField;
    qryEmpregadosendereco: TStringField;
    qryEmpregadosfuncao: TStringField;
    qryEmpregadosid: TLongintField;
    qryEmpregadosnome: TStringField;
    qryEmpregadosnome_curto: TStringField;
    qryEmpregadosobservacao: TMemoField;
    qryEmpregadosplano_contas: TLongintField;
    qryEmpregadosrg: TStringField;
    qryEmpregadossenha_id: TStringField;
    qryEmpregadossys_usuario: TLongintField;
    qryEmpregadostelefone1: TStringField;
    qryEmpregadostelefone2: TStringField;
    qryEmpregadosuf: TStringField;
    qryProdutosConsigcodigo_barras: TStringField;
    qryProdutosConsigdata_consignacao: TDateField;
    qryProdutosConsigdescricao: TStringField;
    qryProdutosConsigempregado: TLongintField;
    qryProdutosConsigempresa: TLongintField;
    qryProdutosConsigid: TLongintField;
    qryProdutosConsiglote: TLongintField;
    qryProdutosConsigpreco: TFloatField;
    qryProdutosConsigproduto: TLongintField;
    qryProdutosConsigquant_consignada: TFloatField;
    qryProdutosConsigquant_devolvida: TFloatField;
    qryProdutosConsigquant_vendida: TFloatField;
    qryProdutosConsigselecionado: TBooleanField;
    qryProdutosConsigslote: TStringField;
    qryProdutosConsigtotal_posse: TFloatField;
    RLBand1: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLBand6: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText6: TRLDBText;
    RLDraw3: TRLDraw;
    RLDraw4: TRLDraw;
    RLLabel1: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLReport1: TRLReport;
    RLSystemInfo4: TRLSystemInfo;
    RLSystemInfo5: TRLSystemInfo;
    RLSystemInfo6: TRLSystemInfo;
    RxDBComboBox1: TRxDBComboBox;
    RxDBGrid1: TRxDBGrid;
    btAddConsignado: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    btDelConsignado: TSpeedButton;
    SpeedButton4: TSpeedButton;
    btCep: TSpeedButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
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
    qryEmpregados: TZQuery;
    qryProdutosConsig: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;
    ZUpdateSQL2: TZUpdateSQL;
    procedure btAddConsignadoClick(Sender: TObject);
    procedure btCepClick(Sender: TObject);
    procedure btDelVendaClick(Sender: TObject);
    procedure btDelConsignadoClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TDBNavButtonType);
    procedure edCodigoButtonClick(Sender: TObject);
    procedure edCodBarrasButtonClick(Sender: TObject);
    procedure edCodBarrasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure edDescricaoButtonClick(Sender: TObject);
    procedure edFilterData1Change(Sender: TObject);
    procedure edFilterData2Change(Sender: TObject);
    procedure edFilterData3Change(Sender: TObject);
    procedure edFilterData4Change(Sender: TObject);
    procedure edFilterDataChange(Sender: TObject);
    procedure edLoteButtonClick(Sender: TObject);
    procedure edLoteEnter(Sender: TObject);
    procedure edLoteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ExtendedNotebook1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure qryEmpregadosAfterPost(DataSet: TDataSet);
    procedure qryProdutosConsigAfterOpen(DataSet: TDataSet);
    procedure qryProdutosConsigCalcFields(DataSet: TDataSet);
    procedure RxDBGrid1TitleClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure WAGDBNavigator1AfterScroll(Sender: TObject);
  private
    function SomarConsignado: Double;
    { private declarations }
  public
    { public declarations }
    procedure OpenFornecedor( KeyValue : Integer);
    procedure LoadProduto( id : String);
    function  LocalizarProduto( codigo : String):TZQuery;
    //function  GetLoteForEmp( produto: Integer; quantidade:Double ):TStringList;

  end;

var
  frmCadEmpregados: TfrmCadEmpregados;

implementation

{$R *.lfm}

Uses udbConnect, sistema_config, uRecebimento, uInputFloat, WagVclUtils,
  TDIPageControl, BDSqlUtils, uSearch, WagStrUtils, LCLType, Variants,
  strutils;

{ TfrmCadEmpregados }

procedure TfrmCadEmpregados.FormResize(Sender: TObject);
begin
  CenterControl(GroupBox2);
  CenterControl(GroupBox7);
end;

procedure TfrmCadEmpregados.MenuItem1Click(Sender: TObject);
var ret : Variant;
begin
  ret := ShowSearchModal(dbConnect.ZConnection1,'empregados','id,nome','id','id',true);
  if VarIsBlank(ret) then exit;
  WAGDBNavigator1.KeyValue:= ret;
end;

procedure TfrmCadEmpregados.MenuItem2Click(Sender: TObject);
var ret : Variant;
begin
  ret := ShowSearchModal(dbConnect.ZConnection1,'empregados','id,nome','id','nome',true);
  if VarIsBlank(ret) then exit;
  WAGDBNavigator1.KeyValue:= ret;
end;

procedure TfrmCadEmpregados.MenuItem3Click(Sender: TObject);
var ret : Variant;
begin
  ret := ShowSearchModal(dbConnect.ZConnection1,'empregados','id,cnpj,nome','id','cnpj',true);
  if VarIsBlank(ret) then exit;
  WAGDBNavigator1.KeyValue:= ret;
end;

procedure TfrmCadEmpregados.qryEmpregadosAfterPost(DataSet: TDataSet);
Var id : Integer;
begin
   id  := qryEmpregadosid.ASInteger;
   WAGDBNavigator1.Refresh(qryEmpregadosid.ASInteger);
   WAGDBNavigator1.KeyValue:= id;
end;

procedure TfrmCadEmpregados.qryProdutosConsigAfterOpen(DataSet: TDataSet);
begin
  edTotal.Value := SomarConsignado;
end;

procedure TfrmCadEmpregados.qryProdutosConsigCalcFields(DataSet: TDataSet);
begin
  qryProdutosConsigtotal_posse.AsFloat := qryProdutosConsigquant_consignada.AsFloat * qryProdutosConsigpreco.AsFloat;
end;

procedure TfrmCadEmpregados.RxDBGrid1TitleClick(Column: TColumn);
begin
//  ShowMessage(Column.FieldName+'  '+RxDBGrid1.Columns.Items[Column.Index+1].FieldName);
  qryProdutosConsig.SortedFields:= RxDBGrid1.Columns.Items[Column.Index+1].FieldName;
  RefreshTable( qryProdutosConsig );
  qryProdutosConsig.First;
end;

procedure TfrmCadEmpregados.SpeedButton1Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'sys_usuarios','id,apelido,nome','id,apelido','apelido',true);
  if VarIsBlank(ret) then exit;
  EditTable(qryEmpregados);
  qryEmpregadossys_usuario.ASString:= ret[0];
  qryEmpregadosapelido.ASString    := ret[1];
end;

procedure TfrmCadEmpregados.SpeedButton2Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'cidades','nome,nome_uf','nome','nome',true,'sigla='+ QuotedStr(qryEmpregadosuf.AsString));
  if VarIsBlank(ret) then exit;
  EditTable(qryEmpregados);
  qryEmpregadoscidade.ASString := ret;
end;

procedure TfrmCadEmpregados.btCepClick(Sender: TObject);
Var s : String;
begin
    if ACBrCEP1.BuscarPorCEP(DBEdit5.text) > 0 then begin
      InputQuery('Qual o número','Digite o número',s);
      EditTable(qryEmpregados);
      qryEmpregadosendereco.AsString:= ACBrCEP1.Enderecos[0].Logradouro;
      qryEmpregadoscidade.AsString:= ACBrCEP1.Enderecos[0].Municipio;
      qryEmpregadosbairro.AsString:= ACBrCEP1.Enderecos[0].Bairro;
      qryEmpregadosuf.AsString    := ExecSql(dbConnect.ZConnection1,'Select nome From unidade_federacao Where upper(sigla)=''%s''',[UpperCase(ACBrCEP1.Enderecos[0].UF)]);
      Exit;
    end;
    MessageDlg('Não foi possível localizar o CEP',mtError,[mbOk],0);
end;

procedure TfrmCadEmpregados.btDelVendaClick(Sender: TObject);
Var id_venda, empresa : Integer;
    total    : Double;
begin
    try
      StartWait;
      ExecSql(dbConnect.ZConnection1,'Begin Work');
      PostTable(qryProdutosConsig);
      qryProdutosConsig.DisableControls;
      qryProdutosConsig.First;
      id_venda := 0;
      total    := 0;
      empresa  := StrToInt(getEmpresaPadrao());//qryProdutosConsigempresa.AsInteger;
      While Not qryProdutosConsig.EOF do begin
        if qryProdutosConsigquant_devolvida.AsFloat > 0 then begin
            if id_venda = 0 then begin
               ExecSql(dbConnect.ZConnection1,'INSERT INTO pedido_venda(cliente, nome, cnpj, inscestadual, endereco, cidade,'+
                                              'bairro, cep, complemento, uf, email, telefone1, telefone2) '+
                                              'Select id, nome, cpf, rg, endereco, cidade,bairro, cep, complemento, uf, email,'+
                                              'telefone1, telefone2 From empregados Where id=%d',[qryEmpregadosid.AsInteger]);
               id_venda:= LastInsertID(dbConnect.ZConnection1,'pedido_venda_id_seq');
            end;
            SetDecimalSeparator('.');
            ExecSql(dbConnect.ZConnection1,'INSERT INTO pedido_venda_itens(pedido_venda, produto, descricao, quantidade, preco_unitario,'+
                                           'desconto, entregue) VALUES ( %d, %d, ''%s'', %.3f, %.3f, 0 , true)',
                                           [id_venda,
                                            qryProdutosConsigproduto.AsInteger,
                                            qryProdutosConsigdescricao.AsString,
                                            qryProdutosConsigquant_devolvida.AsFloat,
                                            qryProdutosConsigpreco.Asfloat]);
            RestoreDecimalSeparator;
            total += qryProdutosConsigpreco.Asfloat * qryProdutosConsigquant_devolvida.AsFloat;
            ExecSql(dbConnect.ZConnection1,'Update empregados_produtos Set quant_vendida=quant_vendida+quant_devolvida, quant_devolvida=0 where id=%d',[qryProdutosConsigid.AsInteger]);
        end;
        qryProdutosConsig.Next;
      end;
      SetDecimalSeparator('.');
      ExecSql(dbConnect.ZConnection1,'INSERT INTO balcao_caixa(conta, historico, valor, loja, tipo_lancamento,balcao_venda,empregado) '+
                              'VALUES (%s, ''%s'', %.2f, %d, %d, %d,%s)',
                              ['125',
                               Format('Venda de consignado (N° %d)',[ id_venda ]),
                               total,
                               empresa,
                               tlTotal,
                               0,
                               '0']);
      RestoreDecimalSeparator;
      qryProdutosConsig.First;
      qryProdutosConsig.EnableControls;
      RefreshTable( qryProdutosConsig );
      ExecSql(dbConnect.ZConnection1,'Commit');
      StopWait;
      ShowMessageFmt('Gerado pedido de venda n° %d',[id_venda]);
    Except
      RestoreDecimalSeparator;
      qryProdutosConsig.First;
      qryProdutosConsig.EnableControls;
      ExecSql(dbConnect.ZConnection1,'RollBack');
      StopWait;
      Raise;
    end;
end;

procedure TfrmCadEmpregados.btDelConsignadoClick(Sender: TObject);
Var quantidade : Double;
    sQuant : String;
begin
    if Not InputQuery('Devolver para estoque','Quanto voce quer devolver ?',sQuant) then exit;
    quantidade := StrToInt(sQuant);
    if quantidade > qryProdutosConsigquant_consignada.ASFloat then
       Raise Exception.Create('Quantidade deve ser menor ou igual a quantidade consignada.');
  try
    ExecSql(dbConnect.ZConnection1,'Begin Work');
    DevolverEstoque( qryProdutosConsiglote.AsInteger,quantidade);
    GerarHistoricoMovimento(qryEmpregadosid.AsInteger,qryProdutosConsigproduto.AsInteger,
                            qryProdutosConsiglote.AsInteger,1,
                            OM_CONSIGNADO,
                            Format('Retorno de consignação (vendedor %d)',[qryEmpregadosid.AsInteger]),
                            0,
                            quantidade);
    if quantidade = qryProdutosConsigquant_consignada.ASFloat then
       qryProdutosConsig.Delete
    else begin
      EditTable(qryProdutosConsig);
      qryProdutosConsigquant_consignada.ASFloat := qryProdutosConsigquant_consignada.ASFloat - quantidade;
      PostTable(qryProdutosConsig);

    end;
    edTotal.Value := SomarConsignado;
    ExecSql(dbConnect.ZConnection1,'Commit');
  Except
    ExecSql(dbConnect.ZConnection1,'RollBack');
  end;

end;

procedure TfrmCadEmpregados.btAddConsignadoClick(Sender: TObject);
Var sql, produto : String;
    empresa, id, lote,i : Integer;
    preco, quantidade : Double;
    prodEmp : TStringList;
begin
  try
    ExecSql(dbConnect.ZConnection1,'Begin Work');
    produto := ExtractWord(1,edDescricao.Text,['-']);
    prodEmp := obtemProdutoPorLote( produto, edQuantidade.Value );
    ShowMessage(prodEmp.Text);
    for i := 0 to prodEmp.Count -1 do begin
      lote      := StrToInt(ExtractWord(1,prodEmp[POR_LOTE_ID],[';']));
      empresa   := 1;//StrToInt(ExtractWord(2,prodEmp[i],[';']));
      quantidade:= StrToFloat( ExtractWord(3,prodEmp[POR_LOTE_QUANT],[';']) );

      if not InputFloat('Preço customizado','Digite o preço',preco) then
         Raise Exception.Create('Não foi definido um preço.');

      SetDecimalSeparator('.');
      sql := 'INSERT INTO empregados_produtos(';
      sql += 'empregado, produto, quant_consignada, empresa, lote, preco) ';
      sql += 'VALUES (%d, %s, %.3f, %d, %d, %.2f)';
      ExecSql(dbConnect.ZConnection1,sql,[qryEmpregadosid.AsInteger,produto, quantidade, empresa, lote, preco]);
      BaixarEstoque(lote, quantidade );
      GerarHistoricoMovimento(qryEmpregadosid.AsInteger,StrtoInt(produto),lote,1,
                              OM_CONSIGNADO,
                              Format('Consignação (vendedor %d)',[qryEmpregadosid.AsInteger]),
                              quantidade,
                              0);
    end;
    ExecSql(dbConnect.ZConnection1,'Commit');
    RestoreDecimalSeparator;
    edCodBarras.SetFocus;
    edCodBarras.Text :='';
    edDescricao.Text :='';
    edLote.Text      :='';
    edQuantidade.Value:= 1;
    RefreshTable( qryProdutosConsig );
    edTotal.Value := SomarConsignado;
   Except
     RestoreDecimalSeparator;
     ExecSql(dbConnect.ZConnection1,'RollBack');
     raise;
   end;
end;

function TfrmCadEmpregados.LocalizarProduto( codigo : String):TZQuery;
var Query : TZQuery;
    sql : String;
begin
  {09/12/2014 - Alterado para pegar estoque de qualquer loja, adriana}
  sql :=        'Select id,codigo_barras,descricao,';
//  sql += Format('(select coalesce(sum(quantidade),0) From produtos_estoque Where produto=p.id and empresa=%s) as quantidade ',[getEmpresaPadrao( meCodigo )]);
  sql +=        '(select coalesce(sum(quantidade),0) From produtos_estoque Where produto=p.id) as quantidade ';
  sql +=        'From produtos p ';
  sql +=        'Where codigo_barras = ''%s'' ';
  sql +=        'Order by codigo_barras';
  Query := ExecSqlQuery(dbConnect.ZConnection1,sql,[codigo]);
  if Query.Eof and Query.Bof then begin
     sql :=        'Select id,codigo_barras,descricao,';
//     sql += Format('(select coalesce(sum(quantidade),0) From produtos_estoque Where produto=p.id and empresa=%s) as quantidade ',[getEmpresaPadrao( meCodigo )]);
     sql +=        '(select coalesce(sum(quantidade),0) From produtos_estoque Where produto=p.id) as quantidade ';
     sql +=        'From produtos p ';
     sql +=        'Where id = %s ';
     sql +=        'Order by codigo_barras';
     Query := ExecSqlQuery(dbConnect.ZConnection1,sql,[codigo]);
  end;

  Result := Query;
end;
{
function TfrmCadEmpregados.GetLoteForEmp(produto: Integer; quantidade: Double
  ): TStringList;
Var qry : TZQuery;
    resto : Double;
    s : string;
    I : Integer;
begin
  resto:= quantidade;
  qry  := ExecSqlQuery(dbConnect.ZConnection1,'Select * from produtos_estoque Where produto=%d and quantidade > 0 Order by data_entrada Desc',[produto]);
  Result := TStringList.Create;

  I := 0;
  while (Not qry.Eof) or (resto >= quantidade )do begin
     s := '';
     if qry.FieldByName('quantidade').ASFloat >= resto then begin
         AddWithSeparator(s,qry.FieldByName('id').AsString,';');
         AddWithSeparator(s,qry.FieldByName('empresa').ASString,';');
         AddWithSeparator(s,FloatToStr(resto),';');
         Result.add(s);
         resto := 0;
         break;
     end;
     if qry.FieldByName('quantidade').ASFloat < resto then begin
         AddWithSeparator(s,qry.FieldByName('id').ASString,';');
         AddWithSeparator(s,qry.FieldByName('empresa').ASString,';');
         AddWithSeparator(s,FloatToStr(qry.FieldByName('quantidade').ASFloat),';');
         Result.add(s);
         resto := resto - qry.FieldByName('quantidade').ASFloat;
     end;
     qry.Next;
     inc(I);
  end;
end;
}

procedure TfrmCadEmpregados.DBNavigator1Click(Sender: TObject;
  Button: TDBNavButtonType);
Var cnpj : String;
    i : Integer;
begin
  if Button = nbInsert then begin
     if not InputQuery('Novo cadastro','Digite o CPF',cnpj) then Abort;
     cnpj := DelCharss(cnpj,'/.-');
     i := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select id From empregados Where limpa_cnpj(cpf)=''%s''',[cnpj]),0);
     if i > 0 then begin
        qryEmpregados.Cancel;
        WAGDBNavigator1.KeyValue:= i;
        Abort;
     end;
     if Length(ValidarCNPJouCPF(cnpj)) > 0 then
        Raise Exception.Create('CPF com erro.');
     qryEmpregadoscpf.AsString := FormatarDocumento(docCPF,cnpj);
     DBEdit2.SetFocus;
  end;
end;

procedure TfrmCadEmpregados.edCodigoButtonClick(Sender: TObject);
var ret   : Variant;
    sql   : String;
    value : Double;
begin
  sql :=        'Select id,codigo_barras,descricao,';
//  sql += Format('(select coalesce(sum(quantidade),0) From produtos_estoque Where produto=p.id and empresa=%s) as quantidade ',[getEmpresaPadrao( meCodigo )]);
  sql +=        '(select coalesce(sum(quantidade),0) From produtos_estoque Where produto=p.id) as quantidade ';
  sql +=        'From produtos p ';
  sql +=        'Where ativo=true ';
  sql +=        'Order by codigo_barras';
  ret:= ShowSearchModalSQL(dbConnect.ZConnection1,sql,'id,codigo_barras,descricao,quantidade','id,quantidade','id',false);
  if VarIsBlank(ret) then exit;
   value := Ret[1];
  if StrtoFloatDef(Ret[1],0) <= 0 then
     Raise Exception.Create('Não há estoque deste produto nesta loja.');
  LoadProduto(VarToStr(ret[0]));
  edLote.SetFocus;
end;

procedure TfrmCadEmpregados.edCodBarrasButtonClick(Sender: TObject);
var ret   : Variant;
    sql   : String;
    value : Double;
begin
  sql :=        'Select id,codigo_barras,descricao,';
//  sql += Format('(select coalesce(sum(quantidade),0) From produtos_estoque Where produto=p.id and empresa=%s) as quantidade ',[getEmpresaPadrao( meCodigo )]);
  sql +=        '(select coalesce(sum(quantidade),0) From produtos_estoque Where produto=p.id) as quantidade ';
  sql +=        'From produtos p ';
  sql +=        'Where ativo=true ';
  sql +=        'Order by codigo_barras';
  ret:= ShowSearchModalSQL(dbConnect.ZConnection1,sql,'id,codigo_barras,descricao,quantidade','id,quantidade','codigo_barras',false);
  if VarIsBlank(ret) then exit;
   value := Ret[1];
  if StrtoFloatDef(Ret[1],0) <= 0 then
     Raise Exception.Create('Não há estoque deste produto nesta loja.');
  LoadProduto(VarToStr(ret[0]));
  edLote.SetFocus;
end;

procedure TfrmCadEmpregados.edCodBarrasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then begin
     LoadProduto( ExecSql(dbConnect.ZConnection1, 'Select id from produtos where codigo_barras=''%s''',[edCodBarras.Text]) );
     edLote.SetFocus;
  end;
end;

procedure TfrmCadEmpregados.edCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then begin
     LoadProduto( edCodigo.Text );
     edLote.SetFocus;
  end;
end;

procedure TfrmCadEmpregados.edDescricaoButtonClick(Sender: TObject);
var ret : Variant;
    sql : String;
    value : Double;
begin
  sql :=        'Select id,codigo_barras,descricao,';
//  sql += Format('(select coalesce(sum(quantidade),0) From produtos_estoque Where produto=p.id and empresa=%s) as quantidade ',[getEmpresaPadrao( meCodigo )]);
  sql +=        '(select coalesce(sum(quantidade),0) From produtos_estoque Where produto=p.id) as quantidade ';
  sql +=        'From produtos p ';
  sql +=        'Where ativo=true ';
  sql +=        'Order by descricao';
  ret:= ShowSearchModalSQL(dbConnect.ZConnection1,sql,'id,codigo_barras,descricao,quantidade','id,quantidade','descricao',false);
  if VarIsBlank(ret) then exit;
  value := Ret[1];
  if value <= 0 then
     Raise Exception.Create('Não há estoque deste produto nesta loja.');
  LoadProduto( VarToStr(ret[0]) );
  edLote.SetFocus;
end;

procedure TfrmCadEmpregados.edFilterData1Change(Sender: TObject);
begin
  qryProdutosConsig.FilterOptions:=[foCaseInsensitive];
  qryProdutosConsig.Filtered := false;
  if Length(edFilterData1.Text) > 0 then
  begin
    qryProdutosConsig.Filter := 'produto like ' + QuotedStr('' +'*'+ edFilterData1.Text +'*'+ ''); // Zeos- Syntax
    qryProdutosConsig.Filtered := true;
    edFilterData.Text := '';
    edFilterData3.Text := '';
    edFilterData2.Text := '';
    edFilterData4.Text := '';
  end;
end;

procedure TfrmCadEmpregados.edFilterData2Change(Sender: TObject);
begin
  qryProdutosConsig.FilterOptions:=[foCaseInsensitive];
  qryProdutosConsig.Filtered := false;
  if Length(edFilterData2.Text) > 0 then
  begin
    qryProdutosConsig.Filter := 'codigo_barras like ' + QuotedStr('' +'*'+ edFilterData2.Text+'*' + ''); // Zeos- Syntax
    qryProdutosConsig.Filtered := true;
    edFilterData.Text := '';
    edFilterData1.Text := '';
    edFilterData3.Text := '';
    edFilterData4.Text := '';
  end;
end;

procedure TfrmCadEmpregados.edFilterData3Change(Sender: TObject);
begin
    qryProdutosConsig.FilterOptions:=[foCaseInsensitive];
    qryProdutosConsig.Filtered := false;
    if Length(edFilterData3.Text) > 0 then
    begin
      qryProdutosConsig.Filter := 'descricao like ' + QuotedStr('' +'*'+ edFilterData3.Text +'*'+ ''); // Zeos- Syntax
      qryProdutosConsig.Filtered := true;
      edFilterData.Text := '';
      edFilterData1.Text := '';
      edFilterData2.Text := '';
      edFilterData4.Text := '';
    end;
end;

procedure TfrmCadEmpregados.edFilterData4Change(Sender: TObject);
begin
  qryProdutosConsig.FilterOptions:=[foCaseInsensitive];
  qryProdutosConsig.Filtered := false;
  if Length(edFilterData4.Text) > 0 then
  begin
    qryProdutosConsig.Filter := 'slote like ' + QuotedStr('' +'*'+ edFilterData4.Text +'*'+ ''); // Zeos- Syntax
    qryProdutosConsig.Filtered := true;
    edFilterData.Text := '';
    edFilterData1.Text := '';
    edFilterData2.Text := '';
    edFilterData3.Text := '';
  end;
end;

procedure TfrmCadEmpregados.edFilterDataChange(Sender: TObject);
begin
    qryProdutosConsig.FilterOptions:=[foCaseInsensitive];
    qryProdutosConsig.Filtered := false;
    if Length(edFilterData.Text) > 0 then
    begin
      qryProdutosConsig.Filter := 'data_consignacao like ' + QuotedStr('' +'*'+ edFilterData.Text+'*' + ''); // Zeos- Syntax
      qryProdutosConsig.Filtered := true;
      edFilterData4.Text := '';
      edFilterData1.Text := '';
      edFilterData2.Text := '';
      edFilterData3.Text := '';
    end;
end;

procedure TfrmCadEmpregados.edLoteButtonClick(Sender: TObject);
var ret   : Variant;
    where : String;
begin
  where := Format('produto=%s and empresa=%s',[ExtractWord(1,edDescricao.Text,['-']), getEmpresaPadrao( meCodigo )]);
  ret:= ShowSearchModal(dbConnect.ZConnection1,'produtos_estoque','id,lote,quantidade,data_validade','id,lote','data_validade',true,where);
  if VarIsBlank(ret) then exit;
  edLote.text := Format('%s-%s',[ret[0],ret[1]]);
end;

procedure TfrmCadEmpregados.edLoteEnter(Sender: TObject);
Var count : Integer;
begin
  //ExtractWord(1,edDescricao.Text,['-'])
  count := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select count(*) From produtos_estoque Where produto=%s and empresa=%s and quantidade > 0',
                               [edCodigo.Text,getEmpresaPadrao( meCodigo )]),0);
  if count = 0 then
     Raise Exception.Create('Não há estoque deste produto nesta loja.');
  if count = 1 then
     edLote.text := ExecSql(dbConnect.ZConnection1,'Select id||''-''||lote From produtos_estoque Where produto=%s and empresa=%s and quantidade > 0',[ExtractWord(1,edDescricao.Text,['-']),getEmpresaPadrao( meCodigo )]);
  if count > 1 then
     edLoteButtonClick(Nil);
end;

procedure TfrmCadEmpregados.edLoteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = VK_RETURN then
       btAddConsignado.Click;
end;

procedure TfrmCadEmpregados.ExtendedNotebook1Change(Sender: TObject);
begin
  FormResize(nil);
end;

procedure TfrmCadEmpregados.FormCreate(Sender: TObject);
begin
  dbConnect.setImageForDBNavigator(dbnavigator1);
  WAGDBNavigator1.Open;
end;

procedure TfrmCadEmpregados.SpeedButton4Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'unidade_federacao','sigla,nome','nome','nome',true);
  if VarIsBlank(ret) then exit;
  EditTable(qryEmpregados);
  qryEmpregadosuf.ASString := ret;
end;

procedure TfrmCadEmpregados.ToolButton12Click(Sender: TObject);
begin
  RLLabel2.Caption := Application.Title;
  RLLabel4.Caption := 'Representante.: '+qryEmpregadosnome.AsString;
  RLReport1.PreviewModal;
end;

procedure TfrmCadEmpregados.ToolButton1Click(Sender: TObject);
begin
    ClosePageThisForm(Self);
end;

procedure TfrmCadEmpregados.ToolButton9Click(Sender: TObject);
begin
  ConfirmDelete;
  qryEmpregados.Delete;
  WAGDBNavigator1.Refresh;
end;

procedure TfrmCadEmpregados.WAGDBNavigator1AfterScroll(Sender: TObject);
begin
  OpenFornecedor(WAGDBNavigator1.KeyValue);
end;

procedure TfrmCadEmpregados.OpenFornecedor(KeyValue: Integer);
begin
   qryEmpregados.Close;
   qryEmpregados.ParamByName('id').AsInteger := KeyValue;
   OpenTable( qryEmpregados );
   qryProdutosConsig.Close;
   OpenTable( qryProdutosConsig );
end;

procedure TfrmCadEmpregados.LoadProduto(id: String);
Var qry : TZQuery;
    Sql : String;
begin
  sql := 'Select p.*,';
//  sql += Format('(select coalesce(sum(quantidade),0) From produtos_estoque Where produto=p.id and empresa=%s) as quantidade ',[getEmpresaPadrao( meCodigo )]);
  sql += '(select coalesce(sum(quantidade),0) From produtos_estoque Where produto=p.id) as quantidade ';
  sql += 'from produtos p Where id=%s';
  qry := ExecSqlQuery(dbConnect.ZConnection1, sql,[id]);
  if qry.RecordCount = 0 then
     Raise Exception.Create('Não há estoque deste produto.');
  edCodBarras.Text      := qry.FieldByName('codigo_barras').AsString;
  edCodigo.Text         := id;
  edDescricao.Text      := qry.FieldByName('id').AsString+'-'+qry.FieldByName('descricao').AsString;
  edQuantidade.MaxValue := qry.FieldByName('quantidade').AsCurrency;
end;

function TfrmCadEmpregados.SomarConsignado:Double;
begin
   qryProdutosConsig.DisableControls;
   qryProdutosConsig.First;
   Result := 0;
   While Not qryProdutosConsig.Eof do begin
     Result := Result + qryProdutosConsigpreco.AsFloat * qryProdutosConsigquant_consignada.AsFloat;
     qryProdutosConsig.Next;
   end;
   qryProdutosConsig.First;
   qryProdutosConsig.EnableControls;
end;

end.

