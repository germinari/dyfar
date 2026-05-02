unit uLocacaoAddItem;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, EditBtn,
  StdCtrls, Buttons, Spin, rxtooledit, rxcurredit;

type

  { TfrmLocacaoAddItem }

  TfrmLocacaoAddItem = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    edTotal: TCurrencyEdit;
    edDiaria: TCurrencyEdit;
    EditButton1: TEditButton;
    FloatSpinEdit1: TFloatSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    RxDateEdit1: TRxDateEdit;
    RxDateEdit2: TRxDateEdit;
    spDias: TSpinEdit;
    procedure EditButton1ButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spDiasChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

function ShowLocacaoItem(Var produto: Integer; Var dtIni, dtFim : TDateTime;Var quantidade,valor : Double;Var pgto_antecipado : Boolean;descricao:String = ''):Boolean;

var
  frmLocacaoAddItem: TfrmLocacaoAddItem;

implementation

uses sistema_config, udbConnect, uSearch, process, strutils, variants,
     BDSqlUtils, WagVclUtils;

function ShowLocacaoItem(var produto: Integer; var dtIni, dtFim: TDateTime;Var quantidade,valor : Double;Var pgto_antecipado : Boolean;Descricao:String): Boolean;
begin
  with TfrmLocacaoAddItem.create(Application) do
  begin
    CheckBox1.Checked    := pgto_antecipado;
    if Length(Descricao) >0 then begin //edição
       EditButton1.Text := Format('%d-%s',[produto,Descricao]);
       RxDateEdit1.Date := dtIni;
       RxDateEdit2.Date := dtFim;
       spDias.Value  := dtFim - dtIni;
       FloatSpinEdit1.Value := quantidade;
       edTotal.Value  := valor;
    end;
    ShowModal;
    Result := (ModalResult = mrOK);
    produto:= StrToIntDef(ExtractWord(1,EditButton1.Text,['-']),0);
    dtIni  := RxDateEdit1.Date;
    dtFim  := RxDateEdit2.Date;
    quantidade := FloatSpinEdit1.Value;
    valor  :=  edTotal.Value;
    pgto_antecipado := CheckBox1.Checked;
  end;
end;

{ TfrmLocacaoAddItem }

procedure TfrmLocacaoAddItem.FormCreate(Sender: TObject);
begin
   RxDateEdit1.Date := Date;
end;

procedure TfrmLocacaoAddItem.EditButton1ButtonClick(Sender: TObject);
var ret : Variant;
    sql : String;
begin
   Sql := 'Select pl.*,p.descricao ';
   Sql += 'From produtos_locacao pl ';
   Sql += 'Left Join produtos p ON p.id=pl.produto ';

   ret:= ShowSearchModalSQL(dbConnect.ZConnection1,Sql,'produto,descricao','produto,descricao,preco','descricao',true);
  if VarIsBlank(ret) then exit;
  EditButton1.Text:= Format('%s-%s',[ret[0],ret[1]]);
  edDiaria.Value  := ret[2];
  edTotal.Value   := edDiaria.Value * spDias.Value;
end;

procedure TfrmLocacaoAddItem.spDiasChange(Sender: TObject);
begin
   RxDateEdit2.Date:= RxDateEdit1.Date + spDias.Value;
   edTotal.Value   := edDiaria.Value * spDias.Value;
end;

{$R *.lfm}

initialization
  RegisterClass(TfrmLocacaoAddItem);

end.

