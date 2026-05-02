unit uRecebFim;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  StdCtrls, ExtCtrls, LCLType, uRecebimento;

type

  { TfrmRecebFim }

  TfrmRecebFim = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lbTotal: TLabel;
    lbTotal1: TLabel;
    lbTotal2: TLabel;
    lbTotal3: TLabel;
    lbTotal4: TLabel;
    lbTotal5: TLabel;
    Shape1: TShape;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;


function confirmaRecebimento(total: Double; recibo : TRecebimento):Boolean;



var
  frmRecebFim: TfrmRecebFim;

implementation

function confirmaRecebimento(total: Double; recibo: TRecebimento): Boolean;
begin
  with TfrmRecebFim.Create(Application) do begin
      lbTotal.Caption := FormatCurr(',0.00',total);
      lbTotal3.Caption := FormatCurr(',0.00',recibo.Dinheiro);
      lbTotal2.Caption := FormatCurr(',0.00',recibo.credito);
      lbTotal1.Caption := FormatCurr(',0.00',recibo.debito);
      lbTotal5.Caption := FormatCurr(',0.00',recibo.Carteira);
      lbTotal4.Caption := FormatCurr(',0.00',recibo.troco);
      ShowModal;
      Result := (ModalResult = mrOK);
      Free;
  end;
end;

{$R *.lfm}

{ TfrmRecebFim }

procedure TfrmRecebFim.SpeedButton1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmRecebFim.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case key of
    VK_RETURN : ModalResult := mrOK;
    VK_ESCAPE : (ModalResult := mrCancel);
  end;

end;

procedure TfrmRecebFim.SpeedButton2Click(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

end.

