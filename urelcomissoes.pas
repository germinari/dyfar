unit uRelComissoes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, EditBtn,
  StdCtrls, Buttons, ExtCtrls, RLReport, rxtooledit, ZDataset;

type

  { TfrmRelComissoes }

  TfrmRelComissoes = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Datasource1: TDatasource;
    edRepresentante: TEditButton;
    Label1: TLabel;
    Label21: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLBand6: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLDBResult5: TRLDBResult;
    RLDBResult6: TRLDBResult;
    RLDBResult7: TRLDBResult;
    RLDBResult8: TRLDBResult;
    RLDBText1: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLGroup1: TRLGroup;
    RLLabel1: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLMemo1: TRLMemo;
    RLMemo2: TRLMemo;
    RLMemo3: TRLMemo;
    RLReport1: TRLReport;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RxDateEdit1: TRxDateEdit;
    RxDateEdit2: TRxDateEdit;
    ZReadOnlyQuery1: TZQuery;
    ZReadOnlyQuery1data: TDateTimeField;
    ZReadOnlyQuery1destinatario: TStringField;
    ZReadOnlyQuery1dtfaturamento: TDateTimeField;
    ZReadOnlyQuery1id: TLongintField;
    ZReadOnlyQuery1nome: TStringField;
    ZReadOnlyQuery1perc_comissao: TFloatField;
    ZReadOnlyQuery1representante: TLongintField;
    ZReadOnlyQuery1vlr_comissao: TFloatField;
    ZReadOnlyQuery1vlr_faturar: TFloatField;
    ZReadOnlyQuery1vlr_nota: TFloatField;
    ZReadOnlyQuery1vlr_pedido: TFloatField;
    procedure BitBtn1Click(Sender: TObject);
    procedure edRepresentanteButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: boolean);
    procedure ZReadOnlyQuery1CalcFields(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmRelComissoes: TfrmRelComissoes;

implementation

Uses WagVclUtils, BDSqlUtils, uSearch, udbConnect, sistema_config, strutils,
  uMultiSelect, dateutils;

{$R *.lfm}

{ TfrmRelComissoes }

procedure TfrmRelComissoes.FormCreate(Sender: TObject);
begin
     RxDateEdit1.Date := StartOfTheMonth(Date);
     RxDateEdit2.Date := Date;
end;

procedure TfrmRelComissoes.RLBand2BeforePrint(Sender: TObject; var PrintIt: boolean);
begin
   PrintIt := True;
   if ZReadOnlyQuery1.RecNo mod 2 > 0 then
      RLBand2.Color := clSilver
   else
     RLBand2.Color := clWhite;
end;

procedure TfrmRelComissoes.ZReadOnlyQuery1CalcFields(DataSet: TDataSet);
begin
  ZReadOnlyQuery1vlr_faturar.Ascurrency := 0.00;
  If ZReadOnlyQuery1vlr_nota.Ascurrency <= 0 then
       ZReadOnlyQuery1vlr_faturar.Ascurrency := ZReadOnlyQuery1vlr_pedido.AsCurrency;
  // ZReadOnlyQuery1vlr_nota.Ascurrency;
end;

procedure TfrmRelComissoes.edRepresentanteButtonClick(Sender: TObject);
Var sql : String;
begin
     Sql := ShowMultiSelect(dbConnect.ZConnection1,'empregados','id,nome','id','funcao=''REPRESENTANTE''','nome',false,edRepresentante.text);
     if length(Sql) = 0 then exit;
     edRepresentante.Text := Sql;
end;

procedure TfrmRelComissoes.BitBtn1Click(Sender: TObject);
Var where, Order : String;
    lista : String;
begin
  if Not (RxDateEdit1.ValidDate or RxDateEdit2.ValidDate) then
     Raise exception.Create('Um periodo de data deve ser informado.');

  if RadioButton1.Checked then begin
     where := 'Where ('+FormatSqlDateCond('pv.data',RxDateEdit1.Date,RxDateEdit2.Date) + ')';
     RLLabel4.Caption := 'Periodo.: '+ Format('%s à %s',[RxDateEdit1.Text,RxDateEdit2.Text]) + ' do pedido';
  end;

  if RadioButton2.Checked then begin
     where := 'Where (Case ';
     where += 'when pv.status=0 then null ';
     where += 'when pv.status=1 ';
     where += 'then (select dataemissao from nfsaida where nfsaida.numero_pedio_online=pv.id and status_nfe in (4,5,8)) ';
     where += 'when pv.status=3 ';
     where += 'then pv.data end) ';
     where += Format(' Between ''%s'' and ''%s''',[RxDateEdit1.Text,RxDateEdit2.Text]);
     RLLabel4.Caption := 'Periodo.: '+ Format('%s à %s',[RxDateEdit1.Text,RxDateEdit2.Text]) + ' do faturamento'; ;
  end;

  where += ' and pv.status in (0,1,3)';
  //where += Format(' and (nf.tipo_nota=0 and nf.status_nfe in (%s))',[StatusNFe2Str(StatusNFeValid)]);
  if Length(edRepresentante.text) > 0 then begin
     lista := ExtractWord(1,edRepresentante.text,['-']);
     where += Format(' and (pv.representante in (%s))',[lista]);
  end;

  ZReadOnlyQuery1.Close;
  ZReadOnlyQuery1.Sql.Clear;
  ZReadOnlyQuery1.Sql.Add('Select pv.representante,e.nome,pv.id,pv.data,c.nome as destinatario,');
  ZReadOnlyQuery1.Sql.Add('(select sum((preco_unitario*abs(desconto/100 - 1))*quantidade)');
  ZReadOnlyQuery1.Sql.Add(' from pedido_venda_itens');
  ZReadOnlyQuery1.Sql.Add(' Where pedido_venda=pv.id)::numeric(15,2) as vlr_pedido ,');
  ZReadOnlyQuery1.Sql.Add('(select valortotalprodutos from nfsaida where nfsaida.numero_pedio_online=pv.id and status_nfe in (4,5,8)) as vlr_nota,');

  ZReadOnlyQuery1.Sql.Add('(Select sum( ((preco_unitario*abs(desconto/100 - 1))*quantidade) * pvi.comissao/100 )');
  ZReadOnlyQuery1.Sql.Add('From pedido_venda_itens  pvi');
  ZReadOnlyQuery1.Sql.Add('Left join produtos p on p.id=pvi.produto');
  ZReadOnlyQuery1.Sql.Add('Where pvi.pedido_venda=pv.id)::numeric(15,2) as vlr_comissao,');
  ZReadOnlyQuery1.Sql.Add('(Select');
  ZReadOnlyQuery1.Sql.Add('       (sum( ((preco_unitario*abs(desconto/100 - 1))*quantidade) * pvi.comissao/100 )/');
  ZReadOnlyQuery1.Sql.Add('       sum( ((preco_unitario*abs(desconto/100 - 1))*quantidade))) * 100');
  ZReadOnlyQuery1.Sql.Add('From pedido_venda_itens  pvi');
  ZReadOnlyQuery1.Sql.Add('Left join produtos p on p.id=pvi.produto');
  ZReadOnlyQuery1.Sql.Add('Where pvi.pedido_venda=pv.id)::numeric(15,2) as perc_comissao,');
  ZReadOnlyQuery1.Sql.Add('0.00 as vlr_faturar,');

  ZReadOnlyQuery1.Sql.Add('(Case');
  ZReadOnlyQuery1.Sql.Add('when pv.status=0 then null');
  ZReadOnlyQuery1.Sql.Add('when pv.status=1');
  ZReadOnlyQuery1.Sql.Add('then (select dataemissao from nfsaida where nfsaida.numero_pedio_online=pv.id and status_nfe in (4,5,8))');
  ZReadOnlyQuery1.Sql.Add('when pv.status=3');
  ZReadOnlyQuery1.Sql.Add('then pv.data');
  ZReadOnlyQuery1.Sql.Add('end) as dtfaturamento');

  ZReadOnlyQuery1.Sql.Add('from pedido_venda pv');
  ZReadOnlyQuery1.Sql.Add('left join empregados e on e.id=pv.representante');
  ZReadOnlyQuery1.Sql.Add('left join clientes c on c.id=pv.cliente');
  ZReadOnlyQuery1.Sql.Add(Where);
  ZReadOnlyQuery1.Sql.Add('Group by pv.id,pv.representante,pv.data,c.nome,e.nome');
  ZReadOnlyQuery1.Sql.Add('Order by e.nome,pv.data');

  OpenTable( ZReadOnlyQuery1 );
  RLLabel1.Caption := Application.Title;
  RLLabel2.Caption := 'Representante '+ IfThen(edRepresentante.text='','Todos',edRepresentante.text);

  dbConnect.ConfigReport(RLReport1);
  RLReport1.PreviewModal;
end;

initialization
 RegisterClass(TfrmRelComissoes);

end.

