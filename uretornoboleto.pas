unit uRetornoBoleto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, EditBtn, Buttons, ComCtrls, rxdbgrid, rxmemds, rxcurredit,
  ZDataset, ACBrBoleto, ACBrValidador, db, BufDataset, memds, Grids, DBGrids,
  Menus;

type

  { TfrmRetornoBoleto }

  TfrmRetornoBoleto = class(TForm)
    ACBrBoleto1: TACBrBoleto;
    ACBrValidador1: TACBrValidador;
    btLeArquivo: TBitBtn;
    btBaixarSelecionados: TBitBtn;
    cbxOcorrencia: TComboBox;
    CheckBox1: TCheckBox;
    edTotalTitulo: TCurrencyEdit;
    edPgto: TCurrencyEdit;
    Datasource1: TDatasource;
    FileNameEdit1: TFileNameEdit;
    ImageList1: TImageList;
    Label1: TLabel;
    Label10: TLabel;
    lbBanco: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    edJuros: TCurrencyEdit;
    edDesconto: TCurrencyEdit;
    edDiferenca: TCurrencyEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    PopupMenu1: TPopupMenu;
    ProgressBar1: TProgressBar;
    qryContaReceber: TZQuery;
    qryContaReceberatraso: TLongintField;
    qryContaReceberbairro: TStringField;
    qryContaReceberboleto: TStringField;
    qryContaReceberbordero: TLongintField;
    qryContaReceberbordero_comissao: TLongintField;
    qryContaRecebercalc_juros: TFloatField;
    qryContaRecebercep: TStringField;
    qryContaRecebercidade: TStringField;
    qryContaRecebercliente: TLongintField;
    qryContaRecebercnpj: TStringField;
    qryContaRecebercobranca: TStringField;
    qryContaRecebercodvend: TLongintField;
    qryContaRecebercomissao: TFloatField;
    qryContaRecebercomissao13: TFloatField;
    qryContaReceberconta: TStringField;
    qryContaReceberdata_conta: TDateField;
    qryContaReceberdata_envio_perda_prejuizo: TDateField;
    qryContaReceberdata_pagamento: TDateField;
    qryContaReceberdata_vencimento: TDateField;
    qryContaReceberdescricao: TStringField;
    qryContaReceberdocumento: TStringField;
    qryContaReceberdt_baixa_sistema: TDateField;
    qryContaReceberendereco: TStringField;
    qryContaReceberentradasaida: TStringField;
    qryContaReceberenviado_boleto: TBooleanField;
    qryContaReceberid: TLongintField;
    qryContaRecebernegociacao: TLongintField;
    qryContaRecebernfsaida: TLongintField;
    qryContaRecebernomevend: TStringField;
    qryContaRecebernro_parcelas: TLongintField;
    qryContaRecebernumeroctlform: TLongintField;
    qryContaReceberobservacao: TMemoField;
    qryContaReceberparcela: TLongintField;
    qryContaReceberpgto_desconto: TFloatField;
    qryContaReceberpgto_juros: TFloatField;
    qryContaReceberpgto_obs: TStringField;
    qryContaReceberpgto_tipo: TStringField;
    qryContaReceberselecionado: TBooleanField;
    qryContaRecebertotal: TFloatField;
    qryContaReceberuf: TStringField;
    qryContaReceberusuario_baixa: TStringField;
    qryContaRecebervalor: TFloatField;
    qryInsertComissao: TZQuery;
    qryInsertComissao13: TZQuery;
    RxDBGrid1: TRxDBGrid;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1baixada: TBooleanField;
    RxMemoryData1baixar: TBooleanField;
    RxMemoryData1boleto: TStringField;
    RxMemoryData1carteira: TStringField;
    RxMemoryData1credor: TStringField;
    RxMemoryData1data: TStringField;
    RxMemoryData1datapgto: TDateTimeField;
    RxMemoryData1desconto: TFloatField;
    RxMemoryData1dt_vencimento: TDateTimeField;
    RxMemoryData1duplicata: TStringField;
    RxMemoryData1id: TLongintField;
    RxMemoryData1juros: TFloatField;
    RxMemoryData1multipla: TBooleanField;
    RxMemoryData1nossonumero: TStringField;
    RxMemoryData1notafiscal: TLongintField;
    RxMemoryData1nroparcelas: TLongintField;
    RxMemoryData1ocorrencia: TStringField;
    RxMemoryData1parcela: TLongintField;
    RxMemoryData1tipo_ocorrencia: TStringField;
    RxMemoryData1valor: TFloatField;
    RxMemoryData1valor_credito1: TFloatField;
    RxMemoryData1valor_pago: TFloatField;
    RxMemoryData1valor_tit: TFloatField;
    RxMemoryData2: TRxMemoryData;
    RxMemoryData2boleto: TStringField;
    RxMemoryData2documento: TStringField;
    RxMemoryData2ids: TMemoField;
    RxMemoryData2sacado: TStringField;
    RxMemoryData2valor: TFloatField;
    RxMemoryData2valor_recebido: TFloatField;
    qryCtaReceber: TZQuery;
    procedure btBaixarSelecionadosClick(Sender: TObject);
    procedure btLeArquivoClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RxDBGrid1CellClick(Column: TColumn);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1GetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
  private
    { private declarations }
  public
    { public declarations }
    procedure BaixarContasBoleto( boleto : String);
  end;

  procedure ShowRetornoBoleto( ACBrBoleto: TACBrBoleto );

