unit uCtaPagarMultBaixa;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, StdCtrls, EditBtn, rxdbgrid, ZDataset, ZSqlUpdate;

type

  { TfrmCtaPagarMultBaixa }

  TfrmCtaPagarMultBaixa = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DateEdit1: TDateEdit;
    dsCtaPagar: TDataSource;
    Label1: TLabel;
    Panel1: TPanel;
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
    qryCtaPagartotal_parcelas: TLongintField;
    qryCtaPagarvalor_devido: TFloatField;
    qryCtaPagarvalor_pago: TFloatField;
    RxDBGrid1: TRxDBGrid;
    qryCtaPagar: TZQuery;
    qryCtaPagarvalor_pagar: TFloatField;
    ZUpdateSQL1: TZUpdateSQL;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryCtaPagarCalcFields(DataSet: TDataSet);
  private
    { private declarations }
    procedure OpenContas(contas : String);
  public
    { public declarations }
  end;

function MultBaixaCtaPagar( contas : String):Boolean;

var
  frmCtaPagarMultBaixa: TfrmCtaPagarMultBaixa;

implementation

uses udbConnect, BDSqlUtils, WagVclUtils;

function MultBaixaCtaPagar(contas: String): Boolean;
begin
  with TfrmCtaPagarMultBaixa.Create(Application) do
  begin
    OpenContas(contas);
    ShowModal;
    Result := (ModalResult = mrOK);
    Free;
  end;
end;

{$R *.lfm}

{ TfrmCtaPagarMultBaixa }

procedure TfrmCtaPagarMultBaixa.qryCtaPagarCalcFields(DataSet: TDataSet);
Var valor : Currency;
begin
  if qryCtaPagarvalor_pago.AsCurrency > 0 then begin
     valor := qryCtaPagarvalor_devido.AsCurrency - qryCtaPagarvalor_pago.AsCurrency;
     if valor < 0 then
        qryCtaPagarjuros.AsCurrency := Abs(valor)
     else
        qryCtaPagardesconto.AsCurrency := valor;
     qryCtaPagarvalor_pagar.AsCurrency := qryCtaPagarvalor_pago.AsCurrency;
  end else begin
      qryCtaPagarvalor_pago.AsCurrency := 0.00;
      qryCtaPagarvalor_pagar.AsCurrency := qryCtaPagarvalor_devido.AsCurrency +
                                             qryCtaPagarjuros.AsCurrency -
                                             qryCtaPagardesconto.AsCurrency;
  end;
end;

procedure TfrmCtaPagarMultBaixa.BitBtn1Click(Sender: TObject);
begin
  ExecSql(dbConnect.ZConnection1,'Begin Work');
  try
    SetDecimalSeparator;
    qryCtaPagar.First;
    While Not qryCtaPagar.Eof do begin
      ExecSql(dbConnect.ZConnection1,'UPDATE contas_pagar SET data_pagamento=''%s'', '+
                                     'desconto=%.2f, juros=%.2f, valor_pago=%.2f '+
                                     'WHERE id=%d',
                                     [DateToStr(DateEdit1.Date),
                                      qryCtaPagardesconto.AsCurrency,
                                      qryCtaPagarjuros.AsCurrency,
                                      qryCtaPagarvalor_pagar.AsCurrency,
                                      qryCtaPagarid.AsInteger]);
      qryCtaPagar.Next;
    end;
    ExecSql(dbConnect.ZConnection1,'Commit');
    RestoreDecimalSeparator;
    ModalResult := mrOK;
  Except
    ExecSql(dbConnect.ZConnection1,'Rollback');
    RestoreDecimalSeparator;
    Raise;
  end;
end;

procedure TfrmCtaPagarMultBaixa.FormCreate(Sender: TObject);
begin
  DateEdit1.Date := Date();
end;

procedure TfrmCtaPagarMultBaixa.OpenContas(contas: String);
begin
   qryCtaPagar.Close;
   qryCtaPagar.SQL.Clear;
   qryCtaPagar.SQL.Text := 'Select * from contas_pagar '+
                      Format('Where id in (%s) ',[contas]) +
                             'Order by data_vencimento';
   OpenTable( qryCtaPagar );
end;



end.

