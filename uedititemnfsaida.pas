unit uEditItemNFSaida;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls, DbCtrls, rxcurredit, rxdbgrid, rxtooledit,
  ZDataset, ZSqlUpdate, udbConnect, db, memds, pcnConversao, Variants, LCLType,
  MaskEdit;

type

  { TfrmEditItemNFSaida }

  TfrmEditItemNFSaida = class(TForm)
    btLancarItem: TBitBtn;
    BitBtn2: TBitBtn;
    cbxcstcofins: TComboBox;
    cbxcstipi: TComboBox;
    cbxUnidadeNF: TComboBox;
    cbxmodbcst: TComboBox;
    cbxModBC: TComboBox;
    cbxOrigem: TComboBox;
    cbxCSTICMS: TComboBox;
    cbxcst_pis: TComboBox;
    cbxCSOSN: TComboBox;
    cbxIndTotal: TCheckBox;
    edTotalItem: TCurrencyEdit;
    edPrecoMax: TCurrencyEdit;
    DividerBevel1: TDividerBevel;
    DividerBevel2: TDividerBevel;
    DividerBevel3: TDividerBevel;
    edAliqIPI: TCurrencyEdit;
    edVFrete: TCurrencyEdit;
    edNumLote: TEdit;
    edpcofins: TCurrencyEdit;
    edVOutras: TCurrencyEdit;
    edVlrBCcofins: TCurrencyEdit;
    edValorunitario: TCurrencyEdit;
    edDescontoNF: TCurrencyEdit;
    edQuantidade: TCurrencyEdit;
    edBCIpi: TCurrencyEdit;
    edVlrST: TCurrencyEdit;
    edValorTotalBruto: TCurrencyEdit;
    edBCST: TCurrencyEdit;
    edPICMS: TCurrencyEdit;
    edpRedBC: TCurrencyEdit;
    edBaseCalc: TCurrencyEdit;
    edVICMS: TCurrencyEdit;
    edpicmsst: TCurrencyEdit;
    edMVAST: TCurrencyEdit;
    edRedBCST: TCurrencyEdit;
    edCodProd: TEdit;
    edCodBarras: TEdit;
    edDescricao: TEdit;
    edNCM: TEdit;
    edcfop: TEdit;
    edVlrBCpis: TCurrencyEdit;
    edppis: TCurrencyEdit;
    HeaderControl1: THeaderControl;
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
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbcfop: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    lbTotalNF: TStaticText;
    Memo1: TMemo;
    PageControl1: TPageControl;
    qryItens: TZQuery;
    qryItensbaseicms: TFloatField;
    qryItensbasesubst: TFloatField;
    qryItenscfop: TStringField;
    qryItenscodigo_barras: TStringField;
    qryItenscst: TStringField;
    qryItenscst_cofins: TLongintField;
    qryItenscst_ipi: TLongintField;
    qryItenscst_pis: TLongintField;
    qryItensdescricao: TStringField;
    qryItensestoque_origem: TStringField;
    qryItensid: TLongintField;
    qryItensindtot: TLongintField;
    qryItensinfadprod: TMemoField;
    qryItenslote: TLongintField;
    qryItensmodbc: TLongintField;
    qryItensmodbcst: TLongintField;
    qryItensncm: TStringField;
    qryItensncm_1: TStringField;
    qryItensnfsaida: TLongintField;
    qryItensorigem: TStringField;
    qryItenspcofins: TFloatField;
    qryItenspcomissao: TFloatField;
    qryItenspdesconto: TFloatField;
    qryItenspeso: TFloatField;
    qryItenspicms: TFloatField;
    qryItenspicmsst: TFloatField;
    qryItenspipi: TFloatField;
    qryItenspmva: TFloatField;
    qryItensppis: TFloatField;
    qryItenspredst: TFloatField;
    qryItensproduto: TLongintField;
    qryItensquantidade: TFloatField;
    qryItensquant_caixa: TFloatField;
    qryItensredbase: TFloatField;
    qryItenstipo_nota: TLongintField;
    qryItensuf: TStringField;
    qryItensunidade: TStringField;
    qryItensvalortotal: TFloatField;
    qryItensvalorunitario: TFloatField;
    qryItensvbc_cofins: TFloatField;
    qryItensvbc_ipi: TFloatField;
    qryItensvbc_pis: TFloatField;
    qryItensvfrete: TFloatField;
    qryItensvlricms: TFloatField;
    qryItensvlrsubst: TFloatField;
    qryItensvoutras: TFloatField;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RxDateEdit1: TRxDateEdit;
    RxDateEdit2: TRxDateEdit;
    Shape1: TShape;
    btSelectProduto: TSpeedButton;
    SpeedButton2: TSpeedButton;
    btCalculaICMS: TSpeedButton;
    btCalcICMSST: TSpeedButton;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    qryProduto: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;
    procedure btCalculaICMSClick(Sender: TObject);
    procedure cbxUnidadeNFChange(Sender: TObject);
    procedure edcfopKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btSelectProdutoClick(Sender: TObject);
    procedure edQuantidadeChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btCalcICMSSTClick(Sender: TObject);
  private
    { private declarations }
    procedure LoadItem( id : Integer );
    procedure defineFornecedorCRT( crt : Integer );
    procedure AtualizarItem;
    function  obtemValorORNull( S : String):Variant;
  public
    { public declarations }
    procedure OpenProduto( id : String );

  end;

