unit uLancaFlex;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  EditBtn, Buttons, rxcurredit;

type

  { TfrmLancaFlex }

  TfrmLancaFlex = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CurrencyEdit1: TCurrencyEdit;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmLancaFlex: TfrmLancaFlex;

function lancamentoFlex(const nome : string; out historico: String; out valor : Currency ):Boolean;

implementation

function lancamentoFlex(const nome: string; out historico: String; out
  valor: Currency): Boolean;
begin
  with TfrmLancaFlex.Create(Application) do
  begin
    Label1.Caption := nome;
    ShowModal;
    historico:= Edit1.Text;
    valor    := CurrencyEdit1.Value;
    Result   := (ModalResult = mrOK);
    Free;
  end;
end;

{$R *.lfm}

end.

