unit wagNFe;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DateUtils, pcnConsSitNFe, pcnConversao, StrUtils,
  pcnConsStatServ, process, XMLRead, DOM;

type
    TProtocolo = class
    public
      tpAmb      : TpcnTipoAmbiente;
      verAplic   : String;
      chNFe      : String;
      dhRecbto   : String;
      nProt      : String;
      digVal     : String;
      cStat      : String;
      xMotivo    : String;
      FsRetornoWS: String;
    end;

    { TCertificado }

    TCertificado = class
    private
      FFileName: String;
      FPassword: String;
      FPathKey: String;
      FPathPerm: String;
      procedure SetFileName(AValue: String);
      procedure SetPassword(AValue: String);
      procedure SetPathKey(AValue: String);
      procedure SetPathPerm(AValue: String);
    public
       property FileName : String read FFileName write SetFileName;
       property Password : String read FPassword write SetPassword;
       property PathCert : String read FPathPerm write SetPathPerm;
       property PathKey  : String read FPathKey write SetPathKey;
    end;

    { TConfiguracao }

    TConfiguracao = class
    private
      FPathRepositorio: String;
      FPathSalvar: String;
      FtpAmb: TpcnTipoAmbiente;
      procedure SetPathRepositorio(AValue: String);
      procedure SetPathSalvar(AValue: String);
      procedure SettpAmb(AValue: TpcnTipoAmbiente);
    public
      property PathRepositorio : String read FPathRepositorio write SetPathRepositorio;
      property PathTemp        : String read FPathSalvar write SetPathSalvar;
      property tpAmb        : TpcnTipoAmbiente read FtpAmb write SettpAmb;

    end;

    { TWebNFE2 }

    TWebNFE2 = class
    private
      FCertificado: TCertificado;
      FConfiguracao: TConfiguracao;
      FtpAmb: TpcnTipoAmbiente;
      XML         : String;
      Conexao     : String;
      retorno     : TStringList;
      procedure SetCertificado(AValue: TCertificado);
      procedure SetConfiguracao(AValue: TConfiguracao);
    protected
      procedure geraXML;
      procedure geraConexao;
      procedure ProcessarRetorno( sFile : String);
    public
      constructor Create; Virtual;
      destructor  Destroy; Virtual;
      function    GetUrl(classe, UF: String; tpAmb : TpcnTipoAmbiente):String;
    published
      property    Configuracao : TConfiguracao read FConfiguracao write SetConfiguracao;
      property    Certificado  : TCertificado read FCertificado write SetCertificado;
    end;

    { TNFeStatusServico2 }

    TNFeStatusServico2 = class(TWebNFE2)
    Private
    protected
      procedure   geraXML;
      procedure   geraConexao;
      procedure   ProcessarRetorno;
    public
      dhRecbto : String;
      tMed     : Integer;
      verAplic : String;
      cStat    : String;
      xMotivo  : String;
      cUF      : String;
      tpAmb    : TpcnTipoAmbiente;
      constructor Create; Override;
      destructor  Destroy; Override;
      function    Execute:Boolean;
    end;

    { TConsultaNFe2 }

    TConsultaNFe2 = class(TWebNFE2)
    Private
      FchNFe: string;
    protected
      procedure   geraXML;
      procedure   geraConexao;
      procedure   ProcessarRetorno;
    public
      verAplic : String;
      cStat    : String;
      xMotivo  : String;
      cUF      : String;
      tpAmb    : TpcnTipoAmbiente;
      constructor Create; Override;
      destructor  Destroy; Override;
      function    Execute:Boolean;
      property chNFe: string read FchNFe write FchNFe;
    end;

//Funçoes para o certificado
function GetDataValidadeCertificado(PathCert : String):String;
function GetDataValidadeCertificadoD(PathCert : String):TDateTime;
function ConvertDTNFe2DateTime( data : String):TDateTime;
function ConvertDateTime2DTNFe( data : TDateTime):String;

implementation

{ TNFeStatusServico2 }

uses WagVclUtils;

