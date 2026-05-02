unit uGerarParcelas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, BufDataset, FileUtil, Forms, Controls, Graphics,
  Dialogs, StdCtrls, Buttons, rxcurredit, rxtooledit, rxdbgrid, rxmemds;

type

  { TfrmGerarParcelas }

  TfrmGerarParcelas = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    CurrencyEdit1: TCurrencyEdit;
    Datasource1: TDatasource;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    RxDBGrid1: TRxDBGrid;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1valor: TFloatField;
    RxMemoryData1vencimento: TDateTimeField;
    procedure BitBtn1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

function gerarParcelas( const valor : Double):TStringList;

var
  frmGerarParcelas: TfrmGerarParcelas;

implementation

uses strutils, variants;

function gerarParcelas(const valor: Double): TStringList;
Var i : Integer;
begin
  with TfrmGerarParcelas.Create(Application) do
  begin
    CurrencyEdit1.Value:= Valor;
    ShowModal;
    Result := TStringList.Create;
    if ModalResult = mrOK then begin
      //VarArrayCreate([0,RxMemoryData1.RecordCount-1],varvariant);
      RxMemoryData1.First;
      While not RxMemoryData1.Eof do begin
        Result.add(RxMemoryData1vencimento.AsString + ';' + RxMemoryData1valor.AsString);//[i] := vararrayof([RxMemoryData1vencimento.AsString,RxMemoryData1valor.ASfloat]);
        RxMemoryData1.Next;
      end;
    end;
    Free;
  end;
end;

{$R *.lfm}

{ TfrmGerarParcelas }

procedure TfrmGerarParcelas.BitBtn1Click(Sender: TObject);
Var i, dias : Integer;
    data : TDateTime;
    valor : Double;
begin
  RxMemoryData1.Close;
  RxMemoryData1.Open;
  valor :=  CurrencyEdit1.Value / WordCount(Edit2.Text,['/']);
  for i := 1 to WordCount(Edit2.Text,['/']) do begin
    dias := StrToIntDef(ExtractWord(i,Edit2.Text,['/']),0);
    data := Date + dias;
    RxMemoryData1.AppendRecord([data,valor]);

  end;
end;

end.

