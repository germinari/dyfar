unit uRelClientes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, EditBtn, Spin, RLReport, RLParser, rxmemds, ZDataset;

type

  { TfrmRelClientes }

  TfrmRelClientes = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ckbIncluirInativos: TCheckBox;
    DataSource1: TDataSource;
    edRepresentante: TEditButton;
    edCidade: TEditButton;
    edBairro: TEditButton;
    edCliente: TEditButton;
    edUF: TEditButton;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLDBMemo1: TRLDBMemo;
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
    RLDBText35: TRLDBText;
    RLDBText36: TRLDBText;
    RLDBText39: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText41: TRLDBText;
    RLDBText42: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDetailGrid1: TRLDetailGrid;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLExpressionParser1: TRLExpressionParser;
    RLExpressionParser2: TRLExpressionParser;
    RLGroup1: TRLGroup;
    RLLabel1: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel33: TRLLabel;
    RLLabel36: TRLLabel;
    RLLabel37: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLReport1: TRLReport;
    RLReport2: TRLReport;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1bairro: TStringField;
    RxMemoryData1cep: TStringField;
    RxMemoryData1cidade: TStringField;
    RxMemoryData1cnpj: TStringField;
    RxMemoryData1contato: TStringField;
    RxMemoryData1endereco: TStringField;
    RxMemoryData1nome: TStringField;
    RxMemoryData1telefone1: TStringField;
    RxMemoryData1uf: TStringField;
    SpinEdit1: TSpinEdit;
    ZQuery1: TZQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure edBairroButtonClick(Sender: TObject);
    procedure edCidadeButtonClick(Sender: TObject);
    procedure edClienteButtonClick(Sender: TObject);
    procedure edRepresentanteButtonClick(Sender: TObject);
    procedure edUFButtonClick(Sender: TObject);
    procedure RadioButton2Change(Sender: TObject);
    procedure RLDBText35BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBText41BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBText42BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
  private
    { private declarations }
    procedure ListagemdeClientes;
    procedure EtiquetaDeClientes;
  public
    { public declarations }
  end;

var
  frmRelClientes: TfrmRelClientes;

implementation

uses udbConnect, variants, strutils, uSearch, BDSqlUtils, ACBrUtil,
  pcnConversao, ACBrValidador;

{$R *.lfm}

{ TfrmRelClientes }
procedure TfrmRelClientes.ListagemdeClientes;
Var where : string;
Begin
    Where := 'Where 0=0';
    if Length(edUF.Text) > 0 then
       where += Format(' and (c.uf ilike ''%s'')',[ExtractWord(1,edUF.Text,['-'])]);
    if Length(edCidade.Text) > 0 then
       where += Format(' and (c.cidade ilike ''%s'')',[edCidade.Text]);
    if Length(edBairro.Text) > 0 then
       where += Format(' and (c.bairro ilike ''%s'')',[edBairro.Text]);
    if Length(edRepresentante.Text) > 0 then
       where += Format(' and (c.id in (Select cliente From cliente_representante Where representante=%s))',[ExtractWord(1,edRepresentante.Text,['-'])]);
    if Not ckbIncluirInativos.Checked then
       Where += ' and (status ilike ''Ativo'')';
    ZQuery1.Close;
    ZQuery1.Sql.Clear;
    ZQuery1.Sql.Add('Select c.*, a.nome as vatividade, g.nome as vcliente_grupo,');
    ZQuery1.Sql.Add('t.nome as vtipo_estabelecimento, cr.representante,e.nome as vrepresentante');
    ZQuery1.Sql.Add('From clientes c');
    ZQuery1.Sql.Add('left join atividade a      on a.id=c.atividade');
    ZQuery1.Sql.Add('left join clientes_grupo g on g.id=c.cliente_grupo');
    ZQuery1.Sql.Add('left join tipo_estabelecimento t on t.id=c.tipo_estabelecimento');
    ZQuery1.Sql.Add('left join cliente_representante cr on cr.cliente=c.id');
    ZQuery1.Sql.Add('left join empregados e on e.id=cr.representante');
    ZQuery1.Sql.Add(Where);
    ZQuery1.Sql.Add('Order by representante,nome');
    OpenTable( ZQuery1 );

    dbConnect.ConfigReport(RLReport1);
    RLReport1.Clear;
    RLReport1.PreviewModal;
end;

procedure TfrmRelClientes.EtiquetaDeClientes;
Var where : string;
  i: Integer;