function InserirItemSaida( seqnf : Integer):boolean;
function EditarItemSaida( id : Integer):boolean;

var
  frmEditItemNFSaida: TfrmEditItemNFSaida;

implementation

{$R *.lfm}

Uses BDSqlUtils, StrUtils, uSearch, WagVclUtils, math, ACBrUtil, sistema_config;


function achaEm( s : String ; Items : TStrings ):Integer;
Var linha : String;
  i: Integer;
begin
  Result := -1;
  for i := 0 to Items.count -1 do begin
     linha := Items[i];
     if pos(s,linha ) >0 then
        Result := i;

   end;
end;

function InserirItemSaida(seqnf: Integer): boolean;
Var crt : Integer;
begin
  with TfrmEditItemNFSaida.Create(Application) do begin
    Caption              := 'Adicionar novo item à nota';
    btLancarItem.Caption := 'Incluir Item';
    crt := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select crt From nfentrada Where seqnf=%d',[seqnf]),3);
    defineFornecedorCRT( crt );
    ShowModal;
    Result := (ModalResult = mrOK);
    if Result then begin
       qryItens.Append;
       qryItensnfsaida.ASInteger := seqnf;
       AtualizarItem;
    end;
    Free;
  end;
end;

function EditarItemSaida(id: Integer): boolean;
Var crt : Integer;
begin
  with TfrmEditItemNFSaida.Create(Application) do begin
    Caption := 'Editar item da nota';
    btLancarItem.Caption := 'Alterar Item';
    crt := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select crt From empresa Where id=%s',[getEmpresaPadrao(meCodigo)]),1);
    defineFornecedorCRT( crt );
    LoadItem( id );
    ShowModal;
    Result := (ModalResult = mrOK);
    if Result then begin
       qryItens.Edit;
       AtualizarItem;
    end;
    Free;
  end;
end;

{ TfrmEditItemNFSaida }

procedure TfrmEditItemNFSaida.btSelectProdutoClick(Sender: TObject);
Var res : variant;
begin
   res := ShowSearchModal(dbConnect.ZConnection1,'produtos','id,descricao','id,descricao','descricao');
   if VarIsNull(res) then exit;
   OpenProduto(res[0]);
   edCodProd.Text   := res[0];
   edDescricao.Text := res[1];
   edCodBarras.Text := qryProduto.FieldByName('codigo_barras').AsString;
   edNCM.Text       := qryProduto.FieldByName('ncm').AsString;
   cbxUnidadeNF.Text:= qryProduto.FieldByName('unidade').AsString;
   edValorunitario.Value:= qryProduto.FieldByName('preco_venda_varejo').AsCurrency;
   edPrecoMax.Value := qryProduto.FieldByName('preco_max_consumidor').AsCurrency;
end;

procedure TfrmEditItemNFSaida.edQuantidadeChange(Sender: TObject);
Var vlr : Currency;
begin
  edValorTotalBruto.Value := edValorunitario.Value * edQuantidade.Value;
  vlr := edValorTotalBruto.Value - CalculaPerc(edDescontoNF.Value,edValorTotalBruto.Value);
//  lbTotalNF.Caption:= FormatMoney(vlr);
  edTotalItem.Value:= vlr;
