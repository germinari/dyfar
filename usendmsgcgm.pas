unit usendmsgcgm;

{$mode objfpc}{$H+}

interface

uses
  Classes, syncobjs, SysUtils, httpsend, MimePart, MimeMess, SynaChar, SynaUtil,
  ZDataset, synacode;

type

  { TSendMSGCGM }

  TSendMSGCGM = class(TThread)
  private
    Frepresentante: Integer;
    Furl : String;
    FMensagem  : string;
    FTitle     : String;
    FClassOpen : String;
    FVibrate   : Integer;
    FSound     : Integer;
    FSmallicon : String;
    auth  : TZQuery;
    procedure SetClassOpen(AValue: String);
    procedure SetMensagem(AValue: String);
    procedure Setrepresentante(AValue: Integer);
    procedure SetSmallicon(AValue: String);
    procedure SetSound(AValue: Integer);
    procedure SetTitle(AValue: String);
    procedure SetURL(AValue: String);
    procedure SetVibrate(AValue: Integer);
  protected
    procedure Execute; override;
  public
    constructor Create( CreateSuspended : Boolean = True);
  published
    property Representante : Integer read Frepresentante write Setrepresentante;
    property URL : String read FURL write SetURL;
    property Mensagem  : String read FMensagem write SetMensagem;
    property Title     : String read FTitle write SetTitle;
    property ClassOpen : String read FClassOpen write SetClassOpen;
    property Vibrate   : Integer read FVibrate write SetVibrate;
    property Sound     : Integer read FSound write SetSound;
    property Smallicon : String read FSmallicon write SetSmallicon;
  end;




implementation

uses BDSqlUtils, udbConnect;



{ TSendMSGCGM }

procedure TSendMSGCGM.Setrepresentante(AValue: Integer);
begin
  if Frepresentante=AValue then Exit;
  Frepresentante:=AValue;
  auth     := ExecSqlQuery(dbConnect.ZConnection1,'Select id,apelido,senha From sys_usuarios Where id=(Select sys_usuario From empregados Where id=%d)',[Frepresentante]);
end;

procedure TSendMSGCGM.SetSmallicon(AValue: String);
begin
  if FSmallicon=AValue then Exit;
  FSmallicon:=AValue;
end;

procedure TSendMSGCGM.SetSound(AValue: Integer);
begin
  if FSound=AValue then Exit;
  FSound:=AValue;
end;

procedure TSendMSGCGM.SetTitle(AValue: String);
begin
  if FTitle=AValue then Exit;
  FTitle:=AValue;
end;

procedure TSendMSGCGM.SetMensagem(AValue: String);
begin
  if FMensagem=AValue then Exit;
  FMensagem:=AValue;
end;

procedure TSendMSGCGM.SetClassOpen(AValue: String);
begin
  if FClassOpen=AValue then Exit;
  FClassOpen:=AValue;
end;

procedure TSendMSGCGM.SetURL(AValue: String);
begin
  if FURL=AValue then Exit;
  FURL:=AValue;
end;

procedure TSendMSGCGM.SetVibrate(AValue: Integer);
begin
  if FVibrate=AValue then Exit;
  FVibrate:=AValue;
end;

procedure TSendMSGCGM.Execute;
Var Response: TStringList;
    msg , resp    : String;
    //jData   : TJSONData;
    //jObject : TJSONObject;
    fFURL : String;
begin
try
  Response := TStringList.Create;
  msg      := Format('versao=4.0.0&user=%s&senha=%s',
                    [auth.FieldByName('apelido').AsString,
                     auth.FieldByName('senha').AsString]);

  msg    += '&msg='      + EncodeURLElement(FMensagem);
  msg    += '&title='    + EncodeURLElement(FTitle);
  msg    += '&classopen='+ EncodeURLElement(FClassOpen);
  msg    += '&vibrate='  + IntToStr(FVibrate);
  msg    += '&sound='    + IntToStr(FSound);
  msg    += '&smallicon='+ FSmallicon;
  fFURL   := Furl + '?acao=gcm&subacao=send&'+ msg +'';
  if (not Self.Terminated) then
    HttpGetText( fFURL ,Response);
//    RESP   := Response.Text;
finally
  Terminate;
end;
end;

constructor TSendMSGCGM.Create( CreateSuspended : Boolean = True);
begin
    FreeOnTerminate:= True;
    inherited Create(CreateSuspended);
end;

end.

