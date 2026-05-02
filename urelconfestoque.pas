unit uRelConfEstoque;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DbCtrls, Buttons, EditBtn, ExtCtrls, RLReport, RLParser, ZDataset;

type

  { TfrmRelConfEstoque }

  TfrmRelConfEstoque = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Datasource1: TDatasource;
    EditButton1: TEditButton;
    EditButton2: TEditButton;
    EditButton3: TEditButton;
    Label13: TLabel;
    Label14: TLabel;
    Label21: TLabel;
    rgOrdem: TRadioGroup;
    rgResumido: TRadioGroup;
    RLBand1: TRLBand;
    RLBand10: TRLBand;
    RLBand11: TRLBand;
    RLBand12: TRLBand;
    RLBand13: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLBand6: TRLBand;
    RLBand7: TRLBand;
    RLBand8: TRLBand;
    RLBand9: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDBResult5: TRLDBResult;
    RLDBResult6: TRLDBResult;
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
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDraw1: TRLDraw;
    RLDraw11: TRLDraw;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLDraw4: TRLDraw;
    RLDraw5: TRLDraw;
    RLDraw6: TRLDraw;
    RLDraw7: TRLDraw;
    RLDraw8: TRLDraw;
    RLDraw9: TRLDraw;
    RLExpressionParser1: TRLExpressionParser;
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
    RLLabel29: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLReport2: TRLReport;
    RLReport3: TRLReport;
    RLReportTemplate: TRLReport;
    RLReport1: TRLReport;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo10: TRLSystemInfo;
    RLSystemInfo11: TRLSystemInfo;
    RLSystemInfo12: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    RLSystemInfo5: TRLSystemInfo;
    RLSystemInfo6: TRLSystemInfo;
    RLSystemInfo7: TRLSystemInfo;
    RLSystemInfo8: TRLSystemInfo;
    RLSystemInfo9: TRLSystemInfo;
    ZReadOnlyQuery1: TZReadOnlyQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure EditButton1ButtonClick(Sender: TObject);
    procedure EditButton2ButtonClick(Sender: TObject);
    procedure EditButton3ButtonClick(Sender: TObject);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: boolean);
  private
    { private declarations }
    procedure DetalhadoPorLote;
    procedure Resumido;
    procedure Financeiro;
  public
    { public declarations }
  end;

var
  frmRelConfEstoque: TfrmRelConfEstoque;

implementation

Uses WagVclUtils, BDSqlUtils, uSearch, udbConnect, sistema_config, strutils,
  umultilevelselect;

{$R *.lfm}

{ TfrmRelConfEstoque }

procedure TfrmRelConfEstoque.BitBtn1Click(Sender: TObject);
begin
   if rgResumido.ItemIndex = 0 then
      DetalhadoPorLote;
   if rgResumido.ItemIndex = 1 then
      Resumido;
   if rgResumido.ItemIndex = 2 then
      Financeiro;
end;


procedure TfrmRelConfEstoque.DetalhadoPorLote;
Var where : String;
    lista,Ordem : String;
