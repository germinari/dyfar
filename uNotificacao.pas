unit uNotificacao;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TfrmNotificacao }

  TfrmNotificacao = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
  private
    { private declarations }
  public
    { public declarations }
    procedure UpdateMsg( msg : String);
  end;

function ShowNotificacao( Titulo, Msg : String):TfrmNotificacao;

var
  frmNotificacao: TfrmNotificacao;

implementation

function ShowNotificacao(Titulo, Msg: String): TfrmNotificacao;
begin
    frmNotificacao:= TfrmNotificacao.Create(Application);
    frmNotificacao.Label1.caption := Titulo;
    frmNotificacao.Label2.caption := Msg;
    frmNotificacao.ShowOnTop;
    frmNotificacao.Update;
    Result := frmNotificacao;
end;

{ TfrmNotificacao }

procedure TfrmNotificacao.UpdateMsg(msg: String);
begin
  Label2.caption := msg;
  Update;
end;

{$R *.lfm}

end.

