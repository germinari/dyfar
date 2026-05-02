unit uEdicaoLote;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  DbCtrls, StdCtrls, rxdbdateedit, rxcurredit, rxtooledit, udbConnect, db, ZDataset,
  ZSqlUpdate, EditBtn;

type

  { TfrmEdicaoLote }

  TfrmEdicaoLote = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edQuantidade: TCurrencyEdit;
    dsEstoqueLotes: TDatasource;
    edNome: TEdit;
    edEmpresa: TEdit;
    edLocalizacao: TEdit;
    edLote: TEdit;
    edQuantidade1: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    qryEstoqueLotes: TZQuery;
    qryEstoqueLotesdata_entrada: TDateTimeField;
    qryEstoqueLotesdata_fabricacao: TDateField;
    qryEstoqueLotesdata_validade: TDateTimeField;
    qryEstoqueLotesdescricao: TStringField;
    qryEstoqueLotesempresa: TLongintField;
    qryEstoqueLotesid: TLongintField;
    qryEstoqueLoteslocalizacao: TStringField;
    qryEstoqueLoteslote: TStringField;
    qryEstoqueLotesnomeemp: TStringField;
    qryEstoqueLotesprazo_validade: TLongintField;
    qryEstoqueLotesproduto: TLongintField;
    qryEstoqueLotesquantidade: TFloatField;
    RxDateEdit1: TRxDateEdit;
    RxDateEdit2: TRxDateEdit;
    RxDateEdit3: TRxDateEdit;
    btEmpresa: TSpeedButton;
    qryProduto: TZReadOnlyQuery;
    ZUpdateSQL1: TZUpdateSQL;
    procedure BitBtn1Click(Sender: TObject);
    procedure btEmpresaClick(Sender: TObject);
    procedure RxDateEdit2Exit(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

function InserirLote( id : Integer; nome : String): Boolean;
function EditarLote( id : Integer): boolean;


var
  frmEdicaoLote: TfrmEdicaoLote;

implementation

uses uSearch, WagVclUtils, sistema_config, strutils, BDSqlUtils;

function EditarLote(id: Integer): boolean;
Var diferenca : Double;
begin
   with TfrmEdicaoLote.Create(Application) do begin
     Caption := 'Editar lote';
     qryEstoqueLotes.Close;
     qryEstoqueLotes.ParamByName('id').AsInteger := id;
     OpenTable( qryEstoqueLotes );
     qryProduto.close;
     qryProduto.ParamByName('id').AsInteger := id;
     OpenTable( qryProduto );

     edNome.Text         := qryEstoqueLotesdescricao.AsString;
     edEmpresa.Text      := qryEstoqueLotesnomeemp.AsString;
     edLocalizacao.Text  := qryEstoqueLoteslocalizacao.AsString;
     edLote.Text         := qryEstoqueLoteslote.AsString;
     edQuantidade.Value  := qryEstoqueLotesquantidade.AsFloat;
     edQuantidade1.Value  := qryEstoqueLotesquantidade.AsFloat;

     RxDateEdit1.Date    := qryEstoqueLotesdata_entrada.AsDateTime;
     RxDateEdit2.Date    := qryEstoqueLotesdata_fabricacao.AsDateTime;
     RxDateEdit3.Date    := qryEstoqueLotesdata_validade.AsDateTime;
     RxDateEdit1.Enabled := True;
     RxDateEdit2.Enabled := True;
     RxDateEdit3.Enabled := True;
     edLote.Enabled      := True;
     edLocalizacao.Enabled:= True;
     edLote.Enabled      := True;
     edQuantidade.Enabled:= False;
     btEmpresa.Enabled   := False;
     edQuantidade1.Visible:= True;
     Label9.Visible       := True;

     ShowModal;
     Result := (ModalResult=mrOK);
     if Result then begin
       {Verificar o que foi alterado}
       if CompareText(qryEstoqueLoteslote.Asstring,edLote.Text) <> 0 then begin
         // lote foi alterado, gero historico de exclusão do lote
         //--GerarHistoricoMovimento(qryEstoqueLotesproduto.AsInteger,qryEstoqueLotesempresa.AsInteger, 'Exclusão de lote '+ qryEstoqueLoteslote.Asstring,0.0, qryEstoqueLotesquantidade.AsFloat);
         //--GerarHistoricoMovimento(qryEstoqueLotesproduto.AsInteger,qryEstoqueLotesempresa.AsInteger, 'Inclusão de lote '+ edLote.Text,edQuantidade.Value, 0.0);
       end;
       diferenca := edQuantidade1.Value - edQuantidade.Value;
       if (diferenca < 0)  then begin
         // Foi alterada quantidade pra menos
         //--GerarHistoricoMovimento(qryEstoqueLotesproduto.AsInteger,qryEstoqueLotesempresa.AsInteger, 'Alteração quant '+ edLote.Text, 0.0,abs(diferenca) );
       end;
       if (diferenca > 0)  then begin
         // Foi alterada quantidade pra mais
         //--GerarHistoricoMovimento(qryEstoqueLotesproduto.AsInteger,qryEstoqueLotesempresa.AsInteger, 'Alteração quant '+ edLote.Text, abs(diferenca), 0.0);
       end;
       qryEstoqueLotes.Edit;
       //qryEstoqueLotesproduto.AsInteger         := id;
       //qryEstoqueLotesempresa.AsString          := ExtractWord(1,edEmpresa.Text,['-']);
       qryEstoqueLoteslocalizacao.AsString      := edLocalizacao.Text;
       qryEstoqueLotesquantidade.AsFloat        := edQuantidade1.Value;
       qryEstoqueLoteslote.Asstring             := edLote.Text;
       if RxDateEdit1.date <> 0 then
          qryEstoqueLotesdata_entrada.AsDateTime    := RxDateEdit1.date;
       if RxDateEdit2.date <> 0 then
          qryEstoqueLotesdata_fabricacao.AsDateTime := RxDateEdit2.date;
       if RxDateEdit3.date <> 0 then
          qryEstoqueLotesdata_validade.AsDateTime   := RxDateEdit3.date;
       qryEstoqueLotes.Post;
     end;
     Free;
   end;
end;

function InserirLote(id: Integer; nome : String): Boolean;
begin
   with TfrmEdicaoLote.Create(Application) do begin
     Caption := 'Inserir novo lote';
     qryProduto.close;
     qryProduto.ParamByName('id').AsInteger := id;
     OpenTable( qryProduto );
     edNome.Text      := Format('%d-%s',[id,nome]);
     edEmpresa.Text   := getEmpresaPadrao(meCodigoNome);
     RxDateEdit1.date := Date;
     ShowModal;
     Result := (ModalResult=mrOK);
     if Result then begin
       qryEstoqueLotes.Close;
       qryEstoqueLotes.ParamByName('id').AsInteger := 0;
       OpenTable( qryEstoqueLotes );
       qryEstoqueLotes.Append;
       qryEstoqueLotesproduto.AsInteger         := id;
       qryEstoqueLotesempresa.AsString          := ExtractWord(1,edEmpresa.Text,['-']);
       qryEstoqueLoteslocalizacao.AsString      := edLocalizacao.Text;
       qryEstoqueLotesquantidade.AsFloat        := edQuantidade.Value;
       qryEstoqueLoteslote.Asstring             := edLote.Text;
       if RxDateEdit1.date <> 0 then
          qryEstoqueLotesdata_entrada.AsDateTime   := RxDateEdit1.date;
       if RxDateEdit2.date <> 0 then
          qryEstoqueLotesdata_fabricacao.AsDateTime:= RxDateEdit2.date;
       if RxDateEdit3.date <> 0 then
          qryEstoqueLotesdata_validade.AsDateTime  := RxDateEdit3.date;
       qryEstoqueLotes.Post;
       //--GerarHistoricoMovimento(qryEstoqueLotesproduto.AsInteger,qryEstoqueLotesempresa.AsInteger, 'Inclusão de lote '+ qryEstoqueLoteslote.Asstring, qryEstoqueLotesquantidade.AsFloat,0.0 );
     end;
     Free;
   end;
end;

{ TfrmEdicaoLote }

procedure TfrmEdicaoLote.btEmpresaClick(Sender: TObject);
Var res : Variant;
begin
     res := ShowSearchModal(dbConnect.ZConnection1,'empresa','id,cnpj,nome','id,nome','nome',True);
     if VarIsBlank(res) then exit;
     edEmpresa.Text := Format('%s-%s',[res[0],res[1]]);;
end;

procedure TfrmEdicaoLote.BitBtn1Click(Sender: TObject);
begin

end;

procedure TfrmEdicaoLote.RxDateEdit2Exit(Sender: TObject);
begin
   RxDateEdit3.Date := RxDateEdit2.Date + qryProduto.FieldByName('prazo_validade').AsInteger;
end;

{$R *.lfm}

end.

