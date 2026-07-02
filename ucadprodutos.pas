unit uCadProdutos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, ComCtrls, DbCtrls, Buttons, ActnList, DBActns, Menus, DBGrids,
  ExtDlgs, IniPropStorage, ACBrGIF, ACBrNCMs, ACBrSocket, RTTICtrls,
  DBDateTimePicker, CheckBoxThemed, DividerBevel, uPSComponent, ZDataset,
  ZSqlUpdate, ZSequence, ZAbstractRODataset, WAGDBNavigator, RLReport,
  rxdbdateedit, rxlookup, rxdbcomb, rxmemds, rxtoolbar, rxdbgrid, rxctrls,
  rxcurredit, db, SdfData, TDIPageControl, LMessages, LCLType, DBExtCtrls;

type
  TTipoEstoque = (teNormal,teLocacao,teAvariados, teQuarentena);
  { TfrmCadProdutos }

  TfrmCadProdutos = class(TForm)
    ACBrNCMs1: TACBrNCMs;
    acLocalizar: TAction;
    Action1: TAction;
    Action3: TAction;
    Action4: TAction;
    ActionList1: TActionList;
    btAddFoto: TSpeedButton;
    btDelfoto: TSpeedButton;
    btAvariados: TSpeedButton;
    btSalvarImagem: TSpeedButton;
    btSelectCClassTrib: TSpeedButton;
    btSelectCSTIBSCBS: TSpeedButton;
    btSelUnidade: TSpeedButton;
    Button1: TButton;
    DBEdit46: TDBEdit;
    DBEdit47: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit56: TDBEdit;
    DBEdit57: TDBEdit;
    DividerBevel1: TDividerBevel;
    dsProdutoUnidade: TDataSource;
    DBCheckBox6: TDBCheckBox;
    dsHistoricoEntradas: TDataSource;
    DBEdit23: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit6: TDBEdit;
    dsDadosEntrada: TDataSource;
    DBCheckBox5: TDBCheckBox;
    DBEdit14: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBMemo3: TDBMemo;
    DBText9: TDBText;
    dsProdutoICMS: TDataSource;
    DBCheckBox4: TDBCheckBox;
    DBEdit17: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBMemo1: TDBMemo;
    DBText7: TDBText;
    DBText8: TDBText;
    dsHistorico: TDatasource;
    dsKit: TDatasource;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit5: TDBEdit;
    DBGrid1: TDBGrid;
    DBMemo2: TDBMemo;
    DBNavigator1: TDBNavigator;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    dsFornProd: TDatasource;
    dsEstoqueLotes: TDatasource;
    DataSetPost1: TDataSetPost;
    dsProdutos: TDatasource;
    DBCheckBox1: TDBCheckBox;
    DBDateEdit1: TRXDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit7: TDBEdit;
    GroupBox1: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    GroupBox13: TGroupBox;
    GroupBox14: TGroupBox;
    GroupBox15: TGroupBox;
    GroupBox16: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox9: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    grpFormacaoPreco: TGroupBox;
    Image1: TImage;
    IniPropStorage1: TIniPropStorage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
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
    Label4: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label5: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label6: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label7: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    mnSomenteInativos: TMenuItem;
    mnSomenteAtivos: TMenuItem;
    mnLoadImage: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    PopupMenu1: TPopupMenu;
    qryDadosEntradacest: TStringField;
    qryDadosEntradacfop: TStringField;
    qryDadosEntradacodificacao_fornecedor: TStringField;
    qryDadosEntradacodigo_barras: TStringField;
    qryDadosEntradacst_cofins: TLongintField;
    qryDadosEntradacst_csosn: TLongintField;
    qryDadosEntradacst_ipi: TLongintField;
    qryDadosEntradacst_pis: TLongintField;
    qryDadosEntradadescricao: TStringField;
    qryDadosEntradadescricao_xml: TStringField;
    qryDadosEntradaestoque_destino: TStringField;
    qryDadosEntradaid: TLongintField;
    qryDadosEntradainfadprod: TMemoField;
    qryDadosEntradamodbc: TLongintField;
    qryDadosEntradamodbcst: TLongintField;
    qryDadosEntradancm: TStringField;
    qryDadosEntradanfci_opc: TStringField;
    qryDadosEntradanfentrada: TLongintField;
    qryDadosEntradaorig: TLongintField;
    qryDadosEntradapcofins: TFloatField;
    qryDadosEntradapicmsst: TFloatField;
    qryDadosEntradapipi: TFloatField;
    qryDadosEntradapmvast: TFloatField;
    qryDadosEntradappis: TFloatField;
    qryDadosEntradapredbc: TFloatField;
    qryDadosEntradapredbcst: TFloatField;
    qryDadosEntradaproduto: TLongintField;
    qryDadosEntradap_icms: TFloatField;
    qryDadosEntradaquantidade: TFloatField;
    qryDadosEntradaquant_estoque: TFloatField;
    qryDadosEntradaunidade: TStringField;
    qryDadosEntradavalortotal: TFloatField;
    qryDadosEntradavalorunitario: TFloatField;
    qryDadosEntradavbcicms: TFloatField;
    qryDadosEntradavbcipi: TFloatField;
    qryDadosEntradavbcst: TFloatField;
    qryDadosEntradavbc_cofins: TFloatField;
    qryDadosEntradavbc_pis: TFloatField;
    qryDadosEntradavcofins: TFloatField;
    qryDadosEntradavdesconto: TFloatField;
    qryDadosEntradavfrete: TFloatField;
    qryDadosEntradavicmsst: TFloatField;
    qryDadosEntradavipi: TFloatField;
    qryDadosEntradavlr_icms: TFloatField;
    qryDadosEntradavlr_unit_estoque: TFloatField;
    qryDadosEntradavoutras: TFloatField;
    qryDadosEntradavpis: TFloatField;
    qryDadosEntradavseguro: TFloatField;
    qryEstoqueLotes: TZQuery;
    qryEstoqueLotesabreviacao: TStringField;
    qryEstoqueLotesdata_entrada: TDateTimeField;
    qryEstoqueLotesdata_fabricacao: TDateField;
    qryEstoqueLotesdata_validade: TDateTimeField;
    qryEstoqueLotesempresa: TLongintField;
    qryEstoqueLotesid: TLongintField;
    qryEstoqueLoteslocalizacao: TStringField;
    qryEstoqueLoteslote: TStringField;
    qryEstoqueLotesproduto: TLongintField;
    qryEstoqueLotesquantidade: TFloatField;
    qryFornProdcodigo_produto: TStringField;
    qryFornProddescricao_produto: TStringField;
    qryFornProdfornecedor: TLongintField;
    qryFornProdnome: TStringField;
    qryFornProdproduto: TLongintField;
    qryFornProdtempo_reposicao: TFloatField;
    qryHistoricoEntradascfop: TStringField;
    qryHistoricoEntradaschave_nfe: TStringField;
    qryHistoricoEntradasdataemissao: TDateField;
    qryHistoricoEntradasdataentrada: TDateField;
    qryHistoricoEntradasfornecedor: TStringField;
    qryHistoricoEntradasid: TLongintField;
    qryHistoricoEntradasnumeronf: TLongintField;
    qryHistoricoEntradaspicmsst: TFloatField;
    qryHistoricoEntradasproduto: TLongintField;
    qryHistoricoEntradasquant_estoque: TFloatField;
    qryHistoricoEntradasvbcst: TFloatField;
    qryHistoricoEntradasvicmsst: TFloatField;
    qryHistoricoEntradasvlr_unit_estoque: TFloatField;
    qryKitdescricao: TStringField;
    qryKitid: TLongintField;
    qryKitpreco: TFloatField;
    qryKitproduto: TLongintField;
    qryKitproduto_master: TLongintField;
    qryKitquantidade: TFloatField;
    qryProdutoICMSbc_include_ipi: TBooleanField;
    qryProdutoICMSbc_st_include_ipi: TBooleanField;
    qryProdutoICMScbenef: TStringField;
    qryProdutoICMScst_csosn: TLongintField;
    qryProdutoICMSfcp: TFloatField;
    qryProdutoICMSid: TLargeintField;
    qryProdutoICMSmod_bc: TLongintField;
    qryProdutoICMSmod_bc_st: TLongintField;
    qryProdutoICMSpmvast_aj: TFloatField;
    qryProdutoICMSpmvast_ajsn: TFloatField;
    qryProdutoICMSpreco_max_consumidor: TFloatField;
    qryProdutoICMSproduto: TLongintField;
    qryProdutoICMSp_cred_sn: TFloatField;
    qryProdutoICMSp_cred_sn_valid_until: TDateTimeField;
    qryProdutoICMSp_icms: TFloatField;
    qryProdutoICMSp_icms_st: TFloatField;
    qryProdutoICMSp_mva_st: TFloatField;
    qryProdutoICMSp_red_bc: TFloatField;
    qryProdutoICMSp_red_bc_st: TFloatField;
    qryProdutoICMSp_red_mvs_sn: TFloatField;
    qryProdutoICMSuf_destino: TStringField;
    qryProdutosaltura: TFloatField;
    qryProdutosativo: TBooleanField;
    qryProdutoscaderno: TBooleanField;
    qryProdutoscest: TStringField;
    qryProdutoscmv: TFloatField;
    qryProdutoscodigo_barras: TStringField;
    qryProdutoscomissao: TFloatField;
    qryProdutoscst_cofins: TLongintField;
    qryProdutoscst_ibs_cbs: TStringField;
    qryProdutoscst_pis: TLongintField;
    qryProdutosc_class_trib: TStringField;
    qryProdutosdata_cadastro: TDateField;
    qryProdutosdesconto_ate: TFloatField;
    qryProdutosdesconto_automatico: TBooleanField;
    qryProdutosdescricao: TStringField;
    qryProdutosem_promocao: TBooleanField;
    qryProdutosgrupo_produto: TLongintField;
    qryProdutosid: TLongintField;
    qryProdutosipi_template_id: TLargeintField;
    qryProdutosis_composed: TBooleanField;
    qryProdutositem_comercial: TBooleanField;
    qryProdutoslargura: TFloatField;
    qryProdutoslista_pis_cofins: TStringField;
    qryProdutoslocal_estoque: TStringField;
    qryProdutoslocal_estoque_grosso: TStringField;
    qryProdutosmargem_lucro_atacado: TFloatField;
    qryProdutosmargem_lucro_consignado: TFloatField;
    qryProdutosmargem_lucro_varejo: TFloatField;
    qryProdutosnao_movimenta_estoque: TBooleanField;
    qryProdutosncm: TStringField;
    qryProdutosnfci_opc: TStringField;
    qryProdutosnumero_reg_ms: TStringField;
    qryProdutosobservacao: TMemoField;
    qryProdutosorigem: TLongintField;
    qryProdutospeso: TFloatField;
    qryProdutospicmsstret: TFloatField;
    qryProdutosprazo_validade: TLongintField;
    qryProdutospreco_compra: TFloatField;
    qryProdutospreco_venda_atacado: TFloatField;
    qryProdutospreco_venda_consignado: TFloatField;
    qryProdutospreco_venda_varejo: TFloatField;
    qryProdutosprofundidade: TFloatField;
    qryProdutospromocao_ate: TDateField;
    qryProdutosp_cofins: TFloatField;
    qryProdutosp_pis: TFloatField;
    qryProdutosquant_caixa: TFloatField;
    qryProdutosquant_caixa_operacao: TStringField;
    qryProdutosquant_geral: TFloatField;
    qryProdutosquant_local: TFloatField;
    qryProdutossimilares: TMemoField;
    qryProdutostipo_produto: TLongintField;
    qryProdutostipo_produto_interno: TLongintField;
    qryProdutosunidade: TStringField;
    qryProdutosvbcstret: TFloatField;
    qryProdutosvicmsstret: TFloatField;
    qryProdutosvnome_classificacao: TStringField;
    qryProdutosvpreco_compra: TFloatField;
    qryProdutosvtipo_produto: TStringField;
    qryProdutosvtipo_produto_interno: TStringField;
    qryProdutoUnidadefator: TFloatField;
    qryProdutoUnidadeid: TLongintField;
    qryProdutoUnidadeproduto: TLongintField;
    qryProdutoUnidadeunidade: TStringField;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLDBText22: TRLDBText;
    RLDBText23: TRLDBText;
    RLDBText24: TRLDBText;
    RLDBText25: TRLDBText;
    RLDBText26: TRLDBText;
    RLDBText27: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLReport1: TRLReport;
    RxDBComboBox1: TRxDBComboBox;
    RxDBComboBox2: TRxDBComboBox;
    RxDBComboBox6: TRxDBComboBox;
    RxDBComboBox7: TRxDBComboBox;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    RxDBGrid3: TRxDBGrid;
    RxDBGrid4: TRxDBGrid;
    RxDBGrid5: TRxDBGrid;
    RxDBGrid6: TRxDBGrid;
    SavePictureDialog1: TSavePictureDialog;
    SdfDataSet1: TSdfDataSet;
    SpeedButton1: TSpeedButton;
    btShowCadIPI: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    btTransfLocacao: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton2: TSpeedButton;
    btSobraTemp: TSpeedButton;
    btSelTipoProduto: TSpeedButton;
    btQuarentena: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    btFaltaTemp: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    qryProdutos: TZQuery;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    ToggleBox1: TToggleBox;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    WAGDBNavigator1: TWAGDBNavigator;
    qryFornProd: TZQuery;
    qryKit: TZQuery;
    qryHistorico: TZReadOnlyQuery;
    updProdutos: TZUpdateSQL;
    upFornProd: TZUpdateSQL;
    updKit: TZUpdateSQL;
    updEstoqueLotes: TZUpdateSQL;
    ZQuery1: TZQuery;
    qryProdutoICMS: TZQuery;
    qryHistoricoEntradas: TZReadOnlyQuery;
    qryDadosEntrada: TZQuery;
    qryProdutoUnidade: TZQuery;
    ZSequence1: TZSequence;
    updProdutoICMS: TZUpdateSQL;
    procedure acLocalizarExecute(Sender: TObject);
    procedure btAddFotoClick(Sender: TObject);
    procedure btAvariadosClick(Sender: TObject);
    procedure btQuarentenaClick(Sender: TObject);
    procedure btSelectCClassTribClick(Sender: TObject);
    procedure btSelectCSTIBSCBSClick(Sender: TObject);
    procedure btSobraTempClick(Sender: TObject);
    procedure btDelfotoClick(Sender: TObject);
    procedure btSalvarImagemClick(Sender: TObject);
    procedure btSelTipoProdutoClick(Sender: TObject);
    procedure btSelUnidadeClick(Sender: TObject);
    procedure btShowCadIPIClick(Sender: TObject);
    procedure btTransfLocacaoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShortCut(var Msg: TLMKey; var Handled: Boolean);
    procedure grpFormacaoPrecoDblClick(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure mnSomenteAtivosClick(Sender: TObject);
    procedure mnLoadImageClick(Sender: TObject);
    procedure mnSomenteInativosClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure qryProdutoICMSNewRecord(DataSet: TDataSet);
    procedure qryProdutosAfterOpen(DataSet: TDataSet);
    procedure qryProdutosAfterPost(DataSet: TDataSet);
    procedure qryProdutosBeforeDelete(DataSet: TDataSet);
    procedure qryProdutosBeforePost(DataSet: TDataSet);
    procedure qryProdutosNewRecord(DataSet: TDataSet);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid6DblClick(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure btFaltaTempClick(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure ToggleBox1Change(Sender: TObject);
    procedure ToolBar1DblClick(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure WAGDBNavigator1AfterScroll(Sender: TObject);
  private
    procedure LoadImagem(id: Integer);
    { private declarations }
  public
    { public declarations }
    procedure OpenProduto(KeyValue : Integer);
  end;

procedure  TranfereLote( Loteid, empresade, empresapara, produto,lote : String; quant,qEstq : Double; destEstoque : TTipoEstoque);


var
  frmCadProdutos: TfrmCadProdutos;

implementation

{$R *.lfm}

Uses WagVclUtils, BDSqlUtils, uSearch, udbConnect, sistema_config, uEdicaoLote,
  uInputFloat, uCadProdutoICMS, uCadSimples, strutils, variants,
  umultilevelselect, uUser, DBBlobImage, uSearchList, uMultiSelect, ACBrUtil;

procedure TranfereLote( Loteid, empresade, empresapara, produto, lote : String; quant, qEstq: Double; destEstoque : TTipoEstoque);
Var idDest, idLote : String;
begin
  case destEstoque of
      teNormal : Begin
                    idDest := Execsql(dbConnect.ZConnection1,'Select coalesce(id,0) From produtos_estoque Where empresa=%s and produto=%s and lote=''%s''',[empresapara,produto,lote]);
                    if idDest = '' then //Inserir no destino
                       Execsql(dbConnect.ZConnection1,
                       'INSERT INTO produtos_estoque(produto, lote, quantidade, data_entrada, data_validade, data_fabricacao, empresa, localizacao) '+
                       'SELECT produto, lote, %.3f, data_entrada, data_validade, data_fabricacao,%s, localizacao '+
                       'FROM produtos_estoque Where id=%s',[quant,empresapara,Loteid])
                    else
                       Execsql(dbConnect.ZConnection1,'Update produtos_estoque SET quantidade=quantidade+%.3f Where id=%s',[quant,idDest]);
                    Execsql(dbConnect.ZConnection1,'Update produtos_estoque SET quantidade=quantidade-%.3f Where id=%s',[quant,Loteid]);
                    //Excluo na origem
                    //--GerarHistoricoMovimento(StrToInt(produto),StrToInt(empresade), 'Transferencia loja '+empresade+'=>'+empresapara+ lote,0.0, quant);
                    //incluo no destino
                    //--GerarHistoricoMovimento(StrToInt(produto),StrToInt(empresapara), 'Transferencia loja '+empresade+'=>'+ lote,quant,0.0);
                 end;
      teLocacao :Begin
                    //idLote := Execsql(dbConnect.ZConnection1,'Select id from produtos_estoque Where produto=%s and lote=''%s''',[produto,lote]);
                    idDest := Execsql(dbConnect.ZConnection1,'Select coalesce(id,0) From produtos_locacao Where produto_estoque=%s',[Loteid]);
                    if idDest = '' then //Inserir no destino
                       Execsql(dbConnect.ZConnection1,'INSERT INTO produtos_locacao(produto, produto_estoque, quantidade, data_entrada, empresa) '+
                                                      'VALUES (%s, %s,  %.3f, CURRENT_DATE, %s)',[produto,Loteid,quant,empresade])

                    else
                       Execsql(dbConnect.ZConnection1,'Update produtos_locacao SET quantidade=quantidade+%.3f Where id=%s',[quant,idDest]);

                    Execsql(dbConnect.ZConnection1,'Update produtos_estoque SET quantidade=quantidade-%.3f Where id=%s',[quant,Loteid]);
                    //Excluo na origem
                    //--GerarHistoricoMovimento(StrToInt(produto),StrToInt(empresade), 'Transferencia p/ locacao '+empresade+ lote,0.0, quant);
                    //incluo no destino
                    //GerarHistoricoMovimento(StrToInt(produto),StrToInt(empresapara), 'Transferencia p/ locacao '+empresade+ lote,quant,0.0);

                 end;
  end;
end;

{ TfrmCadProdutos }

procedure TfrmCadProdutos.MenuItem1Click(Sender: TObject);
var ret : Variant;
begin
  //ShowSearchModal(dbConnect.ZConnection1,'plano_contas','conta,descricao','id','conta',true);
  ret := ShowSearchModal(dbConnect.ZConnection1,'produtos','id,descricao','id','id',true,WAGDBNavigator1.Where);
  if VarIsBlank(ret) then exit;
  WAGDBNavigator1.KeyValue:= ret;
end;

procedure TfrmCadProdutos.MenuItem2Click(Sender: TObject);
var ret : Variant;
begin
  //ShowSearchModal(dbConnect.ZConnection1,'plano_contas','conta,descricao','id','conta',true);
  ret := ShowSearchModal(dbConnect.ZConnection1,'produtos','id,descricao','id','descricao',true,WAGDBNavigator1.Where);
  if VarIsBlank(ret) then exit;
  WAGDBNavigator1.KeyValue:= ret;
end;

procedure TfrmCadProdutos.MenuItem3Click(Sender: TObject);
var ret : Variant;
begin
  ret := ShowSearchField(dbConnect.ZConnection1,'produtos','codigo_barras','id',false,'',WAGDBNavigator1.Where);
  if VarIsBlank(ret) then exit;
  WAGDBNavigator1.KeyValue:= ret;
end;

procedure TfrmCadProdutos.MenuItem4Click(Sender: TObject);
var ret : Variant;
begin
  //ShowSearchModal(dbConnect.ZConnection1,'plano_contas','conta,descricao','id','conta',true);
  ret := ShowSearchModal(dbConnect.ZConnection1,'produtos','id,descricao_xml','id','descricao_xml',true,WAGDBNavigator1.Where);
  if VarIsBlank(ret) then exit;
  WAGDBNavigator1.KeyValue:= ret;
end;

procedure TfrmCadProdutos.mnSomenteAtivosClick(Sender: TObject);
begin
   //mnSomenteAtivos.Checked:= Not mnSomenteAtivos.Checked;
   if mnSomenteAtivos.Checked then
      WAGDBNavigator1.Where := 'ativo=True'
   else
      WAGDBNavigator1.Where := 'ativo=false';
   WAGDBNavigator1.Refresh;
end;

procedure TfrmCadProdutos.mnLoadImageClick(Sender: TObject);
begin
   mnLoadImage.Checked:= Not mnLoadImage.Checked;
end;

procedure TfrmCadProdutos.mnSomenteInativosClick(Sender: TObject);
begin
  //mnSomenteAtivos.Checked:= Not mnSomenteAtivos.Checked;
  if mnSomenteAtivos.Checked then
     WAGDBNavigator1.Where := 'ativo=True'
  else
     WAGDBNavigator1.Where := 'ativo=false';
  WAGDBNavigator1.Refresh;
end;

procedure TfrmCadProdutos.PageControl1Change(Sender: TObject);
begin
  CenterControl(GroupBox1);
  CenterControl(GroupBox2);
  CenterControl(GroupBox8);
  CenterControl(GroupBox7);
  CenterControl(GroupBox10);
  CenterControl(GroupBox13);

  GroupBox10.Enabled  := qryProdutosis_composed.AsBoolean;
  case PageControl1.ActivePageIndex of
      3 : Begin
          qryKit.Close;
          OpenTable( qryKit );
      end;
      2 : Begin
          qryFornProd.Close;
          OpenTable( qryFornProd );
          qryDadosEntrada.Close;
          OpenTable( qryDadosEntrada );
          qryHistoricoEntradas.close;
          OpenTable( qryHistoricoEntradas );
          end;
      4 : Begin
          OpenTable( qryProdutoUnidade );
          end;
      5 : Begin
          qryHistorico.Close;
          OpenTable( qryHistorico );
         end;
  end;

end;

procedure TfrmCadProdutos.qryProdutoICMSNewRecord(DataSet: TDataSet);
var ret : Variant;
begin
  ret := ShowSearchModal(dbConnect.ZConnection1,'unidade_federacao','sigla,nome','sigla','nome',true);
  if VarIsBlank(ret) then begin
     DataSet.Cancel;
     exit;
  end;
  qryProdutoICMSproduto.AsInteger           := qryProdutosid.AsInteger;
  qryProdutoICMSuf_destino.AsString         := ret;
  qryProdutoICMSbc_include_ipi.AsBoolean    := False;
  qryProdutoICMSbc_st_include_ipi.AsBoolean := False;
end;

procedure TfrmCadProdutos.qryProdutosAfterOpen(DataSet: TDataSet);
begin
  qryProdutoICMS.Close;
  OpenTable( qryProdutoICMS );
end;

procedure TfrmCadProdutos.qryProdutosAfterPost(DataSet: TDataSet);
Var id : Integer;
begin
  ////////id := qryProdutosid.AsInteger;
  ////////WAGDBNavigator1.Refresh;
  ////////WAGDBNavigator1.KeyValue := id;
  ////////WAGDBNavigator1AfterScroll(Nil);
end;

procedure TfrmCadProdutos.qryProdutosBeforeDelete(DataSet: TDataSet);
begin
  ConfirmDelete;
  MessageDlg('Não é permitido excluir produtos.',mtError,[mbOk],0);
  AbortSilent;
end;

procedure TfrmCadProdutos.qryProdutosBeforePost(DataSet: TDataSet);
begin

  if Length(qryProdutoscodigo_barras.AsString) > 0 then
     if Not EAN13Valido(qryProdutoscodigo_barras.AsString) then
        ShowMessageFmt('Atenção: %s não é um EAN13 válido. Verifique.',[qryProdutoscodigo_barras.AsString]);

{
  if CheckFieldAlterou([qryClientesdata_lic_sanitaria,qryClientestipo_estabelecimento,
                        qryClientesprazo_pagamento,qryClientesemail ]) then begin
     StartWait;
     try
     sendMenssageToSmatPhone(qryRepresentantesrepresentante.AsInteger,
                             Format('{''cli'':%d}',[qryClientesid.AsInteger]),
                             MESSAGE_CLIENTE
                             );
     finally
       StopWait;
     end;
  end;
}
end;

procedure TfrmCadProdutos.qryProdutosNewRecord(DataSet: TDataSet);
begin
    qryProdutosdata_cadastro.ASDateTime       := Date;
    qryProdutosipi_template_id.ASInteger      := 0;
    qryProdutosis_composed.AsBoolean          := False;
    qryProdutositem_comercial.AsBoolean       := True;
    qryProdutosnao_movimenta_estoque.AsBoolean:= False;
    qryProdutosem_promocao.AsBoolean          := False;
    qryProdutosorigem.ASInteger               := 0;
    qryProdutosprazo_validade.ASInteger       := 0;
    qryProdutosunidade.AsString               := 'und';
end;

procedure TfrmCadProdutos.RxDBGrid1DblClick(Sender: TObject);
Var crt: String;
begin
    EditTable(qryProdutoICMS);
    crt := ExecSql(dbConnect.ZConnection1,'Select crt From empresa Where id=%s',[getEmpresaPadrao(meCodigo)]);
    if ShowCadProdutoICMS( StrToInt(crt) ) then
       PostTable(qryProdutoICMS)
    else
     qryProdutoICMS.Cancel;
  RefreshTable( qryProdutoICMS );
end;

procedure TfrmCadProdutos.RxDBGrid6DblClick(Sender: TObject);
Var fileName, localfile : String;
begin
  fileName  := qryHistoricoEntradaschave_nfe.AsString + '-nfe.xml';
  localfile := NormalDir(GetTempDir) + fileName;
  ExportXMLToFile(dbConnect.ZConnection1,'nfentrada_xml','nfentrada',qryHistoricoEntradasid.AsString,'xml_str',localfile);
  OpenURL(localfile);
//  ShellExecute(0,'open',PChar('file://'+localfile),'','',SW_SHOWNORMAL);
end;

procedure TfrmCadProdutos.SpeedButton10Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'produto_tipo_produto','id,nome','id,nome','nome',true);
  if VarIsBlank(ret) then exit;
  EditTable(qryProdutos);
  qryProdutostipo_produto.AsString := ret[0];
  qryProdutosvtipo_produto.AsString:= ret[1];

end;

procedure TfrmCadProdutos.SpeedButton11Click(Sender: TObject);
begin
    if MessageDlg('Você que deletar o item do kit ?',mtConfirmation,[],0) <> mrYes then exit;
    qryKit.Delete;
end;

procedure TfrmCadProdutos.SpeedButton12Click(Sender: TObject);
var ret : Variant;
    sql : String;
begin
  sql := 'Select codigo,ncm_list,descricao::::varchar(300) as descricao From cest Order by ncm_list';
  ret := ShowSearchModalSQL(dbConnect.ZConnection1,sql,'codigo,ncm_list,descricao','codigo','ncm_list',true);
  if VarIsBlank(ret) then begin
     exit;
  end;
  EditTable( qryProdutos );
  qryProdutoscest.AsString  := ret;

end;

procedure TfrmCadProdutos.SpeedButton13Click(Sender: TObject);
Var count : Currency;
begin
    if qryEstoqueLoteslocalizacao.AsString = 'Locacao' then
       Raise exception.Create('Este item não pode ser alterado por este módulo.');

    count := StrToCurrDef(ExecSql(dbConnect.ZConnection1,'Select sum(pvi.quant_estoque) From pedido_venda_itens pvi '+
                                   'Left Join pedido_venda pv on pv.id=pvi.pedido_venda '+
                                   'Where pvi.produto=%d and pv.status=0 ',[qryProdutosid.AsInteger]),0.00);
    if count > 0 then
       MessageDlg(Format('Atenção: Existe(m) %f unidade(s) deste produto em pedido pendente. O ajuste de estoque pode causar erros futuros.',[count]),mtWarning,[mbOk],0);

    if not EditarLote( qryEstoqueLotesid.AsInteger ) then exit;
    OpenProduto( qryProdutosid.AsInteger );
end;

procedure TfrmCadProdutos.SpeedButton14Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'fornecedores','id,nome','id,nome','nome',true);
  if VarIsBlank(ret) then exit;
  qryFornProd.Append;
  qryFornProdproduto.AsInteger   := qryProdutosid.AsInteger;
  qryFornProdfornecedor.AsInteger:= ret[0];
  qryFornProdnome.AsString       := ret[1];
  PostTable(qryFornProd);
end;

procedure TfrmCadProdutos.SpeedButton15Click(Sender: TObject);
begin
    if MessageDlg('Voce que deletar o fornecedor deste produto ?',mtConfirmation,[],0) <> mrYes then exit;
    qryFornProd.Delete;
end;

procedure TfrmCadProdutos.SpeedButton16Click(Sender: TObject);
begin
  ConfirmDelete;
  qryProdutoICMS.Delete;
  RefreshTable( qryProdutoICMS );
end;

procedure TfrmCadProdutos.SpeedButton17Click(Sender: TObject);
begin
  uUser.ShowDialog(dbConnect.ZConnection1,'Tabelas','TfrmTipoProdutos');

end;

procedure TfrmCadProdutos.SpeedButton18Click(Sender: TObject);
begin
  EditTable( qryProdutos );
  qryProdutospreco_venda_varejo.ASFloat    := qryProdutospreco_compra.AsFloat + (qryProdutospreco_compra.ASfloat * qryProdutosmargem_lucro_varejo.Asfloat/100);
  qryProdutospreco_venda_atacado.ASFloat   := qryProdutospreco_compra.AsFloat + (qryProdutospreco_compra.ASfloat * qryProdutosmargem_lucro_atacado.Asfloat/100);
  qryProdutospreco_venda_consignado.ASFloat:= qryProdutospreco_compra.AsFloat + (qryProdutospreco_compra.ASfloat * qryProdutosmargem_lucro_consignado.Asfloat/100);
end;

procedure TfrmCadProdutos.SpeedButton19Click(Sender: TObject);
begin
  EditTable( qryProdutos );
  qryProdutosmargem_lucro_varejo.Asfloat    := (qryProdutospreco_venda_varejo.ASFloat-qryProdutospreco_compra.AsFloat)/qryProdutospreco_compra.AsFloat * 100;
  qryProdutosmargem_lucro_atacado.Asfloat   := (qryProdutospreco_venda_atacado.ASFloat-qryProdutospreco_compra.AsFloat)/qryProdutospreco_compra.AsFloat * 100;
  qryProdutosmargem_lucro_consignado.Asfloat:= (qryProdutospreco_venda_consignado.ASFloat-qryProdutospreco_compra.AsFloat)/qryProdutospreco_compra.AsFloat * 100;
end;

procedure TfrmCadProdutos.SpeedButton1Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'ncm_sh','ncm,descricao','ncm,descricao','descricao',true);
  if VarIsBlank(ret) then exit;
  EditTable(qryProdutos);
  qryProdutosncm.Asstring       := ret[0];
//  qryProdutosnome_grupo.Asstring:= ret[1];
end;

procedure TfrmCadProdutos.SpeedButton20Click(Sender: TObject);
Var crt: String;
begin
    EditTable(qryProdutoICMS);
    crt := ExecSql(dbConnect.ZConnection1,'Select crt From empresa Where id=%s',[getEmpresaPadrao(meCodigo)]);
    if ShowCadProdutoICMS( StrToInt(crt) ) then
       PostTable(qryProdutoICMS)
    else
       qryProdutoICMS.Cancel;
     RefreshTable( qryProdutoICMS );
end;

procedure TfrmCadProdutos.SpeedButton21Click(Sender: TObject);
begin
  PostTable(qryFornProd);
end;

procedure TfrmCadProdutos.SpeedButton22Click(Sender: TObject);
begin
  ConfirmDelete;
  qryProdutoUnidade.Delete;
end;

procedure TfrmCadProdutos.SpeedButton2Click(Sender: TObject);
var ret : Variant;
begin
  ret := ShowMultiLevelSelect(dbConnect.ZConnection1,'produto_grupo','pai','id','id','nome');
//  ret:= ShowSearchModal(dbConnect.ZConnection1,'produto_grupo','id,nome','id,nome','id',true);
  if VarIsBlank(ret) then exit;
  EditTable(qryProdutos);
  qryProdutosgrupo_produto.AsInteger     := ret;
  qryProdutosvnome_classificacao.Asstring:= ExecSql(dbConnect.ZConnection1,'Select obtemnometipoproduto(%s)',[ret]);
end;

procedure TfrmCadProdutos.SpeedButton3Click(Sender: TObject);
Var ret : Variant;
begin
   ret:= ShowSearchModal(dbConnect.ZConnection1,'pis_cofins','cst,descricao','cst','descricao',true);
  {ret := ShowSearchLista(['01-Operação Tributável com Alíquota Básica',
                          '02-Operação Tributável com Alíquota Diferenciada',
                          '03-Operação Tributável com Alíquota por Unidade de Medida de Produto',
                          '04-Operação Tributável Monofásica – Revenda a Alíquota Zero',
                          '05-Operação Tributável por Substituição Tributária',
                          '06-Operação Tributável a Alíquota Zero',
                          '07-Operação Isenta da Contribuição',
                          '08-Operação sem Incidência da Contribuição',
                          '09-Operação com Suspensão da Contribuição',
                          '49-Outras Operações de Saída']);}
     if VarIsBlank(ret) then exit;
     EditTable(qryProdutos);
     qryProdutoscst_pis.AsString := ret;
     PostTable(qryProdutos);
end;

procedure TfrmCadProdutos.SpeedButton4Click(Sender: TObject);
Var ret : Variant;
begin
    ret:= ShowSearchModal(dbConnect.ZConnection1,'pis_cofins','cst,descricao','cst','descricao',true);
{
  ret := ShowSearchLista(['01-Operação Tributável com Alíquota Básica',
                          '02-Operação Tributável com Alíquota Diferenciada',
                          '03-Operação Tributável com Alíquota por Unidade de Medida de Produto',
                          '04-Operação Tributável Monofásica – Revenda a Alíquota Zero',
                          '05-Operação Tributável por Substituição Tributária',
                          '06-Operação Tributável a Alíquota Zero',
                          '07-Operação Isenta da Contribuição',
                          '08-Operação sem Incidência da Contribuição',
                          '09-Operação com Suspensão da Contribuição',
                          '49-Outras Operações de Saída']);
                          }
     if VarIsBlank(ret) then exit;
     EditTable(qryProdutos);
     qryProdutoscst_cofins.AsString :=  ret;
     PostTable(qryProdutos);
end;

procedure TfrmCadProdutos.SpeedButton6Click(Sender: TObject);
Var crt: String;
begin
    qryProdutoICMS.Append;
    crt := ExecSql(dbConnect.ZConnection1,'Select crt From empresa Where id=%s',[getEmpresaPadrao(meCodigo)]);
    if not ShowCadProdutoICMS( StrToInt(crt) ) then begin
       qryProdutoICMS.Cancel;
       Exit;
    end;
  PostTable(qryProdutoICMS);
  RefreshTable( qryProdutoICMS );
end;

procedure TfrmCadProdutos.SpeedButton7Click(Sender: TObject);
var ret : Variant;
    qry : TZQuery;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'produtos','id,descricao','id','descricao',false);
  if VarIsBlank(ret) then exit;
  qry := ExecSqlQuery(dbConnect.ZConnection1,'Select id,descricao,preco_venda_varejo From produtos Where id=%s',[ret]);
  qryKit.Append;
  qryKitproduto_master.AsInteger:= qryProdutosid.AsInteger;
  qryKitproduto.AsInteger       := qry.FieldByName('id').AsInteger;
  qryKitdescricao.AsString      := qry.FieldByName('descricao').AsString;
  qryKitquantidade.AsFloat      := 1;
  qryKitpreco.AsFloat           := qry.FieldByName('preco_venda_varejo').AsFloat;
  PostTable(qryKit);