end;

procedure TfrmEditItemNFSaida.edcfopKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key <> VK_RETURN then exit;
  lbcfop.Caption :=  ExecSql(dbConnect.ZConnection1,'Select descricao From cfop_data Where limpa_cnpj(cfop)=''%s''',[ DelChars(edcfop.Text,'.')]);

end;

procedure TfrmEditItemNFSaida.cbxUnidadeNFChange(Sender: TObject);
Var q : Integer;
begin
  {
   if cbxUnidadeNF.Text = 'UN' then
      edQuant_estoque.Value := edQuantidade.Value;
   if cbxUnidadeNF.Text = 'CX' then begin
      q := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select quant_caixa From produtos Where id=%s',[edCodProd.Text]),1);
      edQuant_estoque.Value := edQuantidade.Value * q;
   end;
   CalcularItem;
   }
end;

procedure TfrmEditItemNFSaida.btCalculaICMSClick(Sender: TObject);
Var vbc : Double;
begin
  vbc           := edTotalItem.Value;// StrToCurr(lbTotalNF.Caption);
  vbc           := vbc - CalculaPerc(edpRedBC.Value,vbc);
  edVICMS.Value := CalculaPerc(edPICMS.Value,vbc);
  edBaseCalc.Value := vbc;
end;

procedure TfrmEditItemNFSaida.SpeedButton2Click(Sender: TObject);
Var res : variant;
begin
     res := ShowSearchModal(dbConnect.ZConnection1,'cfop_data','cfop,descricao','cfop,descricao','descricao',True);
     if VarIsNull(res) then exit;
     edcfop.Text    := res[0];
     lbcfop.Caption := res[1];
end;

procedure TfrmEditItemNFSaida.btCalcICMSSTClick(Sender: TObject);
Var vBC, v1, v2, vBCST : Double;
begin
  OpenProduto(edCodProd.Text);
  vBC  := edTotalItem.Value;// StrToCurr(lbTotalNF.Caption);
  vBC  := vBC - CalculaPerc(qryProduto.FieldByName('p_red_bc').AsCurrency,vBC);
  v1   := CalculaPerc(qryProduto.FieldByName('p_icms').AsCurrency,vBC);

  vBCST:= ifthen(edPrecoMax.Value=0,edValorTotalBruto.Value,edPrecoMax.Value * edQuantidade.Value);
  vBCST:= vBCST - CalculaPerc(qryProduto.FieldByName('p_red_bc_st').AsCurrency,vBCST);
  v2   := CalculaPerc(qryProduto.FieldByName('p_icms_st').AsCurrency,vBCST);
  edVlrST.Value := (v2 - v1);
  edBCST.Value  := vBCST;
end;

procedure TfrmEditItemNFSaida.LoadItem(id: Integer);
Var v,v2 : Double;
    idx : Integer;
    s : string;
    qryLote : TZQuery;
begin
  qryItens.Close;
  qryItens.ParamByName('id').ASInteger := id;
  OpenTable( qryItens );
  OpenProduto(qryItensproduto.AsString);
  //Identificação
  Label8.Caption           := qryItensdescricao.ASstring;
  edCodProd.Text           := qryItensproduto.AsString;
  edCodBarras.Text         := qryItenscodigo_barras.AsString;
  edDescricao.Text         := qryItensdescricao.AsString;
  Memo1.Lines.Text         := qryItensinfadprod.AsString;
  RadioButton1.Checked     := (qryItensestoque_origem.ASString = 'N');
  RadioButton2.Checked     := (qryItensestoque_origem.ASString = 'A');
  edNCM.Text               := qryItensncm.AsString;

  //Quantidade Nota
  edQuantidade.AsInteger   := qryItensquantidade.AsInteger;
  cbxUnidadeNF.Text        := qryItensunidade.AsString;
  edValorunitario.Value    := qryItensvalorunitario.AsCurrency;
  edValorTotalBruto.Value  := qryItensvalorunitario.AsCurrency * qryItensquantidade.AsInteger;
  edDescontoNF.Value       := qryItenspdesconto.AsCurrency;
