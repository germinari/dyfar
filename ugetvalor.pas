unit uGetValor;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  StdCtrls, rxcurredit;

type

  { TfrmGetValor }

  TfrmGetValor = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CurrencyEdit1: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
  private
    { private declarations }
  public
    { public declarations }
  end;

function obtemValor(Var valor : Double):Boolean;overload;
function obtemValor(const Title, Prompt: String; Var valor : Double):Boolean;overload;

var
  frmGetValor: TfrmGetValor;

implementation

{$R *.lfm}

function obtemValor(var valor: Double): Boolean;
begin
  with TfrmGetValor.Create(Application) do begin
      ShowModal;
      valor := CurrencyEdit1.Value;
      Result := (ModalResult <> mrCancel);
      Free;
  end;
end;

function obtemValor(const Title, Prompt: String; var valor: Double): Boolean;
begin
  with TfrmGetValor.Create(Application) do begin
      Caption := Title;
      Label2.Caption := Prompt;
      ShowModal;
      valor := CurrencyEdit1.Value;
      Result := (ModalResult <> mrCancel);
      Free;
  end;
end;



end.