end;

procedure TfrmCadProdutos.btFaltaTempClick(Sender: TObject);
Var quant, motivo : String;
begin
  if not InputQuery('Estoque temporario','Quantidade de falta',quant) then exit;
  if not InputQuery('Estoque temporario','Motivo da falta',motivo) then exit;
  if length(motivo) < 10 then
     Raise Exception.Create('Motivo da falta deve ter no mínimo 10 caracteres.');
  try
    SetDecimalSeparator('.');
    ExecSql(dbConnect.ZConnection1,'Insert Into produtos_estoque_temporario (lote,quant_falta,motivo ) '+
                                   'values(%d,%.4f,''%s'')',
                                   [qryEstoqueLotesid.AsInteger,
                                    StrToCurr(quant),
                                    motivo]);
    BaixarEstoque(qryEstoqueLotesid.AsInteger,StrToCurr(quant));
  finally
    RestoreDecimalSeparator;
  end;
  GerarHistoricoMovimento(qryEstoqueLotesid.AsInteger,qryEstoqueLotesproduto.AsInteger,
                          qryEstoqueLotesid.AsInteger,1,OM_ESTOQUE_TEMP,
                          motivo,0,StrToCurr(quant));
  ToggleBox1.Checked:= False;
  OpenProduto(qryEstoqueLotesproduto.AsInteger);
