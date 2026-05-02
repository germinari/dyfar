unit uCadAvariados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, variants, FileUtil, Forms, Controls, Graphics, Dialogs,
  ComCtrls, DbCtrls, StdCtrls, Buttons, rxdbgrid, rxtooledit, RLReport, db,
  ZDataset, ZSqlUpdate, DBGrids, EditBtn, ExtCtrls, Menus, sistema_config,
  ZAbstractRODataset;

type

  { TfrmCadAvariados }

  TfrmCadAvariados = class(TForm)
    dsTemporario: TDatasource;
    dsAvariado: TDatasource;
    dsQuarentena: TDatasource;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MenuItem1: TMenuItem;
    Enviarparaestoqueprincipal: TMenuItem;
    mnEnviarPrincFromAvariados: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    PageControl1: TPageControl;
    Panel1: TPanel;
    PopupAvariados: TPopupMenu;
    PopupQuarentena: TPopupMenu;
    PopupDisponivel: TPopupMenu;
    qryAvariadodatahora: TDateTimeField;
    qryAvariadodata_destinacao: TDateTimeField;
    qryAvariadodata_validade: TDateTimeField;
    qryAvariadodescricao: TStringField;
    qryAvariadodestino: TStringField;
    qryAvariadoid: TLongintField;
    qryAvariadolote: TLongintField;
    qryAvariadomotivo: TStringField;
    qryAvariadoproduto: TLongintField;
    qryAvariadoquantidade: TFloatField;
    qryAvariadoslote: TStringField;
    qryQuarentenadatahora: TDateTimeField;
    qryQuarentenadata_validade: TDateTimeField;
    qryQuarentenadescricao: TStringField;
    qryQuarentenaid: TLongintField;
    qryQuarentenalote: TLongintField;
    qryQuarentenamotivo: TStringField;
    qryQuarentenaproduto: TLongintField;
    qryQuarentenaquantidade: TFloatField;
    qryQuarentenaslote: TStringField;
    qryTemporariodatahora: TDateTimeField;
    qryTemporariodata_validade: TDateTimeField;
    qryTemporariodescricao: TStringField;
    qryTemporarioid: TLongintField;
    qryTemporariolote: TLongintField;
    qryTemporariomotivo: TStringField;
    qryTemporarioproduto: TLongintField;
    qryTemporarioquant_falta: TFloatField;
    qryTemporarioquant_sobra: TFloatField;
    qryTemporarioslote: TStringField;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLBand6: TRLBand;
    RLBand7: TRLBand;
    RLBand8: TRLBand;
    RLBand9: TRLBand;
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
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLReport1: TRLReport;
    RLReport2: TRLReport;
    RLReport3: TRLReport;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    RLSystemInfo5: TRLSystemInfo;
    RLSystemInfo6: TRLSystemInfo;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    RxDBGrid3: TRxDBGrid;
    StatusBar1: TStatusBar;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton2: TToolButton;
    ToolButton6: TToolButton;
    qryQuarentena: TZQuery;
    qryAvariado: TZQuery;
    updAvariado: TZUpdateSQL;
    qryTemporario: TZQuery;
    procedure btQuarent2AvariadoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure EnviarparaestoqueprincipalClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure mnEnviarPrincFromAvariadosClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure btQuarent2PrincipalClick(Sender: TObject);
    procedure RxDBGrid1SortChanged(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxDBGrid2TitleClick(Column: TColumn);
    procedure RxDBGrid3SortChanged(Sender: TObject);
    procedure RxDBGrid3TitleClick(Column: TColumn);
    procedure ToolButton15Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { private declarations }
    fOrder : String;
  public
    { public declarations }
  end;

var
  frmCadAvariados: TfrmCadAvariados;

implementation
                       //uProdutos, uConsultaCEP, ,uWagCEP,uCadAvariados_Edit
uses WagVclUtils, udbConnect,uSearchList,wagStrUtils,
     dateutils, strutils, math, TDIPageControl, uSearch, BDSqlUtils,
     uUser, uInputDate, uInputFloat ;

{ TfrmCadAvariados }
{$R *.lfm}

procedure TfrmCadAvariados.ToolButton2Click(Sender: TObject);
begin
  ClosePageThisForm( self );
end;

procedure TfrmCadAvariados.FormResize(Sender: TObject);
begin
  CenterControl(GroupBox1);
  CenterControl(GroupBox2);
  CenterControl(GroupBox3);
end;

procedure TfrmCadAvariados.EnviarparaestoqueprincipalClick(Sender: TObject);
Var i : Integer;
    value : Double;
begin
   if CheckAcessModulo(dbConnect.ZConnection1,'TfrmCadAvariados','EstoquePrincipal') <> ACESSO_PERMITIDO then
      ShowSemAcesso(True);
   if MessageDlg('Voce quer enviar o item selecionado para o estoque principal ?',mtConfirmation,[mbNo,mbYes],0) <> mrYes then exit;
   value := Math.Max(qryTemporarioquant_sobra.AsFloat,qryTemporarioquant_falta.AsFloat);
   if Not InputFloat('Transferir para estoque principal','Quanto voce quer transferir ?',value,0,value) then exit;
   ExecSql(dbConnect.ZConnection1,'Begin Work');
   try
      {Verificar se é sobra ou falta}
      if qryTemporarioquant_sobra.AsCurrency > 0 then begin
        BaixarEstoque(qryTemporariolote.AsInteger,value);
        //regista acao em ajustes
        GerarHistoricoMovimento(qryTemporarioid.AsInteger,qryTemporarioproduto.AsInteger,qryTemporariolote.AsInteger,
                                1,OM_ESTOQUE_TEMP,'Normalizado temporario',0,value);
        if value = qryTemporarioquant_sobra.AsCurrency then
           ExecSql(dbConnect.ZConnection1,'Delete From produtos_estoque_temporario Where id=%d',[qryTemporarioid.AsInteger])
        else
           ExecSql(dbConnect.ZConnection1,'Update produtos_estoque_temporario Set quant_sobra=quant_sobra-%f Where id=%d',[value,qryTemporarioid.AsInteger]);
      end;
      if qryTemporarioquant_falta.AsCurrency > 0 then begin
         DevolverEstoque(qryTemporariolote.AsInteger,value);
         //regista acao em ajustes
         GerarHistoricoMovimento(qryTemporarioid.AsInteger,qryTemporarioproduto.AsInteger,qryTemporariolote.AsInteger,
                                 1,OM_ESTOQUE_TEMP,'Retorno do temporario',value,0);
        if value = qryTemporarioquant_falta.AsCurrency then
           ExecSql(dbConnect.ZConnection1,'Delete From produtos_estoque_temporario Where id=%d',[qryTemporarioid.AsInteger])
        else
           ExecSql(dbConnect.ZConnection1,'Update produtos_estoque_temporario Set quant_falta=quant_falta-%f Where id=%d',[value,qryTemporarioid.AsInteger]);
      end;
      ExecSql(dbConnect.ZConnection1,'Commit');
      ShowMessage('Operação executada com sucesso.');
      RefreshTable( qryTemporario );
   except
      ExecSql(dbConnect.ZConnection1,'Rollback');
      Raise;
   end;
end;

procedure TfrmCadAvariados.MenuItem1Click(Sender: TObject);
Var res : Variant;
    s , sql : String;
    i : Integer;
begin
   if CheckAcessModulo(dbConnect.ZConnection1,'TfrmCadAvariados','EditarAvariado') <> ACESSO_PERMITIDO then
      ShowSemAcesso(True);

   res := ShowSearchLista(['Vencido(s)','Danificados(s)','Outros:']);
   if VarIsNull(Res) then Exit;
   s := '';
   RxDBGrid2.SelectedRows.CurrentRowSelected := True;
   ExecSql(dbConnect.ZConnection1,'Begin Work');
   try
       for i := 0 to RxDBGrid2.SelectedRows.Count -1 do begin
           qryAvariado.GotoBookmark(RxDBGrid2.SelectedRows[i]);
           ExecSql(dbConnect.ZConnection1,'Update produtos_estoque_avariado SET motivo=''%s'' Where id=%s',[res,qryAvariadoid.asInteger]);
       end;
       ExecSql(dbConnect.ZConnection1,'Commit');
       RefreshTable( qryAvariado );
   Except
       ExecSql(dbConnect.ZConnection1,'RoolBack');
       Raise;
   end;

end;

procedure TfrmCadAvariados.MenuItem2Click(Sender: TObject);
Var dt : TDateTime;
    i  : Integer;
    s  : String;
begin
   if CheckAcessModulo(dbConnect.ZConnection1,'TfrmCadAvariados','EditarAvariado') <> ACESSO_PERMITIDO then
      ShowSemAcesso(True);

   dt := Date;
   if not InputDate('Data de destinação',dt) then exit;
   s := '';
   RxDBGrid2.SelectedRows.CurrentRowSelected := True;
   for i := 0 to RxDBGrid2.SelectedRows.Count -1 do begin
       qryAvariado.GotoBookmark(TBookMark(RxDBGrid2.SelectedRows[i]));
       AddWithSeparator(s,qryAvariadoid.AsString,',');
   end;

   ExecSql(dbConnect.ZConnection1,'Update produtos_estoque_avariado SET data_destinacao=''%s'' Where id in (%s)',
                                 [DateToStr(dt),s]);
   RefreshTable( qryAvariado );

end;

procedure TfrmCadAvariados.MenuItem4Click(Sender: TObject);
Var res : Variant;
    sql,s : String;
    i : Integer;
begin
   if CheckAcessModulo(dbConnect.ZConnection1,'TfrmCadAvariados','EditarAvariado') <> ACESSO_PERMITIDO then
      ShowSemAcesso(True);

   res := ShowSearchLista(['Aguardando Troca','Incineracao','Doacao']);
   if VarIsNull(Res) then Exit;
   s := '';
   RxDBGrid2.SelectedRows.CurrentRowSelected := True;
   for i := 0 to RxDBGrid2.SelectedRows.Count -1 do begin
       qryAvariado.GotoBookmark(TBookMark(RxDBGrid2.SelectedRows[i]));
       AddWithSeparator(s,qryAvariadoid.AsString,',');
   end;
   ExecSql(dbConnect.ZConnection1,'Update produtos_estoque_avariado SET destino=''%s'' Where id in (%s)',
                                 [res,s]);
   RefreshTable( qryAvariado );
end;

procedure TfrmCadAvariados.mnEnviarPrincFromAvariadosClick(Sender: TObject);
Var i : Integer;
    value : Double;
begin
   if CheckAcessModulo(dbConnect.ZConnection1,'TfrmCadAvariados','EstoquePrincipal') <> ACESSO_PERMITIDO then
      ShowSemAcesso(True);
   if MessageDlg('Voce quer enviar o item selecionado para o estoque principal ?',mtConfirmation,[mbNo,mbYes],0) <> mrYes then exit;
   value := qryAvariadoquantidade.AsCurrency;
   if Not InputFloat('Transferir para estoque principal','Quanto voce quer transferir ?',value,0,qryAvariadoquantidade.AsCurrency) then exit;
   if value > qryAvariadoquantidade.AsCurrency then
      Raise Exception.Create('Não é possível transferir quantidade maior que a disponível.');
   ExecSql(dbConnect.ZConnection1,'Begin Work');
   try
      DevolverEstoque(qryAvariadolote.AsInteger,value);

      if value = qryAvariadoquantidade.AsCurrency then
         ExecSql(dbConnect.ZConnection1,'Delete From produtos_estoque_avariado Where id=%d',[qryAvariadoid.AsInteger])
      else
         ExecSql(dbConnect.ZConnection1,'Update produtos_estoque_avariado Set quant_sobra=quant_sobra-%f Where id=%d',[value,qryAvariadoid.AsInteger]);

      //regista acao em ajustes
      GerarHistoricoMovimento(qryAvariadoid.AsInteger,qryAvariadoproduto.AsInteger,qryAvariadolote.AsInteger,
                              1,OM_AVARIADOS,'Retorno do avariado',value,0);
      ExecSql(dbConnect.ZConnection1,'Commit');
      ShowMessage('Operação executada com sucesso.');
      RefreshTable( qryAvariado );
   except
      ExecSql(dbConnect.ZConnection1,'Rollback');
      Raise;
   end;
end;

procedure TfrmCadAvariados.FormCreate(Sender: TObject);
begin
   fOrder := 'dataentrada';
   PageControl1Change(Nil);

end;

procedure TfrmCadAvariados.PageControl1Change(Sender: TObject);
begin
    FormResize(Nil);
    StartWait;
    if PageControl1.TabIndex = 0 then begin
        qryQuarentena.Close;
        OpenTable( qryQuarentena );
    end;
    if PageControl1.TabIndex = 1 then begin
        qryAvariado.Close;
        OpenTable( qryAvariado );
    end;
    if PageControl1.TabIndex = 2 then begin
        qryTemporario.Close;
        OpenTable( qryTemporario );
    end;
    StopWait;
end;

procedure TfrmCadAvariados.btQuarent2PrincipalClick(Sender: TObject);
Var i : Integer;
    value : Double;
begin
   if CheckAcessModulo(dbConnect.ZConnection1,'TfrmCadAvariados','EstoquePrincipal') <> ACESSO_PERMITIDO then
      ShowSemAcesso(True);

   if MessageDlg('Voce quer enviar o item selecionado para o estoque principal ?',mtConfirmation,[mbNo,mbYes],0) <> mrYes then exit;
   value := qryQuarentenaquantidade.AsCurrency;
   if Not InputFloat('Transferir para estoque principal','Quanto voce quer transferir ?',value,0,qryQuarentenaquantidade.AsCurrency) then exit;
   if value > qryQuarentenaquantidade.AsCurrency then
      Raise Exception.Create('Não é possível transferir quantidade maior que a disponível.');

   ExecSql(dbConnect.ZConnection1,'Begin Work');
   SetDecimalSeparator('.');
   try
      DevolverEstoque(qryQuarentenalote.AsInteger,value);

      if Trunc(value) = qryQuarentenaquantidade.AsInteger then
         ExecSql(dbConnect.ZConnection1,'Delete From produtos_estoque_quarentena Where id=%d',[qryQuarentenaid.AsInteger])
      else
         ExecSql(dbConnect.ZConnection1,'Update produtos_estoque_quarentena Set quant_sobra=quant_sobra-%f Where id=%d',[value,qryQuarentenaid.AsInteger]);

      //regista acao em ajustes
      GerarHistoricoMovimento(qryQuarentenaid.AsInteger,qryQuarentenaproduto.AsInteger,qryQuarentenalote.AsInteger,
                              1,OM_QUARENTENA,'Retorno da quarentena',value,0);
      ExecSql(dbConnect.ZConnection1,'Commit');
      ShowMessage('Operação executada com sucesso.');
      RefreshTable( qryQuarentena );
      RestoreDecimalSeparator;
   except
      RestoreDecimalSeparator;
      ExecSql(dbConnect.ZConnection1,'Rollback');
      Raise;
   end;
end;

procedure TfrmCadAvariados.btQuarent2AvariadoClick(Sender: TObject);
Var sMotivo : String;
    res : Variant;
    sql : String;
    i : Integer;
    value : Double;
begin
   if CheckAcessModulo(dbConnect.ZConnection1,'TfrmCadAvariados','EstoqueAvariado') <> ACESSO_PERMITIDO then
      ShowSemAcesso(True);
   if MessageDlg('Voce quer enviar o item selecionado para o estoque de avariados ?',mtConfirmation,[mbNo,mbYes],0) <> mrYes then exit;
   value := qryQuarentenaquantidade.AsCurrency;
   if Not InputFloat('Transferir para estoque Avariados','Quanto voce quer transferir ?',value,0,qryQuarentenaquantidade.AsCurrency) then exit;
   res := ShowSearchLista(['Vencido(s)','Danificados(s)','Outros:']);
   if VarIsNull(Res) then Exit;
   sMotivo := res;
   ExecSql(dbConnect.ZConnection1,'Begin Work');
   try
      try
        SetDecimalSeparator('.');
        ExecSql(dbConnect.ZConnection1,'Insert Into produtos_estoque_avariado (lote,quant_sobra,motivo ) '+
                                     'values(%d,%.4f,''%s'')',
                                     [qryQuarentenalote.AsInteger,
                                      value,
                                      sMotivo]);

        if value = qryQuarentenaquantidade.AsCurrency then
           ExecSql(dbConnect.ZConnection1,'Delete From produtos_estoque_quarentena Where id=%d',[qryQuarentenaid.AsInteger])
        else
           ExecSql(dbConnect.ZConnection1,'Update produtos_estoque_quarentena Set quant_sobra=quant_sobra-%f Where id=%d',[value,qryQuarentenaid.AsInteger]);
        ExecSql(dbConnect.ZConnection1,'Commit');
        ShowMessage('Operação executada com sucesso.');
        RefreshTable( qryQuarentena );
      finally
        RestoreDecimalSeparator;
      end;
   except
    ExecSql(dbConnect.ZConnection1,'Rollback');
    Raise;
   end;
end;


procedure TfrmCadAvariados.RxDBGrid1SortChanged(Sender: TObject);
begin
  TZQuery(RxDBGrid1.DataSource.DataSet).SortedFields := RxDBGrid1.SortField;
  Case RxDBGrid1.SortOrder of
     smNone : qryQuarentena.SortType := stIgnored;
     smUp   : qryQuarentena.SortType := stAscending;
     smDown : qryQuarentena.SortType := stDescending;
  end;
  RefreshTable( RxDBGrid1.DataSource.DataSet );
end;

procedure TfrmCadAvariados.RxDBGrid2DblClick(Sender: TObject);
begin
  if CheckAcessModulo(dbConnect.ZConnection1,'TfrmCadAvariados','EditarAvariado') <> ACESSO_PERMITIDO then
      ShowSemAcesso(True);
{
  with TfrmCadAvariados_Edit.Create(Application) do begin
      ShowModal;
      if ModalResult = mrOk then
         PostTable(qryAvariado)
      else
         qryAvariado.Cancel;
      Free;
  end;
  }
end;

procedure TfrmCadAvariados.RxDBGrid2TitleClick(Column: TColumn);
begin
  fOrder := Column.FieldName;
end;

procedure TfrmCadAvariados.RxDBGrid3SortChanged(Sender: TObject);
begin
  TZQuery(RxDBGrid3.DataSource.DataSet).SortedFields := RxDBGrid1.SortField;
  Case RxDBGrid1.SortOrder of
     smNone : TZQuery(RxDBGrid3.DataSource.DataSet).SortType := stIgnored;
     smUp   : TZQuery(RxDBGrid3.DataSource.DataSet).SortType := stAscending;
     smDown : TZQuery(RxDBGrid3.DataSource.DataSet).SortType := stDescending;
  end;
  RefreshTable(RxDBGrid3.DataSource.DataSet );
end;

procedure TfrmCadAvariados.RxDBGrid3TitleClick(Column: TColumn);
begin
  RxDBGrid3.SetSort([Column.FieldName],[smDown],true);
//   qryTemporario.SortedFields:= Column.FieldName;
end;

procedure TfrmCadAvariados.ToolButton15Click(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 0 then begin
     RLLabel2.Caption  := 'Listagem de estoque em quarentena';
     RLLabel1.Caption  := getEmpresaPadrao(meNome);
     //---->ConfigMailForReport(RLReport1);
     RLReport1.Title   := 'Listagem-Quarentena.pdf';
     RLReport1.PreviewModal;
  end;
  if PageControl1.ActivePageIndex = 1 then begin
     RLLabel4.Caption  := 'Listagem de estoque avariados';
     RLLabel3.Caption  := getEmpresaPadrao(meNome);
     //---->ConfigMailForReport(RLReport2);
     RLReport2.Title   := 'Listagem-Avariados.pdf';
     RLReport2.PreviewModal;
  end;
  if PageControl1.ActivePageIndex = 2 then begin
     RLLabel6.Caption := 'Listagem de estoque temporarios';
     RLLabel5.Caption  := getEmpresaPadrao(meNome);
     //---->ConfigMailForReport(RLReport3);
     RLReport3.Title   := 'Listagem-Temporario.pdf';
     RLReport3.PreviewModal;
  end;
end;


end.