Begin
    Where := 'Where 0=0';
    (*
    if Length(edUF.Text) > 0 then
       where += Format(' and (c.uf ilike ''%s'')',[ExtractWord(1,edUF.Text,['-'])]);
    if Length(edCidade.Text) > 0 then
       where += Format(' and (c.cidade ilike ''%s'')',[edCidade.Text]);
    if Length(edBairro.Text) > 0 then
       where += Format(' and (c.bairro ilike ''%s'')',[edBairro.Text]);
    if Length(edRepresentante.Text) > 0 then
       where += Format(' and (c.id in (Select cliente From cliente_representante Where representante=%s))',[ExtractWord(1,edRepresentante.Text,['-'])]);
    if Not ckbIncluirInativos.Checked then
       Where += ' and (status ilike ''Ativo'')';
     *)
   // edCliente.Text
    RxMemoryData1.CloseOpen;
    For i := 1 to SpinEdit1.Value do
    begin
       //RxMemoryData1
    end;

    ZQuery1.Close;
    ZQuery1.Sql.Clear;
    ZQuery1.Sql.Add('Select c.*, a.nome as vatividade, g.nome as vcliente_grupo,');
    ZQuery1.Sql.Add('t.nome as vtipo_estabelecimento, cr.representante,e.nome as vrepresentante');
    ZQuery1.Sql.Add('From clientes c');
    ZQuery1.Sql.Add('left join atividade a      on a.id=c.atividade');
    ZQuery1.Sql.Add('left join clientes_grupo g on g.id=c.cliente_grupo');
    ZQuery1.Sql.Add('left join tipo_estabelecimento t on t.id=c.tipo_estabelecimento');
    ZQuery1.Sql.Add('left join cliente_representante cr on cr.cliente=c.id');
    ZQuery1.Sql.Add('left join empregados e on e.id=cr.representante');
    ZQuery1.Sql.Add(Where);
    ZQuery1.Sql.Add('Order by representante,nome');
    ZQuery1.Sql.Add('Limit 20');
    OpenTable( ZQuery1 );

    dbConnect.ConfigReport(RLReport2);
    RLReport2.Clear;
    RLReport2.Preview();
end;

procedure TfrmRelClientes.BitBtn1Click(Sender: TObject);
begin
  if RadioButton1.Checked then
     ListagemdeClientes
  else
     EtiquetaDeClientes;
end;

procedure TfrmRelClientes.edBairroButtonClick(Sender: TObject);
var ret : Variant;
    filtro : String;
begin
  filtro := Format('uf ilike ''%s'' and cidade ilike ''%s''',[ExtractWord(1,edUF.Text,['-']),edCidade.Text]);
  ret:= ShowSearchModal(dbConnect.ZConnection1,'bairros','bairro','bairro','bairro',true,filtro);
  if VarIsNull(ret) then exit;
  edBairro.Text := ret;
end;

procedure TfrmRelClientes.edCidadeButtonClick(Sender: TObject);
var ret : Variant;
    filtro : String;
begin
  filtro := Format('id_uf_ibge=%d',[UFtoCUF( ExtractWord(1,edUF.Text,['-']) )]);
  ret:= ShowSearchModal(dbConnect.ZConnection1,'municipio','nome','nome','nome',true,filtro);
  if VarIsNull(ret) then exit;
  edCidade.Text := ret;//Format('%s-%s',[ret[0],ret[1]]);

end;

procedure TfrmRelClientes.edClienteButtonClick(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'clientes','nome','id,nome','nome',true,'status ilike ''ATIVO''');
  if VarIsNull(ret) then exit;
  edCliente.Text := Format('%s-%s',[ret[0],ret[1]]);
end;

procedure TfrmRelClientes.edRepresentanteButtonClick(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'empregados','nome','id,nome','nome',true,'funcao in (''REPRESENTANTE'',''SUPERVISOR'')');
  if VarIsNull(ret) then exit;
  edRepresentante.Text := Format('%s-%s',[ret[0],ret[1]]);
end;

procedure TfrmRelClientes.edUFButtonClick(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'unidade_federacao','sigla,nome','sigla,nome','nome',true);
  if VarIsNull(ret) then exit;
  edUF.Text := Format('%s-%s',[ret[0],ret[1]]);
end;

procedure TfrmRelClientes.RadioButton2Change(Sender: TObject);
begin
  Label21.Enabled := RadioButton1.Checked;
  Label24.Enabled := RadioButton1.Checked;
  Label22.Enabled := RadioButton1.Checked;
  Label23.Enabled := RadioButton1.Checked;
  edRepresentante.Enabled := RadioButton1.Checked;
  edUF.Enabled := RadioButton1.Checked;
  edCidade.Enabled := RadioButton1.Checked;
  edBairro.Enabled := RadioButton1.Checked;
  ckbIncluirInativos.Enabled := RadioButton1.Checked;

  Label25.Enabled   := RadioButton2.Checked;
  edCliente.Enabled := RadioButton2.Checked;
  SpinEdit1.Enabled := RadioButton2.Checked;
  Label26.Enabled   := RadioButton2.Checked;
end;

procedure TfrmRelClientes.RLDBText35BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  Atext := FormatarFone(AText,'41');
end;

procedure TfrmRelClientes.RLDBText41BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  Atext := FormatarCEP(AText);
end;

procedure TfrmRelClientes.RLDBText42BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  Atext := FormatarCNPJouCPF(AText);
end;

initialization
 RegisterClass(TfrmRelClientes);
end.