var
  frmRetornoBoleto: TfrmRetornoBoleto;

implementation

{$R *.lfm}

uses WagStrUtils, BDSqlUtils, WagVclUtils, uSearch, uEditMemo,
  udbConnect, sistema_config, math, strutils,ACBrUtil;

procedure ShowRetornoBoleto(ACBrBoleto: TACBrBoleto);
begin
  with TfrmRetornoBoleto.Create(Application) do begin
       ACBrBoleto1 := ACBrBoleto;
       ShowModal;
       Free;
  end;
end;

{ TfrmRetornoBoleto }

procedure TfrmRetornoBoleto.btLeArquivoClick(Sender: TObject);
Var i , cContas, c : Integer;
    sdoc, sboleto, ocorrencia, sql: String;
    valor,valorCR : Double;
    lst : TStringList;
    qryCtaRec, qryBol : TZQuery;
    arOcorrencia : Array[0..1] of String = ('06','08');
begin
  StartWait;
  try
     ProgressBar1.Visible := True;
     ProgressBar1.Position:= 0;
     ACBrBoleto1.DirArqRetorno := ExtractFileDir(FileNameEdit1.FileName);
     ACBrBoleto1.NomeArqRetorno:= ExtractFileName(FileNameEdit1.FileName);
     SaveStringIni(ConfigRecord.FileNamePath,'boleto','DirArqRetorno',ACBrBoleto1.DirArqRetorno);
     ACBrBoleto1.LerRetorno();

     Label2.caption := 'Cedente.: '+ACBrBoleto1.Cedente.Nome;
     Label3.caption := FormatDateTime('"Dt.Grava: "dd/mm/yyy',ACBrBoleto1.DataArquivo);
     Label4.caption := FormatDateTime('"Dt.Mov..: "dd/mm/yyy',ACBrBoleto1.DataCreditoLanc);
     lbBanco.caption:= Format('Banco.: %s',[ACBrBoleto1.Banco.Nome]);

     RxMemoryData1.CloseOpen;
     RxMemoryData1.DisableControls;
     Datasource1.DataSet := nil;
     ProgressBar1.Max:=ACBrBoleto1.ListadeBoletos.Count;
     lst := TStringList.Create;
     lst.Duplicates:= dupIgnore;
     edTotalTitulo.Value:= 0;
     edJuros.Value      := 0;
     edPgto.Value       := 0;
     edDesconto.Value   := 0;
     ocorrencia := ExtractWord(1,cbxOcorrencia.Text, ['-']);
     if ocorrencia <> '01' then begin
        arOcorrencia[0] := '00';
        arOcorrencia[1] := ocorrencia;
     end;
     for i := 0 to ACBrBoleto1.ListadeBoletos.Count -1 do begin
         if Not HaveValueIn(ACBrBoleto1.ListadeBoletos[i].OcorrenciaOriginal.CodigoBanco,arOcorrencia) then
             continue;
         sboleto := ACBrBoleto1.ListadeBoletos[i].NossoNumero;
         //sboleto := Format('%s-%s',[sboleto, ACBrBoleto1.Banco.CalcularDigitoVerificador( TACBrTitulo( ACBrBoleto1.ListadeBoletos[i] ) )]);
         //sboleto := geraNossoNumero('0273','03845','109',sboleto);

         qryCtaRec:= ExecSqlQuery(dbConnect.ZConnection1,'Select cr.id,id_nf as nfsaida,descricao,cr.data_vencimento,'+
                                                         'cr.data_pagamento,cr.documento,sum(valor_devido) as valor '+
                                                         'from contas_receber cr '+
                                                         'Left Join boleto_contas_receber bcr on bcr.contas_receber=cr.id '+
                                                         'Left Join boleto b on b.id=bcr.boleto '+
                                                         'Where LPAD(b.nosso_numero, %d, ''0'')=''%s'' '+
                                                         'Group by cr.id,nfsaida,descricao,cr.data_vencimento,'+
                                                         'cr.data_pagamento,cr.documento',
                                                         [ACBrBoleto1.Banco.TamanhoMaximoNossoNum,sboleto]);
         cContas  := qryCtaRec.RecordCount;
         valorCR  := qryCtaRec.FieldByName('valor').AsCurrency;
         if (qryCtaRec.Eof = True) and (qryCtaRec.Bof = True) then begin
            {Não existe conta X boleto}
            sdoc := Trim(ACBrBoleto1.ListadeBoletos[i].NumeroDocumento);
            if Pos('-',sdoc) > 0 then
            begin
              sdoc := ExtractWord(1,Trim(ACBrBoleto1.ListadeBoletos[i].NumeroDocumento),['-']);
              sdoc := PadLeft( sdoc, 9, '0' )+ '-' + ExtractWord(2,Trim(ACBrBoleto1.ListadeBoletos[i].NumeroDocumento),['-']);
            end else
            begin
               sdoc := ExtractWord(1,Trim(ACBrBoleto1.ListadeBoletos[i].NumeroDocumento),['-']);
               sdoc := PadLeft( sdoc, 9, '0' );
            end;
            qryCtaRec:= ExecSqlQuery(dbConnect.ZConnection1,'Select cr.id,id_nf as nfsaida,descricao,cr.data_vencimento,'+
                                                            'cr.data_pagamento,cr.documento,sum(valor_devido) as valor '+
                                                            'from contas_receber cr '+
                                                            'Left Join boleto_contas_receber bcr on bcr.contas_receber=cr.id '+
                                                            'Left Join boleto b on b.id=bcr.boleto '+
                                                            'Where cr.documento=''%s'' '+
                                                            'Group by cr.id,nfsaida,descricao,cr.data_vencimento,'+
                                                            'cr.data_pagamento,cr.documento',[sdoc]);

            RxMemoryData1.Append;
            RxMemoryData1tipo_ocorrencia.AsString := ACBrBoleto1.Banco.TipoOCorrenciaToCod(ACBrBoleto1.ListadeBoletos[i].OcorrenciaOriginal.Tipo);
            RxMemoryData1baixar.Asboolean    := False;
            RxMemoryData1id.AsInteger        := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select id From contas_receber Where documento=''%s''',[sdoc]) ,0);
            RxMemoryData1notafiscal.AsInteger:= 0;
            RxMemoryData1data.ASDateTime     := ACBrBoleto1.ListadeBoletos[i].DataProcessamento;
            RxMemoryData1multipla.ASBoolean  := False;
            RxMemoryData1carteira.ASString   := ACBrBoleto1.ListadeBoletos[i].Carteira;
            RxMemoryData1boleto.ASString     := sboleto;
            RxMemoryData1nossonumero.ASString:= sboleto;
            RxMemoryData1baixada.ASBoolean   := Not qryCtaRec.FieldByName('data_pagamento').IsNull;;
            RxMemoryData1duplicata.ASstring  := ifthen(Length(trim(ACBrBoleto1.ListadeBoletos[i].NumeroDocumento))>0,ACBrBoleto1.ListadeBoletos[i].NumeroDocumento,qryCtaRec.FieldByName('documento').AsString);;
            RxMemoryData1nroparcelas.AsInteger:= ACBrBoleto1.ListadeBoletos[i].TotalParcelas;
            RxMemoryData1parcela.AsInteger    := ACBrBoleto1.ListadeBoletos[i].Parcela;
            RxMemoryData1credor.ASstring     := 'BOLETO DE COBRANÇA NÃO LOCALIZADO';
            RxMemoryData1valor.AsFloat       := ACBrBoleto1.ListadeBoletos[i].ValorDocumento;
            edTotalTitulo.Value              := edTotalTitulo.Value + RxMemoryData1valor.AsFloat;
            RxMemoryData1dt_vencimento.AsDateTime := qryCtaRec.FieldByName('data_vencimento').AsDateTime;
            sdoc := ACBrBoleto1.Banco.TipoOcorrenciaToDescricao(ACBrBoleto1.ListadeBoletos[i].OcorrenciaOriginal.Tipo);
            if lst.IndexOf(sdoc) < 0 then
               lst.add(sdoc);
            RxMemoryData1ocorrencia.ASString   := sdoc;
            RxMemoryData1valor_credito1.ASfloat:= ACBrBoleto1.ListadeBoletos[i].ValorRecebido;

            RxMemoryData1valor_pago.ASfloat  := ACBrBoleto1.ListadeBoletos[i].ValorRecebido + ACBrBoleto1.ListadeBoletos[i].ValorDespesaCobranca;
            edPgto.Value                     := edPgto.Value + RxMemoryData1valor_pago.ASfloat;

            RxMemoryData1juros.ASfloat       := ACBrBoleto1.ListadeBoletos[i].ValorMoraJuros;
            edJuros.Value                    := edJuros.Value + RxMemoryData1juros.ASfloat;

            RxMemoryData1desconto.ASfloat    := ACBrBoleto1.ListadeBoletos[i].ValorDesconto+ACBrBoleto1.ListadeBoletos[i].ValorAbatimento;
            edDesconto.Value                 := edDesconto.Value + RxMemoryData1desconto.ASfloat;

            RxMemoryData1datapgto.AsDateTime := ACBrBoleto1.ListadeBoletos[i].DataOcorrencia;
            RxMemoryData1.Post;
            continue;

         end;

         qryBol:= ExecSqlQuery(dbConnect.ZConnection1,'Select * From boleto Where nosso_numero=''%s''',[sboleto]);
         valor := qryBol.FieldByName('valor_boleto').Ascurrency;
         valor := Math.ifthen(valor = 0 ,valorCR,valor);
         RxMemoryData1.Append;
         RxMemoryData1tipo_ocorrencia.AsString := ACBrBoleto1.Banco.TipoOCorrenciaToCod(ACBrBoleto1.ListadeBoletos[i].OcorrenciaOriginal.Tipo);
         RxMemoryData1baixar.Asboolean    := False;
         RxMemoryData1id.AsInteger        := qryCtaRec.FieldByName('id').AsInteger;
         RxMemoryData1notafiscal.AsInteger:= qryCtaRec.FieldByName('nfsaida').AsInteger;
         RxMemoryData1data.ASDateTime     := ACBrBoleto1.ListadeBoletos[i].DataProcessamento;
         RxMemoryData1multipla.ASBoolean  := cContas > 1;
         RxMemoryData1carteira.ASString   := ACBrBoleto1.ListadeBoletos[i].Carteira;
         RxMemoryData1boleto.ASString     := sboleto;
         RxMemoryData1nossonumero.ASString:= sboleto;
         RxMemoryData1baixada.ASBoolean   := Not qryCtaRec.FieldByName('data_pagamento').IsNull;
         RxMemoryData1duplicata.ASstring  := ifthen(Length(trim(ACBrBoleto1.ListadeBoletos[i].NumeroDocumento))>0,ACBrBoleto1.ListadeBoletos[i].NumeroDocumento,qryCtaRec.FieldByName('documento').AsString);;
         RxMemoryData1nroparcelas.AsInteger:= cContas;
         RxMemoryData1parcela.AsInteger    := 1;
         RxMemoryData1credor.ASstring     := qryCtaRec.FieldByName('descricao').AsString;//lista;
         RxMemoryData1valor.AsFloat       := valor;
         edTotalTitulo.Value              := edTotalTitulo.Value + valor;
         RxMemoryData1dt_vencimento.AsDateTime := qryCtaRec.FieldByName('data_vencimento').AsDateTime;
         sdoc := ACBrBoleto1.Banco.TipoOcorrenciaToDescricao(ACBrBoleto1.ListadeBoletos[i].OcorrenciaOriginal.Tipo);
         if lst.IndexOf(sdoc) < 0 then
            lst.add(sdoc);
         RxMemoryData1ocorrencia.ASString   := sdoc;
         RxMemoryData1valor_credito1.ASfloat:= ACBrBoleto1.ListadeBoletos[i].ValorRecebido;

         RxMemoryData1valor_pago.ASfloat  := ACBrBoleto1.ListadeBoletos[i].ValorRecebido + ACBrBoleto1.ListadeBoletos[i].ValorDespesaCobranca;
         edPgto.Value                     := edPgto.Value + RxMemoryData1valor_pago.ASfloat;

         RxMemoryData1juros.ASfloat       := ACBrBoleto1.ListadeBoletos[i].ValorMoraJuros;
         edJuros.Value                    := edJuros.Value + RxMemoryData1juros.ASfloat;

         RxMemoryData1desconto.ASfloat    := ACBrBoleto1.ListadeBoletos[i].ValorDesconto+ACBrBoleto1.ListadeBoletos[i].ValorAbatimento;
         edDesconto.Value                 := edDesconto.Value + RxMemoryData1desconto.ASfloat;

         RxMemoryData1datapgto.AsDateTime := ACBrBoleto1.ListadeBoletos[i].DataOcorrencia;

         RxMemoryData1.Post;
         //edTotalTitulo.Value :=  edTotalTitulo.Value + RxMemoryData1valor.ASfloat;
         //edPgto.Value :=  edTotalTitulo.Value + RxMemoryData1valor_pago.ASfloat;
         ProgressBar1.Position:= ProgressBar1.Position +1;
         Update;
     end;
     edDiferenca.Value := edTotalTitulo.Value - edPgto.Value;
  finally
     //cbxOcorrencia.Items.Clear;
     //cbxOcorrencia.Items.AddStrings(lst);
     RxMemoryData1.SortOnFields('boleto');
     RxMemoryData1.First;
     RxMemoryData1.EnableControls;
     ProgressBar1.Visible := False;
     //cbxOcorrencia.ItemIndex:= 0;
     //ComboBox1Change(nil);
     Datasource1.DataSet := RxMemoryData1;
     StopWait;
  end;