function ConvertDTNFe2DateTime( data : String):TDateTime;
Var s, mes, dia, ano, hora : String;
begin
    ano := copy(data,1,4);
    mes := copy(data,6,2);
    dia := copy(data,9,2);
    hora:= copy(data,12,8);
    Result := StrToDateTime(Format('%s/%s/%s %s',[dia,mes,ano,hora]));
end;

function ConvertDateTime2DTNFe( data : TDateTime):String;
Begin
    Result := FormatDateTime('yyyy"-"mm"-"dd"T"hh":"nn":"ss',data);
end;

function GetDataValidadeCertificado(PathCert : String):String;
Var sFile : String;
    proc : TProcess;
    Retorno : TStringList;
begin
  sFile := Format('openssl x509 -in %s -enddate -noout',[PathCert]);

  proc := TProcess.Create(nil);
  proc.CommandLine:= sFile;
  proc.Options    := proc.Options + [poWaitOnExit,poUsePipes,poStderrToOutPut,poNoConsole];
  proc.Execute;
  //notAfter=Mar  1 23:59:59 2013 GMT
  proc.Output.Position:= 0;
  Retorno := TStringList.Create;
  Retorno.add(sFile);
  Retorno.LoadFromStream(proc.Output);
  Retorno.SaveToFile('/home/wagner/teste.txt');
  Result := ExtractWord(2,Retorno.Text,['=']);
  Retorno.Free;
  proc.Free;
end;

function GetDataValidadeCertificadoD(PathCert : String):TDateTime;
Var s, mes, dia, ano, hora : String;
    i, nMes  : Integer;
begin
    s := GetDataValidadeCertificado(PathCert);
    if length(s) <= 0 then Result := 0
    else begin
         mes := ExtractWord(1,s,[' ']);
         dia := ExtractWord(2,s,[' ']);
         hora:= ExtractWord(3,s,[' ']);
         ano := ExtractWord(4,s,[' ']);
         //ShortMonthNames
         for i := 1 to 12 do begin
             if CompareText(mes,ShortMonthNames[i]) = 0 then
                Break;
         end;
         Result := EncodeDate(StrToIntDef(ano,0),i,StrToIntDef(dia,0));
    end;
end;


{ TConsultaNFe2 }

procedure TConsultaNFe2.geraXML;
Var Texto : String;
begin
    Texto :=         '<?xml version="1.0" encoding="utf-8"?>';
    Texto := Texto + '<soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">';
    Texto := Texto + '<soap12:Header>';
    Texto := Texto + ' <nfeCabecMsg xmlns="http://www.portalfiscal.inf.br/nfe/wsdl/NfeConsulta2">';
    Texto := Texto + '  <cUF>41</cUF>';
    Texto := Texto + '  <versaoDados>2.00</versaoDados>';
    Texto := Texto + ' </nfeCabecMsg>';
    Texto := Texto + '</soap12:Header>';
    Texto := Texto + '<soap12:Body>';
    Texto := Texto + '<nfeDadosMsg xmlns="http://www.portalfiscal.inf.br/nfe/wsdl/NfeConsulta2">';
    Texto := Texto + '<consSitNFe xmlns="http://www.portalfiscal.inf.br/nfe" versao="2.00">';
    Texto := Texto + '<tpAmb>'+ TpAmbToStr( Configuracao.tpAmb ) +'</tpAmb>';
    Texto := Texto + '<xServ>CONSULTAR</xServ>';
    Texto := Texto + '<chNFe>'+chNFe+'</chNFe>';
    Texto := Texto + '</consSitNFe>';
    Texto := Texto + '</nfeDadosMsg>';
    Texto := Texto + '</soap12:Body>';
    Texto := Texto + '</soap12:Envelope>';
    XML   := Texto;
end;