end;

procedure TfrmCadProdutos.SpeedButton8Click(Sender: TObject);
begin
  qryProdutoUnidade.Append;
  qryProdutoUnidadeproduto.AsInteger := qryProdutosid.AsInteger;
end;

procedure TfrmCadProdutos.SpeedButton9Click(Sender: TObject);
var ret : Variant;
    value : Double;
begin
  if not InserirLote( qryProdutosid.AsInteger, qryProdutosdescricao.AsString ) then exit;
  OpenProduto( qryProdutosid.AsInteger );

  {
  if qryEstoqueLoteslocalizacao.AsString = 'Locacao' then
     Raise exception.Create('Este item não pode ser alterado por este módulo. Este item esta no estoque de locação.');

  ret:= ShowSearchModal(dbConnect.ZConnection1,'empresa','id,nome','id,nome','id',true,'id <> '+ qryEstoqueLotesempresa.ASstring);
  if VarIsBlank(ret) then exit;
  value := qryEstoqueLotesquantidade.ASfloat;
  SetDecimalSeparator('.');
  if InputFloat('Transferencia de estoque','Quantidade a transferir',value,3,qryEstoqueLotesquantidade.ASfloat) then begin
     TranfereLote(qryEstoqueLotesid.ASstring, qryEstoqueLotesempresa.ASstring, ret[0],qryEstoqueLotesproduto.ASstring,qryEstoqueLoteslote.ASstring, value,qryEstoqueLotesquantidade.AsFloat, teNormal);
  end;
  RestoreDecimalSeparator;
  OpenProduto( qryProdutosid.AsInteger );
  }