end;

procedure TfrmRetornoBoleto.btBaixarSelecionadosClick(Sender: TObject);
Var count : Integer;
    sErroBaixa : String;
begin
  sErroBaixa := '';
  RxMemoryData1.DisableControls;
  RxMemoryData1.First;
  ProgressBar1.Visible := True;
  ProgressBar1.Max := RxMemoryData1.RecordCount;
  btBaixarSelecionados.Enabled := False;
  StartWait;
  try
     count := 0;
     While not RxMemoryData1.Eof do begin
        Application.ProcessMessages;
        ProgressBar1.Position := ProgressBar1.Position +1;
        Update;
        if RxMemoryData1baixar.AsBoolean then begin
           if (pos('06',RxMemoryData1ocorrencia.ASString) > 0) or ((pos('08',RxMemoryData1ocorrencia.ASString) > 0)) then begin
              BaixarContasBoleto( RxMemoryData1id.AsString );
              RxMemoryData1.Edit;
              RxMemoryData1baixada.ASBoolean := True;
              RxMemoryData1.Post;
              inc(count);
           end;
        end;
        RxMemoryData1.Next;
     end;
     if Length(sErroBaixa) > 0 then
        EditarMemo('Erros ocorridos',sErroBaixa,True);
     ShowMessageFmt('Baixadas %d Contas',[count]);
     RefreshTable( RxMemoryData1 );
     btBaixarSelecionados.Enabled := True;
  Finally
   ProgressBar1.Visible := False;
   StopWait;
   RxMemoryData1.First;
   RxMemoryData1.EnableControls;
  end;
