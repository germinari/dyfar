unit uCadTipoProduto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  ExtCtrls, Buttons, StdCtrls, ZDataset;

type

  { TfrmCadTipoProduto }

  TfrmCadTipoProduto = class(TForm)
    Label3: TLabel;
    Salvar: TButton;
    Fechar: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    pnEdit: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    TreeView1: TTreeView;
    ZQuery1: TZQuery;
    procedure FecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SalvarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure TreeView1SelectionChanged(Sender: TObject);
  private
    { private declarations }
    procedure LoadTabela;
    procedure LoadChildren(ndPai: TTreeNode; pai: Integer);
  public
    { public declarations }
  end;

  TStateAcao = (dsaInativo,dsaInsertPai,dsaInsertFilho,dsaEdit);

  TSelectItem = class(TObject)
     id         : Integer;
     Selecionado : Boolean;
     Selecionavel: Boolean;
  end;

var
  frmCadTipoProduto: TfrmCadTipoProduto;
  SelectItem : TSelectItem;
  StateAcao : TStateAcao;

implementation

{$R *.lfm}

Uses WagVclUtils, BDSqlUtils, uSearch, udbConnect, sistema_config;


{ TfrmCadTipoProduto }

procedure TfrmCadTipoProduto.ToolButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadTipoProduto.ToolButton4Click(Sender: TObject);
Var qry  : TZQuery;
    Item : TSelectItem;
Begin
    //if ZQuery1.Eof or ZQuery1.Bof then
       //Raise Exception.Create('Selecione uma ramificação primeiro.');
    if TreeView1.Selected = nil then
       Raise Exception.Create('Selecione uma ramificação primeiro.');
    Item     := TSelectItem(TreeView1.Selected.Data );
    //ZQuery1.Close;
    //ZQuery1.ParamByName('id').AsInteger := Item.id;
    //OpenTable( ZQuery1 );
    //qry := ExecSqlQuery(dbConnect.ZConnection1,'Select * from tipo_produtos Where id=%d Order by nome',[Item.id]);
    StateAcao:= dsaEdit;
    Label3.Caption := 'Edição';
    pnEdit.Visible := True;
    Edit1.Text     := ZQuery1.FieldByName('codigo').ASString;
    Edit2.Text     := ZQuery1.FieldByName('nome').ASString;
    Edit1.SetFocus;
end;

procedure TfrmCadTipoProduto.ToolButton5Click(Sender: TObject);
Var  Item : TSelectItem;
begin
  if TreeView1.Selected = nil then exit;
  Item     := TSelectItem(TreeView1.Selected.Data );
  if MessageDlg('Deletar item','Voce que deletar o item atual e todos os seu filhos?',mtConfirmation,[mbNo,mbYes],0,mbNo)<> mrYes then exit;
  ExecSql(dbConnect.ZConnection1,'Delete from tipo_produtos Where id =%d',[Item.id]);
  ExecSql(dbConnect.ZConnection1,'Delete from tipo_produtos Where pai=%d',[Item.id]);
  LoadTabela;
  StateAcao := dsaInativo;
end;

procedure TfrmCadTipoProduto.TreeView1SelectionChanged(Sender: TObject);
Var  Item : TSelectItem;
begin
    ZQuery1.close;
    if TreeView1.Selected = nil then exit;
    Item     := TSelectItem(TreeView1.Selected.Data );
    SelectItem := Item;
    ZQuery1.close;
    ZQuery1.ParamByName('id').AsInteger := Item.id;
    OpenTable( ZQuery1 );
end;

procedure TfrmCadTipoProduto.FormCreate(Sender: TObject);
begin
  LoadTabela;
  StateAcao := dsaInativo;
end;