//  lbTotalNF.Caption        := FormatMoney(edValorTotalBruto.Value - CalculaPerc(qryItenspdesconto.AsCurrency,edValorTotalBruto.Value));
  edTotalItem.Value        := edValorTotalBruto.Value - CalculaPerc(qryItenspdesconto.AsCurrency,edValorTotalBruto.Value);

  {Impostos}
  //PIS
  idx := obtemIndexFor(cbxcst_pis.Items,Copy(qryItenscst_pis.AsString,1,2)+'-');
  cbxcst_pis.ItemIndex:= idx;
  edppis.Value        := qryItensppis.AsCurrency;
  edVlrBCpis.Value    := qryItensvbc_pis.AsCurrency;
  //cofins
  idx := obtemIndexFor(cbxcstcofins.Items,Copy(qryItenscst_cofins.AsString,1,2)+'-');
  cbxcstcofins.ItemIndex:= idx;
  edpcofins.Value       := qryItenspcofins.AsCurrency;
  edVlrBCcofins.Value   := qryItensvbc_cofins.AsCurrency;
  //IPI
  idx := obtemIndexFor(cbxcstipi.Items,Copy(qryItenscst_ipi.AsString,1,2),1,'-');
  cbxcstipi.ItemIndex   := idx;
  edAliqIPI.Value       := qryItenspipi.AsCurrency;
  edBCIpi.Value         := qryItensvbc_ipi.AsCurrency;

  {ICMS}
  cbxOrigem.ItemIndex := qryItensorigem.ASInteger;
  ShowMessage(qryItenscst.AsString);
  s  := qryItenscst.AsString;
//  idx:= 1;
  if cbxCSOSN.Visible then
     cbxCSOSN.ItemIndex  := achaEm( s , cbxCSOSN.Items ) //obtemIndexFor(cbxCSOSN.Items,s+'-')
  else
     cbxCSTICMS.ItemIndex:= achaEm( s , cbxCSTICMS.Items );// obtemIndexFor(cbxCSTICMS.Items,s+'-');

  idx := obtemIndexFor(cbxModBC.Items,qryItensmodbc.AsString+'-');
  cbxModBC.ItemIndex  := idx;
  edpRedBC.Value      := qryItensredbase.ASCurrency;
  edBaseCalc.Value    := qryItensbaseicms.AsCurrency;
  edPICMS.Value       := qryItenspicms.AsCurrency;
  edVICMS.Value       := qryItensvlricms.AsCurrency;

  //ICMS ST
  s   := qryItensmodbcst.AsString;
  idx := obtemIndexFor(cbxmodbcst.Items,s,1,'-');
  cbxmodbcst.ItemIndex:= idx;
  edMVAST.Value       := qryItenspmva.ASCurrency;
  edRedBCST.Value     := qryItenspredst.ASCurrency;
  edBCST.Value        := qryItensbasesubst.ASCurrency;
  edpicmsst.Value     := qryItenspicmsst.ASCurrency;
  edVlrST.Value       := qryItensvlrsubst.ASCurrency;

  //CFOP
  edcfop.Text         :=  qryItenscfop.AsString;
  lbcfop.Caption      :=  ExecSql(dbConnect.ZConnection1,'Select descricao From cfop_data Where limpa_cnpj(cfop)=''%s''',[ DelChars(qryItenscfop.AsString,'.')]);

  edVFrete.Value      := qryItensvfrete.AsCurrency;
  edVOutras.Value     := qryItensvoutras.AsCurrency;
  cbxIndTotal.Checked := qryItensindtot.AsInteger = 1;


  edNumLote.Text      := qryProduto.FieldByName('slote').AsString;
  edPrecoMax.Value    := qryProduto.FieldByName('preco_max_consumidor').AsCurrency;

end;

procedure TfrmEditItemNFSaida.defineFornecedorCRT(crt : Integer);
begin
  // Fornecedor é Simples Nacional
  {1 - Simples Nacional
   2 - Simples Nacional - excesso de sublimite da receita bruta
   3 - Regime Normal}
  cbxCSOSN.Visible := (crt < 3);
  //Label22.Visible    := (crt = 3);
  //cbxOrigem.Visible  := (crt = 3);
  //Label24.Visible    := (crt = 3);
  cbxCSTICMS.Visible := (crt = 3);
end;