end;

procedure TfrmCadProdutos.ToggleBox1Change(Sender: TObject);
Var sql : String;
begin
  if ToggleBox1.Checked then begin
    sql := 'SELECT pe.id, pe.produto, pe.localizacao, pe.lote, pe.quantidade, pe.data_entrada, pe.data_validade,';
    sql += '       pe.data_fabricacao,pe.empresa,e.abreviacao ';
    sql += 'FROM produtos_estoque pe ';
    sql += 'Left Join empresa e ON e.id=pe.empresa ';
    sql += 'Where pe.produto=:id ';
    sql += 'Order by data_validade, id';
  end else begin
    sql := '(SELECT pe.id, pe.produto, pe.localizacao, pe.lote, pe.quantidade, pe.data_entrada, pe.data_validade, ';
    sql += 'pe.data_fabricacao,pe.empresa,e.abreviacao ';
    sql += 'FROM produtos_estoque pe ';
    sql += 'Left Join empresa e ON e.id=pe.empresa ';
    sql += 'Where pe.produto = :id and pe.quantidade > 0) ';
    sql += 'Union ';
    sql += '(SELECT id, produto,''Consignado'',(select lote From produtos_estoque Where id=ep.lote), ';
    sql += 'quant_consignada, data_consignacao::::date, null, null, empresa, ';
    sql += '(Select nome_curto From empregados Where id=ep.empregado)::::varchar(20) ';
    sql += 'FROM empregados_produtos ep ';
    sql += 'Where ep.produto= :id) ';
    sql += 'Order by data_validade,id';
  end;
  qryEstoqueLotes.Close;
  qryEstoqueLotes.Sql.Text:= sql;
  qryEstoqueLotes.ParamByName('id').AsInteger := qryProdutosid.AsInteger;
  OpenTable( qryEstoqueLotes );
