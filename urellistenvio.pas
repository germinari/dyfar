unit uRelListEnvio;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DbCtrls, Buttons, EditBtn, ExtCtrls, RLReport, ZDataset;

type

  { TfrmRelListEnvio }

  TfrmRelListEnvio = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Datasource1: TDatasource;
    EditButton1: TEditButton;
    EditButton2: TEditButton;
    EditButton3: TEditButton;
    Label13: TLabel;
    Label14: TLabel;
    Label21: TLabel;
    rgbOrdem: TRadioGroup;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLBand6: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText6: TRLDBText;
    RLDraw3: TRLDraw;
    RLDraw4: TRLDraw;
    RLLabel10: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLReport1: TRLReport;
    RLSystemInfo4: TRLSystemInfo;
    RLSystemInfo5: TRLSystemInfo;
    RLSystemInfo6: TRLSystemInfo;
    ZReadOnlyQuery1: TZReadOnlyQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: boolean);
    procedure EditButton1ButtonClick(Sender: TObject);
    procedure EditButton2ButtonClick(Sender: TObject);
    procedure EditButton3ButtonClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmRelListEnvio: TfrmRelListEnvio;

implementation

Uses WagVclUtils, BDSqlUtils, uSearch, udbConnect, sistema_config, strutils,
  umultilevelselect;

{$R *.lfm}

{ TfrmRelListEnvio }

procedure TfrmRelListEnvio.BitBtn1Click(Sender: TObject);
Var where : String;
    lista,Order : String;
begin

  where := 'Where (0=0) and (p.ativo=true)';

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
  Case rgbOrdem.ItemIndex of
     0 : Order := 'Order by produto';
     1 : Order := 'Order by descricao';
     2 : Order := 'Order by codigo_barras';
  end;

  ZReadOnlyQuery1.Close;
  ZReadOnlyQuery1.Sql.Clear;
  ZReadOnlyQuery1.Sql.Add('Select pe.produto,p.codigo_barras,p.descricao,p.preco_venda_atacado,');
  ZReadOnlyQuery1.Sql.Add('sum(pe.quantidade) as quantidade');
  ZReadOnlyQuery1.Sql.Add('from produtos_estoque pe');
  ZReadOnlyQuery1.Sql.Add('Left Join produtos p ON pe.produto=p.id');
  ZReadOnlyQuery1.Sql.Add(where);
  ZReadOnlyQuery1.Sql.Add('Group by pe.produto,p.codigo_barras,p.descricao,p.preco_venda_atacado');
  ZReadOnlyQuery1.Sql.Add(Order);
  OpenTable( ZReadOnlyQuery1 );
  RLLabel2.Caption := Application.Title;
  RLLabel4.Caption := 'Tipo de produto '+ExtractWord(2,EditButton1.text,[',']);
  RLLabel8.Caption := 'Grupo do produto '+ExtractWord(2,EditButton2.text,['-']);
  RLLabel21.Caption:= 'Fornecedor ' + EditButton3.text;
  dbConnect.report := RLReport1;
  RLReport1.PreviewModal;
end;

procedure TfrmRelListEnvio.EditButton1ButtonClick(Sender: TObject);
var ret : Variant;
begin
  ret := ShowMultiLevelSelect(dbConnect.ZConnection1,'produto_grupo','pai','id','id','nome');
  if VarIsBlank(ret) then exit;
  EditButton1.Text := ret + '-' +ExecSql(dbConnect.ZConnection1,'Select obtemnometipoproduto(%s)',[ret]);
end;

procedure TfrmRelListEnvio.EditButton2ButtonClick(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'produto_tipo_produto','id,nome','id,nome','nome',true);
  if VarIsBlank(ret) then exit;
  EditButton2.Text := Format('%s-%s',[ret[0],ret[1]]);
end;

procedure TfrmRelListEnvio.EditButton3ButtonClick(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'fornecedores','id,nome','id,nome','nome',true);
  if VarIsBlank(ret) then exit;
  EditButton3.Text := Format('%s-%s',[ret[0],ret[1]]);
end;

procedure TfrmRelListEnvio.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: boolean);
begin
   PrintIt := True;
   if ZReadOnlyQuery1.RecNo mod 2 > 0 then
      RLBand5.Color := clSilver
   else
     RLBand5.Color := clWhite;
end;

initialization
  RegisterClass(TfrmRelListEnvio);

end.