procedure TConsultaNFe2.geraConexao;
Var Texto : String;
begin
    Texto := '/usr/bin/curl -3 --silent '+GetUrl(Self.ClassName, Self.cUF, Configuracao.tpAmb)+' '+
            '--connect-timeout 30 '+
            '--cert '+Certificado.PathCert+' '+
            '--key ' +Certificado.PathKey+' '+
            '--insecure '+
            '--header '+QuotedStr('SOAPAction: "http://www.portalfiscal.inf.br/nfe/wsdl/NfeConsulta2"')+' '+
            '--header '+QuotedStr('Content-Type: application/soap+xml; charset=utf-8')+' '+
            '--data ' + QuotedStr(XML);
    conexao := Texto;
end;

procedure TConsultaNFe2.ProcessarRetorno;
var PassNode: TDOMNode;
    Doc     : TXMLDocument;
    m       : TMemoryStream;
    ok      : Boolean;
begin
  m   := TMemoryStream.Create;
  Doc := TXMLDocument.Create;

  Retorno.SaveToStream(m);
  m.Position:=0;
  ReadXMLFile(Doc,m);
  PassNode := Doc.FindNode('env:Envelope');
  PassNode := PassNode.FindNode('env:Body');
  PassNode := PassNode.FindNode('nfeConsultaNF2Result');
  PassNode := PassNode.FindNode('retConsSitNFe');

  tpAmb    := StrToTpAmb(ok,PassNode.FindNode('tpAmb').TextContent);
  verAplic := PassNode.FindNode('verAplic').TextContent;
  cStat    := PassNode.FindNode('cStat').TextContent;
  xMotivo  := PassNode.FindNode('xMotivo').TextContent;
  cUF      := PassNode.FindNode('cUF').TextContent;
  chNFe    := PassNode.FindNode('chNFe').TextContent;
  m.Free;
  Doc.Free;
end;

constructor TConsultaNFe2.Create;
begin
  inherited Create;
end;

destructor TConsultaNFe2.Destroy;
begin
  inherited Destroy;
end;

function TConsultaNFe2.Execute: Boolean;
Var proc : TProcess;
begin
  geraXML;
  geraConexao;
  proc := TProcess.Create(nil);
  proc.CommandLine:= conexao;
  proc.Options    := proc.Options + [poWaitOnExit,poUsePipes,poStderrToOutPut,poNoConsole];
  proc.Execute;
  Retorno.LoadFromStream(proc.Output);
  Retorno.Insert(0,'<?xml version="1.0"?>');
  //Retorno.Add(conexao);
  Retorno.SaveToFile('/home/wagner/resposta.txt');
  ProcessarRetorno;
  Result := (cStat = '100');
end;


procedure TNFeStatusServico2.geraXML;
Var Texto : String;
begin
    Texto := '<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:nfes="http://www.portalfiscal.inf.br/nfe/wsdl/NfeStatusServico2">';
    Texto := Texto + '<soap:Header>';
    Texto := Texto + '<nfes:nfeCabecMsg>';
    Texto := Texto + '<versaoDados>2.00</versaoDados>';
    Texto := Texto + '<cUF>41</cUF>';
    Texto := Texto + '</nfes:nfeCabecMsg>';
    Texto := Texto + '</soap:Header>';
    Texto := Texto + '<soap:Body>';
    Texto := Texto + '<nfes:nfeDadosMsg>';
    Texto := Texto + '<consStatServ versao="2.00" xmlns="http://www.portalfiscal.inf.br/nfe">';
    Texto := Texto + '<tpAmb>'+ TpAmbToStr( Self.tpAmb ) +'</tpAmb>';
    Texto := Texto + '<cUF>41</cUF>';
    Texto := Texto + '<xServ>STATUS</xServ>';
    Texto := Texto + '</consStatServ>';
    Texto := Texto + '</nfes:nfeDadosMsg>';
    Texto := Texto + '</soap:Body>';
    Texto := Texto + '</soap:Envelope>';
    Xml := Texto;
end;

procedure TNFeStatusServico2.geraConexao;
Var Texto : String;
    Lista : TStringList;
    s     : PChar;
Begin
    //https://nfe2.fazenda.pr.gov.br/nfe/NFeStatusServico2