end;

procedure TfrmCadProdutos.ToolBar1DblClick(Sender: TObject);
Var qry : TZQuery;
begin
//INSERT INTO tipo_produto_interno(id, nome)VALUES(001,'LINHA PADRÃO'),(002,'PRODUTOS PARA SAUDE'),(003,'PERFUMARIA'),(004,'MEDICAMENTOS')
{
  dbConnect.ZConnection2.Connect;
  SetDecimalSeparator('.');


  qry := ExecSqlQuery(dbConnect.ZConnection2,'SELECT a.PRD_CODIGO, a.PRD_REFER, a.PRD_STATUS, a.PRD_DTCADASTRO, '+
  'a.PRD_DESCRI, a.PRD_DESCRI_RES, a.PRD_UND, a.PRD_UND_GRADE_CALCULO, a.PRD_EMBALA, a.PGR_CODIGO, a.PTI_CODIGO, '+
  'a.IPI_CODIGO, a.PRD_ALIQICM, a.LIN_CODIGO, a.PRD_COMPL, a.PRD_CARACT, a.PRD_MINIMO, a.PRD_PCUSTO, a.PRD_PVENDA, '+
  'a.PRD_PMEDIO, a.PRD_PMATPRI, a.PRD_MAOOBRA, a.PRD_ESTOQUE, a.PRD_SAIDA, a.PRD_PENDENTE, a.FOR_CODIGO, a.PRD_ENTRADA, '+
  'a.PRD_MAXIMO, a.PRD_TEMSUB, a.PRD_SITRIBUT, a.PRD_ICMSUBS, a.PRD_UTILCONV, a.PRD_UNDCOMP, a.PRD_PESOKG, '+
  'a.PRD_FATORC, a.PRD_DIVMULT, a.EMP_CODIGO, a.PRD_DTPCUSTO, a.PRD_TABPRECO, a.PRD_GARANTIA, a.PRD_FAMILIA, '+
  'a.PRD_CODBARRA, a.PRD_VAR1, a.PRD_VAR2, a.PRD_VAR3, a.PRD_VAR4, a.PRD_VAR5, a.PRD_VAR6, a.PRD_VAR7, a.PRD_VAR8, '+
  'a.PRD_DCVAR1, a.PRD_DCVAR2, a.PRD_DCVAR3, a.PRD_DCVAR4, a.PRD_DCVAR5, a.PRD_DCVAR6, a.PRD_DCVAR7, a.PRD_DCVAR8, '+
  'a.PRD_CURVA, a.PRD_CODORIGINAL, a.PRD_CODMERCOSUL, a.PRD_DTPVENDA, a.AMX_CODIGO, a.PRD_PESOLIQ, a.PRD_GRADE, '+
  'a.PRD_CUSTOCOMIPI, a.PRD_RESERVA, a.PRD_EMPENHO, a.PRD_SALDOPRODUCAO, a.PRD_SIMULACAO, a.PRD_COMISSAO, '+
  'a.PRD_RESERVA_VAR1, a.PRD_RESERVA_VAR2, a.PRD_RESERVA_VAR3, a.PRD_RESERVA_VAR4, a.PRD_RESERVA_VAR5, '+
  'a.PRD_RESERVA_VAR6, a.PRD_RESERVA_VAR7, a.PRD_RESERVA_VAR8, a.PRD_DT_ULT_COMPRA, a.PRD_VL_ULT_COMPRA, '+
  'a.PRD_NF_ULT_COMPRA, a.FOR_CODIGO_ANT, a.PRD_DT_ULT_COMPRA_ANT, a.PRD_VL_ULT_COMPRA_ANT, a.PRD_NF_ULT_COMPRA_ANT, '+
  'a.PRD_LOTE, a.PRD_FATOR_PROD, a.PRD_DIV_MULT_PROD, a.STB_TRIBUTACAO, a.PRD_ORIGEM, a.PRD_CUSTO_CREDITO, '+
  'a.PRD_MARGEMVENDA, a.PRD_MARGEMOFERTA, a.PRD_PRECOOFERTA, a.PRD_INICIOOFERTA, a.PRD_FIMOFERTA, a.PRD_PVENDA2, '+
  'a.PRD_PVENDA3, a.PRD_PVENDA4, a.PRD_PVENDA5, a.PRD_PVENDA6, a.USU_CODIGO_ATUAL_TAB, a.USU_LOGIN_ATUAL_TAB, '+
  'a.PRD_DATA_ATUAL_TAB, a.SPED_GENCODIGO, a.SPED_TIPCODIGO, a.PRD_UNICODIGO, a.PRD_PRODSERV, a.PRD_CUSTOFRETE, '+
  'a.PRD_CUSTOIPI, a.PRD_CUSTOSUBTRIB, a.PRD_CUSTOADCIONAL, a.PRD_MGDESPFIXAS, a.PRD_INDICESOBMARGEM, a.SRV_REGISTRO, '+
  'a.PRD_FOTO, a.PRD_GERENCIA_LOTE, a.PRD_GRADE_OBRIGATORIO, a.PRDE_REGISTRO, a.CEST_COD, a.CEST_REVISAR '+
  'FROM PRD0000 a Order By PRD_CODIGO');
  while not qry.Eof do begin

     ExecSql(dbConnect.ZConnection1,'INSERT INTO produtos(id, descricao, codigo_barras, data_cadastro, unidade,'+
            'preco_compra, margem_lucro_atacado,preco_venda_atacado,'+
            'ncm,origem, cmv, ativo, cest,comissao,tipo_produto_interno )'+
            'VALUES (%d,''%.80s'',''%s'',%s,''%s'',%.2f,%.2f,%.2f,''%s'', ''%s'', %.2f,%s,''%s'',%.2f,%s ) ',
            [qry.FieldByName('PRD_CODIGO').ASInteger,
             qry.FieldByName('PRD_DESCRI').AsString,
             qry.FieldByName('PRD_CODBARRA').AsString,
             DateORNull(qry.FieldByName('PRD_DTCADASTRO').AsDateTime, True),
             qry.FieldByName('PRD_UND').AsString,
             qry.FieldByName('PRD_CUSTOCOMIPI').AsCurrency,     //preco_compra
             qry.FieldByName('PRD_MARGEMVENDA').AsCurrency,//margem_lucro_atacado
             qry.FieldByName('PRD_PVENDA').AsCurrency,     //preco_venda_atacado
             qry.FieldByName('IPI_CODIGO').AsString,    //ncm
             qry.FieldByName('PRD_ORIGEM').AsString,
             qry.FieldByName('PRD_CUSTOCOMIPI').AsCurrency,//cmv PRD_PCUSTO
             ifthen(qry.FieldByName('PRD_STATUS').AsString='A','True','False'),
             qry.FieldByName('CEST_COD').AsString,
             qry.FieldByName('PRD_COMISSAO').AsCurrency,
             ifthen(qry.FieldByName('LIN_CODIGO').IsNull,'0',qry.FieldByName('LIN_CODIGO').AsString)
             ]);


     if Not qry.FieldByName('FOR_CODIGO').IsNull then
     ExecSql(dbConnect.ZConnection1,'INSERT INTO fornecedor_produto(produto,fornecedor,codigo_produto) '+
                                    'VALUES(%d,%d,''%s'')',
                                    [qry.FieldByName('PRD_CODIGO').ASInteger,
                                     qry.FieldByName('FOR_CODIGO').ASInteger,
                                     qry.FieldByName('PRD_CODORIGINAL').AsString]);


     ExecSql(dbConnect.ZConnection1,'INSERT INTO produto_icms_template('+
                 'produto,uf_destino,cst_csosn,p_icms) '+
         'VALUES (%d, ''%s'', %d, %.2f)',
         [qry.FieldByName('PRD_CODIGO').ASInteger,
          'PR',101,
          qry.FieldByName('PRD_ALIQICM').AsFloat
         ]);
     qry.Next;
  end;
  ExecSql(dbConnect.ZConnection1,'SELECT setval(''produtos_id_seq'', (Select Max(id) from produtos))');

  {Lotes}
  qry := ExecSqlQuery(dbConnect.ZConnection2,'SELECT a.PRDL_DATA_FABRICACAO, '+
                                             'a.PRDL_DATA_VALIDADE, a.PRDL_LOTE, a.PRDL_PRECO_MAXIMO, a.PRDL_SALDO, '+
                                             'a.PRD_CODIGO, a.PRDL_CADASTRO FROM PRD_LOTE a '+
                                             'Left join PRD0000 p on p.PRD_CODIGO=a.PRD_CODIGO '+
                                             'where p.PRD_CODIGO is not null '+
                                             'Order by a.PRD_CODIGO',[]);
  while Not qry.EOF do begin
     ExecSql(dbConnect.ZConnection1,'INSERT INTO produtos_estoque(produto, lote, quantidade, data_entrada, '+
                                    'data_validade, data_fabricacao, empresa) '+
                                    'VALUES (%d, ''%s'', %.3f, %s, %s, %s, 1)',
                                    [qry.FieldByName('PRD_CODIGO').ASInteger,
                                     qry.FieldByName('PRDL_LOTE').ASString,
                                     0.00,//qry.FieldByName('PRDL_SALDO').AsFloat,
                                     DateORNull(qry.FieldByName('PRDL_CADASTRO').AsDateTime, True),
                                     DateORNull(qry.FieldByName('PRDL_DATA_VALIDADE').AsDateTime, True),
                                     DateORNull(qry.FieldByName('PRDL_DATA_FABRICACAO').AsDateTime, True)
                                     ]);
     qry.Next;
  end;
  RestoreDecimalSeparator;


   ShowMessage('Fim');
  }