procedure TfrmEditItemNFSaida.AtualizarItem;
var s : string;
begin
  qryItenscodigo_barras.AsString     := edCodBarras.Text;
  qryItensproduto.AsString           := edCodProd.Text;
  qryItensdescricao.AsString         := edDescricao.Text;
  qryItenscfop.AsString              := edcfop.Text;
  qryItensncm.AsString               := edNCM.Text;
  qryItensestoque_origem.AsString    := IfThen(RadioButton1.Checked,'N','A');
  qryItensquantidade.ASInteger       := edQuantidade.AsInteger;
  qryItensunidade.AsString           := cbxUnidadeNF.Text;
  qryItenspdesconto.AsCurrency       := edDescontoNF.Value;
  qryItensvalorunitario.AsCurrency   := edValorunitario.Value;
  qryItensvalortotal.AsCurrency      := edTotalItem.Value;// StrToCurr(lbTotalNF.Caption);// edValorTotalBruto.Value;
  qryItensinfadprod.ASString         := Memo1.Lines.Text;

  //ICMS
  if cbxCSTICMS.Visible then
     qryItenscst.AsString            := Copy(cbxCSTICMS.Text,1,2)
  else
     qryItenscst.AsString            := Copy(cbxCSOSN.Text,1,3);

  qryItensorigem.ASInteger           := cbxOrigem.ItemIndex;// StrToIntDef(Copy(cbxOrigem.Text,1,1),0);

  qryItenspicms.AsCurrency           := edPICMS.Value;
  qryItensbaseicms.AsCurrency        := edBaseCalc.Value;
  qryItensmodbc.ASInteger            := StrToIntDef(Copy(cbxModBC.Text,1,1),0);
  qryItensredbase.AsCurrency         := edpRedBC.Value;
  qryItensvlricms.AsCurrency         := edVICMS.Value;
  //IPI
  qryItenscst_ipi.AsString           := Copy(cbxcstipi.Text,1,2);
  qryItenspipi.AsCurrency            := edAliqIPI.Value;
  qryItensvbc_ipi.AsCurrency         := edBCIpi.Value;
  //PIS
  qryItenscst_pis.AsString           := Copy(cbxcst_pis.Text,1,2);
  qryItensppis.AsCurrency            := edppis.Value;
  qryItensvbc_pis.AsCurrency         := edVlrBCpis.Value;
  //Cofins
  qryItenscst_cofins.AsString        := Copy(cbxcstcofins.Text,1,2);
  qryItenspcofins.AsCurrency         := edpcofins.Value;;
  qryItensvbc_cofins.AsCurrency      := edVlrBCcofins.Value;
  //ST ICMS
  {Não Sujeito}
  if cbxmodbcst.ItemIndex = 0 then
  begin
     qryItensmodbcst.AsVariant         := Null;
     qryItensbasesubst.AsVariant       := Null;
     qryItenspmva.AsVariant            := Null;
     qryItenspicmsst.AsVariant         := Null;
     qryItenspredst.AsVariant          := Null;
     qryItensvlrsubst.AsVariant        := Null;
  end else
  begin
    s := ExtractWord(1,cbxmodbcst.Text,['-']);
    qryItensmodbcst.AsString           := ifthen(pos(s,'0123456789') >= 0,s,'');
    qryItensbasesubst.AsCurrency       := edBCST.Value;
    qryItenspmva.AsCurrency            := edMVAST.Value;
    qryItenspicmsst.AsCurrency         := edpicmsst.Value;
    qryItenspredst.AsCurrency          := edRedBCST.Value;
    qryItensvlrsubst.AsCurrency        := edVlrST.Value;
  end;
  qryItensvfrete.AsCurrency            := edVFrete.Value;
  qryItensvoutras.AsCurrency           := edVOutras.Value;

  qryItensindtot.AsString              := IfThen(cbxIndTotal.Checked,'1','0');
  qryItens.Post;
end;

function TfrmEditItemNFSaida.obtemValorORNull(S: String): Variant;
begin
  Result := Null;
  if length(trim(s)) > 0 then Result := Text;
end;

procedure TfrmEditItemNFSaida.OpenProduto(id: String);
begin
  qryProduto.Close;
  qryProduto.ParamByName('id').AsString   := id;
  qryProduto.ParamByName('uf').AsString   := 'PR';
  qryProduto.ParamByName('lote').AsInteger:= qryItenslote.AsInteger;
  OpenTable( qryProduto );
end;



end.

