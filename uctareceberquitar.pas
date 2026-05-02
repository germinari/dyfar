unit uCtaReceberQuitar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DbCtrls, Buttons, EditBtn, rxdbdateedit, rxcurredit, rxtooledit, rxctrls,
  uRecebimento, uCtaReceber;

type

  { TfrmCtaReceberQuitar }

  TfrmCtaReceberQuitar = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    RxDateEdit1: TDateEdit;
    edValorConta: TCurrencyEdit;
    edDesconto: TCurrencyEdit;
    edJuros: TCurrencyEdit;
    edAPagar: TCurrencyEdit;
    edPago: TCurrencyEdit;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label9: TLabel;
    RxLabel1: TRxLabel;
    procedure edDescontoChange(Sender: TObject);
    procedure edJurosChange(Sender: TObject);
    procedure edPagoChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    procedure  Recalcula;
  end;

function QuitarContaReceber(ValorConta : Double; Out Desconto : Currency;Out Juros : Currency;Out Pago : Currency; var formaPgto : TTipoLancamento; Var data : TDateTime):Boolean;

var
  frmCtaReceberQuitar: TfrmCtaReceberQuitar;

implementation


function QuitarContaReceber(ValorConta : Double; Out Desconto : Currency;Out Juros : Currency;Out Pago : Currency; var formaPgto : TTipoLancamento; Var data : TDateTime):Boolean;
begin
  with TfrmCtaReceberQuitar.Create(Application) do begin
    edValorConta.value:= ValorConta;
    edDesconto.value  := 0;
    edJuros.value     := 0;
    edAPagar.value    := ValorConta;
    edPago.value      := 0;
    RxDateEdit1.Date  := Date();
    ShowModal;
    Result   := (ModalResult = mrOk);
    Desconto := edDesconto.value;
    Juros    := edJuros.value;
    Pago     := edPago.value;
    data     := RxDateEdit1.Date;
    Case ComboBox1.ItemIndex of
      0 :  formaPgto := tlDinheiro;
      1 :  formaPgto := tlCheque;
      2 :  formaPgto := tlDebito;
      3 :  formaPgto := tlCredito;
    end;
  end;
end;

{$R *.lfm}

{ TfrmCtaReceberQuitar }

procedure TfrmCtaReceberQuitar.edDescontoChange(Sender: TObject);
begin
   Recalcula;
end;

procedure TfrmCtaReceberQuitar.edJurosChange(Sender: TObject);
begin
  Recalcula;
end;

procedure TfrmCtaReceberQuitar.edPagoChange(Sender: TObject);
Var dif : Currency;
begin
   edDesconto.OnChange:= nil;
   edJuros.OnChange   := nil;
   edPago.OnChange    := nil;
   dif := edPago.Value - edAPagar.Value;
   if (dif = 0) or (edPago.Value = 0.00) then begin
     edDesconto.Value := 0.00;
     edJuros.Value    := 0.00;
   end;
   if dif < 0 then begin
     edDesconto.Value := Abs(dif);
     edJuros.Value    := 0.00;
   end;
   if dif > 0 then begin
     edDesconto.Value := 0.00;
     edJuros.Value    := dif;
   end;
   edDesconto.OnChange:= @edDescontoChange;
   edJuros.OnChange   := @edJurosChange;
   edPago.OnChange    := @edPagoChange;
end;

procedure TfrmCtaReceberQuitar.Recalcula;
begin
  edPago.OnChange    := nil;
  edAPagar.Value := edValorConta.Value - edDesconto.Value + edJuros.Value;
  edPago.Value   := edValorConta.Value - edDesconto.Value + edJuros.Value;
  edPago.OnChange    := @edPagoChange;
end;

end.