end;

procedure TfrmCadProdutos.ToolButton11Click(Sender: TObject);
begin
  RLLabel1.Caption:= getEmpresaPadrao(meNome);
  RLReport1.PreviewModal;
end;

procedure TfrmCadProdutos.ToolButton12Click(Sender: TObject);
begin
  ClosePageThisForm(Self);
end;

procedure TfrmCadProdutos.FormCreate(Sender: TObject);
begin
  IniPropStorage1.IniFileName:= ConfigRecord.FileNamePath;
  IniPropStorage1.IniSection := 'TfrmCadProdutos';
  IniPropStorage1.Active     := true;
  IniPropStorage1.Restore;

  {Restrições de acesso}

  {Fim Restrições de acesso}
  dbConnect.setImageForDBNavigator(dbnavigator1);
  WAGDBNavigator1.Open;
end;

procedure TfrmCadProdutos.btSobraTempClick(Sender: TObject);
Var quant, motivo : String;
begin
  if not InputQuery('Estoque temporario','Quantidade de sobra',quant) then exit;
  if not InputQuery('Estoque temporario','Motivo da sobra',motivo) then exit;
  if length(motivo) < 10 then
     Raise Exception.Create('Motivo da sobra deve ter no mínimo 10 caracteres.');
  try
    SetDecimalSeparator('.');
    ExecSql(dbConnect.ZConnection1,'Insert Into produtos_estoque_temporario (lote,quant_sobra,motivo ) '+
                                 'values(%d,%.4f,''%s'')',
                                 [qryEstoqueLotesid.AsInteger,
                                  StrToCurr(quant),
                                  motivo]);
    DevolverEstoque(qryEstoqueLotesid.AsInteger,StrToCurr(quant));
  finally
    RestoreDecimalSeparator;
  end;
  GerarHistoricoMovimento(qryEstoqueLotesid.AsInteger,qryEstoqueLotesproduto.AsInteger,
                          qryEstoqueLotesid.AsInteger,1,OM_ESTOQUE_TEMP,
                          motivo,StrToCurr(quant),0);
  ToggleBox1.Checked:= False;
  OpenProduto(qryEstoqueLotesproduto.AsInteger);
