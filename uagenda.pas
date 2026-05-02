unit uAgenda;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, rxdbverticalgrid;

type

  { TfrmAgenda }

  TfrmAgenda = class(TForm)
    RxDBVerticalGrid1: TRxDBVerticalGrid;
  private

  public

  end;

var
  frmAgenda: TfrmAgenda;

implementation

{$R *.lfm}

end.

