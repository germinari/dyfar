unit uCtapagar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, StdCtrls, ActnList, DbCtrls, Buttons, DBActns, EditBtn, ZDataset,
  ZSqlUpdate, rxtoolbar, rxdbgrid, rxdbdateedit, rxcurredit, WAGDBNavigator,
  RLReport, db, ExtendedNotebook, DBGrids, DBExtCtrls;

type

  { TfrmCtapagar }

  TfrmCtapagar = class(TForm)
    acLocalizar: TAction;
    Action1: TAction;
    Action3: TAction;
    Action4: TAction;
    ActionList1: TActionList;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    DataSetPost1: TDataSetPost;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    DBDateEdit4: TDBDateEdit;
    DBDateEdit5: TDBDateEdit;
    DBDateEdit6: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBMemo1: TDBMemo;
    dsCtaPagar: TDatasource;
    Edit1: TEdit;
    EditButton1: TEditButton;
    ExtendedNotebook1: TExtendedNotebook;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
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
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    qryCtaPagaratrazo: TLongintField;
    qryCtaPagarbanco_negociado: TStringField;
    qryCtaPagarconta_credito: TLongintField;
    qryCtaPagarconta_debito: TLongintField;
    qryCtaPagardataconta: TDateField;
    qryCtaPagardata_pagamento: TDateField;
    qryCtaPagardata_vencimento: TDateField;
    qryCtaPagardesconto: TFloatField;
    qryCtaPagardescricao: TStringField;
    qryCtaPagardocumento: TStringField;
    qryCtaPagarfornecedor: TLongintField;
    qryCtaPagarid: TLongintField;
    qryCtaPagarid_nf: TLongintField;
    qryCtaPagarjuros: TFloatField;
    qryCtaPagarobservacao: TMemoField;
    qryCtaPagarparcela: TLongintField;
    qryCtaPagarselecionado: TBooleanField;
    qryCtaPagartotal_parcelas: TLongintField;
    qryCtaPagarvalor_devido: TFloatField;
    qryCtaPagarvalor_pago: TFloatField;
    qryCtaPagarvconta_credito: TStringField;
    qryCtaPagarvconta_debito: TStringField;
    qryCtaPagarvdescricao_credito: TStringField;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    rgSituacao: TRadioGroup;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLReport1: TRLReport;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RxDBGrid1: TRxDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    qryCtaPagar: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;
    procedure BitBtn2Click(Sender: TObject);
    procedure DateEdit1AcceptDate(Sender: TObject; var ADate: TDateTime;
      var AcceptDate: Boolean);
    procedure dsCtaPagarStateChange(Sender: TObject);
    procedure EditButton1ButtonClick(Sender: TObject);
    procedure ExtendedNotebook1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure qryCtaPagarAfterOpen(DataSet: TDataSet);
    procedure qryCtaPagarCalcFields(DataSet: TDataSet);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1GetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure RxDBGrid1TitleClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    Ordem : String;
    AlternateColor : TColor;
  end; 

var
  frmCtapagar: TfrmCtapagar;

implementation

{$R *.lfm}

Uses udbConnect, uCtaPagarMultBaixa, WagVclUtils, TDIPageControl, uSearch,
  BDSqlUtils, WagStrUtils, DateUtils, StrUtils;

{ TfrmCtapagar }

procedure TfrmCtapagar.FormResize(Sender: TObject);
begin
  CenterControl(GroupBox2);
  CenterControl(GroupBox3);
end;

procedure TfrmCtapagar.qryCtaPagarAfterOpen(DataSet: TDataSet);
begin
  qryCtaPagar.DisableControls;
  qryCtaPagar.First;
  CurrencyEdit1.Value := 0;
  CurrencyEdit2.Value := 0;
  While Not qryCtaPagar.Eof do begin
    CurrencyEdit1.Value := CurrencyEdit1.Value + qryCtaPagarvalor_devido.AsFloat;
    CurrencyEdit2.Value := CurrencyEdit2.Value + qryCtaPagarvalor_pago.AsFloat;
    qryCtaPagar.Next;
  end;
  qryCtaPagar.EnableControls;
end;

procedure TfrmCtapagar.qryCtaPagarCalcFields(DataSet: TDataSet);
begin
  qryCtaPagaratrazo.AsInteger :=  0;
  if qryCtaPagardata_pagamento.IsNull then
     qryCtaPagaratrazo.AsInteger :=  Trunc(qryCtaPagardata_vencimento.ASDateTime-Date);
end;

procedure TfrmCtapagar.RLBand2BeforePrint(Sender: TObject; var PrintIt: boolean
  );
begin
  RLBand2.Color:= clWhite;
  if ((qryCtaPagar.RecNo mod 2) > 0 ) then RLBand2.Color:= AlternateColor;
end;

