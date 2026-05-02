unit uEditItemNFEntrada;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls, DbCtrls, rxcurredit, rxdbgrid, ZDataset,
  ZSqlUpdate, udbConnect, db, memds, pcnConversao, Variants, LCLType, MaskEdit;

type

  { TfrmEditItemNFEntrada }

  TfrmEditItemNFEntrada = class(TForm)
    btLancarItem: TBitBtn;
    BitBtn2: TBitBtn;
    cbxcstcofins: TComboBox;
    cbxcstipi: TComboBox;
    cbxcst_pis: TComboBox;
    cbxUnidadeNF: TComboBox;
    cbxmodbcst: TComboBox;
    cbxModBC: TComboBox;
    cbxOrigem: TComboBox;
    cbxCSTICMS: TComboBox;
    cbxCSOSN: TComboBox;
    DividerBevel1: TDividerBevel;
    DividerBevel2: TDividerBevel;
    DividerBevel3: TDividerBevel;
    edAliqIPI: TCurrencyEdit;
    edBCIpi: TCurrencyEdit;
    edpcofins: TCurrencyEdit;
    edppis: TCurrencyEdit;
    edValorunitario: TCurrencyEdit;
    edDescontoNF: TCurrencyEdit;
    edQuantidade: TCurrencyEdit;
    edVlrBCcofins: TCurrencyEdit;
    edVlrBCpis: TCurrencyEdit;
    edVlrST: TCurrencyEdit;
    edValorTotalBruto: TCurrencyEdit;
    edBCST: TCurrencyEdit;
    edQuant_estoque: TCurrencyEdit;
    edpicms: TCurrencyEdit;
    edpRedBC: TCurrencyEdit;
    ebvBC: TCurrencyEdit;
    edvicms: TCurrencyEdit;
    edpicmsst: TCurrencyEdit;
    edMVAST: TCurrencyEdit;
    edRedBCST: TCurrencyEdit;
    DBNavigator1: TDBNavigator;
    dsLotesItens: TDatasource;
    edCodProd: TEdit;
    edCodProdFor: TEdit;
    edEan: TEdit;
    edDescricao: TEdit;
    Edit5: TEdit;
    edcfop: TEdit;
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
    Label30: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbCSOSN2: TLabel;
    lbcfop: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    lbDescontoEstoq: TStaticText;
    lbTotalNF: TStaticText;
    lbVlrUnitEstq: TStaticText;
    lbTotalEstoque2: TStaticText;
    MemDataset1: TMemDataset;
    Memo1: TMemo;
    PageControl1: TPageControl;
    qryItens: TZQuery;
    qryItenscest: TStringField;
    qryItenscfop: TStringField;
    qryItenscodificacao_fornecedor: TStringField;
    qryItenscodigo_barras: TStringField;
    qryItenscst_cofins: TLongintField;
    qryItenscst_csosn: TLongintField;
    qryItenscst_ipi: TLongintField;
    qryItenscst_pis: TLongintField;
    qryItensdescricao: TStringField;
    qryItensdescricao_xml: TStringField;
    qryItensestoque_destino: TStringField;
    qryItensid: TLongintField;
    qryItensinfadprod: TMemoField;
    qryItensmodbc: TLongintField;
    qryItensmodbcst: TLongintField;
    qryItensncm: TStringField;
    qryItensnfci_opc: TStringField;
    qryItensnfentrada: TLongintField;
    qryItensorig: TLongintField;
    qryItenspcofins: TFloatField;
    qryItenspicmsst: TFloatField;
    qryItenspipi: TFloatField;
    qryItenspmvast: TFloatField;
    qryItensppis: TFloatField;
    qryItensprazo_validade: TLongintField;
    qryItenspredbc: TFloatField;
    qryItenspredbcst: TFloatField;
    qryItensproduto: TLongintField;
    qryItensp_icms: TFloatField;
    qryItensquantidade: TFloatField;
    qryItensquant_caixa: TFloatField;
    qryItensquant_caixa_operacao: TStringField;
    qryItensquant_estoque: TFloatField;
    qryItensuf: TStringField;
    qryItensunidade: TStringField;
    qryItensvalortotal: TFloatField;
    qryItensvalorunitario: TFloatField;
    qryItensvbcicms: TFloatField;
    qryItensvbcipi: TFloatField;
    qryItensvbcst: TFloatField;
    qryItensvbc_cofins: TFloatField;
    qryItensvbc_pis: TFloatField;
    qryItensvcofins: TFloatField;
    qryItensvdesconto: TFloatField;
    qryItensvfrete: TFloatField;
    qryItensvicmsst: TFloatField;
    qryItensvipi: TFloatField;
    qryItensvlr_icms: TFloatField;
    qryItensvlr_unit_estoque: TFloatField;
    qryItensvoutras: TFloatField;
    qryItensvpis: TFloatField;
    qryItensvseguro: TFloatField;
    qryLotesItensdata_frabricacao: TDateField;
    qryLotesItensdata_vencimento: TDateField;
    qryLotesItensid: TLongintField;
    qryLotesItenslote: TLongintField;
    qryLotesItensnfentrada_itens: TLongintField;
    qryLotesItensnumerolote: TStringField;
    qryLotesItenspmc: TFloatField;
    qryLotesItensquantidade: TFloatField;
    qryLotesItensquantidade_estoque: TFloatField;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RxDBGrid1: TRxDBGrid;
    Shape1: TShape;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    lbTotalBrutoEstoque: TStaticText;
    StaticText1: TStaticText;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet5: TTabSheet;
    qryLotesItens: TZQuery;
    TabSheet6: TTabSheet;
    updItens: TZUpdateSQL;
    procedure cbxUnidadeNFChange(Sender: TObject);
    procedure edcfopKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edDescontoNFExit(Sender: TObject);
    procedure edValorTotalBrutoExit(Sender: TObject);
    procedure edValorunitarioExit(Sender: TObject);
    procedure MemDataset1BeforePost(DataSet: TDataSet);
    procedure MemDataset1NewRecord(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { private declarations }
    procedure LoadItem( id : Integer );
    procedure defineFornecedorCRT( crt : Integer );
    procedure CalcularItem;
    procedure AtualizarItem;
    function  obtemValorORNull( S : String):Variant;
  public
    { public declarations }
  end;

function entradadeItem( id : Integer):boolean;
function editarItem( id : Integer):boolean;

var
  frmEditItemNFEntrada: TfrmEditItemNFEntrada;

implementation

{$R *.lfm}

Uses BDSqlUtils, StrUtils, uSearch, WagVclUtils, sistema_config;

function entradadeItem(id: Integer): boolean;
Var crt : Integer;
begin
  with TfrmEditItemNFEntrada.Create(Application) do begin
    Caption := 'Adicionar novo item à nota';
    btLancarItem.Caption := 'Incluir Item';
    crt := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select crt From nfentrada Where id=%d',[id]),3);
    defineFornecedorCRT( crt );
    ShowModal;
    Result := (ModalResult = mrOK);
    if Result then begin
       qryItens.Append;
       qryItensid.ASInteger := id;
       AtualizarItem;
    end;
    Free;
  end;
end;

function editarItem(id: Integer): boolean;
Var crt : Integer;
begin
  with TfrmEditItemNFEntrada.Create(Application) do begin
    Caption := 'Editar item da nota';
    btLancarItem.Caption := 'Alterar Item';
    crt := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select crt From nfentrada Where id=(select nfentrada from nfentrada_itens Where id=%d)',[id]),3);
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

{ TfrmEditItemNFEntrada }

procedure TfrmEditItemNFEntrada.SpeedButton1Click(Sender: TObject);
Var res : variant;
begin
     res := ShowSearchModal(dbConnect.ZConnection1,'produtos','id,descricao','id,descricao','descricao');
     if VarIsNull(res) then exit;
     edCodProd.Text := res[0];
     edDescricao.Text := res[1];
end;

procedure TfrmEditItemNFEntrada.edcfopKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key <> VK_RETURN then exit;
  lbcfop.Caption :=  ExecSql(dbConnect.ZConnection1,'Select descricao From cfop_data Where limpa_cnpj(cfop)=''%s''',[ DelChars(edcfop.Text,'.')]);

end;

procedure TfrmEditItemNFEntrada.edDescontoNFExit(Sender: TObject);
begin
  CalcularItem;
end;

procedure TfrmEditItemNFEntrada.edValorTotalBrutoExit(Sender: TObject);
begin
  CalcularItem;
end;

procedure TfrmEditItemNFEntrada.edValorunitarioExit(Sender: TObject);
begin
  CalcularItem;
end;

procedure TfrmEditItemNFEntrada.MemDataset1BeforePost(DataSet: TDataSet);
begin
  if (MemDataset1.FieldByName('data_vencimento').AsDateTime <> 0) and
     (MemDataset1.FieldByName('data_frabricacao').AsDateTime = 0) then
     MemDataset1.FieldByName('data_frabricacao').AsDateTime := IncMonth(MemDataset1.FieldByName('data_vencimento').AsDateTime,qryItensprazo_validade.asInteger * -1);

end;

procedure TfrmEditItemNFEntrada.MemDataset1NewRecord(DataSet: TDataSet);
begin
   MemDataset1.FieldByName('id').AsInteger := -1;
end;

procedure TfrmEditItemNFEntrada.cbxUnidadeNFChange(Sender: TObject);
Var q : Currency;
    op : String;
begin
   if cbxUnidadeNF.Text = 'UN' then
      edQuant_estoque.Value := edQuantidade.Value;
   if cbxUnidadeNF.Text = 'CX' then begin
      q := qryItensquant_caixa.AsCurrency; //;StrToCurrDef(ExecSql(dbConnect.ZConnection1,'Select quant_caixa From produtos Where id=%s',[edCodProd.Text]),1.00);
      op:= qryItensquant_caixa_operacao.AsString;
      if op = '*' then
         edQuant_estoque.Value := edQuantidade.Value * q;
      if op = '/' then
         edQuant_estoque.Value := edQuantidade.Value / q;
      MemDataset1.First;
      while Not MemDataset1.eof do begin
        EditTable(MemDataset1);
        if op = '*' then
           MemDataset1.FieldByName('quantidade_estoque').AsCurrency := MemDataset1.FieldByName('quantidade').AsCurrency * q ;
        if op = '/' then
           MemDataset1.FieldByName('quantidade_estoque').AsCurrency := MemDataset1.FieldByName('quantidade').AsCurrency / q ;
        PostTable(MemDataset1);
        MemDataset1.Next;
      end;
   end;
   CalcularItem;
end;

procedure TfrmEditItemNFEntrada.SpeedButton2Click(Sender: TObject);
Var res : variant;
begin
     res := ShowSearchModal(dbConnect.ZConnection1,'cfop_data','cfop,descricao','cfop,descricao','descricao');
     if VarIsNull(res) then exit;
     edcfop.Text := res[0];
     lbcfop.Caption := res[1];
end;

procedure TfrmEditItemNFEntrada.LoadItem(id: Integer);
Var v,v2 : Double;
begin
  qryItens.Close;
  qryItens.ParamByName('id').ASInteger := id;
  OpenTable( qryItens );

  qryLotesItens.Close;
  qryLotesItens.ParamByName('nfentrada_itens').ASInteger := qryItensid.AsInteger;
  OpenTable( qryLotesItens );

  MemDataset1.Close;
  MemDataset1.Clear;
  OpenTable( MemDataset1 );
  MemDataset1.CopyFromDataset(qryLotesItens);
  MemDataset1.FieldDefs[0].Required:= False;

  //Identificação
  Label8.Caption           := qryItensdescricao_xml.ASstring;
  edCodProd.Text           := qryItensproduto.AsString;
  edCodProdFor.Text               := qryItenscodificacao_fornecedor.ASstring;
  edEan.Text               := qryItenscodigo_barras.AsString;
  edDescricao.Text         := qryItensdescricao.AsString;
  Memo1.Lines.Text         := qryItensinfadprod.AsString;
  RadioButton1.Checked     := (qryItensestoque_destino.ASString = 'N');
  RadioButton2.Checked     := (qryItensestoque_destino.ASString = 'A');

  //Quantidade Nota
  edQuantidade.AsInteger   := qryItensquantidade.AsInteger;
  cbxUnidadeNF.Text        := qryItensunidade.AsString;
  edValorunitario.Value    := qryItensvalorunitario.AsCurrency;
  edValorTotalBruto.Value  := qryItensvalorunitario.AsCurrency * qryItensquantidade.AsInteger;
  edDescontoNF.Value       := qryItensvdesconto.AsCurrency;
  lbTotalNF.Caption        := FormatMoney(qryItensvalortotal.AsCurrency - edDescontoNF.Value);

  //Quantidade Estoque
  edQuant_estoque.AsInteger   := qryItensquant_estoque.AsInteger;
  // unidade é sempre UN
  lbVlrUnitEstq.Caption       := FormatMoney( edValorTotalBruto.Value/edQuant_estoque.AsInteger );
  v := (edValorTotalBruto.Value/edQuant_estoque.AsInteger) * edQuant_estoque.AsInteger;
  lbTotalBrutoEstoque.Caption := FormatMoney(v);
  v2 := v * qryItensvdesconto.AsCurrency / 100;
  lbDescontoEstoq.Caption     := FormatMoney(v2);
  lbTotalEstoque2.Caption     := FormatMoney(v - v2);

  //NCM
  Edit5.Text               := qryItensncm.AsString;
  //Impostos
  //PIS
  cbxcst_pis.ItemIndex:= obtemIndexFor(cbxcst_pis.Items,Copy(qryItenscst_pis.AsString,1,2)+'-');;
  edppis.Value := qryItensppis.AsCurrency;
  edVlrBCpis.Value := qryItensvbc_pis.AsCurrency;
  //cofins
  cbxcstcofins.ItemIndex:= obtemIndexFor(cbxcstcofins.Items,Copy(qryItenscst_cofins.AsString,1,2)+'-');;
  edpcofins.Value := qryItenspcofins.AsCurrency;
  edVlrBCcofins.Value := qryItensvbc_cofins.AsCurrency;
  //IPI
  edAliqIPI.Value := qryItenspipi.AsCurrency;

  //ICMS
  cbxOrigem.ItemIndex := qryItensorig.ASInteger;
  if cbxCSTICMS.Visible then
     cbxCSTICMS.ItemIndex:= obtemIndexFor(cbxCSTICMS.Items, AddChar('0',qryItenscst_csosn.AsString,2) , 1 ,'-')
  else
     cbxCSOSN.ItemIndex  := obtemIndexFor(cbxCSOSN.Items,qryItenscst_csosn.AsString,1,'-');
  cbxModBC.ItemIndex  := obtemIndexFor(cbxModBC.Items,qryItensmodbc.AsString+'-');
  edpRedBC.Value      := qryItenspredbc.AsCurrency;
  ebvBC.Value         := qryItensvbcicms.AsCurrency;
  edpicms.Value       := qryItensp_icms.AsCurrency;
  edvicms.Value       := qryItensvlr_icms.AsCurrency;

  //ICMC ST
  cbxmodbcst.ItemIndex:= obtemIndexFor(cbxmodbcst.Items,qryItensmodbcst.AsString+'-');
  edMVAST.Value       := qryItenspmvast.ASCurrency;
  edRedBCST.Value     := qryItenspredbcst.ASCurrency;
  edBCST.Value        := qryItensvbcst.ASCurrency;
  edpicmsst.Value     := qryItenspicmsst.ASCurrency;
  edVlrST.Value       := qryItensvicmsst.ASCurrency;



  //ItemIndex:= StrToIntDef(Copy(qryItenscst.AsString,2,3),0);
  //CFOP
  edcfop.Text         := qryItenscfop.AsString;
  lbcfop.Caption      :=  ExecSql(dbConnect.ZConnection1,'Select descricao From cfop_data Where limpa_cnpj(cfop)=''%s''',[ DelChars(qryItenscfop.AsString,'.')]);

  RadioButton1.Checked:= qryItensestoque_destino.AsString = 'N';

end;

procedure TfrmEditItemNFEntrada.defineFornecedorCRT(crt : Integer);
begin
    // Fornecedor é Simples Nacional
  {1 - Simples Nacional
   2 - Simples Nacional - excesso de sublimite da receita bruta
   3 - Regime Normal}
  cbxCSOSN.Visible := (crt < 3);
  lbCSOSN2.Visible := (crt < 3);

  Label22.Visible    := (crt = 3);
  cbxOrigem.Visible  := (crt = 3);
  Label24.Visible    := (crt = 3);
  cbxCSTICMS.Visible := (crt = 3);

end;

procedure TfrmEditItemNFEntrada.CalcularItem;
Var v : Double;
begin
  v := edValorTotalBruto.Value/edQuant_estoque.Value;
  lbVlrUnitEstq.Caption      := FormatMoney(v);
  lbTotalBrutoEstoque.Caption:= FormatMoney(edQuant_estoque.Value*v);
  lbDescontoEstoq.Caption    := FormatMoney(edDescontoNF.Value);
  lbTotalEstoque2.Caption    := FormatMoney((edQuant_estoque.Value*v) - edDescontoNF.Value);
end;

procedure TfrmEditItemNFEntrada.AtualizarItem;
Var s : string;
begin
  qryItenscodificacao_fornecedor.AsString:= edCodProdFor.Text;
  qryItenscodigo_barras.AsString  := edEan.Text;
  qryItensproduto.AsString        := edCodProd.Text;
  qryItensdescricao.AsString      := edDescricao.Text;

  qryItenscfop.AsString           := edcfop.Text;
 // qryItenscfop_oper.AsString      := getCFOP4TipoMov(qryItensfinalidade_nf.ASInteger,qryItensuf.ASString,qryItenscst.AsString);
  qryItensncm.AsString            := Edit5.Text;
  qryItensestoque_destino.AsString:= IfThen(RadioButton1.Checked,'N','A');

  qryItensquantidade.ASInteger    := edQuantidade.AsInteger;
  qryItensunidade.AsString       := cbxUnidadeNF.Text;
  qryItensquant_estoque.ASInteger := edQuant_estoque.AsInteger;
  qryItensvdesconto.AsCurrency        := (edDescontoNF.Value*100)/edValorTotalBruto.Value;
  qryItensvdesconto.AsCurrency       := edDescontoNF.Value;
  qryItensvalortotal.AsCurrency      := edValorTotalBruto.Value;
  qryItensvalorunitario.AsCurrency   := edValorunitario.Value;
  qryItensvlr_unit_estoque.AsCurrency:= edValorunitario.Value;
  lbVlrUnitEstq.Caption := StringsReplace(lbVlrUnitEstq.Caption,['.'],[''],[rfReplaceAll]);
  lbVlrUnitEstq.Caption := StringsReplace(lbVlrUnitEstq.Caption,[','],['.'],[rfReplaceAll]);
  qryItensinfadprod.ASString      := Memo1.Lines.Text;
  // Calculo CMV
  // Calculo é feito quando lancar a nota
  // qryItenscmv.AsCurrency             := ;

  //ICMS
  if cbxCSTICMS.Visible then
     qryItenscst_csosn.AsString            := Copy(cbxCSTICMS.Text,1,2)
  else
     qryItenscst_csosn.AsString            := Copy(cbxCSOSN.Text,1,3);

  qryItensorig.ASInteger          := StrToIntDef(Copy(cbxOrigem.Text,1,1),0);

  qryItensp_icms.AsCurrency    := edpicms.Value;
  qryItensvbcicms.AsCurrency        := ebvBC.Value;
  qryItensmodbc.ASInteger         := StrToIntDef(Copy(cbxModBC.Text,1,1),0);
  qryItenspredbc.AsCurrency          := edpRedBC.Value;
  qryItensvlr_icms.AsCurrency        := edvicms.Value;
  //IPI
  qryItenspipi.AsCurrency        := edAliqIPI.Value;
  qryItensvbcipi.AsCurrency         := edBCIpi.Value;
  //PIS
  qryItenscst_pis.AsString        := Copy(cbxcst_pis.Text,1,2);
  qryItensppis.AsCurrency            := edppis.Value;
  qryItensvbc_pis.AsCurrency         := edVlrBCpis.Value;
  //Cofins
  qryItenscst_cofins.AsString     := Copy(cbxcstcofins.Text,1,2);
  qryItenspcofins.AsCurrency         := edpcofins.Value;;
  qryItensvbc_cofins.AsCurrency      := edVlrBCcofins.Value;
  //ST ICMS
  //if pos(ExtractWord(1,cbxmodbcst.Text,['-']),'0123456789') >=0 then
  s := ExtractWord(1,cbxmodbcst.Text,['-']);
  qryItensmodbcst.AsString        := ifthen(pos(s,'0123456789') >=0,s,'');
  //else
  //   qryItensmodbcst.AsString     := '';
  qryItensvbcicms.AsCurrency       := edBCST.Value;
  qryItenspmvast.AsCurrency          := edMVAST.Value;
  qryItenspicmsst.AsCurrency         := edpicmsst.Value;
  qryItenspredbcst.AsCurrency        := edRedBCST.Value;
  qryItensvicmsst.AsCurrency         := edVlrST.Value;
  //Lançameto de lotes
  PostTable(MemDataset1);
  MemDataset1.First;
  while not MemDataset1.Eof do begin
         if qryLotesItens.Locate('id',MemDataset1.FieldByName('id').AsInteger,[]) then
            qryLotesItens.Edit
         else
            qryLotesItens.Append;
         qryLotesItensnfentrada_itens.AsInteger   := qryItensid.AsInteger;
         qryLotesItensnumerolote.AsString         := MemDataset1.FieldByName('numerolote').AsString;
         qryLotesItensquantidade.AsInteger        := MemDataset1.FieldByName('quantidade').AsInteger;
         qryLotesItensdata_vencimento.ASDateTime  := MemDataset1.FieldByName('data_vencimento').AsDateTime;
         qryLotesItenspmc.AsCurrency              := MemDataset1.FieldByName('pmc').AsCurrency;
         qryLotesItensdata_frabricacao.AsDateTime := MemDataset1.FieldByName('data_frabricacao').AsDateTime;
         qryLotesItensquantidade_estoque.AsInteger:= MemDataset1.FieldByName('quantidade_estoque').AsInteger;
         qryLotesItens.Post;
         MemDataset1.Next;
  end;
  qryItens.Post;
end;

function TfrmEditItemNFEntrada.obtemValorORNull(s: String): Variant;
begin
  Result := Null;
  if length(trim(s)) > 0 then Result := Text;
end;



end.

