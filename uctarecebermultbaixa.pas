unit uCtaReceberMultBaixa;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, StdCtrls, EditBtn, rxdbgrid, ZDataset, ZSqlUpdate;

type

  { TfrmCtaReceberMultBaixa }

  TfrmCtaReceberMultBaixa = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DateEdit1: TDateEdit;
    dsCtaReceber: TDataSource;
    Label1: TLabel;
    Panel1: TPanel;
    RxDBGrid1: TRxDBGrid;
    qryCtaReceber: TZQuery;
    qryCtaReceberbanco_negociado: TStringField;
    qryCtaRecebercliente: TLongintField;
    qryCtaReceberconta: TLongintField;
    qryCtaReceberconta_credito: TLongintField;
    qryCtaReceberconta_debito: TLongintField;
    qryCtaReceberdataconta: TDateField;
    qryCtaReceberdata_pagamento: TDateField;
    qryCtaReceberdata_vencimento: TDateField;
    qryCtaReceberdesconto: TFloatField;
    qryCtaReceberdescricao: TStringField;
    qryCtaReceberdocumento: TStringField;
    qryCtaReceberid: TLongintField;
    qryCtaReceberid_nf: TLongintField;
    qryCtaReceberjuros: TFloatField;
    qryCtaReceberobservacao: TMemoField;
    qryCtaReceberparcela: TLongintField;
    qryCtaRecebertotal_parcelas: TLongintField;
    qryCtaRecebervalor_devido: TFloatField;
    qryCtaRecebervalor_pagar: TFloatField;
    qryCtaRecebervalor_pago: TFloatField;
    ZUpdateSQL1: TZUpdateSQL;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryCtaReceberCalcFields(DataSet: TDataSet);
  private
    { private declarations }
    procedure OpenContas(contas : String);
  public
    { public declarations }
  end;

function MultBaixaCtaReceber( contas : String):Boolean;

var
  frmCtaReceberMultBaixa: TfrmCtaReceberMultBaixa;

implementation

uses udbConnect, BDSqlUtils, WagVclUtils;

function MultBaixaCtaReceber(contas: String): Boolean;
begin
  with TfrmCtaReceberMultBaixa.Create(Application) do
  begin
    OpenContas(contas);
    ShowModal;
    Result := (ModalResult = mrOK);
    Free;
  end;
end;

{$R *.lfm}

{ TfrmCtaReceberMultBaixa }

procedure TfrmCtaReceberMultBaixa.qryCtaReceberCalcFields(DataSet: TDataSet);
Var valor : Currency;
begin
  if qryCtaRecebervalor_pago.AsCurrency > 0 then begin
     valor := qryCtaRecebervalor_devido.AsCurrency - qryCtaRecebervalor_pago.AsCurrency;
     if valor < 0 then
        qryCtaReceberjuros.AsCurrency := Abs(valor)
     else
        qryCtaReceberdesconto.AsCurrency := valor;
     qryCtaRecebervalor_pagar.AsCurrency := qryCtaRecebervalor_pago.AsCurrency;
  end else begin
      qryCtaRecebervalor_pago.AsCurrency := 0.00;
      qryCtaRecebervalor_pagar.AsCurrency := qryCtaRecebervalor_devido.AsCurrency +
                                             qryCtaReceberjuros.AsCurrency -
                                             qryCtaReceberdesconto.AsCurrency;
  end;
end;

procedure TfrmCtaReceberMultBaixa.BitBtn1Click(Sender: TObject);
begin
  ExecSql(dbConnect.ZConnection1,'Begin Work');
  try
    SetDecimalSeparator;
    qryCtaReceber.First;
    While Not qryCtaReceber.Eof do begin
      ExecSql(dbConnect.ZConnection1,'UPDATE contas_receber SET data_pagamento=''%s'', '+
                                     'desconto=%.2f, juros=%.2f, valor_pago=%.2f '+
                                     'WHERE id=%d',
                                     [DateToStr(DateEdit1.Date),
                                      qryCtaReceberdesconto.AsCurrency,
                                      qryCtaReceberjuros.AsCurrency,
                                      qryCtaRecebervalor_pagar.AsCurrency,
                                      qryCtaReceberid.AsInteger]);
      qryCtaReceber.Next;
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

procedure TfrmCtaReceberMultBaixa.FormCreate(Sender: TObject);
begin
    DateEdit1.Date := Date();
end;

procedure TfrmCtaReceberMultBaixa.OpenContas(contas: String);
begin
   qryCtaReceber.Close;
   qryCtaReceber.SQL.Clear;
   qryCtaReceber.SQL.Text := 'Select * from contas_receber '+
                      Format('Where id in (%s) ',[contas]) +
                             'Order by data_vencimento';
   OpenTable( qryCtaReceber );
end;



end.