begin

  where := 'Where pe.quantidade > 0';

  if Length(EditButton1.text) > 0 then begin
     where += Format(' and (p.grupo_produto=%s)',[ExtractWord(1,EditButton1.text,['-'])]);
  end;
  if Length(EditButton2.text) > 0 then begin
     where += Format(' and (p.tipo_produto in (%s))',[ExtractWord(1,EditButton2.text,['-'])]);
  end;
  if Length(EditButton3.text) > 0 then begin
     lista := Format('Select produto From fornecedor_produto Where fornecedor=%s',
                     [ExtractWord(1,EditButton3.text,['-'])]
                     );
     where += Format(' and (p.id in (%s))',[lista]);
  end;
  Case rgOrdem.ItemIndex of
     0 : Ordem := 'Order by pe.produto';
     1 : Ordem := 'Order by p.descricao';
     2 : Ordem := 'Order by p.local_estoque';
  end;

  ZReadOnlyQuery1.Close;
  ZReadOnlyQuery1.Sql.Clear;
  ZReadOnlyQuery1.Sql.Add('Select pe.produto,p.codigo_barras,p.descricao,p.preco_venda_atacado,');
  ZReadOnlyQuery1.Sql.Add('pe.lote,pe.quantidade, p.local_estoque,p.local_estoque_grosso');
  ZReadOnlyQuery1.Sql.Add('from produtos_estoque pe');
  ZReadOnlyQuery1.Sql.Add('Left Join produtos p ON pe.produto=p.id');
  ZReadOnlyQuery1.Sql.Add(where);
  ZReadOnlyQuery1.Sql.Add(Ordem);
  OpenTable( ZReadOnlyQuery1 );
  RLLabel2.Caption := Application.Title;
  RLLabel3.Caption := 'Tipo de produto '+ExtractWord(2,EditButton1.text,[',']);
  RLLabel4.Caption := 'Grupo do produto '+ExtractWord(2,EditButton2.text,['-']);
  RLLabel12.Caption:= 'Fornecedor ' + EditButton3.text;
  dbConnect.ConfigReport(RLReport1);
  RLReport1.PreviewModal;
end;

procedure TfrmRelConfEstoque.Resumido;
Var where : String;
    lista,Ordem : String;
begin

  where := 'Where (ativo=true)';

  if Length(EditButton1.text) > 0 then begin
     where += Format(' and (p.grupo_produto=%s)',[ExtractWord(1,EditButton1.text,['-'])]);
  end;
  if Length(EditButton2.text) > 0 then begin
     where += Format(' and (p.tipo_produto in (%s))',[ExtractWord(1,EditButton2.text,['-'])]);
  end;
  if Length(EditButton3.text) > 0 then begin
     lista := Format('Select produto From fornecedor_produto Where fornecedor=%s',
                     [ExtractWord(1,EditButton3.text,['-'])]
                     );
     where += Format(' and (p.id in (%s))',[lista]);
  end;
  Case rgOrdem.ItemIndex of
     0 : Ordem := 'Order by p.id';
     1 : Ordem := 'Order by p.descricao';
     2 : Ordem := 'Order by p.local_estoque';
  end;

  ZReadOnlyQuery1.Close;
  ZReadOnlyQuery1.Sql.Clear;
  ZReadOnlyQuery1.Sql.Add('Select p.id as produto,p.codigo_barras,p.descricao,p.local_estoque,');
  ZReadOnlyQuery1.Sql.Add('sum(pe.quantidade)::numeric(10,0) as quantidade ');
  ZReadOnlyQuery1.Sql.Add('from produtos p');
  ZReadOnlyQuery1.Sql.Add('Left Join produtos_estoque pe ON pe.produto=p.id');
  ZReadOnlyQuery1.Sql.Add(where);
  ZReadOnlyQuery1.Sql.Add('Group by p.id,p.codigo_barras,p.descricao,p.local_estoque');
  ZReadOnlyQuery1.Sql.Add(Ordem);
  OpenTable( ZReadOnlyQuery1 );
  RLLabel8.Caption := Application.Title;
  RLLabel9.Caption := 'Tipo de produto '+ExtractWord(2,EditButton1.text,[',']);
  RLLabel10.Caption:= 'Grupo do produto '+ExtractWord(2,EditButton2.text,['-']);
  RLLabel18.Caption:= 'Fornecedor ' + EditButton3.text;
  dbConnect.ConfigReport(RLReport1);
  RLReport2.PreviewModal;
end;

procedure TfrmRelConfEstoque.Financeiro;
Var where : String;
    lista,Ordem : String;
