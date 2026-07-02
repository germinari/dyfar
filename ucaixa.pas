unit uCaixa;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, StdCtrls, ActnList, DbCtrls, Buttons, DBActns, EditBtn, ZDataset,
  ZSqlUpdate, rxtoolbar, rxdbgrid, rxdbdateedit, rxcurredit, WAGDBNavigator,
  RLReport, db, ExtendedNotebook, DBGrids;

type

  { TfrmCaixa }

  TfrmCaixa = class(TForm)
    acLocalizar: TAction;
    Action1: TAction;
    Action3: TAction;
    Action4: TAction;
    ActionList1: TActionList;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbxTipo: TComboBox;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    edSoma: TCurrencyEdit;
    edDinheiro: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit6: TCurrencyEdit;
    DataSetPost1: TDataSetPost;
    DateEdit1: TDateEdit;
    dsCaixa: TDatasource;
    edEmpresa: TEdit;
    ExtendedNotebook1: TExtendedNotebook;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    qryCaixabalcao_venda: TLongintField;
    qryCaixaconta: TLongintField;
    qryCaixadata: TDateTimeField;
    qryCaixaempregado: TLongintField;
    qryCaixahistorico: TStringField;
    qryCaixaid: TLongintField;
    qryCaixaloja: TLongintField;
    qryCaixatipo_lancamento: TLongintField;
    qryCaixavalor: TFloatField;
    qryCtaPagarvconta_debito: TStringField;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLLabel1: TRLLabel;
    RLReport1: TRLReport;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RxDBGrid1: TRxDBGrid;
    SpeedButton3: TSpeedButton;
    TabSheet1: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton13: TToolButton;
    ToolButton2: TToolButton;
    qryCaixa: TZQuery;
    ToolButton3: TToolButton;
    procedure BitBtn2Click(Sender: TObject);
    procedure ExtendedNotebook1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1GetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure RxDBGrid1TitleClick(Column: TColumn);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    Ordem : String;
    AlternateColor : TColor;
    procedure Somar;
  end; 

var
  frmCaixa: TfrmCaixa;

implementation

{$R *.lfm}

Uses udbConnect, uRecebimento, sistema_config, WagVclUtils, TDIPageControl,
  uSearch, BDSqlUtils, DateUtils, StrUtils;

{ TfrmCaixa }

procedure TfrmCaixa.FormResize(Sender: TObject);
begin
  CenterControl(GroupBox2);
end;

procedure TfrmCaixa.RLBand2BeforePrint(Sender: TObject; var PrintIt: boolean
  );
begin
  RLBand2.Color:= clWhite;
  if ((qryCaixa.RecNo mod 2) > 0 ) then RLBand2.Color:= AlternateColor;
end;

procedure TfrmCaixa.RxDBGrid1DblClick(Sender: TObject);
var ret : Variant;
    Sql : String;
begin
  sql := 'Select produto,p.descricao,quantidade,preco,desconto,(quantidade*preco - (quantidade*preco*desconto/100)) as total,lote From balcao_venda_itens bi ';
  Sql += 'Left Join produtos p ON p.id=bi.produto ';
  Sql += 'Where bi.balcao_venda='+qryCaixabalcao_venda.ASString;
  ret:= ShowSearchModalSQL(dbConnect.ZConnection1,Sql,'produto,descricao,quantidade,preco,desconto,total,lote','produto','descricao',True);
  //'balcao_venda_itens',
  //'produto,quantidade,preco,desconto,lote','produto','id',true,'balcao_venda='+qryCaixabalcao_venda.ASString);
  if VarIsBlank(ret) then exit;
  //edEmpresa.Text := Format('%s-%s',[ret[0],ret[1]]);
end;

procedure TfrmCaixa.RxDBGrid1GetCellProps(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor);
begin
  if (Field.FieldName = 'atrazo') and (Field.AsInteger < 0) then
     AFont.Color:=clRed;
end;

procedure TfrmCaixa.RxDBGrid1TitleClick(Column: TColumn);
begin
  Column := RxDBGrid1.Columns.Items[Column.Index+1];
  if Column.FieldName = 'atrazo' then exit;
  if pos(Ordem,Column.FieldName) > 0 then
       Ordem := Column.FieldName+' desc'
  else Ordem := Column.FieldName;
  BitBtn2.Click;
end;

procedure TfrmCaixa.SpeedButton3Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'empresa','id,nome','id,nome','id',true);
  if VarIsBlank(ret) then exit;
  edEmpresa.Text := Format('%s-%s',[ret[0],ret[1]]);
end;

procedure TfrmCaixa.ToolButton12Click(Sender: TObject);
begin
  {
  AlternateColor := ReadIntDefaultIni('configuracoes','ColorButton1_ButtonColor',clWhite);
  RLLabel1.Caption:= Application.Title;
  if ExtendedNotebook1.PageIndex = 0 then begin
    RLLabel2.Caption := Format('Periodo de %s a %s',[DateEdit1.Text,DateEdit2.Text]);
    RLReport1.PreviewModal;
  end;
  }
end;

procedure TfrmCaixa.FormCreate(Sender: TObject);
begin
  //OpenTable( qryCaixa );
  ordem := '0=0';
  DateEdit1.Date   := Date;
  edEmpresa.Caption:= getEmpresaPadrao(meCodigoAbrev);
end;

