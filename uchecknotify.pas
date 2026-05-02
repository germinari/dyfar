unit uCheckNotify;

{$mode objfpc}{$H+}

interface

uses
  Classes, syncobjs, SysUtils, httpsend, MimePart, MimeMess, SynaChar, SynaUtil,
  ZDataset, synacode, ZConnection;

type

    TCheckNotifyEvent = procedure(Sender: TObject; const Result : String) of object;

    { TCkeckNotify }

    TCkeckNotify = class(TThread)
    private
      FOnCheckOK: TCheckNotifyEvent;
      FURL: String;
      procedure SetOnCheckOK(AValue: TCheckNotifyEvent);
      procedure SetURL(AValue: String);
    protected
      procedure Execute; override;
      procedure SyncronizeOnCkeckOK;
    public
      constructor Create( CreateSuspended : Boolean = True);
    published
      property URL : String read FURL write SetURL;
      property OnCheckOK : TCheckNotifyEvent read FOnCheckOK write SetOnCheckOK;
    end;


implementation

uses BDSqlUtils, udbConnect;


{ TCkeckNotify }

procedure TCkeckNotify.SetURL(AValue: String);
begin
  if FURL=AValue then Exit;
  FURL:=AValue;
end;

procedure TCkeckNotify.SetOnCheckOK(AValue: TCheckNotifyEvent);
begin
  if FOnCheckOK=AValue then Exit;
  FOnCheckOK:=AValue;
end;

procedure TCkeckNotify.Execute;
Var id : String;
begin
  try

      Synchronize(@SyncronizeOnCkeckOK);
  finally
      Terminate;
  end;

end;

procedure TCkeckNotify.SyncronizeOnCkeckOK;
begin
  if Assigned(OnCheckOK) then
     OnCheckOK( self , 'Teste' );
end;

constructor TCkeckNotify.Create(CreateSuspended: Boolean);
begin
  FreeOnTerminate:= True;
  inherited Create(CreateSuspended);
end;

end.

