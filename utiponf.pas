unit uTipoNF;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls;

type

  { TfrmTipoNF }

  TTipoNota = (tnNada,tnFornecedor,tnDevolucao,tnBonificacao);

  TfrmTipoNF = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    Retorno : TTipoNota;
  end;

function TipoNotaToInt( tipo : TTipoNota):Integer;
function IntToTipoNota( tipo : Integer):TTipoNota;

function GetTipoNFEntrada: TTipoNota;

//Const NOTA_FORNECEDOR  = 0;
//      NOTA_DEVOLUCAO   = 1;
//      NOTA_BNONIFICACAO= 2;

var
  frmTipoNF: TfrmTipoNF;

implementation

{$R *.lfm}

function TipoNotaToInt(tipo: TTipoNota): Integer;
begin
     Result := Ord(tipo);
end;

function IntToTipoNota(tipo: Integer): TTipoNota;
begin
     Result := TTipoNota(Tipo);
end;

function GetTipoNFEntrada: TTipoNota;
begin
  with TfrmTipoNF.Create(Application) do begin
       Retorno := tnNada;
       ShowModal;
       Result := Retorno;
  end;
end;

{ TfrmTipoNF }

procedure TfrmTipoNF.Button1Click(Sender: TObject);
begin
  Retorno:= tnFornecedor;
  Close;
end;

procedure TfrmTipoNF.Button2Click(Sender: TObject);
begin
  Retorno:= tnDevolucao;
  Close;
end;

procedure TfrmTipoNF.Button3Click(Sender: TObject);
begin
 Retorno:= tnBonificacao;
 Close;
end;

procedure TfrmTipoNF.Button4Click(Sender: TObject);
begin
 Retorno:= tnNada;
 Close;
end;

//initialization
//  {$I utiponf.lrs}

end.