procedure TfrmCaixa.BitBtn2Click(Sender: TObject);
Var Where : String;
begin
  Case cbxTipo.ItemIndex of
       0 : Where  := Format('Where (tipo_lancamento in (1,2,8,9,10)) ',[tlTotal]);
       1 : Where  := Format('Where (tipo_lancamento in (3,7)) ',[tlDinheiro]);
       2 : Where  := Format('Where (tipo_lancamento = %d) ',[tlCredito]);
       3 : Where  := Format('Where (tipo_lancamento = %d) ',[tlDebito]);
       4 : Where  := Format('Where (tipo_lancamento = %d) ',[tlCarteira]);
  end;
  if Length(edEmpresa.Text) > 0 then
     Where  := Where + Format(' and (loja=%s)',[ExtractWord(1,edEmpresa.Text,['-'])]);

  Where := Where + ' and '+Format('(data::::date = ''%s'')',[DateEdit1.Text]);

  qryCaixa.close;
  qryCaixa.Sql.clear;
  qryCaixa.Sql.Add('Select * from balcao_caixa');
  qryCaixa.Sql.Add(Where);
  qryCaixa.Sql.Add('Order by data, tipo_lancamento');
  OpenTable( qryCaixa );
  Somar;
end;

procedure TfrmCaixa.ExtendedNotebook1Change(Sender: TObject);
begin
  CenterControl(GroupBox2);
end;

procedure TfrmCaixa.ToolButton1Click(Sender: TObject);
begin
    ClosePageThisForm(Self);
end;

procedure TfrmCaixa.ToolButton3Click(Sender: TObject);
begin
  RLLabel1.Caption := Application.Title;
  dbConnect.report := RLReport1;
  RLReport1.PreviewModal;
end;

procedure TfrmCaixa.Somar;
Var qry : TZQuery;
    troco, soma : Double;
begin
  try
    StartWaitSql;
    qry := ExecSqlQuery(dbConnect.ZConnection1,'Select tipo_lancamento,SUM(valor) as valor '+
                                               'From balcao_caixa Where cast(data as date) = ''%s'' and loja=%s'+
                                               'Group by tipo_lancamento',
                                               [DateEdit1.Text,ExtractWord(1,edEmpresa.Text,['-'])]);

    CurrencyEdit1.Value := 0;
    CurrencyEdit2.Value := 0;
    edDinheiro.Value    := 0;
    CurrencyEdit4.Value := 0;
    CurrencyEdit5.Value := 0;
    CurrencyEdit6.Value := 0;
    edSoma.Value        := 0;
    troco := 0;
    soma  := 0;
    //edSoma.Value := 0;

    //qryCaixa.DisableControls;
    qry.First;
    While not qry.eof do begin
      if (qry.FieldByName('tipo_lancamento').AsInteger = TTipoLancamentoToInt(tlAbertura)) or
         (qry.FieldByName('tipo_lancamento').AsInteger = TTipoLancamentoToInt(tlEntrada)) then begin
         CurrencyEdit1.Value := CurrencyEdit1.Value + qry.FieldByName('valor').AsFloat;
         Soma += qry.FieldByName('valor').ASFloat;
      end;

      if qry.FieldByName('tipo_lancamento').AsInteger = TTipoLancamentoToInt(tlDinheiro) then begin
         edDinheiro.Value := edDinheiro.Value + qry.FieldByName('valor').ASFloat;
         Soma += qry.FieldByName('valor').ASFloat;
      end;

      if qry.FieldByName('tipo_lancamento').AsInteger = TTipoLancamentoToInt(tlCredito) then begin
         CurrencyEdit4.Value := CurrencyEdit4.Value + qry.FieldByName('valor').ASFloat;
         Soma += qry.FieldByName('valor').ASFloat;
      end;

      if qry.FieldByName('tipo_lancamento').AsInteger = TTipoLancamentoToInt(tlDebito) then begin
         CurrencyEdit5.Value := CurrencyEdit5.Value + qry.FieldByName('valor').ASFloat;
         Soma += qry.FieldByName('valor').ASFloat;
      end;

      if qry.FieldByName('tipo_lancamento').AsInteger = TTipoLancamentoToInt(tlCarteira) then begin
         CurrencyEdit6.Value := CurrencyEdit6.Value + qry.FieldByName('valor').ASFloat;
         Soma += qry.FieldByName('valor').ASFloat;
      end;
      if qry.FieldByName('tipo_lancamento').AsInteger = TTipoLancamentoToInt(tlSangria) then begin
         CurrencyEdit2.Value := CurrencyEdit2.Value + qry.FieldByName('valor').ASFloat;
         Soma -= qry.FieldByName('valor').ASFloat;
      end;
      if qry.FieldByName('tipo_lancamento').AsInteger = TTipoLancamentoToInt(tlTroco) then begin
         Troco := Troco + qry.FieldByName('valor').ASFloat;
         Soma -= qry.FieldByName('valor').ASFloat;
      end;
      if qry.FieldByName('tipo_lancamento').AsInteger = TTipoLancamentoToInt(tlCheque) then begin
         CurrencyEdit6.Value := CurrencyEdit6.Value + qry.FieldByName('valor').ASFloat;
         Soma -= qry.FieldByName('valor').ASFloat;
      end;

      qry.Next;
    end;
{
tlAbertura=1, tlTotal, tlDinheiro, tlDebito, tlCredito, tlCarteira, tlTroco, tlFechamento, tlSangria, tlEntrada, tlCheque);
4;205.00  DB
3;193.25  din
7;32.00   tro
5;187.40  Cre
1;0.00    Abert.
2;698.40  Total
}
    edDinheiro.Value:= edDinheiro.Value - Troco;
    edSoma.Value    := Soma
  finally
    //qryCaixa.EnableControls;
    StopWaitSql;
  end;
end;

end.

