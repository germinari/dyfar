unit uCadTaxas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  ExtCtrls, StdCtrls, DbCtrls, udbConnect, db, rxdbcomb, ZDataset, ZSqlUpdate;

type

  { TfrmCadTaxas }

  TfrmCadTaxas = class(TForm)
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBNavigator1: TDBNavigator;
    dsTaxas: TDatasource;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    dsTXICMS: TDatasource;
    dsTXIPI: TDatasource;
    Label1: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
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
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    qryTXICMS: TZQuery;
    qryTaxasid: TLargeintField;
    qryTaxasname: TStringField;
    qryTaxastax_type: TLongintField;
    qryTXIPI: TZQuery;
    qryTXICMSbc_include_ipi: TBooleanField;
    qryTXICMSbc_st_include_ipi: TBooleanField;
    qryTXICMScsosn: TLongintField;
    qryTXICMScst: TLongintField;
    qryTXICMSid: TLargeintField;
    qryTXICMSmod_bc: TLongintField;
    qryTXICMSmod_bc_st: TLongintField;
    qryTXICMSorig: TLongintField;
    qryTXICMSproduto_tax_template_id: TLargeintField;
    qryTXICMSp_cred_sn: TFloatField;
    qryTXICMSp_cred_sn_valid_until: TDateTimeField;
    qryTXICMSp_icms: TFloatField;
    qryTXICMSp_icms_st: TFloatField;
    qryTXICMSp_mva_st: TFloatField;
    qryTXICMSp_red_bc: TFloatField;
    qryTXICMSp_red_bc_st: TFloatField;
    qryTXIPIcalculo: TLongintField;
    qryTXIPIcl_enq: TStringField;
    qryTXIPIcnpj_prod: TStringField;
    qryTXIPIcst: TLongintField;
    qryTXIPIc_enq: TStringField;
    qryTXIPIc_selo: TStringField;
    qryTXIPIid: TLongintField;
    qryTXIPIproduto_tax_template_id: TLongintField;
    qryTXIPIp_ipi: TFloatField;
    qryTXIPIq_selo: TLongintField;
    qryTXIPIq_unid: TFloatField;
    RxDBComboBox10: TRxDBComboBox;
    RxDBComboBox11: TRxDBComboBox;
    RxDBComboBox12: TRxDBComboBox;
    RxDBComboBox13: TRxDBComboBox;
    RxDBComboBox7: TRxDBComboBox;
    RxDBComboBox8: TRxDBComboBox;
    RxDBComboBox9: TRxDBComboBox;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    qryTaxas: TZQuery;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure qryTaxasAfterScroll(DataSet: TDataSet);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmCadTaxas: TfrmCadTaxas;

implementation

uses uSearch, WagVclUtils, BDSqlUtils;

{$R *.lfm}

{ TfrmCadTaxas }

procedure TfrmCadTaxas.FormCreate(Sender: TObject);
begin
  OpenTable( qryTaxas );

end;

procedure TfrmCadTaxas.qryTaxasAfterScroll(DataSet: TDataSet);
begin
  if qryTaxastax_type.AsInteger > 0 then
     PageControl1.PageIndex:= qryTaxastax_type.AsInteger;
  OpenTable( qryTXICMS );
  OpenTable( qryTXIPI );
end;

procedure TfrmCadTaxas.ToolButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadTaxas.ToolButton4Click(Sender: TObject);
var ret : Variant;
    Sql,s : String;
begin
  Sql := 'Select 1 as id,''Imposto de ICMS''::varchar(20) as nome '+
         'Union '+
         'Select 2,''Imposto de IPI'' '+
{         'Union '+
         'Select 3,''Imposto de PIS'' '+
         'Union '+
         'Select 4,''Imposto de COFINS'' '+}
         'Order by id ';
  ret:= ShowSearchModalSQL(dbConnect.ZConnection1,Sql,'id,nome','id','id',true);
  if VarIsBlank(ret) then Begin
    Exit;
  end;
  if Not InputQuery('Nova Classe de imposto','Informe uma descricao',s) then exit;
  qryTaxas.Insert;
  qryTaxasname.ASString    := s;
  qryTaxastax_type.AsString:= ret;
  qryTaxas.Post;
  if ret = '1' then begin
    qryTXICMS.Insert;
    qryTXICMSproduto_tax_template_id.AsInteger := qryTaxasid.AsInteger;
    qryTXICMS.Post;
  end;
  if ret = '2' then begin
    qryTXIPI.Insert;
    qryTXIPIproduto_tax_template_id.AsInteger := qryTaxasid.AsInteger;
    qryTXIPI.Post;
  end;
end;

procedure TfrmCadTaxas.ToolButton5Click(Sender: TObject);
begin
  PostTable(qryTaxas);
  PostTable(qryTXICMS);
  PostTable(qryTXIPI);
end;

initialization
  RegisterClass(TfrmCadTaxas);


end.