procedure TfrmCadTipoProduto.SalvarClick(Sender: TObject);
begin
    pnEdit.Visible:= False;
    Case StateAcao of
       dsaInsertPai  : ExecSql(dbConnect.ZConnection1,'INSERT INTO tipo_produtos(pai, codigo, nome) VALUES (0, ''%s'', ''%s'')',[Edit1.Text,Edit2.Text]);
       dsaInsertFilho: ExecSql(dbConnect.ZConnection1,'INSERT INTO tipo_produtos(pai, codigo, nome) VALUES (%d, ''%s'', ''%s'')',
                                       [ZQuery1.FieldByName('id').AsInteger,
                                        Edit1.Text,
                                        Edit2.Text]);
       dsaEdit       : ExecSql(dbConnect.ZConnection1,'Update tipo_produtos Set codigo=''%s'', nome=''%s'' Where id = %d',
                                       [Edit1.Text,
                                        Edit2.Text,
                                        ZQuery1.FieldByName('id').AsInteger]);

    end;
    ZQuery1.close;
    LoadTabela;
    StateAcao := dsaInativo;
end;

procedure TfrmCadTipoProduto.FecharClick(Sender: TObject);
begin
  pnEdit.Visible:= False;
  StateAcao     := dsaInativo;
end;

procedure TfrmCadTipoProduto.SpeedButton1Click(Sender: TObject);
begin
    StateAcao:= dsaInsertPai;
    Label3.Caption := 'Novo ramo pai';
    Edit1.Text := '';
    Edit2.Text := '';
    pnEdit.Visible := True;
    Edit1.SetFocus;
end;

procedure TfrmCadTipoProduto.SpeedButton2Click(Sender: TObject);
Var Item : TSelectItem;
    qry : TZQuery;
Begin
    if TreeView1.Selected = nil then
       Raise Exception.Create('Selecione uma ramificação primeiro.');
    Item     := TSelectItem(TreeView1.Selected.Data );
    //ZQuery1.Close;
    //ZQuery1.ParamByName('id').AsInteger := Item.id;
    //OpenTable( ZQuery1 );
    if ZQuery1.Eof or ZQuery1.Bof then
       Raise Exception.Create('Selecione uma ramificação pai, primeiro.');
//    qry := ExecSqlQuery(dbConnect.ZConnection1,'Select * from tipo_produtos Where id=%d Order by nome',[Item.id]);
    StateAcao:= dsaInsertFilho;
    Label3.Caption := 'Novo ramo filho';
    pnEdit.Visible := True;
    Edit1.Text     := ZQuery1.FieldByName('codigo').ASString+'.';
    Edit2.Text     := '';
    Edit1.SetFocus;
end;

procedure TfrmCadTipoProduto.LoadTabela;
Var qry : TZQuery;
    node : TTreeNode;
    Item : TSelectItem;
begin
    TreeView1.Items.Clear;
    TreeView1.BeginUpdate;
    qry := ExecSqlQuery(dbConnect.ZConnection1,'Select * from tipo_produtos Where pai=%d Order by nome',[0]);
    While Not qry.Eof do begin
      Item    := TSelectItem.Create();
      Item.id := qry.FieldByName('id').AsInteger;
      Item.Selecionado := False;
      Item.Selecionavel:= False;
      node := TreeView1.Items.AddObject(Nil,qry.FieldByName('codigo').AsString+' '+qry.FieldByName('nome').AsString,Item);
      Node.StateIndex   := 2;
      LoadChildren(node,Item.id);
      qry.Next;
    end;
    TreeView1.EndUpdate;
end;

procedure TfrmCadTipoProduto.LoadChildren(ndPai : TTreeNode; pai : Integer);
Var qry : TZQuery;
    node : TTreeNode;
    Item : TSelectItem;
begin
    qry := ExecSqlQuery(dbConnect.ZConnection1,'Select * from tipo_produtos Where pai=%d Order by nome',[pai]);
    While Not qry.Eof do begin
      Item    := TSelectItem.Create();
      Item.id := qry.FieldByName('id').AsInteger;
      Item.Selecionado := False;
      Item.Selecionavel:= True;
      node := TreeView1.Items.AddChildObject(ndPai,qry.FieldByName('codigo').AsString+' '+qry.FieldByName('nome').AsString,Item);
      Node.StateIndex  := 3;
      LoadChildren(node,Item.id);
      qry.Next;
    end;
end;

initialization
   RegisterClass(TfrmCadTipoProduto);
end.