end;

procedure TfrmRetornoBoleto.CheckBox1Click(Sender: TObject);
begin
  StartWait;
  try
      RxMemoryData1.First;
      RxMemoryData1.DisableControls;

      While Not RxMemoryData1.Eof do begin
          RxMemoryData1.Edit;
          RxMemoryData1baixar.AsBoolean := CheckBox1.Checked;
          RxMemoryData1.Post;

          RxMemoryData1.Next;
      end;
  finally
     RxMemoryData1.First;
     RxMemoryData1.EnableControls;
     StopWait;
  end;

end;

procedure TfrmRetornoBoleto.FormCreate(Sender: TObject);
begin
  cbxOcorrencia.ItemIndex  := 0;
  FileNameEdit1.InitialDir := ReadStringINI(ConfigRecord.FileNamePath,'boleto','DirArqRetorno',DocumentDir());
end;

procedure TfrmRetornoBoleto.RxDBGrid1CellClick(Column: TColumn);
begin
   if Column.FieldName = 'baixar' then begin
      Column.Field.DataSet.Edit;
      Column.Field.AsBoolean:= Not Column.Field.AsBoolean;
      Column.Field.DataSet.Post;
   end;
//      ShowMessage(Column.FieldName);
end;

procedure TfrmRetornoBoleto.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  RxDBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  if DataCol = 1 then begin
     //ImageList1.Draw(RxDBGrid1.Canvas,Rect.Left,Rect.Top,2);
     if RxMemoryData1baixada.AsBoolean then
        ImageList1.Draw(RxDBGrid1.Canvas,Rect.Left,Rect.Top,2);
     if RxMemoryData1multipla.AsBoolean then
        ImageList1.Draw(RxDBGrid1.Canvas,Rect.Left+16,Rect.Top,3);
     if (RxMemoryData1valor.AsFloat < (RxMemoryData1valor_pago.AsFloat + RxMemoryData1juros.AsFloat - RxMemoryData1desconto.AsFloat)) then
        ImageList1.Draw(RxDBGrid1.Canvas,Rect.Left+32,Rect.Top,4);
  end;
