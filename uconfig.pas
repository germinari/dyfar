unit uConfig;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Dialogs, Buttons, StdCtrls, IniPropStorage, EditBtn,
  ComCtrls, ExtCtrls, DbCtrls, DividerBevel, SpinEx, ZDataset, udbConnect, db;

type

  { TfrmConfig }

  TfrmConfig = class(TForm)
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btIniciacontingencia: TButton;
    btFinalContingencia: TButton;
    ckbNaoImprimeTicket: TCheckBox;
    cbxTipoImpressao: TComboBox;
    ckbPermitirVendaSemEstq: TCheckBox;
    ckbPermitirEstoqueNeg: TCheckBox;
    DataSource1: TDataSource;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DividerBevel2: TDividerBevel;
    edEmpresaPadrao: TEditButton;
    edImpressoraTicket: TEditButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    IniPropStorage1: TIniPropStorage;
    Label1: TLabel;
    Label2: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    PageControl1: TPageControl;
    qryContingenciadatahora: TDateTimeField;
    qryContingenciadescricao: TStringField;
    qryContingenciaid: TLongintField;
    qryContingenciamotivo: TStringField;
    qryContingenciaregime: TLongintField;
    qryContingenciausuario: TStringField;
    speMargemDireita: TSpinEditEx;
    speMargemEsquerda: TSpinEditEx;
    speMargemInferior: TSpinEditEx;
    speMargemSuperior: TSpinEditEx;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    qryContingencia: TZQuery;
    TabSheet3: TTabSheet;
    procedure BitBtn1Click(Sender: TObject);
    procedure btFinalContingenciaClick(Sender: TObject);
    procedure btIniciacontingenciaClick(Sender: TObject);
    procedure edEmpresaPadraoButtonClick(Sender: TObject);
    procedure edImpressoraTicketButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label4DblClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frmConfig: TfrmConfig;

implementation

uses WagVclUtils, uSearch, sistema_config, strutils, uSearchlist, uUser,
  uEditMemo, BDSqlUtils, Printers;

{$R *.lfm}

{ TfrmConfig }

procedure TfrmConfig.FormCreate(Sender: TObject);
//Var path : String;
begin
  Label4.Caption := DefaultINFileName;
  IniPropStorage1.IniFileName := DefaultINFileName;
  IniPropStorage1.Active:= true;
  IniPropStorage1.Restore;
  ckbPermitirEstoqueNeg.Checked  := (LowerCase( getSysParametro('PERMITE_ESTOQUE_NEGATIVO') ) = 'true');
  ckbPermitirVendaSemEstq.Checked:= (LowerCase( getSysParametro('PERMITE_VENDA_SEM_ESTOQUE')) = 'true');
  OpenTable( qryContingencia );
end;

procedure TfrmConfig.Label4DblClick(Sender: TObject);
Var texto : String;
begin
  texto := LeFileToString(Label4.Caption);
  if not EditarMemo('Arquivo de configuração',texto) then exit;
  SaveStringToFile(texto, Label4.Caption);
end;

procedure TfrmConfig.edEmpresaPadraoButtonClick(Sender: TObject);
Var res : Variant;
begin
     res := ShowSearchModal(dbConnect.ZConnection1,'empresa','id,cnpj,nome','id,nome','nome',True);
     if VarIsBlank(res) then exit;
     edEmpresaPadrao.Text := Format('%s-%s',[res[0],res[1]]);;
end;

procedure TfrmConfig.BitBtn1Click(Sender: TObject);
begin
   IniPropStorage1.Save;
   putSysParametro('PERMITE_ESTOQUE_NEGATIVO', BooleanToStr(ckbPermitirEstoqueNeg.Checked)  );
   putSysParametro('PERMITE_VENDA_SEM_ESTOQUE', BooleanToStr(ckbPermitirVendaSemEstq.Checked)  );

end;

procedure TfrmConfig.btFinalContingenciaClick(Sender: TObject);
Var xmotivo : String;
begin
  if qryContingenciaregime.AsInteger = 1 then
     Raise Exception.Create('Sistema não esta em contingência.');
  qryContingencia.AppendRecord([nil,nil,1,'Sistema em operação normal',UsuarioAtual.userApelido]);
  RefreshTable( qryContingencia );
end;

procedure TfrmConfig.btIniciacontingenciaClick(Sender: TObject);
Var xmotivo,ret,n : String;
begin
  //'1-Emissão normal (não em contingência)',
  if qryContingenciaregime.AsInteger <> 1 then
     Raise Exception.Create('Sistema já esta em contingência.');
  ret := ShowSearchLista([
                   '2-Contingência FS-IA, com impressão do DANFE em formulário de segurança',
                   '3-Contingência SCAN (Sistema de Contingência do Ambiente Nacional) (*em desativação*)',
                   '4-*Contingência DPEC (Declaração Prévia da Emissão em Contingência)',
                   '5-Contingência FS-DA, com impressão do DANFE em formulário de segurança',
                   '6-Contingência SVC-AN (SEFAZ Virtual de Contingência do AN)',
                   '7-*Contingência SVC-RS (SEFAZ Virtual de Contingência do RS)',
                   '9-Contingência off-line da NFC-e (Somente NFC-e)']);
  if VarIsBlank(ret) then exit;
  n := ExtractWord(1,ret,['-']);
  if not InputQuery('Motivo da contingência','Entre com o motivo (min. 15 caracteres)',xmotivo) then exit;
  if Length(xmotivo) < 15 then
     Raise Exception.Create('Motivo deve ter no mínimo 15 caracteres.');
  qryContingencia.AppendRecord([nil,nil,n,xmotivo,UsuarioAtual.userApelido]);
  RefreshTable( qryContingencia );
end;
(*
Var xmotivo : String;
begin
  if qryContingenciaregime.AsInteger <> 1 then
     Raise Exception.Create('Sistema já esta em contingência.');
  if not InputQuery('Motivo da contingência','Entre com o motivo (min. 15 caracteres)',xmotivo) then exit;
  if Length(xmotivo) < 15 then
     Raise Exception.Create('Motivo deve ter no mínimo 15 caracteres.');
  qryContingencia.AppendRecord([nil,nil,4,xmotivo,UsuarioAtual.userApelido]);
  RefreshTable( qryContingencia );
end;
*)
procedure TfrmConfig.edImpressoraTicketButtonClick(Sender: TObject);
Var res : Variant;
begin
     res := ShowSearchLista( Printer.Printers ,'Selecione uma impressora...');
     if VarIsBlank(res) then exit;
     edImpressoraTicket.Text := Format('%s',[res]);;
end;

initialization
  RegisterClass(TfrmConfig);

end.

