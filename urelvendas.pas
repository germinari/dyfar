unit uRelVendas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, EditBtn,
  StdCtrls, Buttons, ExtCtrls, RLReport, rxtooledit, ZDataset;

type

  { TfrmRelVendas }

  TfrmRelVendas = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Datasource1: TDatasource;
    EditButton1: TEditButton;
    EditButton2: TEditButton;
    EditButton3: TEditButton;
    Label1: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label21: TLabel;
    rgbOrderm: TRadioGroup;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLLabel1: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLReport1: TRLReport;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RxDateEdit1: TRxDateEdit;
    RxDateEdit2: TRxDateEdit;
    ZReadOnlyQuery1: TZReadOnlyQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure EditButton1ButtonClick(Sender: TObject);
    procedure EditButton2ButtonClick(Sender: TObject);
    procedure EditButton3ButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: boolean);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmRelVendas: TfrmRelVendas;

implementation

Uses WagVclUtils, BDSqlUtils, uSearch, udbConnect, sistema_config, strutils,
  umultilevelselect;

{$R *.lfm}

{ TfrmRelVendas }

procedure TfrmRelVendas.FormCreate(Sender: TObject);
begin
     RxDateEdit1.Date := Date;
     RxDateEdit2.Date := Date;
end;

procedure TfrmRelVendas.RLBand2BeforePrint(Sender: TObject; var PrintIt: boolean);
begin
   PrintIt := True;
   if ZReadOnlyQuery1.RecNo mod 2 > 0 then
      RLBand2.Color := clSilver
   else
     RLBand2.Color := clWhite;
end;

procedure TfrmRelVendas.BitBtn1Click(Sender: TObject);
Var where, Order : String;
    lista : String;
begin
  if Not (RxDateEdit1.ValidDate or RxDateEdit2.ValidDate) then
     Raise exception.Create('Um periodo de data deve ser informado.');

  where := 'Where ('+FormatSqlDateCond('nf.dataemissao',RxDateEdit1.Date,RxDateEdit2.Date)+')';
  where += Format(' and (nf.status_nfe in (%s))',[ StatusNFe2Str(StatusNFeValid) ]);

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

  Case rgbOrderm.ItemIndex of
     0 : Order := 'Order by produto';
     1 : Order := 'Order by descricao';
     2 : Order := 'Order by total desc';
     3 : Order := 'Order by total asc';
     4 : Order := 'Order by quantidade desc';
     5 : Order := 'Order by quantidade asc';
  end;

  ZReadOnlyQuery1.Close;
  ZReadOnlyQuery1.Sql.Clear;
  ZReadOnlyQuery1.Sql.Add('Select i.produto,i.descricao,sum(i.quantidade) as quantidade,sum(i.valortotal) as total,sum(i.vlrsubst) as vlr_st ');
  ZReadOnlyQuery1.Sql.Add('From nfsaida_itens i');
  ZReadOnlyQuery1.Sql.Add('Left Join nfsaida nf ON nf.id=i.nfsaida');
  ZReadOnlyQuery1.Sql.Add('Left Join produtos p ON p.id=i.produto');
  ZReadOnlyQuery1.Sql.Add(where);
  ZReadOnlyQuery1.Sql.Add('Group by i.produto,i.descricao');
  ZReadOnlyQuery1.Sql.Add(Order);
  OpenTable( ZReadOnlyQuery1 );
  RLLabel1.Caption := Application.Title;
  RLLabel4.Caption := 'Periodo.: '+ Format('%s à %s',[RxDateEdit1.Text,RxDateEdit2.Text]);
  RLLabel2.Caption := 'Tipo de produto '+ExtractWord(2,EditButton1.text,[',']);
  RLLabel3.Caption := 'Grupo do produto '+ExtractWord(2,EditButton2.text,['-']);
  RLLabel13.Caption:= 'Fornecedor ' + EditButton3.text;

  dbConnect.report := RLReport1;
  RLReport1.PreviewModal;
end;

procedure TfrmRelVendas.EditButton1ButtonClick(Sender: TObject);
var ret : Variant;
    sql : String;
begin
  sql := 'Select coalesce(pai,id) as pai,id,concat(classificacao,''-'',nome) as nome From produto_grupo Order by classificacao';
  ret := ShowMultiLevelSelect(dbConnect.ZConnection1,sql,'pai', 'id', 'id','nome');
  if VarIsBlank(ret) then exit;
  EditButton1.Text := ret + '-' +ExecSql(dbConnect.ZConnection1,'Select obtemnometipoproduto(%s)',[ret]);
end;

procedure TfrmRelVendas.EditButton2ButtonClick(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'produto_tipo_produto','id,nome','id,nome','nome',true);
  if VarIsBlank(ret) then exit;
  EditButton2.Text := Format('%s-%s',[ret[0],ret[1]]);
end;

procedure TfrmRelVendas.EditButton3ButtonClick(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'fornecedores','id,nome','id,nome','nome',true);
  if VarIsBlank(ret) then exit;
  EditButton3.Text := Format('%s-%s',[ret[0],ret[1]]);
end;

initialization
 RegisterClass(TfrmRelVendas);

end.