//    Texto := 'curl -3 --silent https://nfe2.fazenda.pr.gov.br/nfe/NFeStatusServico2 \'+#10+
//    Texto := 'curl -3 --silent https://homologacao.nfe2.fazenda.pr.gov.br/nfe/NFeStatusServico2 \'+#10+
    Texto := '/usr/bin/curl -3 --silent '+GetUrl(Self.ClassName,Self.cUF, Self.tpAmb)+' '+
         '--connect-timeout 30 '+
         '--cert '+Certificado.PathCert+' '+
         '--key ' +Certificado.PathKey+' '+
         //'--output '+Configuracao.PathTemp+'NFeStatusServico2-sta.xml \'+#10+
         '--insecure '+
         '--header '+QuotedStr('SOAPAction: "http://www.portalfiscal.inf.br/nfe/wsdl/NfeStatusServico2/nfeStatusServicoNF2"')+' '+
         '--header '+QuotedStr('Content-Type: application/soap+xml; charset=utf-8')+' '+
         '--data '+QuotedStr(Xml);
    conexao := Texto;
end;

procedure TNFeStatusServico2.ProcessarRetorno;
var PassNode: TDOMNode;
    Doc     : TXMLDocument;
    m       : TMemoryStream;
    ok      : Boolean;
begin
  m   := TMemoryStream.Create;
  Doc := TXMLDocument.Create;

  Retorno.SaveToStream(m);
  m.Position:=0;
  ReadXMLFile(Doc,m);
  PassNode := Doc.FindNode('env:Envelope');
  PassNode := PassNode.FindNode('env:Body');
  PassNode := PassNode.FindNode('nfeStatusServicoNF2Result');
  PassNode := PassNode.FindNode('retConsStatServ');

  // Escreve por extenso o valor do nó selecionado
  tpAmb    := StrToTpAmb(ok,PassNode.FindNode('tpAmb').TextContent);
  verAplic := PassNode.FindNode('verAplic').TextContent;
  cStat    := PassNode.FindNode('cStat').TextContent;
  xMotivo  := PassNode.FindNode('xMotivo').TextContent;
  cUF      := PassNode.FindNode('cUF').TextContent;
  dhRecbto := PassNode.FindNode('dhRecbto').TextContent;
  if cStat = '107' then
     tMed     := StrToIntDef(PassNode.FindNode('tMed').TextContent,0);
  m.Free;
  Doc.Free;
end;

constructor TNFeStatusServico2.Create;
begin
  inherited Create;
end;

destructor TNFeStatusServico2.Destroy;
begin
  inherited Destroy;
end;

function TNFeStatusServico2.Execute: Boolean;
Var proc : TProcess;
begin
  geraXML;
  geraConexao;
  proc := TProcess.Create(nil);
  proc.CommandLine:= conexao;
  proc.Options    := proc.Options + [poWaitOnExit,poUsePipes,poStderrToOutPut,poNoConsole];
  proc.Execute;
  Retorno.LoadFromStream(proc.Output);
  Retorno.Insert(0,'<?xml version="1.0"?>');
  ProcessarRetorno;
  Result := (cStat = '107');
end;

{ TWebNFE2 }

procedure TWebNFE2.SetCertificado(AValue: TCertificado);
begin
  if FCertificado=AValue then Exit;
  FCertificado:=AValue;
end;

procedure TWebNFE2.SetConfiguracao(AValue: TConfiguracao);
begin
  if FConfiguracao=AValue then Exit;
  FConfiguracao:=AValue;
end;


procedure TWebNFE2.geraXML;
begin

end;

procedure TWebNFE2.geraConexao;
begin

end;

procedure TWebNFE2.ProcessarRetorno(sFile: String);
begin

end;

constructor TWebNFE2.Create;
begin
  FConfiguracao:= TConfiguracao.Create;
  FCertificado := TCertificado.Create;
  retorno      := TStringList.Create;
end;

destructor TWebNFE2.Destroy;
begin

end;

