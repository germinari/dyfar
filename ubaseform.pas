unit uBaseForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ZDataset, LazFileUtils;

type

  { TfrmBaseForm }

  TfrmBaseForm = class(TForm)
    Image1: TImage;
    ZQuery1: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frmBaseForm: TfrmBaseForm;

implementation

uses WagVclUtils, BDSqlUtils, udbConnect, sistema_config;

{$R *.lfm}

{ TfrmBaseForm }

procedure TfrmBaseForm.FormResize(Sender: TObject);
begin
  CenterControl(Image1);
end;

procedure TfrmBaseForm.FormCreate(Sender: TObject);
var  //qry : TZQuery;
     sFile : String;
begin
  Caption := Application.Title;
  sFile:= ExecSql(dbConnect.ZConnection1,'SELECT concat(tipo_dado, extencao) as nome FROM empresa_arquivos Where tipo_dado=''logo''');
  sFile:= obtemPathSistemaNFe( tpsImagens ) + sFile;
  if FileExists(sFile) then
     Image1.Picture.LoadFromFile( sFile );
//  ExibeFoto(qry,'dado',Image1);
end;

end.