end;

procedure TfrmCadProdutos.btDelfotoClick(Sender: TObject);
Var qry : TZQuery;
begin
  qry := ExecSqlQuery(dbConnect.ZConnection1,'Select * From produtos_imagens Where produto=%d',[qryProdutosid.AsInteger]);
  if qry.RecordCount = 0 then
     Raise Exception.Create('Produto não tem imagem associada.');
  if MessageDlg('Voce realmente quer excluir esta imagem ?', mtWarning, [mbYes, mbNo],0) <> mrYes then Exit;
  EditTable(qry);
  ExcluiFoto(qry,'imagem');
  PostTable(qry);
  Image1.Picture.Clear;
end;

procedure TfrmCadProdutos.btSalvarImagemClick(Sender: TObject);
Var qry : TZQuery;
begin
  qry := ExecSqlQuery(dbConnect.ZConnection1,'Select * From produtos_imagens Where produto=%d',[qryProdutosid.AsInteger]);
  if qry.RecordCount = 0 then
     Raise Exception.Create('Produto não tem imagem associada.');
  if not SavePictureDialog1.execute Then exit;
  ExportaFoto(qry,'imagem',SavePictureDialog1.FileName);
end;

procedure TfrmCadProdutos.btSelTipoProdutoClick(Sender: TObject);
  var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'tipo_produto_interno','id,nome','id,nome','nome',true);
  if VarIsBlank(ret) then exit;
  EditTable(qryProdutos);
  qryProdutostipo_produto_interno.Asstring := ret[0];
  qryProdutosvtipo_produto_interno.Asstring:= ret[1];
end;

procedure TfrmCadProdutos.btSelUnidadeClick(Sender: TObject);
  var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'unidade_medida','unidade,descricao','unidade','unidade',true);
  if VarIsBlank(ret) then exit;
  EditTable(qryProdutos);
  qryProdutosunidade.Asstring := ret;
end;

procedure TfrmCadProdutos.btShowCadIPIClick(Sender: TObject);
begin
   uUser.ShowDialog(dbConnect.ZConnection1,'Tabelas','TfrmCadIPI');
end;

procedure TfrmCadProdutos.btAddFotoClick(Sender: TObject);
Var qry : TZQuery;
begin
  if Not OpenPictureDialog1.Execute Then exit;
  StartWait;
  try
    qry := ExecSqlQuery(dbConnect.ZConnection1,'Select * From produtos_imagens Where produto=%d',[qryProdutosid.AsInteger]);
    if qry.RecordCount > 0 then
       qry.Edit
    else
       qry.Append;

    qry.FieldByName('produto').AsInteger:= qryProdutosid.AsInteger;
    qry.FieldByName('versao').AsInteger := 1;
    ImportaFoto( qry,'imagem', OpenPictureDialog1.FileName );
    qry.Post;
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  finally
    StopWait;
  end;
end;

procedure TfrmCadProdutos.acLocalizarExecute(Sender: TObject);
begin
 MenuItem1.Click;
end;

procedure TfrmCadProdutos.btAvariadosClick(Sender: TObject);
Var quant, motivo : String;
begin
  if not InputQuery('Estoque de avariados','Quantidade',quant) then exit;
  if not InputQuery('Estoque de avariados','Motivo',motivo) then exit;
  if length(motivo) < 10 then
     Raise Exception.Create('Motivo da avariados deve ter no mínimo 10 caracteres.');
  try
    SetDecimalSeparator('.');
    ExecSql(dbConnect.ZConnection1,'Insert Into produtos_estoque_avariados (lote,quant_sobra,motivo ) '+
                                 'values(%d,%.4f,''%s'')',
                                 [qryEstoqueLotesid.AsInteger,
                                  StrToCurr(quant),
                                  motivo]);
    BaixarEstoque(qryEstoqueLotesid.AsInteger,StrToCurr(quant));
  finally
    RestoreDecimalSeparator;
  end;
  GerarHistoricoMovimento(qryEstoqueLotesid.AsInteger,qryEstoqueLotesproduto.AsInteger,
                          qryEstoqueLotesid.AsInteger,1,OM_AVARIADOS,
                          motivo,0,StrToCurr(quant));
  ToggleBox1.Checked:= False;
  OpenProduto(qryEstoqueLotesproduto.AsInteger);
end;

procedure TfrmCadProdutos.btQuarentenaClick(Sender: TObject);
Var quant, motivo : String;
begin
  if not InputQuery('Estoque de quarentena','Quantidade',quant) then exit;
  if not InputQuery('Estoque de quarentena','Motivo',motivo) then exit;
  if length(motivo) < 10 then
     Raise Exception.Create('Motivo da quarentena deve ter no mínimo 10 caracteres.');
  try
    SetDecimalSeparator('.');
    ExecSql(dbConnect.ZConnection1,'Insert Into produtos_estoque_quarentena (lote,quant_sobra,motivo ) '+
                                 'values(%d,%.4f,''%s'')',
                                 [qryEstoqueLotesid.AsInteger,
                                  StrToCurr(quant),
                                  motivo]);
    BaixarEstoque(qryEstoqueLotesid.AsInteger,StrToCurr(quant));
  finally
    RestoreDecimalSeparator;
  end;
  GerarHistoricoMovimento(qryEstoqueLotesid.AsInteger,qryEstoqueLotesproduto.AsInteger,
                          qryEstoqueLotesid.AsInteger,1,OM_QUARENTENA,
                          motivo,0,StrToCurr(quant));
  ToggleBox1.Checked:= False;
  OpenProduto(qryEstoqueLotesproduto.AsInteger);
end;

procedure TfrmCadProdutos.btSelectCClassTribClick(Sender: TObject);
Var ret : Variant;
  str: String;
begin
     ret:= ShowSearchModal(dbConnect.ZConnection1,'cclasstrib_norm','cclasstrib,nome_cclasstrib','cclasstrib','nome_cclasstrib',true);
     if VarIsBlank(ret) then exit;
     EditTable(qryProdutos);
     qryProdutosc_class_trib.AsString := PadLeft(ret,6,'0');
     PostTable(qryProdutos);
end;

