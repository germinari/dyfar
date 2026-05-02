program dyfar;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  {$IFDEF WINDOWS}
  Windows, {for setconsoleoutputcp}
  {$ENDIF}
  Forms, zcomponent, LazTDI, user, rxnew, RxVersInfo, lazcontrols,
  runtimetypeinfocontrols, memdslaz, datetimectrls, sdflaz, lazreportpdfexport,
  pascalscript, umain, uCadProdutos, uCaixa, udbConnect, uConfig, uCadCliente,
  uPedidoFornecedor, uBaseForm, uPlanoContas, uCadEmpregados, ucadgrupoprod,
  ucadSituacao, uCtapagar, uProducao, uNovoPedido, uEditItemNFSaida,
  uImportarNFe, uTipoNF, uNFEntrada, uNotificacao, uCadEmpresa, sistema_config,
  uEdicaoLote, uCadTaxas, uTipoMovimento, uCadSimples, uGetValor, uRecebimento,
  uRecebFim, uTipoProdutos, uCadFornecedor, uCadTipoProduto, uCtaReceber,
  uRelListEnvio, uRelConfEstoque, uRelComissoes, uGerarParcelas, uVendaBalcao,
  uCtaReceberQuitar, uLocacaoAddItem, uIdentificaConsumidor, uExportXMLEntrada,
  uNFSaida, uImpressaoTicket, uPedidoCliente, ucadtran, uCadProdutoICMS,
  uCadIPI, uGerarCtaReceber, ufrmStatus, uCadAvariados, uRelVendas,
  uGerenciamentoFlex, uLancaFlex, usendmsgcgm, uCheckNotify, uSelectItensNF,
  uRelClientes, uConsultaCadastro, uCtaPagarMultBaixa, uEditItemNFEntrada,
  uCtaReceberMultBaixa, uImprimirBoleto, uRetornoBoleto, uExportXMLSaida,
  uAgenda, uSelecionarCertificado, uDistribuicaoNFe;

{$R *.res}
Var RxVersionInfo : TRxVersionInfo;
    oFile: Text;
begin
  Application.Title:='Sistema de Vendas e Estoque';
  Application.Initialize;

  if Application.HasOption('v','versao') then begin
     RxVersionInfo := TRxVersionInfo.Create(Application);
     Assign(oFile, 'versao.xml');
     ReWrite(oFile);
     //AllocConsole;      // in Windows unit
     //IsConsole := True; // in System unit
     //SysInitStdIO;
     write(oFile, '<?xml version="1.0" encoding="UTF-8"?>');
     write(oFile,'<release>');
      write(oFile,'<title>');
       write(oFile, Application.Title );
      write(oFile,'</title>');
      write(oFile,'<versao>');
       write(oFile, RxVersionInfo.FileVersion);
      write(oFile,'</versao>');
     write(oFile,'</release>');
     CloseFile(oFile);//
     RxVersionInfo.Free;
     exit;
  end;
  Application.CreateForm(TdbConnect, dbConnect);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

