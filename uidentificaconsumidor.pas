unit uIdentificaConsumidor;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, LCLType, ACBrCEP, ZDataset;

type

  { TfrmIdentificaConsumidor }

  TfrmIdentificaConsumidor = class(TForm)
    ACBrCEP1: TACBrCEP;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edComplemento: TEdit;
    edNome: TEdit;
    edCPF: TEdit;
    edCep: TEdit;
    edEndereco: TEdit;
    edNumero: TEdit;
    edbairro: TEdit;
    edCidade: TEdit;
    edUF: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure edCepKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

  TConsumidor = class
    Nome     : String;
    CPF      : String;
    CEP      : String;
    Endereco : String;
    Numero   : String;
    cidade   : String;
    bairro   : String;
    uf       : String;
    complemento : String;
  end;

function ShowIdentificarConsumidor( Var Consumidor : TConsumidor):Boolean;

var
  frmIdentificaConsumidor: TfrmIdentificaConsumidor;


implementation

uses WagVclUtils, uSearch, BDSqlUtils, udbConnect, strutils;

{$R *.lfm}

function ShowIdentificarConsumidor( Var consumidor : TConsumidor):Boolean;
begin
    with TfrmIdentificaConsumidor.Create(Application) do begin
      ShowModal;
      if ModalResult= mrOK then begin
         consumidor := TConsumidor.Create;
         consumidor.Nome       := edNome.Text;
         consumidor.CPF        := edCPF.Text;
         consumidor.CEP        := edCep.Text;
         consumidor.Endereco   := edEndereco.Text;
         consumidor.Numero     := edNumero.Text;
         consumidor.cidade     := edCidade.Text;
         consumidor.uf         := edUF.Text;
         consumidor.bairro     := edbairro.Text;
         consumidor.complemento:= edComplemento.Text;
      end;
      Result := (ModalResult=mrOK);
      Free;
    end;
end;

{ TfrmIdentificaConsumidor }

procedure TfrmIdentificaConsumidor.SpeedButton1Click(Sender: TObject);
Var s : String;
begin
    StartWait;
    try
      if ACBrCEP1.BuscarPorCEP(edCep.text) > 0 then begin
        InputQuery('Qual o número','Digite o número',s);
        edEndereco.Text := ACBrCEP1.Enderecos[0].Tipo_Logradouro+' '+ACBrCEP1.Enderecos[0].Logradouro;
        edCidade.Text   := ACBrCEP1.Enderecos[0].Municipio;
        edbairro.Text   := ACBrCEP1.Enderecos[0].Bairro;
        edUF.Text       := ACBrCEP1.Enderecos[0].UF;
        edNumero.Text   := S;
        StopWait;
        Exit;
      end;
    MessageDlg('Não foi possível localizar o CEP',mtError,[mbOk],0);
    finally
      StopWait;
    end;
end;

procedure TfrmIdentificaConsumidor.edCepKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
     SpeedButton1.Click;
end;

procedure TfrmIdentificaConsumidor.SpeedButton2Click(Sender: TObject);
Var res : Variant;
    qry : TZQuery;
begin
   res := ShowSearchModal(dbConnect.ZConnection1,'clientes','id,nome','id','nome',true);
   if VarIsBlank(res) then exit;
   qry := ExecSqlQuery(dbConnect.ZConnection1,'Select * from clientes Where id=%s',[res]);
   edNome.Text     := qry.FieldByName('nome').AsString;
   edCPF.Text      := qry.FieldByName('cnpj').AsString;
   edEndereco.Text := ExtractWord(1,qry.FieldByName('endereco').AsString,[',']);
   edCidade.Text   := qry.FieldByName('cidade').AsString;
   edbairro.Text   := qry.FieldByName('bairro').AsString;
   edUF.Text       := qry.FieldByName('uf').AsString;
   edNumero.Text   := ExtractWord(2,qry.FieldByName('endereco').AsString,[',']);
   edComplemento.Text := qry.FieldByName('complemento').AsString;
end;

end.

