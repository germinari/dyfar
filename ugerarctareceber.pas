unit uGerarCtaReceber;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, rxdbgrid, rxtooledit, rxmemds, ZDataset;

type

  { TfrmGerarCtaReceber }

  TfrmGerarCtaReceber = class(TForm)
    btGerar: TButton;
    Cancelar: TButton;
    Button2: TButton;
    dsCtaTemp: TDataSource;
    edPrazoPgto: TEdit;
    edVlrTotProd: TEdit;
    edVlrTotNota: TEdit;
    edVlrTotImpostos: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    mdCtaTempdtvcto: TDateTimeField;
    mdCtaTempparcela: TLongintField;
    mdCtaTempvalor: TFloatField;
    rgImposto: TRadioGroup;
    RxDateEdit1: TRxDateEdit;
    RxDBGrid1: TRxDBGrid;
    mdCtaTemp: TRxMemoryData;
    qryNF: TZQuery;
    procedure btGerarClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    procedure OpenNotaFiscal(const seqnf: Integer);
    procedure OpenPedidoVenda(const seqnf: Integer);
    function  getPrimeiroDia:TDatetime;
  end;

function ShowGerarContasReceber(const seqnf : Integer):Boolean;

var
  frmGerarCtaReceber: TfrmGerarCtaReceber;

implementation

uses strutils, math, ACBrUtil, BDSqlUtils;

{$R *.lfm}

function ShowGerarContasReceber(const seqnf: Integer): Boolean;
begin
   with TfrmGerarCtaReceber.Create(Application) do
   begin
     OpenNotaFiscal(seqnf);
     ShowModal;
     if ModalResult = mrOK then begin
        Result := True;
     end;
     Free;
   end;

end;

{ TfrmGerarCtaReceber }

procedure TfrmGerarCtaReceber.btGerarClick(Sender: TObject);
Var qParc, i, dias : Integer;
    valor, vlrTotal, dif, vlrImposto : Currency;
    dt : TDateTime;
begin
   mdCtaTemp.CloseOpen;
   qParc     := WordCount(edPrazoPgto.Text,['/']);
   qParc     := Max(qParc,1);
   vlrTotal  := 0.00;
   vlrImposto:= StrToFloat(edVlrTotImpostos.Text);
   valor     := RoundABNT(qryNF.FieldByName('valortotalnota').AsCurrency/qParc,-2);
   if rgImposto.ItemIndex > 0 then
      valor  := RoundABNT((qryNF.FieldByName('valortotalnota').AsCurrency-vlrImposto)/qParc,-2);
   if rgImposto.ItemIndex = 2 then begin
      //A Vista é para o dia
      //mdCtaTemp.AppendRecord([1, Date() + 7 , vlrImposto]);
      mdCtaTemp.AppendRecord([1, Date() , vlrImposto]);
   end;

   for i := 1 to qParc do begin
       dias:= StrtoIntDef(ExtractWord(i,edPrazoPgto.Text,['/']),0);
       //dias:= Max(dias,7); A Vista é para o dia
       dt  := RxDateEdit1.Date + dias;
       mdCtaTemp.AppendRecord([mdCtaTemp.RecordCount+1,dt,valor]);
       vlrTotal += valor;
   end;
   if rgImposto.ItemIndex = 2 then exit;
   dif := qryNF.FieldByName('valortotalnota').AsCurrency - vlrTotal;
   mdCtaTemp.First;
   mdCtaTemp.Edit;
   mdCtaTempvalor.AsCurrency := mdCtaTempvalor.AsCurrency + dif;
   mdCtaTemp.Post;
end;

procedure TfrmGerarCtaReceber.OpenNotaFiscal(const seqnf: Integer);
begin
   qryNF.close;
   qryNF.SQL.Clear;
   qryNF.Sql.Text := 'Select id,numeroctlform,prazo_pgto,valortotalnota,valoripi,valoricmssub,valortotalprodutos From nfsaida where id = :id';
   qryNF.ParamByName('id').AsInteger := seqnf;
   OpenTable( qryNF );
   edPrazoPgto.Text     := OnlyCharsInSet(qryNF.FieldByName('prazo_pgto').AsString,['0','1','2','3','4','5','6','7','8','9','/']);
   edVlrTotProd.Text    := FormatFloat(',0.00',qryNF.FieldByName('valortotalprodutos').AsCurrency);
   edVlrTotNota.Text    := FormatFloat(',0.00',qryNF.FieldByName('valortotalnota').AsCurrency);
   edVlrTotImpostos.Text:= FormatFloat(',0.00',qryNF.FieldByName('valoripi').AsCurrency + qryNF.FieldByName('valoricmssub').AsCurrency);
   RxDateEdit1.Date     := Date;//getPrimeiroDia;
end;

procedure TfrmGerarCtaReceber.OpenPedidoVenda(const seqnf: Integer);
begin
  qryNF.close;
  qryNF.SQL.Clear;
  qryNF.Sql.Text := 'Select id,id as numeroctlform,prazo_pgto, '+
       '(Select sum(quantidade*preco_unitario + quantidade*vlr_subst) From pedido_venda_itens Where pedido_venda=pv.id) as valortotalnota,'+
       '0 as valoripi,'+
       '(Select sum(quantidade*vlr_subst) From pedido_venda_itens Where pedido_venda=pv.id) as valoricmssub,'+
       '(Select sum(quantidade*preco_unitario) From pedido_venda_itens Where pedido_venda=pv.id) as valortotalprodutos '+
       'From pedido_venda pv '+
       'where id= :id';
  qryNF.ParamByName('id').AsInteger := seqnf;
  OpenTable( qryNF );
  edPrazoPgto.Text     := OnlyCharsInSet(qryNF.FieldByName('prazo_pgto').AsString,['0','1','2','3','4','5','6','7','8','9','/']);
  edVlrTotProd.Text    := FormatFloat(',0.00',qryNF.FieldByName('valortotalprodutos').AsCurrency);
  edVlrTotNota.Text    := FormatFloat(',0.00',qryNF.FieldByName('valortotalnota').AsCurrency);
  edVlrTotImpostos.Text:= FormatFloat(',0.00',qryNF.FieldByName('valoripi').AsCurrency + qryNF.FieldByName('valoricmssub').AsCurrency);
  RxDateEdit1.Date     := Date;//getPrimeiroDia;
end;

function TfrmGerarCtaReceber.getPrimeiroDia: TDatetime;
Var s : String;
begin
  s := ExtractWord(1,edPrazoPgto.Text,['/']);
  Result := (Date() + StrToIntDef(s,0));
end;



end.