function TWebNFE2.GetUrl(classe, UF: String; tpAmb : TpcnTipoAmbiente ): String;
begin
  if UF = 'PR' then begin
    if classe = 'TNFeStatusServico2' then Result := IfThen( tpAmb = taProducao,'https://nfe2.fazenda.pr.gov.br/nfe/NFeStatusServico2','https://homologacao.nfe2.fazenda.pr.gov.br/nfe/NFeStatusServico2');
    if classe = 'TretConsReciNFe2'   then Result := IfThen( tpAmb = taProducao ,'https://nfe2.fazenda.pr.gov.br/nfe/NFeRetRecepcao2','https://homologacao.nfe2.fazenda.pr.gov.br/nfe/NFeRetRecepcao2');
    if classe = 'TConsultaNFe2'      then Result := IfThen( tpAmb = taProducao,'https://nfe2.fazenda.pr.gov.br/nfe/NFeConsulta2','https://homologacao.nfe2.fazenda.pr.gov.br/nfe/NFeConsulta2');
    if classe = 'TretConsReciNFe2'   then Result := IfThen( tpAmb = taProducao,'https://nfe2.fazenda.pr.gov.br/nfe/NFeRetRecepcao2','https://homologacao.nfe2.fazenda.pr.gov.br/nfe/NFeRetRecepcao2');
    if classe = 'TEnvioNFe2'         then Result := IfThen( tpAmb = taProducao,'https://nfe2.fazenda.pr.gov.br/nfe/NFeRecepcao2','https://homologacao.nfe2.fazenda.pr.gov.br/nfe/NFeRecepcao2');
    if classe = 'TCancelaNFe2'       then Result := IfThen( tpAmb = taProducao,'https://nfe2.fazenda.pr.gov.br/nfe/NFeCancelamento2','https://homologacao.nfe2.fazenda.pr.gov.br/nfe/NFeCancelamento2');
    if classe = 'TInutilizaNFe2'     then Result := IfThen( tpAmb = taProducao,'https://nfe2.fazenda.pr.gov.br/nfe/NFeInutilizacao2','https://homologacao.nfe2.fazenda.pr.gov.br/nfe/NFeInutilizacao2');
    if classe = 'TDPECNFe2'          then Result := IfThen( tpAmb = taProducao,'https://www.nfe.fazenda.gov.br/SCERecepcaoRFB/SCERecepcaoRFB.asmx','https://hom.nfe.fazenda.gov.br/SCERecepcaoRFB/SCERecepcaoRFB.asmx');
    if classe = 'TsceConsultaDPEC'   then Result := IfThen( tpAmb = taProducao,'https://www.nfe.fazenda.gov.br/SCEConsultaRFB/SCEConsultaRFB.asmx','https://hom.nfe.fazenda.gov.br/SCEConsultaRFB/SCEConsultaRFB.asmx');
  end;
end;

{ TCertificado }

procedure TCertificado.SetFileName(AValue: String);
begin
  if FFileName=AValue then Exit;
  FFileName:=AValue;
end;

procedure TCertificado.SetPassword(AValue: String);
begin
  if FPassword=AValue then Exit;
  FPassword:=AValue;
end;

procedure TCertificado.SetPathKey(AValue: String);
begin
  if FPathKey=AValue then Exit;
  FPathKey:= AValue;
end;

procedure TCertificado.SetPathPerm(AValue: String);
begin
  if FPathPerm=AValue then Exit;
  FPathPerm:= AValue;
end;



{ TConfiguracao }

procedure TConfiguracao.SetPathRepositorio(AValue: String);
begin
  if FPathRepositorio=AValue then Exit;
  FPathRepositorio := NormalDir(AValue);
end;

procedure TConfiguracao.SetPathSalvar(AValue: String);
begin
  if FPathSalvar=AValue then Exit;
  FPathSalvar:= NormalDir(AValue);
end;

procedure TConfiguracao.SettpAmb(AValue: TpcnTipoAmbiente);
begin
  if FtpAmb=AValue then Exit;
  FtpAmb:=AValue;
end;

end.