procedure TfrmCtapagar.RxDBGrid1DblClick(Sender: TObject);
begin
  ExtendedNotebook1.PageIndex:= 1;
end;

procedure TfrmCtapagar.RxDBGrid1GetCellProps(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor);
begin
  if (Field.FieldName = 'atrazo') and (Field.AsInteger < 0) then
     AFont.Color:=clRed;
end;

procedure TfrmCtapagar.RxDBGrid1TitleClick(Column: TColumn);
begin
  Column := RxDBGrid1.Columns.Items[Column.Index+1];
  if Column.FieldName = 'atrazo' then exit;
  if pos(Ordem,Column.FieldName) > 0 then
       Ordem := Column.FieldName+' desc'
  else Ordem := Column.FieldName;
  BitBtn2.Click;
end;

procedure TfrmCtapagar.SpeedButton1Click(Sender: TObject);
var ret : Variant;
begin
  ret := ShowSearchModal(dbConnect.ZConnection1,'plano_contas','conta,descricao','id,conta,descricao','conta',true);
  if VarIsBlank(ret) then exit;
  EditTable(qryCtaPagar);
  qryCtaPagarconta_credito.ASString := ret[0];
  qryCtaPagarvdescricao_credito.ASString:= Format('%s-%s',[ret[1],ret[2]]);
end;

procedure TfrmCtapagar.SpeedButton3Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'fornecedores','id,nome','id,nome','id',true);
  if VarIsBlank(ret) then exit;
  Edit1.Text := Format('%s-%s',[ret[0],ret[1]]);
end;

procedure TfrmCtapagar.SpeedButton4Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'fornecedores','id,nome','id,nome','id',true);
  if VarIsBlank(ret) then exit;
  EditTable(qryCtaPagar);
  qryCtaPagardescricao.ASString := ret[1];
  qryCtaPagarfornecedor.AsString:= ret[0];
end;

procedure TfrmCtapagar.SpeedButton5Click(Sender: TObject);
var
  ncontas: Integer;
  lista_cta: String;
begin
  qryCtaPagar.DisableControls;
  qryCtaPagar.First;
  ncontas := 0;
  lista_cta := '';
  While Not qryCtaPagar.Eof do begin
    if qryCtaPagarselecionado.AsBoolean then begin
       inc(ncontas);
       AddWithSeparator(lista_cta, qryCtaPagarid.AsString,',');
    end;
    qryCtaPagar.Next;
  end;
  qryCtaPagar.First;
  qryCtaPagar.EnableControls;
  if ncontas > 0 then begin
     //ShowMessageFmt('Selecionadas %d contas : %s',[ncontas,lista_cta]);
     MultBaixaCtaPagar(lista_cta);
     exit;
  end;
end;

procedure TfrmCtapagar.ToolButton11Click(Sender: TObject);
begin
  PostTable(qryCtaPagar);
end;

procedure TfrmCtapagar.ToolButton12Click(Sender: TObject);
begin
  AlternateColor  := ReadIntDefaultIni('configuracoes','ColorButton1_ButtonColor',clWhite);
  RLLabel1.Caption:= Application.Title;
  if ExtendedNotebook1.PageIndex = 0 then begin
    RLLabel2.Caption := Format('Periodo de %s a %s',[DateEdit1.Text,DateEdit2.Text]);
    RLReport1.PreviewModal;

  end;
end;

procedure TfrmCtapagar.FormCreate(Sender: TObject);
begin
  OpenTable( qryCtaPagar );
  ordem := '0=0';
  DateEdit1.Date := StartOfTheMonth(Date);
  DateEdit2.Date := EndOfTheMonth(Date);
end;

procedure TfrmCtapagar.BitBtn2Click(Sender: TObject);
Var Where : String;
begin
  Where := ' Where (0=0) ';
  if RadioButton1.Checked then
     Where += Format(' and dataconta Between ''%s'' and ''%s''',[DateEdit1.Text,DateEdit2.Text]);
  if RadioButton2.Checked then
     Where += Format(' and data_vencimento Between ''%s'' and ''%s''',[DateEdit1.Text,DateEdit2.Text]);
  if RadioButton3.Checked then
     Where += Format(' and data_pagamento Between ''%s'' and ''%s''',[DateEdit1.Text,DateEdit2.Text]);
  if Length(Edit1.Text) > 0 then
     Where  += Format(' and (cp.descricao like ''%s%%'')',[Copy(ExtractWord(2,Edit1.Text,['-']),1,10)]);
  if Length(EditButton1.Text) > 0 then
     Where  += Format(' and (pc.conta like ''%s%%'')',[ExtractWord(1,EditButton1.Text,['-']) ]);
  case rgSituacao.ItemIndex of
     1 : Where += Format(' and (data_vencimento < ''%s'' and data_pagamento is null)',[DateToStr(Date)]);
     2 : Where := ' and (data_pagamento is not null)';
  end;

  qryCtaPagar.close;
  qryCtaPagar.Sql.clear;
  qryCtaPagar.Sql.Add('SELECT (pc.conta||''-''||pc.descricao)::::varchar(80) as vdescricao_credito,');
  qryCtaPagar.Sql.Add('pc.conta as vconta_credito,');
  qryCtaPagar.Sql.Add('cp.id, id_nf, documento, cp.descricao, dataconta, data_vencimento,');
  qryCtaPagar.Sql.Add('data_pagamento, valor_devido, desconto, juros, valor_pago, observacao,');
  qryCtaPagar.Sql.Add('conta_credito, conta_debito, banco_negociado, parcela, total_parcelas,fornecedor, false as selecionado ');
  qryCtaPagar.Sql.Add('FROM contas_pagar cp');
  qryCtaPagar.Sql.Add('Left Join plano_contas pc ON cp.conta_credito=pc.id');
  qryCtaPagar.Sql.Add(Where);
  qryCtaPagar.Sql.Add('Order by '+ordem);
  OpenTable( qryCtaPagar );