end;

procedure TfrmRetornoBoleto.RxDBGrid1GetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
begin
  if (RxMemoryData1valor.AsFloat < (RxMemoryData1valor_pago.AsFloat + RxMemoryData1juros.AsFloat - RxMemoryData1desconto.AsFloat)) then
     Background := clRed;
end;

procedure TfrmRetornoBoleto.BaixarContasBoleto( boleto: String );
Var ctas, blt : TZQuery;
    sql,obs  : String;
    juros,comissao,desconto : Double;
    ok : Boolean;
begin
    ctas    := ExecSqlQuery(dbConnect.ZConnection1,'Select * From contas_receber Where id=%s',[boleto]);
    juros   := RxMemoryData1juros.Asfloat/ctas.RecordCount;
    desconto:= RxMemoryData1desconto.Asfloat/ctas.RecordCount;
    obs  := 'Quitacao pelo sistema.';
    if ctas.RecordCount > 1 then
       obs += 'Conta agrupada '+ExecSqlResultLista(dbConnect.ZConnection1,'Select documento From contas_receber Where boleto=''%s''',[boleto],False);
    ok := false;
    While Not ctas.Eof do begin
       ok := True;
       SetDecimalSeparator('.');
       sql := Format('Update contas_receber Set data_pagamento=%s,'+
                     'juros=%.2f,desconto=%.2f,observacao=''%s'',valor_pago=%.2f '+
                     ',bordero=0 '+
                     'where id=%d',
                     [QuotedStr(DateTostr(RxMemoryData1datapgto.ASDateTime)),
                      juros,
                      desconto,
                      obs,
                      RxMemoryData1valor_credito1.AsCurrency,
                      ctas.FieldByName('id').AsInteger]);
       ExecSql(dbConnect.ZConnection1,sql);
       RestoreDecimalSeparator;
       ctas.Next;
    end;
end;


end.


