unit uImpressaoTicket;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, RLReport;

type

  { TfrmImpressaoTicket }

  TfrmImpressaoTicket = class(TForm)
    lDesconto: TRLLabel;
    lDescValLiq: TRLLabel;
    lNomeFantasia: TRLLabel;
    lQtdItens: TRLLabel;
    lQtdTotalItensVal: TRLLabel;
    lTitDesconto: TRLLabel;
    lTitDescValLiq: TRLLabel;
    lTitFormaPagto: TRLLabel;
    lTitTotal: TRLLabel;
    lTitValorPago: TRLLabel;
    lTotal: TRLLabel;
    lTotalItem: TRLLabel;
    mLinhaItem: TRLMemo;
    RLBand1: TRLBand;
    RLBand3: TRLBand;
    rlbDescItem: TRLBand;
    RLDraw7: TRLDraw;
    RLLabel5: TRLLabel;
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLSubDetail2: TRLSubDetail;
    RLSubDetail3: TRLSubDetail;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: boolean);
    procedure RLReport1DataRecord(Sender: TObject; RecNo: integer;
      CopyNo: integer; var Eof: boolean; var RecordAction: TRLRecordAction);
    procedure RLSubDetail1DataRecord(Sender: TObject; RecNo: integer;
      CopyNo: integer; var Eof: boolean; var RecordAction: TRLRecordAction);
    procedure RLSubDetail2DataRecord(Sender: TObject; RecNo: integer;
      CopyNo: integer; var Eof: boolean; var RecordAction: TRLRecordAction);
    procedure RLSubDetail3BeforePrint(Sender: TObject; var PrintIt: boolean);
    procedure RLSubDetail3DataRecord(Sender: TObject; RecNo: integer;
      CopyNo: integer; var Eof: boolean; var RecordAction: TRLRecordAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

procedure ImprimeTicket( const numero : Integer; impressora : String);

var
  frmImpressaoTicket: TfrmImpressaoTicket;

implementation

{$R *.lfm}

uses RLPrinters, math;

procedure ImprimeTicket(const numero: Integer;impressora : String);
begin
   with TfrmImpressaoTicket.Create(Application) do
   begin
      RLPrinter.PrinterName := impressora;
      RLReport1.Print;
      Free;
   end;
end;

{ TfrmImpressaoTicket }

procedure TfrmImpressaoTicket.RLSubDetail1DataRecord(Sender: TObject;
  RecNo: integer; CopyNo: integer; var Eof: boolean;
  var RecordAction: TRLRecordAction);
begin
   Eof := (RecNo > 1);
   RecordAction := raUseIt;
end;

procedure TfrmImpressaoTicket.RLSubDetail2DataRecord(Sender: TObject;
  RecNo: integer; CopyNo: integer; var Eof: boolean;
  var RecordAction: TRLRecordAction);
begin
   Eof := (RecNo > 1) ;
   RecordAction := raUseIt ;
end;

procedure TfrmImpressaoTicket.RLSubDetail3BeforePrint(Sender: TObject;
  var PrintIt: boolean);
begin
   PrintIt := True;
end;

procedure TfrmImpressaoTicket.RLSubDetail3DataRecord(Sender: TObject;
  RecNo: integer; CopyNo: integer; var Eof: boolean;
  var RecordAction: TRLRecordAction);
begin
   Eof := (RecNo > 1);
   RecordAction := raUseIt;
end;

procedure TfrmImpressaoTicket.RLReport1DataRecord(Sender: TObject;
  RecNo: integer; CopyNo: integer; var Eof: boolean;
  var RecordAction: TRLRecordAction);
begin
   Eof := (RecNo > 1);
   RecordAction := raUseIt;
end;

procedure TfrmImpressaoTicket.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: boolean);
var TotalPaginaPixel: Integer;
begin
   PrintIt := True;
  lNomeFantasia.Caption := Application.Title;
  TotalPaginaPixel := RLSubDetail3.Height +
                      RLSubDetail2.Height +
                      Trunc( RLSubDetail1.Height * 5 );
    // Pixel para Milimitros //
    RLReport1.PageSetup.PaperHeight := max( 100, 10+Trunc( TotalPaginaPixel / 3.7 ));
end;





end.