begin

  where := 'Where (ativo=true)';

  if Length(EditButton1.text) > 0 then begin
     where += Format(' and (p.grupo_produto=%s)',[ExtractWord(1,EditButton1.text,['-'])]);
  end;
  if Length(EditButton2.text) > 0 then begin
     where += Format(' and (p.tipo_produto in (%s))',[ExtractWord(1,EditButton2.text,['-'])]);
  end;
  if Length(EditButton3.text) > 0 then begin
     lista := Format('Select produto From fornecedor_produto Where fornecedor=%s',
                     [ExtractWord(1,EditButton3.text,['-'])]
                     );
     where += Format(' and (p.id in (%s))',[lista]);
  end;
  Case rgOrdem.ItemIndex of
     0 : Ordem := 'Order by pe.produto';
     1 : Ordem := 'Order by p.descricao';
     2 : Ordem := 'Order by p.local_estoque';
  end;

  ZReadOnlyQuery1.Close;
  ZReadOnlyQuery1.Sql.Clear;
  ZReadOnlyQuery1.Sql.Add('Select pe.produto,p.descricao,p.unidade,');
  ZReadOnlyQuery1.Sql.Add('sum(quantidade) as estoque,p.preco_compra,');
  ZReadOnlyQuery1.Sql.Add('p.preco_venda_atacado,p.local_estoque');
  ZReadOnlyQuery1.Sql.Add('from produtos_estoque pe');
  ZReadOnlyQuery1.Sql.Add('Left Join produtos p ON pe.produto=p.id');
  ZReadOnlyQuery1.Sql.Add(where);
  ZReadOnlyQuery1.Sql.Add('group by pe.produto,p.descricao,p.unidade,p.preco_compra,p.preco_venda_atacado,p.local_estoque');
//  ZReadOnlyQuery1.Sql.Add('Order by pe.produto,p.descricao,p.unidade,p.preco_compra,p.preco_venda_atacado');
  ZReadOnlyQuery1.Sql.Add(Ordem);
  OpenTable( ZReadOnlyQuery1 );
  RLLabel19.Caption := Application.Title;
  RLLabel20.Caption := 'Tipo de produto '+ExtractWord(2,EditButton1.text,[',']);
  RLLabel21.Caption := 'Grupo do produto '+ExtractWord(2,EditButton2.text,['-']);
  RLLabel26.Caption := 'Fornecedor ' + EditButton3.text;
  dbConnect.ConfigReport(RLReport3);
  RLReport3.PreviewModal;

end;

procedure TfrmRelConfEstoque.EditButton1ButtonClick(Sender: TObject);
var ret : Variant;
    sql : String;
begin
  sql := 'Select coalesce(pai,id) as pai,id,concat(classificacao,''-'',nome) as nome From produto_grupo Order by classificacao';
  ret := ShowMultiLevelSelect(dbConnect.ZConnection1,sql,'pai', 'id', 'id','nome');
  if VarIsBlank(ret) then exit;
  EditButton1.Text := ret + '-' +ExecSql(dbConnect.ZConnection1,'Select obtemnometipoproduto(%s)',[ret]);
end;

procedure TfrmRelConfEstoque.EditButton2ButtonClick(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'produto_tipo_produto','id,nome','id,nome','nome',true);
  if VarIsBlank(ret) then exit;
  EditButton2.Text := Format('%s-%s',[ret[0],ret[1]]);
end;

procedure TfrmRelConfEstoque.EditButton3ButtonClick(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'fornecedores','id,nome','id,nome','nome',true);
  if VarIsBlank(ret) then exit;
  EditButton3.Text := Format('%s-%s',[ret[0],ret[1]]);
end;

procedure TfrmRelConfEstoque.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: boolean);
begin
   PrintIt := True;
   if ZReadOnlyQuery1.RecNo mod 2 > 0 then
      (Sender as TRLBand).Color := clSilver
   else
     (Sender as TRLBand).Color := clWhite;
   //RLBand8.Color := RLBand5.Color;
end;

initialization
  RegisterClass(TfrmRelConfEstoque);

end.

