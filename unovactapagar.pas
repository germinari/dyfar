unit uNovaCtaPagar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  EditBtn, Spin, Buttons, rxcurredit, variants;

type

  { TfrmNovaCtaPagar }

  TfrmNovaCtaPagar = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edValor: TCurrencyEdit;
    DateEdit1: TDateEdit;
    edDoc: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
  private
    { private declarations }
  public
    { public declarations }
  end;

function obtemNovaCtaPagar(var documento : String; var datavcto : TDateTime; var valor: double):Boolean;

var
  frmNovaCtaPagar: TfrmNovaCtaPagar;

implementation

{$R *.lfm}

uses strutils, uSearch, udbConnect;

function obtemNovaCtaPagar(var documento : String; var datavcto: TDateTime;
  var valor: double): Boolean;
begin
  with TfrmNovaCtaPagar.Create(Application) do begin
    ShowModal;
    Result := (ModalResult = mrOK);
    documento := edDoc.Text;
    datavcto  := DateEdit1.Date;
    valor     := edValor.Value;
  end;
end;


end.

