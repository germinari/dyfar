unit uCadSimples;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  ExtCtrls, ActnList, DbCtrls, StdCtrls, rxctrls, rxtoolbar, rxdbgrid, ZDataset,
  db, DBGrids, Grids,ZAbstractRODataset, ZSqlMetadata, ZConnection, Variants;

type

  { TfrmCadSimples }
  TFiltroCad = class(TObject)
    Match       : String;
    startMatch  : String;
    listDisplay : Array of String;
    listValue   : Array of String;
  end;

  TFieldLookUp = class(TObject)
    FieldDest   : String;
    TableSource : String;
    FieldSource : String;
    FieldResult : String;
    FieldSort   : String;
    FieldWhere  : String;
  end;

  TfrmCadSimples = class(TForm)
    acClose: TAction;
    ActionList1: TActionList;
    cbxFiltro: TComboBox;
    Datasource1: TDatasource;
    DBNavigator1: TDBNavigator;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    RxDBGrid1: TRxDBGrid;
    ToolPanel1: TToolPanel;
    ZQuery1: TZQuery;
    procedure acCloseExecute(Sender: TObject);
    procedure cbxFiltroChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RxDBGrid1EditButtonClick(Sender: TObject);
    procedure RxDBGrid1TitleClick(Column: TColumn);
    procedure ZQuery1BeforeDelete(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
    FFiltroCad : TFiltroCad;
    FFieldLookUp : TFieldLookUp;
    Ftabela,Forder,Fwhere: String;
    FvisibleFields,FTitles : TstringList;
    FReadOnly : Array of Boolean;
    procedure OpenTabela(tabela,order,where : String);
    procedure defineTitulos;
    procedure defineReadOnly;
    procedure loadFiltro;
  end;


procedure ShowCadastro( titulo,tabela : String; const titles : Array of const;
                        const visibleFields : Array of const;
                        const readonly : Array of boolean; Order : String = '0=0';
                        where : String = '0=0';
                        Filtro : TObject = nil);overload;

var
  frmCadSimples: TfrmCadSimples;

implementation

Uses WagVclUtils, WagStrUtils, BDSqlUtils, uSearch;

procedure ShowCadastro( titulo,tabela : String; const titles : Array of const;
                        const visibleFields : Array of const;
                        const readonly : Array of boolean; Order : String = '0=0';
                        where : String = '0=0';
                        Filtro : TObject = nil);
Var i : Integer;
begin
   with TfrmCadSimples.Create(Application) do begin
     Caption := titulo;
     Ftabela := tabela;
     Forder  := order;
     Fwhere  := where;
       if Filtro <> nil then begin
           if Filtro.ClassNameIs('TFiltroCad') then
              FFiltroCad := TFiltroCad(Filtro);
           if Filtro.ClassNameIs('TFieldLookUp') then
              FFieldLookUp := TFieldLookUp(Filtro);
       end;

     FvisibleFields.Clear;
     for i := 0 to High(visibleFields) do begin
         FvisibleFields.Add( Format('%s',visibleFields[i]) );
     end;
     for i := Low(titles) to High(titles) do begin
         FTitles.Add( Format('%s', titles[i] ) );
     end;

     SetLength(FReadOnly,Length(ReadOnly));
     for i := 0 to High(ReadOnly) do begin
         FReadOnly[i] := ReadOnly[i];
     end;

     cbxFiltro.Visible := (FFiltroCad <> nil);
     Label2.Visible    := (FFiltroCad <> nil);
     if (FFiltroCad <> nil) then loadFiltro()
     else OpenTabela(tabela,order,where);
     Label1.Caption := Format('%d registros',[ZQuery1.RecordCount]);
     ShowModal;
     Free;
   end;
end;

{ TfrmCadSimples }

procedure TfrmCadSimples.acCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadSimples.cbxFiltroChange(Sender: TObject);
begin
  Fwhere := Format(FFiltroCad.Match,[FFiltroCad.listValue[cbxFiltro.ItemIndex]]);
  OpenTabela(ftabela,forder,fwhere);
end;

procedure TfrmCadSimples.FormCreate(Sender: TObject);
begin
  FvisibleFields := TstringList.Create;
  FTitles        := TstringList.Create;
end;

procedure TfrmCadSimples.RxDBGrid1EditButtonClick(Sender: TObject);
Var res : Variant;
begin
    if RxDBGrid1.SelectedColumn.FieldName = FFieldLookUp.FieldDest then begin
       res := ShowSearchModal( TZConnection( ZQuery1.Connection ),FFieldLookUp.TableSource,FFieldLookUp.FieldSource,FFieldLookUp.FieldResult,FFieldLookUp.FieldSort,True,'0=0',FFieldLookUp.FieldSort);
       if VarIsBlank(res) then exit;
       EditTable(ZQuery1);
       ZQuery1.FieldByName(FFieldLookUp.FieldDest).AsString := res[0];
    end;
end;

procedure TfrmCadSimples.RxDBGrid1TitleClick(Column: TColumn);
begin
  ShowMessage(ZQuery1.SortedFields +' '+RxDBGrid1.Columns[Column.Index+1].FieldName);
   if ZQuery1.SortedFields = RxDBGrid1.Columns[Column.Index+1].FieldName then
      ZQuery1.SortType:= stAscending
   else
      ZQuery1.SortType:= stDescending;
   ShowMessage(RxDBGrid1.Columns[Column.Index+1].FieldName);
   ZQuery1.SortedFields:= RxDBGrid1.Columns[Column.Index+1].FieldName;
   RefreshTable( ZQuery1 );
end;

procedure TfrmCadSimples.ZQuery1BeforeDelete(DataSet: TDataSet);
begin
  ConfirmDelete;
end;

procedure TfrmCadSimples.OpenTabela(tabela,order,where: String);
Var sql,fields : String;
    i : Integer;
    field : TField;
begin
  sql := Format('Select * from %s Where %s Order By %s',[tabela,where,order]);
  ZQuery1.Close;
  ZQuery1.Sql.Clear;
  ZQuery1.SQL.Add(sql);
  OpenTable( ZQuery1 );
  defineTitulos;
  defineReadOnly;
  if FFieldLookUp <> nil then begin
    for i := 0 to RxDBGrid1.Columns.Count-1 do begin
        if RxDBGrid1.Columns[i].FieldName = FFieldLookUp.FieldDest then begin
           RxDBGrid1.Columns[i].ButtonStyle := cbsButton;
           exit;
        end;
    end;


  end;
end;

procedure TfrmCadSimples.defineTitulos;
Var i : Integer;
begin
  for i := 0 to RxDBGrid1.Columns.Count-1 do begin
      RxDBGrid1.Columns[i].Visible := False;
      RxDBGrid1.Columns[i].MaxSize := RxDBGrid1.Columns[i].Field.Size;
      if RxDBGrid1.Columns[i].Field.DataType in [ftFloat, ftCurrency] then
         RxDBGrid1.Columns[i].DisplayFormat:= '0.00';
  end;
  for i := 0 to FvisibleFields.Count -1 do begin
      RxDBGrid1.ColumnByFieldName(FvisibleFields[i]).Visible := True;
      RxDBGrid1.ColumnByFieldName(FvisibleFields[i]).Index   := i;
      //RxDBGrid1.ColumnByFieldName(FvisibleFields[i]).MaxSize := ;
  end;
  for i := 0 to Ftitles.Count -1 do begin
      if RxDBGrid1.Columns[i].Visible then
         RxDBGrid1.Columns[i].Title.Caption := ftitles[i];
   //   RxDBGrid1.Columns[i].Visible := True;
  end;
end;

procedure TfrmCadSimples.defineReadOnly;
Var i : Integer;
begin
  for i := 0 to High(freadonly) do begin
      RxDBGrid1.Columns[i].ReadOnly := FReadOnly[i];//VarRecToVariant(readonly[i]);
  end;

end;

procedure TfrmCadSimples.loadFiltro();
Var i : Integer;
begin
  cbxFiltro.Clear;
  for i := Low(FFiltroCad.listDisplay) to High(FFiltroCad.listDisplay) do begin
      cbxFiltro.Items.Add(FFiltroCad.listDisplay[i]);
  end;
  for i := Low(FFiltroCad.listValue) to High(FFiltroCad.listValue) do begin
      if FFiltroCad.listValue[i] = FFiltroCad.startMatch then
         Break;
  end;
  cbxFiltro.ItemIndex:= i;
  fwhere := Format(FFiltroCad.Match,[FFiltroCad.startMatch]);
  OpenTabela(ftabela,forder,fwhere);
end;

{$R *.lfm}

end.


