unit uSelectItensNF;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons, rxdbgrid, db, ZDataset;

type

  { TfrmSelectItensNF }

  TfrmSelectItensNF = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    RxDBGrid1: TRxDBGrid;
    ZQuery1: TZQuery;
    ZQuery1descricao: TStringField;
    ZQuery1id: TLongintField;
    ZQuery1id_lote: TLongintField;
    ZQuery1lote: TStringField;
    ZQuery1produto: TLongintField;
    ZQuery1quantidade: TFloatField;
    ZQuery1quant_dev: TLongintField;
    ZQuery1quant_estoque: TFloatField;
  private
    { private declarations }
  public
    { public declarations }
  end;

function getItensNF( id : Integer ):TStringList;
function getItensNFEnt(id: Integer): TStringList;

var
  frmSelectItensNF: TfrmSelectItensNF;

implementation

{$R *.lfm}

uses BDSqlUtils, udbConnect;

function getItensNF(id: Integer): TStringList;
begin
  with TfrmSelectItensNF.Create(Application) do
  begin
     ZQuery1.Close;
     ZQuery1.SQL.Clear;
     ZQuery1.SQL.Add('Select i.id,i.produto,descricao,pe.lote,i.quantidade,i.quantidade as quant_estoque,0 as quant_dev,i.lote as id_lote');
     ZQuery1.SQL.Add('from nfsaida_itens i');
     ZQuery1.SQL.Add('Left Join produtos_estoque pe on pe.id=i.lote');
     ZQuery1.SQL.Add('where nfsaida = :id');
     ZQuery1.SQL.Add('Order by i.id');
     ZQuery1.ParamByName('id').AsInteger := id;
     OpenTable( ZQuery1 );
     ShowModal;
     Result := TStringList.Create;
     if ModalResult=mrOk then begin
       PostTable(ZQuery1);
       ZQuery1.First;
       while not ZQuery1.Eof do begin
          if ZQuery1quant_dev.AsInteger > 0 then
             Result.Add(Format('%d,%d,%d',[ZQuery1id.AsInteger,ZQuery1quant_dev.AsInteger,ZQuery1id_lote.AsInteger]));
          ZQuery1.Next;
       end;
     end;
  end;
end;

function getItensNFEnt(id: Integer): TStringList;
begin
  with TfrmSelectItensNF.Create(Application) do
  begin
     ZQuery1.Close;
     ZQuery1.SQL.Clear;
     ZQuery1.SQL.Add('Select i.id,i.produto,descricao,nil.numerolote as lote,i.quantidade,i.quant_estoque,0 as quant_dev,nil.lote as id_lote');
     ZQuery1.SQL.Add('from nfentrada_itens i');
     ZQuery1.SQL.Add('Left Join nfentrada_itens_lotes nil on nil.nfentrada_itens=i.id');
     ZQuery1.SQL.Add('Left Join produtos_estoque pe on pe.id=nil.lote');
     ZQuery1.SQL.Add('where nfentrada = :id');
     ZQuery1.SQL.Add('Order by i.id');
     ZQuery1.ParamByName('id').AsInteger := id;
     OpenTable( ZQuery1 );
     ShowModal;
     Result := TStringList.Create;
     if ModalResult=mrOk then begin
       PostTable(ZQuery1);
       ZQuery1.First;
       while not ZQuery1.Eof do begin
          if ZQuery1quant_dev.AsInteger > 0 then
             Result.Add(Format('%d,%d,%d',[ZQuery1id.AsInteger,ZQuery1quant_dev.AsInteger,ZQuery1id_lote.AsInteger]));
          ZQuery1.Next;
       end;
     end;
  end;
end;

end.