end;

procedure TfrmCtapagar.DateEdit1AcceptDate(Sender: TObject;
  var ADate: TDateTime; var AcceptDate: Boolean);
begin
   AcceptDate := True;
   DateEdit2.date := EndOfTheMonth(ADate);
end;

procedure TfrmCtapagar.dsCtaPagarStateChange(Sender: TObject);
begin
  ToolButton11.Enabled := qryCtaPagar.State in dsEditModes;
end;

procedure TfrmCtapagar.EditButton1ButtonClick(Sender: TObject);
var ret : Variant;
  filtro: String;
begin
  filtro := '(conta like ''2.%'') or (conta like ''3.%'') or (conta like ''5.%'')';
  ret:= ShowSearchModal(dbConnect.ZConnection1,'plano_contas','conta,descricao','conta,descricao','conta',true,filtro);
  if VarIsBlank(ret) then exit;
  EditButton1.Text:= Format('%s-%s',[ret[0],ret[1]]); ;
end;

procedure TfrmCtapagar.ExtendedNotebook1Change(Sender: TObject);
begin
    CenterControl(GroupBox2);
  CenterControl(GroupBox3);
end;

procedure TfrmCtapagar.ToolButton1Click(Sender: TObject);
begin
    ClosePageThisForm(Self);
end;

procedure TfrmCtapagar.ToolButton3Click(Sender: TObject);
Var Sql : String;
begin
  if MessageDlg('Voce que criar uma copia da conta atual ?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then exit;
  sql := 'Insert into contas_pagar (id_nf, documento, descricao, dataconta, data_vencimento, '+
         '     data_pagamento, valor_devido, desconto, juros, valor_pago, observacao, '+
         '     conta_credito, conta_debito, banco_negociado, fornecedor, parcela, '+
         '     total_parcelas) '+
         'SELECT id_nf, documento, descricao, dataconta, data_vencimento, '+
         '     data_pagamento, valor_devido, desconto, juros, valor_pago, observacao, '+
         '     conta_credito, conta_debito, banco_negociado, fornecedor, parcela, '+
         '     total_parcelas '+
         'FROM contas_pagar Where id=%d';
  ExecSql(dbConnect.ZConnection1,sql,[qryCtaPagarid.AsInteger]);
  BitBtn2.Click;
end;

procedure TfrmCtapagar.ToolButton5Click(Sender: TObject);
begin
  ExtendedNotebook1.PageIndex:= 1;
  qryCtaPagar.Append;
  qryCtaPagardataconta.ASDateTime := Date;
  DBEdit2.SetFocus;
end;

procedure TfrmCtapagar.ToolButton6Click(Sender: TObject);
begin
  EditTable(qryCtaPagar);
end;

procedure TfrmCtapagar.ToolButton9Click(Sender: TObject);
Var i : Integer;
    ncontas: Integer;
    lista_cta: String;
begin
  qryCtaPagar.DisableControls;
  qryCtaPagar.First;
  ncontas   := 0;
  lista_cta := '';
  While Not qryCtaPagar.Eof do begin
    if qryCtaPagarselecionado.AsBoolean then begin
       inc(ncontas);
       AddWithSeparator(lista_cta, qryCtaPagarid.AsString,',');
    end;
    qryCtaPagar.Next;
  end;
  qryCtaPagar.First;
  qryCtaPagar.EnableControls;
  if length(lista_cta) = 0 then
     Raise Exception.Create('Selecione uma conta.');
  ConfirmDelete;
  ExecSql(dbConnect.ZConnection1,'Delete From contas_pagar Where id in (%s)',[lista_cta]);
  BitBtn2.Click();
end;

end.

