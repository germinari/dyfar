unit uRecebimento;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  StdCtrls, LCLType, rxcurredit, RLBarcode;

type

  { TfrmRecebimento }

  { TRecebimento }
  TTipoLancamento = (tlAbertura=1, tlTotal, tlDinheiro, tlDebito, tlCredito, tlCarteira, tlTroco, tlFechamento, tlSangria, tlEntrada, tlCheque);

  TRecebimento = Class
    public
      Total    : Double;
      Dinheiro : Double;
      Credito  : Double;
      Debito   : Double;
      Troco    : Double;
      Carteira : Double;
      desconto : Double;
      Cheque   : Double;
      constructor Create;
  end;

  TfrmRecebimento = class(TForm)
    btCheque: TSpeedButton;
    edDesconto: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lbTotal: TLabel;
    lbTotal1: TLabel;
    lbTotal10: TLabel;
    lbTotal11: TLabel;
    lbTotal2: TLabel;
    lbTotal3: TLabel;
    lbTotal4: TLabel;
    lbTotal5: TLabel;
    lbTotal6: TLabel;
    lbTotal7: TLabel;
    lbTotal8: TLabel;
    lbTotal9: TLabel;
    btDinheiro: TSpeedButton;
    btCredito: TSpeedButton;
    btDebito: TSpeedButton;
    btCtaCorrente: TSpeedButton;
    procedure btChequeClick(Sender: TObject);
    procedure edDescontoChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btDinheiroClick(Sender: TObject);
    procedure btCreditoClick(Sender: TObject);
    procedure btDebitoClick(Sender: TObject);
    procedure btCtaCorrenteClick(Sender: TObject);
  private
    { private declarations }
    recibo : TRecebimento;
    totVenda : double;
    procedure recalcula;
  public
    { public declarations }
  end;


function TTipoLancamentoToInt( value : TTipoLancamento):Integer;
function obtemValorRecebimento( Total : Double; recebimento : TRecebimento):boolean;

var
  frmRecebimento: TfrmRecebimento;

implementation
{$R *.lfm}

Uses uGetValor, uRecebFim, math;

function TTipoLancamentoToInt(value: TTipoLancamento): Integer;
begin
  Result := Integer( Ord(Value) );
end;

function obtemValorRecebimento(Total : Double; recebimento : TRecebimento): boolean;
begin
    with TfrmRecebimento.Create(Application) do begin
         recibo       := recebimento;
         recibo.Total := Total;
         totVenda     := Total;
         lbTotal.Caption := Format('%.2f',[Total]);
         ShowModal;
         Result := (ModalResult <> mrCancel);
         if Result then
            Result := confirmaRecebimento(recibo.Total,recibo);
         recebimento := recibo;
         Free;
    end;
end;

{ TRecebimento }

constructor TRecebimento.Create;
begin
  Total    := 0;
  Dinheiro := 0;
  Credito  := 0;
  Debito   := 0;
  Troco    := 0;
  Carteira := 0;
  desconto := 0;
  Cheque   := 0;
end;

{ TfrmRecebimento }

procedure TfrmRecebimento.btCtaCorrenteClick(Sender: TObject);
Var valor : Double;
begin
//  if not obtemValor(valor) then exit;
  recibo.Dinheiro := 0;
  recibo.Credito  := 0;
  recibo.Debito   := 0;
  recibo.Troco    := 0;
  recibo.Carteira := recibo.Total;
  recalcula;
  lbTotal8.Caption := Format('%.2f',[valor]);
end;

procedure TfrmRecebimento.recalcula;
Var vlr : Double;
begin
   vlr := recibo.Total - (recibo.Dinheiro + recibo.Credito + recibo.Debito + Recibo.Carteira + Recibo.Cheque);
   lbTotal4.Caption := Format('%.2f',[vlr]);
   if vlr <= 0 then Begin
     recibo.Troco:= abs(vlr);
     ModalResult := mrOk;
   end;
end;

procedure TfrmRecebimento.btDinheiroClick(Sender: TObject);
Var valor : Double;
begin
  if not obtemValor(valor) then exit;
  recibo.Dinheiro := valor;
  recalcula;
  lbTotal3.Caption := Format('%.2f',[valor]);
end;

procedure TfrmRecebimento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case key of
    VK_F2 : btDinheiro.Click;
    VK_F3 : btCredito.Click;
    VK_F4 : btDebito.Click;
    VK_F5 : btCtaCorrente.Click;
    VK_F6 : btCheque.Click;
    VK_ESCAPE : (ModalResult := mrCancel);
  end;
end;

procedure TfrmRecebimento.edDescontoChange(Sender: TObject);
Var value : Double;
begin
    {Evita rechamada do evento}
  if edDesconto.Value = recibo.desconto then exit;
  edDesconto.OnChange:= Nil;
  value := totVenda - (totVenda * edDesconto.Value/100);
  recibo.Total   := value;
  recibo.desconto:= edDesconto.Value;
  recibo.Credito := 0;
  recibo.Carteira:= 0;
  recibo.Debito  := 0;
  recibo.Dinheiro:= 0;
  recibo.Troco   := 0;
  recibo.Cheque  := 0;
  recalcula;
  edDesconto.OnChange:= @edDescontoChange;
end;

procedure TfrmRecebimento.btChequeClick(Sender: TObject);
Var valor : Double;
begin
  if not obtemValor(valor) then exit;
  recibo.Cheque := valor;
  recalcula;
  lbTotal1.Caption := Format('%.2f',[valor]);
end;

procedure TfrmRecebimento.btCreditoClick(Sender: TObject);
Var valor : Double;
begin
  if not obtemValor(valor) then exit;
  recibo.Credito := valor;
  recalcula;
  lbTotal2.Caption := Format('%.2f',[valor]);
end;

procedure TfrmRecebimento.btDebitoClick(Sender: TObject);
Var valor : Double;
begin
  if not obtemValor(valor) then exit;
  recibo.Debito := valor;
  recalcula;
  lbTotal1.Caption := Format('%.2f',[valor]);
end;



end.

