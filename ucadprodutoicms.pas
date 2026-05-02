unit uCadProdutoICMS;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DbCtrls, Buttons, rxdbcomb, ucadprodutos, db, ZDataset;

type

  { TfrmCadProdutoICMS }

  TfrmCadProdutoICMS = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBEdit20: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    Label24: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    RxDBComboBox12: TRxDBComboBox;
    RxDBComboBox13: TRxDBComboBox;
    RxDBComboBox7: TRxDBComboBox;
  private
    { private declarations }
  public
    { public declarations }
  end;

function ShowCadProdutoICMS(crt : Integer = 1):Boolean;

var
  frmCadProdutoICMS: TfrmCadProdutoICMS;

implementation

{$R *.lfm}

function ShowCadProdutoICMS( crt : Integer ): Boolean;
begin
  with TfrmCadProdutoICMS.Create(Application) do begin
    RxDBComboBox1.Visible := (crt=1);
    RxDBComboBox7.Visible := (crt<>1);
    ShowModal;
    Result := (ModalResult = mrOK);
    Free;
  end;
end;





end.

