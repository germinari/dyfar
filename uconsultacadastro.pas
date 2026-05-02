unit uConsultaCadastro;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Dialogs,
  StdCtrls, ExtCtrls, ACBrNFe, ACBrNFeDANFeRLClass, ZDataset;

type

  { TfrmConsultaCadastro }

  TfrmConsultaCadastro = class(TForm)
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    Button1: TButton;
    Button201: TButton;
    btConsultar: TButton;
    Button4: TButton;
    edCNPJ: TEdit;
    edUF: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    lbField1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbField10: TLabel;
    lbField11: TLabel;
    lbField12: TLabel;
    lbField13: TLabel;
    lbField2: TLabel;
    lbField3: TLabel;
    lbField4: TLabel;
    lbField5: TLabel;
    lbField6: TLabel;
    lbField7: TLabel;
    lbField8: TLabel;
    lbField9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    ScrollBox1: TScrollBox;
    procedure Button1Click(Sender: TObject);
    procedure Button201Click(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    strInfCad : TStringList;
    procedure LoadClienteByCodigo(sValue : String);
    procedure OutraForma;

  end;

var
  frmConsultaCadastro: TfrmConsultaCadastro;

implementation
                 //uMain    WagXML,
//udmNfeUtils
uses udbConnect, sistema_config, WagVclUtils, WagStrUtils, BDSqlUtils,
  pcnConversao, pcnAuxiliar;

{$R *.lfm}

{ TfrmConsultaCadastro }


function CloneComponent(AAncestor: TComponent): TComponent;
var
  XMemoryStream: TMemoryStream;
  XTempName: string;
begin
  Result:=nil;
  if not Assigned(AAncestor) then
    exit;
  XMemoryStream:=TMemoryStream.Create;
  try
    XTempName:=AAncestor.Name;
    AAncestor.Name:= Format('%s%d',[XTempName,AAncestor.Owner.ComponentCount+1]);
    XMemoryStream.WriteComponent(AAncestor);
    AAncestor.Name:=XTempName;
    XMemoryStream.Position:=0;
    Result:=TComponentClass(AAncestor.ClassType).Create(AAncestor.Owner);
    if AAncestor is TControl then TControl(Result).Parent:=TControl(AAncestor).Parent;
    XMemoryStream.ReadComponent(Result);
  finally
    XMemoryStream.Free;
  end;
end;

procedure TfrmConsultaCadastro.Button1Click(Sender: TObject);
Var pn : TPanel;
    aPanel: TPanel;
    Ctrl, Ctrl_: TComponent;
    i: integer;
begin
  pn := TPanel.Create(ScrollBox1);
  //pn := TPanel(CloneComponent(Panel1));
  pn.Name   := Format('Panel10%d',[ScrollBox1.ComponentCount]) ;
  pn.Caption:= '';
  pn.Parent := ScrollBox1;
  pn.SetBounds(Panel1.Left,Panel1.Top,Panel1.Width,Panel1.Height);
  pn.Top:= ((Panel1.Top+Panel1.Height)*ScrollBox1.ComponentCount) +5;
  pn.BevelInner:= Panel1.BevelInner;
  pn.BevelOuter:= Panel1.BevelOuter;
  pn.OnClick:= @Panel1Click;

  for i:= 0 to Panel1.ControlCount-1 do begin
    Ctrl := TComponent(Panel1.Controls[i]);
    Ctrl_ := CloneComponent(Ctrl);
    TControl(Ctrl_).Parent := pn;
    TControl(Ctrl_).Left   := TControl(Ctrl).Left;
    TControl(Ctrl_).top    := TControl(Ctrl).top;
    if Ctrl_ is TButton then begin
       TControl(Ctrl_).OnClick:= @Button201Click;
       TControl(Ctrl_).Name   := Format('Button20%d',[ScrollBox1.ComponentCount+1]) ;
    end;
  end;
end;

procedure TfrmConsultaCadastro.Button201Click(Sender: TObject);
Var i,p,p2 : Integer;
    s : String;
begin
  if Sender is TButton then begin
     //ShowMessageFmt('%s %d',[TComponent(Sender).Name,TComponent(Sender).Tag]);
     i := TComponent(Sender).Tag;// StrToInt(Copy(TComponent(Sender).Name,8,2));
     //ShowMessageFmt('%d - %d',[strInfCad.Count, i]);
     //Write(strInfCad[i]);
     p := RetornarPosEx('<infCad>', ACBrNFe1.WebServices.ConsultaCadastro.RetWS,i+1);
     p2:= RetornarPosEx('</infCad>', ACBrNFe1.WebServices.ConsultaCadastro.RetWS,i+1);
     s := Copy(ACBrNFe1.WebServices.ConsultaCadastro.RetWS,p,(p2+9)-p);
     SaveStringToFile(s, GetTempDir(false) + '/consulta-cliente.xml');
     ModalResult := mrOK;
  end;
end;

procedure TfrmConsultaCadastro.btConsultarClick(Sender: TObject);
begin
  OutraForma;
end;

procedure TfrmConsultaCadastro.Button4Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmConsultaCadastro.FormCreate(Sender: TObject);
var sValue : String;
begin
  InicializaConfigNFe( ACBrNFe1, StrToInt(getEmpresaPadrao(meCodigo)) );
  if Application.HasOption('c','codcliente') then begin
     sValue := Application.GetOptionValue('c','codcliente');
     LoadClienteByCodigo(sValue);
  end;
  if Application.HasOption('d','doc') then begin
     sValue := Application.GetOptionValue('d','doc');
     edCNPJ.Text:= sValue;
     sValue := Application.GetOptionValue('e','estado');
     edUF.Text  := sValue;
  end;

  TLabel(FindComponent('Label16')).Caption := '';
  TLabel(FindComponent('Label19')).Caption := '';
  TLabel(FindComponent('lbField1')).Caption:= '';
  TLabel(FindComponent('lbField2')).Caption:= '';
  TLabel(FindComponent('lbField3')).Caption:= '';
  TLabel(FindComponent('lbField4')).Caption:= '';
  TLabel(FindComponent('lbField5')).Caption:= '';
  TLabel(FindComponent('lbField6')).Caption:= '';
  TLabel(FindComponent('lbField7')).Caption:= '';
  TLabel(FindComponent('lbField8')).Caption:= '';
  TLabel(FindComponent('lbField9')).Caption:= '';
  TLabel(FindComponent('lbField10')).Caption:= '';
  TLabel(FindComponent('lbField11')).Caption:= '';
  TLabel(FindComponent('lbField12')).Caption:= '';
  TLabel(FindComponent('lbField13')).Caption:= '';
  strInfCad := TStringList.Create;
  //if (Length(edCNPJ.Text) > 0) and (Length(edUF.Text)>0) then
     //btConsultar.Click;
end;

procedure TfrmConsultaCadastro.Label3Click(Sender: TObject);
begin
  //ShowMessage(TComponent(Sender).Name);
end;

procedure TfrmConsultaCadastro.Panel1Click(Sender: TObject);
begin
  //ShowMessage(TComponent(Sender).Name);
end;

procedure TfrmConsultaCadastro.LoadClienteByCodigo(sValue: String);
Var qry : TZQuery;
begin
    qry := ExecSqlQuery(dbConnect.ZConnection1,'Select cnpj,uf From cliente Where codcliente=%s',[sValue]);
    edCNPJ.Text := qry.FieldByName('cnpj').AsString;
    edUF.Text := qry.FieldByName('uf').AsString;
    writeln(edCNPJ.Text);
end;

procedure TfrmConsultaCadastro.OutraForma;
Var i : Integer;
begin

  i := 1;
  While ScrollBox1.FindComponent(Format('Panel10%d',[i])) <> Nil do begin
     ScrollBox1.FindComponent(Format('Panel10%d',[i])).Free;
     inc(i);
  end;
  ScrollBox1.Update;

  ACBrNFe1.WebServices.ConsultaCadastro.CNPJ:= edCNPJ.Text;
  ACBrNFe1.WebServices.ConsultaCadastro.UF  := edUF.Text;
  ACBrNFe1.WebServices.ConsultaCadastro.Executar;

  //ShowMessage(ACBrNFe1.WebServices.ConsultaCadastro.xMotivo);

  for i := 0 to ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Count -1 do begin
      //ShowMessage(ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].xNome);
      TLabel(FindComponent('Label16')).Caption := ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[i].xNome;
      TLabel(FindComponent('Label19')).Caption := ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[i].xFant;
      TLabel(FindComponent('lbField1')).Caption:= ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[i].IE;
      TLabel(FindComponent('lbField2')).Caption:= ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[i].UF;
      TLabel(FindComponent('lbField3')).Caption:= ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[i].xRegApur;
      TLabel(FindComponent('lbField4')).Caption:= IntToStr(ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[i].CNAE);
      TLabel(FindComponent('lbField5')).Caption:= DateToStr(ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[i].dIniAtiv);
      TLabel(FindComponent('lbField6')).Caption:= DateToStr(ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[i].dUltSit);
      if ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[i].dBaixa = 0 then
         TLabel(FindComponent('lbField7')).Caption:= ''
      else
         TLabel(FindComponent('lbField7')).Caption:= DateToStr(ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[i].dBaixa);
      TLabel(FindComponent('lbField8')).Caption:= ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[i].xLgr;
      TLabel(FindComponent('lbField9')).Caption:= ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[i].nro;
      TLabel(FindComponent('lbField10')).Caption:= ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[i].xMun;
      TLabel(FindComponent('lbField11')).Caption:= ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[i].xBairro;
      TLabel(FindComponent('lbField12')).Caption:= ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[i].xCpl;
      TLabel(FindComponent('lbField13')).Caption:= ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[i].CEP;
      TButton(FindComponent('Button201')).Enabled := ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[i].dBaixa=0;
      TPanel(FindComponent('Panel2')).Visible     := Not TButton(FindComponent('Button201')).Enabled;
      TButton(FindComponent('Button201')).Tag     := i+1;
      strInfCad.Add( ACBrNFe1.WebServices.ConsultaCadastro.RetWS );
      if (i < (ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Count-1)) then
         Button1.Click;
  end;

end;


end.