procedure TfrmCadProdutos.btSelectCSTIBSCBSClick(Sender: TObject);
Var ret : Variant;
  str: String;
begin
     ret:= ShowSearchModal(dbConnect.ZConnection1,'cst_ibs_cbs','cst_ibs_cbs,descricao','cst_ibs_cbs','descricao',true);
     if VarIsBlank(ret) then exit;
     EditTable(qryProdutos);
     qryProdutoscst_ibs_cbs.AsString := PadLeft(ret,3,'0');
     PostTable(qryProdutos);
end;

procedure TfrmCadProdutos.btTransfLocacaoClick(Sender: TObject);
var ret : Variant;
    value : Double;
  Var estoque : Variant;
begin
  estoque := obtemProdutoPorLote(qryProdutosid.AsInteger, 10);
  ShowMessageFmt('%d',[Integer(estoque[0][0])]);
  ShowMessageFmt('%d - %d - %.2f - %s',[Integer(estoque[0][0]),Integer(estoque[0][1]),estoque[0][2],estoque[0][3]]);
  if qryEstoqueLoteslocalizacao.AsString = 'Locacao' then
       Raise exception.Create('Este item não pode ser alterado por este módulo.');

  //ret:= ShowSearchModal(dbConnect.ZConnection1,'empresa','id,nome','id,nome','id',true,'id <> '+ qryEstoqueLotesempresa.ASstring);
  //if VarIsBlank(ret) then exit;
  value := qryEstoqueLotesquantidade.ASfloat;
  SetDecimalSeparator('.');
  if InputFloat('Transferencia para locação','Quantidade a transferir',value,3,qryEstoqueLotesquantidade.ASfloat) then begin
     TranfereLote(qryEstoqueLotesid.ASstring, qryEstoqueLotesempresa.ASstring, qryEstoqueLotesempresa.ASstring,qryEstoqueLotesproduto.ASstring,qryEstoqueLoteslote.ASstring, value,qryEstoqueLotesquantidade.AsFloat,teLocacao);
  end;
  RestoreDecimalSeparator;
  OpenProduto( qryProdutosid.AsInteger );
end;

procedure TfrmCadProdutos.Button1Click(Sender: TObject);
begin
  ACBrNCMs1.ListarNcms();
  ShowMessageFmt('%d',[ACBrNCMs1.NCMS.Count]);
end;

procedure TfrmCadProdutos.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  IniPropStorage1.Save;
end;

procedure TfrmCadProdutos.FormResize(Sender: TObject);
begin
    CenterControl(GroupBox1);
    CenterControl(GroupBox7);
    CenterControl(GroupBox8);
end;

procedure TfrmCadProdutos.FormShortCut(var Msg: TLMKey; var Handled: Boolean);
begin
    if msg.CharCode = VK_F2 then begin
       MenuItem1.Click;
       Handled := True;
    end;
    if msg.CharCode = VK_F3 then begin
       MenuItem2.Click;
       Handled := True;
    end;
    if msg.CharCode = VK_F4 then begin
       MenuItem3.Click;
       Handled := True;
    end;
    if msg.CharCode = VK_F5 then begin
       MenuItem4.Click;
       Handled := True;
    end;
end;

procedure TfrmCadProdutos.grpFormacaoPrecoDblClick(Sender: TObject);
Var prod : Integer;
begin
  qryProdutos.DisableControls;
  OpenTable( SdfDataSet1 );
  SdfDataSet1.First;
  StartWaitSql;
  While Not SdfDataSet1.Eof do begin
     prod := SdfDataSet1.FieldByname('produto').AsInteger;

     ExecSql(dbConnect.ZConnection1,'Update produtos Set descricao=');
     OpenProduto(prod);
     if (qryProdutosid.AsInteger = prod) and (not SdfDataSet1.FieldByname('preco').IsNull) then begin
       EditTable(qryProdutos);
       qryProdutosdescricao.AsString          := SdfDataSet1.FieldByname('descricao').AsString;
       qryProdutospreco_venda_atacado.AsFloat := SdfDataSet1.FieldByname('preco').AsFloat;
       PostTable(qryProdutos);
     end;
     SdfDataSet1.next;
     Application.ProcessMessages;
  end;
  StopWaitSql;
  qryProdutos.EnableControls;
  ShowMessage('Fim');
end;

procedure TfrmCadProdutos.Image1DblClick(Sender: TObject);
begin
   LoadImagem( qryProdutosid.AsInteger );
end;

procedure TfrmCadProdutos.LoadImagem( id : Integer);
Var qry : TZQuery;
begin
   qry := ExecSqlQuery(dbConnect.ZConnection1,'Select imagem From produtos_imagens Where produto=%d',[qryProdutosid.AsInteger]);
   ExibeFoto(qry,'imagem',Image1);
   qry.free;
end;

procedure TfrmCadProdutos.ToolButton8Click(Sender: TObject);
begin
  ConfirmDelete;
  qryProdutos.Delete;
  WAGDBNavigator1.Refresh;
  WAGDBNavigator1.First;
end;

procedure TfrmCadProdutos.WAGDBNavigator1AfterScroll(Sender: TObject);
begin
  OpenProduto(WAGDBNavigator1.KeyValue);
end;

procedure TfrmCadProdutos.OpenProduto(KeyValue: Integer);
Var empLocal : Integer;
begin
  //upper(obtemnometipoproduto(tipo_produto::::Integer)) as vtipo_produto,
  StartWaitSql;
  Try
      empLocal := StrToIntDef(getEmpresaPadrao(meCodigo),0);
      if empLocal = 0 then
         Raise Exception.Create('Empresa local ainda não foi definida.');
      qryProdutos.Close;
      {
      qryProdutos.Sql.Clear;
      qryProdutos.Sql.Add('Select p.id, descricao, codigo_barras, data_cadastro, grupo_produto, unidade,');
      qryProdutos.Sql.Add('       margem_lucro_varejo, preco_venda_varejo, observacao,');
      qryProdutos.Sql.Add('       item_comercial, prazo_validade, nao_movimenta_estoque, ncm, genero,');
      qryProdutos.Sql.Add('       is_composed, largura, altura, profundidade, peso, icms_template_id,');
      qryProdutos.Sql.Add('       ipi_template_id, full_image, image, similares, origem, numero_reg_ms,');
      qryProdutos.Sql.Add('       preco_venda_atacado, margem_lucro_atacado,g.nome as nome_grupo,');
      qryProdutos.admin           turboSql.Add('(Select sum(quantidade) From produtos_estoque Where produtos_estoque.produto=p.id) as quant_geral,');
      qryProdutos.Sql.Add(Format('(Select sum(quantidade) From produtos_estoque Where produtos_estoque.produto=p.id and empresa=%d) as quant_local, ',[empLocal]));
      qryProdutos.Sql.Add('(Case when Not is_composed then preco_compra else (Select sum(quantidade*preco) From produtos_kit Where produto_master=p.id) end) as preco_compra,');
      qryProdutos.Sql.Add('tipo_produto,descricao_xml,p.cmv,imagem,imagem_type, ');
      qryProdutos.Sql.Add('preco_venda_consignado,margem_lucro_consignado,ativo,caderno,cest,lista_pis_cofins,p_pis,cst_pis,p_cofins,cst_cofins ');
      qryProdutos.Sql.Add('From produtos p ');
      qryProdutos.Sql.Add('Left Join grupo_produtos g ON g.id=p.grupo_produto');
      //qryProdutos.Sql.Add('Left Join produto_tax_template pti ON pti.id=p.icms_template_id');
      //qryProdutos.Sql.Add('Left Join produto_tax_template pti2 ON pti2.id=p.ipi_template_id');
      qryProdutos.Sql.Add('Where p.id =:id');
      }
      qryProdutos.ParamByName('empLocal').AsInteger := empLocal;
      qryProdutos.ParamByName('id').AsInteger := KeyValue;
      OpenTable( qryProdutos );
      DBEdit8.ReadOnly:= qryProdutosis_composed.AsBoolean;

      qryEstoqueLotes.Close;
      OpenTable( qryEstoqueLotes );

      Image1.Picture.Clear;
      if mnLoadImage.Checked then
         LoadImagem( qryProdutosid.AsInteger );
  finally
    StopWaitSql;
  end;
end;

end.
{
SELECT pe.id, pe.produto, pe.localizacao, pe.lote, pe.quantidade, pe.data_entrada, pe.data_validade,
       pe.data_fabricacao,pe.empresa,e.abreviacao
  FROM produtos_estoque pe
Left Join empresa e ON e.id=pe.empresa
  Where pe.produto = :id and pe.quantidade > 0
  Order by pe.data_validade
}
