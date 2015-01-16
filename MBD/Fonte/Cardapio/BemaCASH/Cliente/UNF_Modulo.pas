unit UNF_Modulo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ADODB, BDE, IBDatabase, IBCustomDataSet, IBTable, IBQuery, DBTables,IniFileS,
  DBClient, mdMailSlot, RXCtrls;

type
  TFRM_Modulo = class(TDataModule)
    DataBaseIB: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBT_Usuario: TIBTable;
    IBT_UsuarioCODIGO_ID: TIntegerField;
    IBT_UsuarioLOGIN: TIBStringField;
    IBT_UsuarioNIVEL: TIntegerField;
    IBT_UsuarioCHPB: TIBStringField;
    DTS_Usuario: TDataSource;
    IBT_Modulos: TIBTable;
    IBT_ModulosCODIGO_ID: TIntegerField;
    IBT_ModulosMODULO: TIBStringField;
    IBT_ModulosMOD_NAME: TIBStringField;
    IBT_ModulosBOT_NAME: TIBStringField;
    DTS_Modulos: TDataSource;
    IBT_Nivel: TIBTable;
    IBT_NivelCODIGO_ID: TIntegerField;
    IBT_NivelNIVEL: TIBStringField;
    DTS_Nivel: TDataSource;
    IBT_Permissao: TIBTable;
    IBT_PermissaoCODIGO_ID: TIntegerField;
    IBT_PermissaoNIVEL: TIntegerField;
    IBT_PermissaoMODULO: TIBStringField;
    IBT_PermissaoMOD_NAME: TIBStringField;
    IBT_PermissaoBOT_NAME: TIBStringField;
    IBT_PermissaoPERMISSAO: TIBStringField;
    IBT_PermissaoCHPB: TIBStringField;
    IBT_PermissaoDesModulo: TStringField;
    IBT_PermissaoDesPermissao: TStringField;
    DTS_Permissao: TDataSource;
    IBT_UsuNivel: TIBTable;
    IBT_UsuNivelCODIGO_ID: TIntegerField;
    IBT_UsuNivelLOGIN: TIBStringField;
    IBT_UsuNivelSENHA: TIBStringField;
    IBT_UsuNivelNIVEL: TIntegerField;
    IBT_UsuNivelCHPB: TIBStringField;
    IBT_UsuNivelDesLogin: TStringField;
    DTS_UsuNivel: TDataSource;
    IBT_UsuarioFUNCIONARIO: TIntegerField;
    IBT_UsuNivelFUNCIONARIO: TIntegerField;
    IBT_Funcionario: TIBTable;
    DTS_Funcionario: TDataSource;
    IBT_UsuarioDesFuncioanrio: TStringField;
    IBT_UsuNivelDesFuncioanio: TStringField;
    IBT_UsuarioSENHA: TIBStringField;
    IBT_Cargo: TIBTable;
    DTS_Cargo: TDataSource;
    IBT_CargoCODIGO_ID: TIntegerField;
    IBT_CargoDESCRICAO: TIBStringField;
    IBT_CargoTIPO: TIBStringField;
    IBT_Config: TIBTable;
    DTS_Config: TDataSource;
    IBT_ConfigCODIGO_ID: TIntegerField;
    IBT_ConfigIMPRESSORA: TIBStringField;
    IBT_ConfigPORT_IMPRI: TIBStringField;
    IBT_Ficha: TIBTable;
    DTS_Ficha: TDataSource;
    IBT_FichaCODIGO_ID: TIntegerField;
    IBT_FichaFICHA: TIntegerField;
    IBT_FichaSEQUENCIA: TIntegerField;
    IBT_FichaSTATUS: TIBStringField;
    IBT_FichaATIVO: TIBStringField;
    IBT_FichaCONSULTA: TIBStringField;
    IBT_FormaPagto: TIBTable;
    DTS_FormaPagto: TDataSource;
    IBT_FormaPagtoCODIGO_ID: TIntegerField;
    IBT_FormaPagtoDESCRICAO: TIBStringField;
    IBT_FormaPagtoDESCONTO: TFloatField;
    IBT_FormaPagtoTIPOPAGTO: TIntegerField;
    IBT_Grupo: TIBTable;
    DTS_Grupo: TDataSource;
    IBT_GrupoCODIGO_ID: TIntegerField;
    IBT_GrupoGRUPO: TIBStringField;
    IBT_GrupoDESCRICAO: TIBStringField;
    IBT_MesaFecha: TIBTable;
    DTS_MesaFecha: TDataSource;
    IBT_MesaItem: TIBTable;
    DTS_MesaItem: TDataSource;
    IBT_MesaItemCODIGO_ID: TIntegerField;
    IBT_MesaItemMESA: TIntegerField;
    IBT_MesaItemSEQUENCIA: TIntegerField;
    IBT_MesaItemGARCOM: TIntegerField;
    IBT_MesaItemPRODUTO: TIntegerField;
    IBT_MesaItemQUANTIDADE: TFloatField;
    IBT_MesaItemCANCELADA: TIBStringField;
    IBT_MesaItemIMP_REMOTA: TIBStringField;
    IBT_MesaItemPONTOVENDA: TIntegerField;
    IBT_MesaItemHORA: TIBStringField;
    IBT_MesaItemDATE: TDateField;
    IBT_MesaItemMESAFECHA: TIntegerField;
    IBT_MesaItemSEQFECHA: TIntegerField;
    IBT_MesaFechaCODIGO_ID: TIntegerField;
    IBT_MesaFechaMESA: TIntegerField;
    IBT_MesaFechaSEQUENCIA: TIntegerField;
    IBT_MesaFechaVALOR: TFloatField;
    IBT_MesaFechaTROCO: TFloatField;
    IBT_MesaFechaTIPO_PAGTO: TIntegerField;
    IBT_MesaFechaHORA_PAGTO: TIBStringField;
    IBT_MesaFechaDATA_PAGTO: TDateField;
    IBT_MesaFechaOPERADOR: TIntegerField;
    IBT_MesaFechaDESCONTO: TFloatField;
    IBT_MesaFechaCANCELADO: TIBStringField;
    IBT_MesaFechaPONTOVENDA: TIntegerField;
    IBT_MesaFechaSEQ_FISCAL: TIBStringField;
    IBT_MesaFechaNUM_CAIXA: TIBStringField;
    IBT_MesaFechaCOK: TIBStringField;
    IBT_MesaFechaMESAFECHA: TIntegerField;
    IBT_MesaFechaSEQFECHA: TIntegerField;
    IBT_Periodo: TIBTable;
    DTS_Periodo: TDataSource;
    IBT_PeriodoCODIGO_ID: TIntegerField;
    IBT_PeriodoDESCRICAO: TIBStringField;
    IBT_PeriodoHORAINICIO: TIBStringField;
    IBT_PeriodoHORAFIM: TIBStringField;
    IBT_PontoVenda: TIBTable;
    DTS_PontoVenda: TDataSource;
    IBT_PontoVendaCODIGO_ID: TIntegerField;
    IBT_PontoVendaDESCRICAO: TIBStringField;
    IBT_Produtos: TIBTable;
    DTS_Produtos: TDataSource;
    IBT_TipoPagto: TIBTable;
    DTS_TipoPagto: TDataSource;
    IBT_TipoPagtoCODIGO_ID: TIntegerField;
    IBT_TipoPagtoDESCRICAO: TIBStringField;
    IBT_TipoPagtoGAVETA: TIBStringField;
    IBT_Tributar: TIBTable;
    DTS_Tributar: TDataSource;
    IBT_TributarCODIGO_ID: TIntegerField;
    IBT_TributarCODIGO: TIBStringField;
    IBT_TributarDESCRICAO: TIBStringField;
    IBT_TributarALIQUOTA: TFloatField;
    IBT_TributarSITUACAO: TIBStringField;
    IBT_Turno: TIBTable;
    DTS_Turno: TDataSource;
    IBT_TurnoCODIGO_ID: TIntegerField;
    IBT_TurnoDESCRICAO: TIBStringField;
    IBT_TurnoHORAINICIO: TIBStringField;
    IBT_TurnoHORAFIM: TIBStringField;
    IBT_Unidade: TIBTable;
    DTS_Unidade: TDataSource;
    IBT_UnidadeCODIGO_ID: TIntegerField;
    IBT_UnidadeSIGLA: TIBStringField;
    IBT_UnidadeDESCRICAO: TIBStringField;
    DataBaseIBF: TIBDatabase;
    IBTransactionF: TIBTransaction;
    IBT_FuncionarioCODIGO_ID: TIntegerField;
    IBT_FuncionarioDESCRICAO: TIBStringField;
    IBT_FuncionarioPONTOVENDA: TIntegerField;
    IBT_FuncionarioDT_NASCTO: TDateField;
    IBT_FuncionarioENDERECO: TIBStringField;
    IBT_FuncionarioBAIRRO: TIBStringField;
    IBT_FuncionarioCIDADE: TIBStringField;
    IBT_FuncionarioTELEFONE: TIBStringField;
    IBT_FuncionarioATIVO: TIBStringField;
    IBT_FuncionarioADMISSAO: TDateField;
    IBT_FuncionarioDEMISSAO: TDateField;
    IBT_Funcionarioturno: TIntegerField;
    IBT_FuncionarioCARGO: TIntegerField;
    IBT_ProdutosCODIGO_ID: TIntegerField;
    IBT_ProdutosPRODUTO: TIBStringField;
    IBT_ProdutosDESCRICAO: TIBStringField;
    IBT_ProdutosPRECO: TFloatField;
    IBT_ProdutosPRECOCUSTO: TFloatField;
    IBT_ProdutosGRUPO: TIntegerField;
    IBT_ProdutosICMS_SN: TIBStringField;
    IBT_ProdutosTRIBUTAR: TIntegerField;
    IBT_ProdutosBALANCA: TIBStringField;
    IBT_ProdutosTARA: TFloatField;
    IBT_ProdutosUNIDADE: TIntegerField;
    IBT_ProdutosATIVO: TIBStringField;
    IBT_ProdutosCOMANDA: TIBStringField;
    IBT_ProdutosLOCAL_IMP: TIntegerField;
    IBQ_MesaItem: TIBQuery;
    IBT_FuncionarioSTATUS: TIBStringField;
    IBT_MesaItemGRUPO: TIntegerField;
    IBT_MesaItemPRC_UNITARIO: TFloatField;
    IBT_MesaItemBALANCA: TIBStringField;
    IBT_MesaItemHO: TIBStringField;
    IBQ_USuNivel: TIBQuery;
    IBQ_USuNivelCODIGO_ID: TIntegerField;
    IBQ_USuNivelLOGIN: TIBStringField;
    IBQ_USuNivelNIVEL: TIntegerField;
    IBQ_USuNivelCHPB: TIBStringField;
    IBQ_USuNivelFUNCIONARIO: TIntegerField;
    IBQ_USuNivelSENHA: TIBStringField;
    IBQ_USuNivelCODIGO_ID1: TIntegerField;
    IBQ_USuNivelDESCRICAO: TIBStringField;
    IBQ_USuNivelPONTOVENDA: TIntegerField;
    IBQ_USuNivelDT_NASCTO: TDateField;
    IBQ_USuNivelENDERECO: TIBStringField;
    IBQ_USuNivelBAIRRO: TIBStringField;
    IBQ_USuNivelCIDADE: TIBStringField;
    IBQ_USuNivelTELEFONE: TIBStringField;
    IBQ_USuNivelATIVO: TIBStringField;
    IBQ_USuNivelADMISSAO: TDateField;
    IBQ_USuNivelDEMISSAO: TDateField;
    IBQ_USuNivelturno: TIntegerField;
    IBQ_USuNivelCARGO: TIntegerField;
    IBQ_USuNivelSTATUS: TIBStringField;
    IBQ_USuNivelDesLogin: TStringField;
    IBT_MesaItemTEMPO: TDateTimeField;
    IBT_MesaItemOPCANCEL: TIntegerField;
    IBT_MesaFechaTEMPO: TDateTimeField;
    IBT_MesaFechaOPCANCEL: TIntegerField;
    IBTransaction_Commit: TIBTransaction;
    IBQ_DTSystem: TIBQuery;
    IBQ_DTSystemDATA_SER: TDateField;
    IBQ_DTSystemHORA_SER: TTimeField;
    DataBaseIBO: TIBDatabase;
    IBTransactionO: TIBTransaction;
    IBT_MesaItemALIQUOTA: TIntegerField;
    IBT_ProdutosDESCONTO: TFloatField;
    IBT_ProdutosACRESCIMO: TFloatField;
    IBT_ConfFirma: TIBTable;
    IBT_ConfFirmaCODIGO: TIntegerField;
    IBT_ConfFirmaATIVO: TIBStringField;
    IBT_ConfFirmaRELFECHA: TIBStringField;
    IBT_ConfFirmaDESCRICAO: TIBStringField;
    DTS_ConfFirma: TDataSource;
    IBT_MesaCond: TIBTable;
    IBT_MesaCondCODIGO_ID: TIntegerField;
    IBT_MesaCondMESA: TIntegerField;
    IBT_MesaCondSEQUENCIA: TIntegerField;
    IBT_MesaCondTIPO_PAGTO: TIntegerField;
    IBT_MesaCondTOTAL: TFloatField;
    IBT_MesaCondHORA_PAGTO: TIBStringField;
    IBT_MesaCondDATA_PAGTO: TDateField;
    IBT_MesaCondMESAFECHA: TIntegerField;
    IBT_MesaCondSEQFECHA: TIntegerField;
    IBT_MesaCondTEMPO: TDateTimeField;
    IBT_MesaCondFECHA: TDateField;
    IBT_MesaCondDEVEDOR: TFloatField;
    DTS_MesaCond: TDataSource;
    DTS_Parametros: TDataSource;
    IBQ_GravaProd: TIBQuery;
    IBQ_GraEstProd: TIBQuery;
    IBT_MovEstoque: TIBTable;
    DTS_MovEstoque: TDataSource;
    IBQ_EstGravar: TIBQuery;
    IBQ_CalEstoque: TIBQuery;
    IBQ_CalEstoquecPreMedio: TCurrencyField;
    IBT_ProdutosPROD_MTN: TIntegerField;
    IBT_ProdutosESTOQUE: TIBStringField;
    IBT_ProdutosESTNEGATIVO: TIBStringField;
    IBQ_GravaProdCODIGO_ID: TIntegerField;
    IBQ_GravaProdPRODUTO: TIBStringField;
    IBQ_GravaProdDESCRICAO: TIBStringField;
    IBQ_GravaProdPRECO: TFloatField;
    IBQ_GravaProdPRECOCUSTO: TFloatField;
    IBQ_GravaProdGRUPO: TIntegerField;
    IBQ_GravaProdICMS_SN: TIBStringField;
    IBQ_GravaProdTRIBUTAR: TIntegerField;
    IBQ_GravaProdBALANCA: TIBStringField;
    IBQ_GravaProdTARA: TFloatField;
    IBQ_GravaProdUNIDADE: TIntegerField;
    IBQ_GravaProdATIVO: TIBStringField;
    IBQ_GravaProdCOMANDA: TIBStringField;
    IBQ_GravaProdLOCAL_IMP: TIntegerField;
    IBQ_GravaProdDESCONTO: TFloatField;
    IBQ_GravaProdACRESCIMO: TFloatField;
    IBQ_GravaProdPROD_MTN: TIntegerField;
    IBQ_GravaProdESTOQUE: TIBStringField;
    IBQ_GravaProdESTNEGATIVO: TIBStringField;
    IBQ_EstGravarCODIGO_ID: TIntegerField;
    IBQ_EstGravarPRODUTOS: TIntegerField;
    IBQ_EstGravarCLIFOR: TIntegerField;
    IBQ_EstGravarHISTORICO: TIBStringField;
    IBQ_EstGravarVALENTRADA: TFloatField;
    IBQ_EstGravarQTDENTRADA: TFloatField;
    IBQ_EstGravarVALSAIDA: TFloatField;
    IBQ_EstGravarQTDSAIDA: TFloatField;
    IBQ_EstGravarVALSALDO: TFloatField;
    IBQ_EstGravarQTDSALDO: TFloatField;
    IBQ_EstGravarCENTROCUSTO: TIntegerField;
    IBQ_CalEstoqueCODIGO_ID: TIntegerField;
    IBQ_CalEstoquePRODUTOS: TIntegerField;
    IBQ_CalEstoqueCLIFOR: TIntegerField;
    IBQ_CalEstoqueHISTORICO: TIBStringField;
    IBQ_CalEstoqueVALENTRADA: TFloatField;
    IBQ_CalEstoqueQTDENTRADA: TFloatField;
    IBQ_CalEstoqueVALSAIDA: TFloatField;
    IBQ_CalEstoqueQTDSAIDA: TFloatField;
    IBQ_CalEstoqueVALSALDO: TFloatField;
    IBQ_CalEstoqueQTDSALDO: TFloatField;
    IBQ_CalEstoqueCENTROCUSTO: TIntegerField;
    IBT_MovEstoqueCODIGO_ID: TIntegerField;
    IBT_MovEstoquePRODUTOS: TIntegerField;
    IBT_MovEstoqueCLIFOR: TIntegerField;
    IBT_MovEstoqueHISTORICO: TIBStringField;
    IBT_MovEstoqueVALENTRADA: TFloatField;
    IBT_MovEstoqueQTDENTRADA: TFloatField;
    IBT_MovEstoqueVALSAIDA: TFloatField;
    IBT_MovEstoqueQTDSAIDA: TFloatField;
    IBT_MovEstoqueVALSALDO: TFloatField;
    IBT_MovEstoqueQTDSALDO: TFloatField;
    IBT_MovEstoqueCENTROCUSTO: TIntegerField;
    IBT_ProdutosESTOQUE_FISICO: TFloatField;
    IBT_ProdutosESTOQUE_VIRTUAL: TFloatField;
    IBQ_GravaProdESTOQUE_FISICO: TFloatField;
    IBQ_GravaProdESTOQUE_VIRTUAL: TFloatField;
    IBT_MovEstoqueDATA: TDateTimeField;
    IBQ_EstGravarDATA: TDateTimeField;
    IBQ_CalEstoqueDATA: TDateTimeField;
    CDS_OVariasFormas: TClientDataSet;
    CDS_OVariasFormasCond: TIntegerField;
    CDS_OVariasFormasValor: TFloatField;
    CDS_OVariasFormasFlag: TStringField;
    CDS_OVariasFormasDevedor: TFloatField;
    CDS_VariasFormas: TClientDataSet;
    CDS_VariasFormasCond: TIntegerField;
    CDS_VariasFormasValor: TFloatField;
    CDS_VariasFormasFlag: TStringField;
    CDS_VariasFormasDevedor: TFloatField;
    DTS_VariasFormas: TDataSource;
    DTS_OVariasFormas: TDataSource;
    IBT_FormaPagtoMULTFORM: TIBStringField;
    IBT_FormaPagtoTEF: TIBStringField;
    IBT_FormaPagtoTIPO: TIBStringField;
    IBT_Cliente: TIBTable;
    IBT_ClienteCODIGO_ID: TIntegerField;
    IBT_ClienteNOMEFANTASIA: TIBStringField;
    IBT_ClienteRAZAOSOCIAL: TIBStringField;
    IBT_ClienteCNPJ: TIBStringField;
    IBT_ClienteCPF: TIBStringField;
    IBT_ClienteIE: TIBStringField;
    IBT_ClienteRG: TIBStringField;
    IBT_ClienteENDERECO: TIBStringField;
    IBT_ClienteBAIRRO: TIBStringField;
    IBT_ClienteCIDADE: TIBStringField;
    IBT_ClienteTELEFONE: TIBStringField;
    IBT_ClienteFAX: TIBStringField;
    IBT_ClienteCONTATO: TIBStringField;
    IBT_ClienteEMAIL: TIBStringField;
    IBT_ClienteSITE: TIBStringField;
    IBT_ClienteATIVO: TIBStringField;
    IBT_ClienteCEP: TIBStringField;
    IBT_ClienteUF: TIBStringField;
    IBT_ClienteTIPOCLIFOR: TIBStringField;
    DTS_Cliente: TDataSource;
    IBT_MesaFechaCLIENTE: TIntegerField;
    IBT_FormaPagtoDIAS: TIntegerField;
    IBQ_CxList: TIBQuery;
    IBQ_CxListNUMERO_ID: TIntegerField;
    IBQ_CxListCAIXA: TIntegerField;
    IBQ_CxListDATA: TDateTimeField;
    IBQ_CxListHISTORICO: TMemoField;
    IBQ_CxListCONTA: TIntegerField;
    IBQ_CxListSUBCONTA: TIntegerField;
    IBQ_CxListDEBCRED: TIBStringField;
    IBQ_CxListVALOR: TFloatField;
    IBQ_CxListSALDO: TFloatField;
    IBQ_CxListCLIFOR: TIntegerField;
    IBQ_CxListDOCUMENTO: TIBStringField;
    IBQ_CxListTIPO_DES: TIBStringField;
    IBQ_CxListTIPO_ORI: TIBStringField;
    IBQ_CxListCODE_ORI: TIntegerField;
    IBQ_Grava: TIBQuery;
    IntegerField18: TIntegerField;
    IBQ_GravarCAIXA: TIntegerField;
    DateTimeField1: TDateTimeField;
    MemoField1: TMemoField;
    IntegerField19: TIntegerField;
    IntegerField20: TIntegerField;
    IBStringField22: TIBStringField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    IntegerField21: TIntegerField;
    IBStringField23: TIBStringField;
    IBT_MovtoDiaria: TIBTable;
    DTS_MovtoDiaria: TDataSource;
    IBT_MovtoDiariaCODIGO_ID: TIntegerField;
    IBT_MovtoDiariaDIARIA: TIntegerField;
    IBT_MovtoDiariaMESA: TIntegerField;
    IBT_MovtoDiariaSEQUENCIA: TIntegerField;
    IBT_MovtoDiariaDATA_INICIO: TDateField;
    IBT_MovtoDiariaDATA_FINAL: TDateField;
    IBT_MovtoDiariaHORA_INICIO: TIBStringField;
    IBT_MovtoDiariaHORA_FINAL: TIBStringField;
    IBT_MovtoDiariaTEMPO_INICIAL: TDateTimeField;
    IBT_MovtoDiariaTEMPO_FINAL: TDateTimeField;
    IBT_MovtoDiariaGARCOM: TIntegerField;
    IBT_Diaria: TIBTable;
    DTS_Diaria: TDataSource;
    IBT_FuncionarioDescPeriodo: TStringField;
    IBT_FichaDescFicha: TStringField;
    IBT_FichaTRAVA: TIBStringField;
    IBT_FichaDIGITO: TSmallintField;
    IBT_FichaTP_FICHA: TIBStringField;
    IBT_FichaOPERADOR: TIntegerField;
    IBT_FichaPRODUCAO: TIBStringField;
    IBT_MovtoDiariaQTDEDIARIA: TIntegerField;
    IBT_MovtoDiariaVALOR: TFloatField;
    IBT_MovtoDiariaDESCONTO: TFloatField;
    IBT_MovtoDiariaFINALIZADA: TIBStringField;
    IBQ_MovtoDiaria: TIBQuery;
    IBQ_MovtoDiariaCODIGO_ID: TIntegerField;
    IBQ_MovtoDiariaDIARIA: TIntegerField;
    IBQ_MovtoDiariaMESA: TIntegerField;
    IBQ_MovtoDiariaSEQUENCIA: TIntegerField;
    IBQ_MovtoDiariaDATA_INICIO: TDateField;
    IBQ_MovtoDiariaDATA_FINAL: TDateField;
    IBQ_MovtoDiariaHORA_INICIO: TIBStringField;
    IBQ_MovtoDiariaHORA_FINAL: TIBStringField;
    IBQ_MovtoDiariaTEMPO_INICIAL: TDateTimeField;
    IBQ_MovtoDiariaTEMPO_FINAL: TDateTimeField;
    IBQ_MovtoDiariaGARCOM: TIntegerField;
    IBQ_MovtoDiariaQTDEDIARIA: TIntegerField;
    IBQ_MovtoDiariaVALOR: TFloatField;
    IBQ_MovtoDiariaDESCONTO: TFloatField;
    IBQ_MovtoDiariaFINALIZADA: TIBStringField;
    IBT_ProdutosDescLocalImp: TStringField;
    IBQ_MovtoDiariaDescDiaria: TStringField;
    IBT_ContaParam: TIBTable;
    IBT_ContaParamCODIGO_ID: TIntegerField;
    IBT_ContaParamNOME: TIBStringField;
    IBT_ContaParamSIGLA: TIBStringField;
    DTS_ContaParam: TDataSource;
    DTS_SubContaParam: TDataSource;
    IBT_SubContaParam: TIBTable;
    IBT_SubContaParamCODIGO_ID: TIntegerField;
    IBT_SubContaParamNOME: TIBStringField;
    IBT_SubContaParamSIGLA: TIBStringField;
    IBT_SubContaParamCONTA: TIntegerField;
    DTS_CaixaParam: TDataSource;
    IBT_CaixaParam: TIBTable;
    IBT_CaixaParamNUMERO_ID: TIntegerField;
    IBT_CaixaParamCAIXA: TIntegerField;
    IBT_CaixaParamDESCRICAO: TIBStringField;
    IBT_DiariaCODIGO_ID: TIntegerField;
    IBT_DiariaPRODUTO: TIBStringField;
    IBT_DiariaDESCRICAO: TIBStringField;
    IBT_DiariaPRECO: TFloatField;
    IBT_DiariaPRECOCUSTO: TFloatField;
    IBT_DiariaGRUPO: TIntegerField;
    IBT_DiariaICMS_SN: TIBStringField;
    IBT_DiariaTRIBUTAR: TIntegerField;
    IBT_DiariaBALANCA: TIBStringField;
    IBT_DiariaTARA: TFloatField;
    IBT_DiariaUNIDADE: TIntegerField;
    IBT_DiariaATIVO: TIBStringField;
    IBT_DiariaCOMANDA: TIBStringField;
    IBT_DiariaLOCAL_IMP: TIntegerField;
    IBT_DiariaDESCONTO: TFloatField;
    IBT_DiariaACRESCIMO: TFloatField;
    IBT_DiariaPROD_MTN: TIntegerField;
    IBT_DiariaESTOQUE: TIBStringField;
    IBT_DiariaESTNEGATIVO: TIBStringField;
    IBT_DiariaESTOQUE_FISICO: TFloatField;
    IBT_DiariaESTOQUE_VIRTUAL: TFloatField;
    IBT_DiariaESTOQUEMIN: TFloatField;
    IBT_DiariaESTOQUEMAX: TFloatField;
    IBT_DiariaTEMPO: TIBStringField;
    IBT_DiariaDIA_PROD: TIBStringField;
    IBT_MesaItemDATA_INICIO: TDateField;
    IBT_MesaItemDATA_FINAL: TDateField;
    IBT_MesaItemHORA_INICIO: TIBStringField;
    IBT_MesaItemHORA_FINAL: TIBStringField;
    IBT_MesaItemTEMPO_INICIAL: TDateTimeField;
    IBT_MesaItemTEMPO_FINAL: TDateTimeField;
    IBT_MesaItemDESCONTO: TFloatField;
    IBT_MesaItemFINALIZADA: TIBStringField;
    IBT_FuncionarioDescTurno: TStringField;
    IBT_FormaPagtoQTDTICKET: TIntegerField;
    IBT_ProdutosESTOQUEMIN: TFloatField;
    IBT_ProdutosESTOQUEMAX: TFloatField;
    IBT_ProdutosTEMPO: TIBStringField;
    IBT_ProdutosDIA_PROD: TIBStringField;
    IBT_ClienteMATRICULA: TIBStringField;
    IBQ_MovEstoque: TIBQuery;
    DTQ_MovEstoque: TDataSource;
    IBT_Parametros: TIBTable;
    IBT_ProdutosIMP_PERS: TIBStringField;
    IBQ_PesFichas: TIBQuery;
    IBQ_PesFichasCODIGO_ID: TIntegerField;
    IBQ_PesFichasFICHA: TIntegerField;
    IBQ_PesFichasSEQUENCIA: TIntegerField;
    IBQ_PesFichasSTATUS: TIBStringField;
    IBQ_PesFichasATIVO: TIBStringField;
    IBQ_PesFichasCONSULTA: TIBStringField;
    IBQ_PesFichasTRAVA: TIBStringField;
    IBQ_PesFichasDIGITO: TSmallintField;
    IBQ_PesFichasTP_FICHA: TIBStringField;
    IBQ_PesFichasOPERADOR: TIntegerField;
    IBQ_PesFichasPRODUCAO: TIBStringField;
    IBT_DiariaIMP_PERS: TIBStringField;
    IBT_ProdutosVALSALDOENT: TFloatField;
    IBT_ProdutosQTDSALDOENT: TFloatField;
    IBQ_GravaProdVALSALDOENT: TFloatField;
    IBQ_GravaProdQTDSALDOENT: TFloatField;
    IBT_MesaItemCLIENTEDIARIA: TIntegerField;
    IBT_DiariaVALSALDOENT: TFloatField;
    IBT_DiariaQTDSALDOENT: TFloatField;
    IBT_DiariaTAXA: TFloatField;
    IBT_DiariaTAXA_SN: TIBStringField;
    IBT_ProdutosTAXA: TFloatField;
    IBT_ProdutosTAXA_SN: TIBStringField;
    IBT_FichaQUARTO: TIBStringField;
    IBT_MesaItemOBS: TIBStringField;
    IBT_MesaItemIMP_DIARIA: TIBStringField;
    IBT_MesaItemIMP_CONTINT: TIBStringField;
    IBT_MesaItemIMP_CANCELINT: TIBStringField;
    IBT_MesaItemACRESCIMO: TFloatField;
    IBT_MesaItemTAXA: TFloatField;
    IBT_MesaItemVAL_DESCONTO: TFloatField;
    IBT_MesaItemVAL_ACRESCIMO: TFloatField;
    IBT_MesaItemVAL_TAXA: TFloatField;
    IBT_MesaItemVAL_PRODUTO: TFloatField;
    IBT_MesaFechaVAL_DESCONTOI: TFloatField;
    IBT_MesaFechaVAL_ACRESCIMOI: TFloatField;
    IBT_MesaFechaVAL_TAXAI: TFloatField;
    IBQ_FuncSaldo: TIBQuery;
    MDM_Cardapio: TmdMailSlot;
    IBQ_ModulosFrente: TIBQuery;
    IBQ_AtualizaModulosFrente: TIBQuery;
    IBQ_ModulosFrenteCODIGO_ID: TIntegerField;
    IBQ_ModulosFrenteMODULO: TIBStringField;
    IBQ_ModulosFrenteMOD_NAME: TIBStringField;
    IBQ_ModulosFrenteBOT_NAME: TIBStringField;
    IBQ_AtualizaModulosFrenteCODIGO_ID: TIntegerField;
    IBQ_AtualizaModulosFrenteMODULO: TIBStringField;
    IBQ_AtualizaModulosFrenteMOD_NAME: TIBStringField;
    IBQ_AtualizaModulosFrenteBOT_NAME: TIBStringField;
    IBQ_PermissaoFrente: TIBQuery;
    IBQ_PermissaoFrenteCODIGO_ID: TIntegerField;
    IBQ_PermissaoFrenteNIVEL: TIntegerField;
    IBQ_PermissaoFrenteMODULO: TIBStringField;
    IBQ_PermissaoFrenteMOD_NAME: TIBStringField;
    IBQ_PermissaoFrenteBOT_NAME: TIBStringField;
    IBQ_PermissaoFrentePERMISSAO: TIBStringField;
    IBQ_PermissaoFrenteCHPB: TIBStringField;
    IBQ_PermissaoFrenteDesModulo: TStringField;
    IBQ_PermissaoFrenteDesPermissao: TStringField;
    IBT_ContaAtivos: TIBTable;
    IBT_ContaAtivosCODIGO_ID: TIntegerField;
    IBT_ContaAtivosNOME: TIBStringField;
    IBT_ContaAtivosSIGLA: TIBStringField;
    IBT_ContaAtivosATIVO: TIBStringField;
    DTS_ContaAtivos: TDataSource;
    IBT_SubContaAtivos: TIBTable;
    IBT_SubContaAtivosCODIGO_ID: TIntegerField;
    IBT_SubContaAtivosNOME: TIBStringField;
    IBT_SubContaAtivosSIGLA: TIBStringField;
    IBT_SubContaAtivosCONTA: TIntegerField;
    IBT_SubContaAtivosATIVO: TIBStringField;
    DTS_SubContaAtivos: TDataSource;
    IBT_ClienteAtivos: TIBTable;
    DTS_ClienteAtivos: TDataSource;
    IBT_ClienteAtivosCODIGO_ID: TIntegerField;
    IBT_ClienteAtivosNOMEFANTASIA: TIBStringField;
    IBT_ClienteAtivosRAZAOSOCIAL: TIBStringField;
    IBT_ClienteAtivosCNPJ: TIBStringField;
    IBT_ClienteAtivosCPF: TIBStringField;
    IBT_ClienteAtivosIE: TIBStringField;
    IBT_ClienteAtivosRG: TIBStringField;
    IBT_ClienteAtivosENDERECO: TIBStringField;
    IBT_ClienteAtivosBAIRRO: TIBStringField;
    IBT_ClienteAtivosCIDADE: TIBStringField;
    IBT_ClienteAtivosTELEFONE: TIBStringField;
    IBT_ClienteAtivosFAX: TIBStringField;
    IBT_ClienteAtivosCONTATO: TIBStringField;
    IBT_ClienteAtivosEMAIL: TIBStringField;
    IBT_ClienteAtivosSITE: TIBStringField;
    IBT_ClienteAtivosATIVO: TIBStringField;
    IBT_ClienteAtivosCEP: TIBStringField;
    IBT_ClienteAtivosUF: TIBStringField;
    IBT_ClienteAtivosTIPOCLIFOR: TIBStringField;
    IBT_ClienteAtivosMATRICULA: TIBStringField;
    IBT_MesaFechaCAT_CNPJ: TIBStringField;
    IBT_MesaFechaCAT_NOME: TIBStringField;
    IBT_MesaFechaCAT_ENDERECO: TIBStringField;
    IBT_ClienteOBSERVACAO: TBlobField;
    IBT_ClienteSALDO_CASTO: TFloatField;
    IBT_ClienteSALDO_LIMITE: TFloatField;
    IBT_ClienteTRAVAMENSAGEM: TIBStringField;
    IBT_ClienteCONTRATO: TIBStringField;
    IBT_ClienteDTCADASTRO: TDateField;
    IBQ_NumTef: TIBQuery;
    IBQ_NumTefNTEF: TLargeintField;
    IBQ_TempTEF: TIBQuery;
    IBQ_TempTEFNUM_MAQ: TIntegerField;
    IBQ_TempTEFNUM_TEF: TIntegerField;
    IBQ_TempTEFNUM_COO: TIntegerField;
    IBQ_TempTEFVALOR: TFloatField;
    IBQ_TempTEFCONFIRMADO: TIBStringField;
    IBQ_TempTEFBUFFER: TMemoField;
    IBT_TempTEF: TIBTable;
    IBT_TempTEFNUM_MAQ: TIntegerField;
    IBT_TempTEFNUM_TEF: TIntegerField;
    IBT_TempTEFNUM_COO: TIntegerField;
    IBT_TempTEFVALOR: TFloatField;
    IBT_TempTEFCONFIRMADO: TIBStringField;
    IBT_TempTEFBUFFER: TMemoField;
    DTS_TempTEF: TDataSource;
    IBT_TempTefADM: TIBTable;
    IBT_TempTefADMNUM_MAQ: TIntegerField;
    IBT_TempTefADMBUFFER: TMemoField;
    DTS_TempTefADM: TDataSource;
    IBQ_Busca: TIBQuery;
    IBQ_BuscaNUM_MAQ: TIntegerField;
    IBQ_BuscaNUM_TEF: TIntegerField;
    IBQ_BuscaNUM_COO: TIntegerField;
    IBQ_BuscaVALOR: TFloatField;
    IBQ_BuscaCONFIRMADO: TIBStringField;
    IBQ_BuscaBUFFER: TMemoField;
    CDS_VariasFormasTEF: TIntegerField;
    CDS_OVariasFormasTEF: TIntegerField;
    IBT_MesaFechaNUMSERIEIMPRESSORA: TIBStringField;
    IBT_ProdutosLUCRO: TFloatField;
    IBT_ProdutosMOVEL: TIBStringField;
    IBT_ProdutosPIS: TFloatField;
    IBT_ProdutosREDUCAOICMS: TFloatField;
    IBT_ProdutosCOFINS: TFloatField;
    IBT_ProdutosICMS: TFloatField;
    IBT_MesaItemALIQUO: TIBStringField;
    IBT_MesaItemPIS: TFloatField;
    IBT_MesaItemCOFINS: TFloatField;
    IBT_MesaItemICMS: TFloatField;
    IBT_FormaPagtoATIVO: TIBStringField;
    IBT_FormaPagtoACRESCIMO: TFloatField;
    IBT_ProdutosTRIBUTAR_ANTIGO: TIntegerField;
    IBT_ProdutosTRIBUTAR_FORA_ANTIGO: TIntegerField;
    IBT_ProdutosPRECO_AGREGADO: TFloatField;
    IBT_ProdutosTRIBUTAR_FORA: TIntegerField;
    IBT_ProdutosCST: TIntegerField;
    IBT_ProdutosCOMISSAO: TFloatField;
    IBT_ProdutosCOMISPRSN: TIBStringField;
    IBT_FuncionarioOBSERVACAO: TBlobField;
    IBT_FuncionarioMOVEL: TIBStringField;
    IBT_FuncionarioCOMISSAO: TFloatField;
    IBT_FormaPagtoCORTESIA: TIBStringField;
    IBT_MesaFechaCORTESIA: TIBStringField;
    IBT_MesaItemCOMISSAOPR: TFloatField;
    IBT_MesaItemCOMISSAOFU: TFloatField;
    IBT_MesaItemCOMISPRSN: TIBStringField;
    IBT_MesaItemCORTESIA: TIBStringField;
    IBT_MesaCondCORTESIA: TIBStringField;
    IBT_MesaCondTURNO: TIntegerField;
    IBT_MesaFechaTURNO: TIntegerField;
    IBT_MesaItemTURNO: TIntegerField;
    CDS_OVariasFormasDifTef: TFloatField;
    CDS_VariasFormasDifTef: TFloatField;
    IBT_MesaItemOBSERVACAO: TMemoField;
    IBT_Complemento: TIBTable;
    IBT_ComplementoCODIGO_ID: TIntegerField;
    IBT_ComplementoDESCRICAO: TIBStringField;
    IBT_ComplementoMOVEL: TIBStringField;
    IBT_ComplementoATIVO: TIBStringField;
    DTS_Complemento: TDataSource;
    IBT_MesaComp: TIBTable;
    DTS_MesaComp: TDataSource;
    IBT_MesaCompCODIGO_ID: TIntegerField;
    IBT_MesaCompPRODUTO: TIntegerField;
    IBT_MesaCompCOMP: TIntegerField;
    IBT_MesaCompCS: TIBStringField;
    IBT_MesaCompFICHA: TIntegerField;
    IBT_MesaCompFSEQUENCIA: TIntegerField;
    IBT_MesaCompFINALIZADO: TIBStringField;
    IBT_MesaCompLIGACOMP: TIntegerField;
    IBT_MesaItemSTATUSCONT: TIBStringField;
    IBT_MesaItemREDUCAO: TFloatField;
    IBT_MesaItemCOMPLEMENTO: TIBStringField;
    IBT_MesaItemPOSICAO: TIBStringField;
    IBT_MesaItemLIGACOMP: TIntegerField;
    IBT_ParametrosCODIGO_ID: TIntegerField;
    IBT_ParametrosDT_INICIAL: TIntegerField;
    IBT_ParametrosDT_FINAL: TIntegerField;
    IBT_ParametrosHR_INICIAL: TIBStringField;
    IBT_ParametrosHR_FINAL: TIBStringField;
    IBT_ParametrosPERIODO: TIBStringField;
    IBT_ParametrosDT_INICIALM: TIntegerField;
    IBT_ParametrosDT_FINALM: TIntegerField;
    IBT_ParametrosMONTANA: TIBStringField;
    IBT_ParametrosCONTA: TIntegerField;
    IBT_ParametrosSUBCONTA: TIntegerField;
    IBT_ParametrosCENTROCUSTO: TIntegerField;
    IBT_ParametrosFRENTECLIFOR: TIntegerField;
    IBT_ParametrosCAIXA: TIntegerField;
    IBT_ParametrosDIFCONTA: TIntegerField;
    IBT_ParametrosDIFSUBCONTA: TIntegerField;
    IBT_ParametrosPCONTA: TIntegerField;
    IBT_ParametrosPSUBCONTA: TIntegerField;
    IBT_ParametrosECONTA: TIntegerField;
    IBT_ParametrosESUBCONTA: TIntegerField;
    IBT_ParametrosGRUPODIARIA: TIntegerField;
    IBT_ParametrosFRENTEAVULSO: TIntegerField;
    IBT_ParametrosPORTA: TIBStringField;
    IBT_ParametrosPORC_ESTOQUE: TFloatField;
    IBT_ParametrosMODOPERMISSAO: TIBStringField;
    IBT_ParametrosENTREGA_CALCULO: TIBStringField;
    IBT_ParametrosENTREGA_COZINHA: TIntegerField;
    IBT_ParametrosENTREGA_PACOTE: TIntegerField;
    IBT_ParametrosTERMDIA: TIBStringField;
    IBT_ParametrosFECHACAIXA: TIBStringField;
    IBT_ParametrosTIKETMSG: TIBStringField;
    IBT_ParametrosTIKETMSG2: TIBStringField;
    IBT_ParametrosTIKETMSG3: TIBStringField;
    IBT_ParametrosTIKETMSG4: TIBStringField;
    IBT_ParametrosTICKETPERSONA: TIBStringField;
    IBT_ParametrosRECEBIDO_AUTO: TIBStringField;
    IBT_MesaFechaIMPRESSO: TIBStringField;
    IBT_MesaItemNIVEL_ISENTO: TIntegerField;
    IBT_ProdutosITEMDATASUL: TIBStringField;
    IBT_ProdutosCLASSFISC_DATASUL: TIBStringField;
    IBT_ProdutosNATOPERACAO_DATASUL: TIBStringField;
    IBT_ProdutosUNITEM_DATASUL: TIBStringField;
    IBT_ProdutosUNFAMI_DATASUL: TIBStringField;
    IBT_ProdutosCODTRIB_DATASUL: TIBStringField;
    IBT_ProdutosPERREDUCAOICMS_DATASUL: TIBStringField;
    IBT_ProdutosNIVEL_ISENTO: TIntegerField;
    IBT_MesaFechaPESSOAS: TIntegerField;
    IBT_MesaCompCANCELADA: TIBStringField;
    IBT_MesaItemIMPRESSO: TIBStringField;
    IBT_MesaItemPESSOAS: TIntegerField;
    IBT_ProdutosOBSFRENTE: TIBStringField;
    IBQ_DadosECF: TIBQuery;
    IBT_ProdutosNCM: TIBStringField;
    IBT_ProdutosBXCARTELA: TIBStringField;
    IBT_ParametrosMSG_COMANDA: TIBStringField;
    IBT_ParametrosCLIENTEPERSO: TIBStringField;
    IBT_ParametrosFRENTEFUNC: TIntegerField;
    IBT_ParametrosVIAS: TIntegerField;
    IBT_ParametrosNUMLINHAS: TIntegerField;
    IBT_FichaFINALIZADA: TIBStringField;
    IBQ_VerMesa: TIBQuery;
    IBQ_VerMesaCODIGO_ID: TIntegerField;
    IBQ_VerMesaMESA: TIntegerField;
    IBQ_VerMesaSEQUENCIA: TIntegerField;
    IBQ_VerMesaGARCOM: TIntegerField;
    IBQ_VerMesaPRODUTO: TIntegerField;
    IBQ_VerMesaQUANTIDADE: TFloatField;
    IBQ_VerMesaCANCELADA: TIBStringField;
    IBQ_VerMesaIMP_REMOTA: TIBStringField;
    IBQ_VerMesaPONTOVENDA: TIntegerField;
    IBQ_VerMesaHORA: TIBStringField;
    IBQ_VerMesaDATE: TDateField;
    IBQ_VerMesaMESAFECHA: TIntegerField;
    IBQ_VerMesaSEQFECHA: TIntegerField;
    IBQ_VerMesaGRUPO: TIntegerField;
    IBQ_VerMesaPRC_UNITARIO: TFloatField;
    IBQ_VerMesaBALANCA: TIBStringField;
    IBQ_VerMesaHO: TIBStringField;
    IBQ_VerMesaTEMPO: TDateTimeField;
    IBQ_VerMesaOPCANCEL: TIntegerField;
    IBQ_VerMesaALIQUOTA: TIntegerField;
    IBQ_VerMesaDATA_INICIO: TDateField;
    IBQ_VerMesaDATA_FINAL: TDateField;
    IBQ_VerMesaHORA_INICIO: TIBStringField;
    IBQ_VerMesaHORA_FINAL: TIBStringField;
    IBQ_VerMesaTEMPO_INICIAL: TDateTimeField;
    IBQ_VerMesaTEMPO_FINAL: TDateTimeField;
    IBQ_VerMesaDESCONTO: TFloatField;
    IBQ_VerMesaFINALIZADA: TIBStringField;
    IBQ_VerMesaOBS: TIBStringField;
    IBQ_VerMesaIMP_DIARIA: TIBStringField;
    IBQ_VerMesaIMP_CONTINT: TIBStringField;
    IBQ_VerMesaIMP_CANCELINT: TIBStringField;
    IBQ_VerMesaCLIENTEDIARIA: TIntegerField;
    IBQ_VerMesaACRESCIMO: TFloatField;
    IBQ_VerMesaTAXA: TFloatField;
    IBQ_VerMesaVAL_TAXA: TFloatField;
    IBQ_VerMesaVAL_DESCONTO: TFloatField;
    IBQ_VerMesaVAL_ACRESCIMO: TFloatField;
    IBQ_VerMesaVAL_PRODUTO: TFloatField;
    IBQ_VerMesaALIQUO: TIBStringField;
    IBQ_VerMesaPIS: TFloatField;
    IBQ_VerMesaCOFINS: TFloatField;
    IBQ_VerMesaICMS: TFloatField;
    IBQ_VerMesaCOMISSAOPR: TFloatField;
    IBQ_VerMesaCOMISSAOFU: TFloatField;
    IBQ_VerMesaCOMISPRSN: TIBStringField;
    IBQ_VerMesaCORTESIA: TIBStringField;
    IBQ_VerMesaTURNO: TIntegerField;
    IBQ_VerMesaSTATUSCONT: TIBStringField;
    IBQ_VerMesaREDUCAO: TFloatField;
    IBQ_VerMesaOBSERVACAO: TMemoField;
    IBQ_VerMesaCOMPLEMENTO: TIBStringField;
    IBQ_VerMesaPOSICAO: TIBStringField;
    IBQ_VerMesaLIGACOMP: TIntegerField;
    IBQ_VerMesaNIVEL_ISENTO: TIntegerField;
    IBQ_VerMesaIMPRESSO: TIBStringField;
    IBQ_VerMesaPESSOAS: TIntegerField;
    IBT_ParametrosNFENTRADAIMP: TIBStringField;
    IBT_ProdLista: TIBTable;
    IBT_ProdListaDesUnidade: TStringField;
    IBT_ProdListaCODIGO_ID: TIntegerField;
    IBT_ProdListaPRODUTO: TIBStringField;
    IBT_ProdListaDESCRICAO: TIBStringField;
    IBT_ProdListaPRECO: TFloatField;
    IBT_ProdListaPRECOCUSTO: TFloatField;
    IBT_ProdListaGRUPO: TIntegerField;
    IBT_ProdListaICMS_SN: TIBStringField;
    IBT_ProdListaTRIBUTAR: TIntegerField;
    IBT_ProdListaBALANCA: TIBStringField;
    IBT_ProdListaTARA: TFloatField;
    IBT_ProdListaUNIDADE: TIntegerField;
    IBT_ProdListaATIVO: TIBStringField;
    IBT_ProdListaCOMANDA: TIBStringField;
    IBT_ProdListaLOCAL_IMP: TIntegerField;
    IBT_ProdListaDESCONTO: TFloatField;
    IBT_ProdListaACRESCIMO: TFloatField;
    IBT_ProdListaPROD_MTN: TIntegerField;
    IBT_ProdListaESTOQUE: TIBStringField;
    IBT_ProdListaESTNEGATIVO: TIBStringField;
    IBT_ProdListaESTOQUE_FISICO: TFloatField;
    IBT_ProdListaESTOQUE_VIRTUAL: TFloatField;
    IBT_ProdListaESTOQUEMIN: TFloatField;
    IBT_ProdListaESTOQUEMAX: TFloatField;
    IBT_ProdListaTEMPO: TIBStringField;
    IBT_ProdListaDIA_PROD: TIBStringField;
    IBT_ProdListaIMP_PERS: TIBStringField;
    IBT_ProdListaVALSALDOENT: TFloatField;
    IBT_ProdListaQTDSALDOENT: TFloatField;
    IBT_ProdListaTAXA: TFloatField;
    IBT_ProdListaTAXA_SN: TIBStringField;
    IBT_ProdListaLUCRO: TFloatField;
    IBT_ProdListaMOVEL: TIBStringField;
    IBT_ProdListaPIS: TFloatField;
    IBT_ProdListaREDUCAOICMS: TFloatField;
    IBT_ProdListaCOFINS: TFloatField;
    IBT_ProdListaICMS: TFloatField;
    IBT_ProdListaTRIBUTAR_ANTIGO: TIntegerField;
    IBT_ProdListaTRIBUTAR_FORA_ANTIGO: TIntegerField;
    IBT_ProdListaPRECO_AGREGADO: TFloatField;
    IBT_ProdListaTRIBUTAR_FORA: TIntegerField;
    IBT_ProdListaCST: TIntegerField;
    IBT_ProdListaCOMISSAO: TFloatField;
    IBT_ProdListaCOMISPRSN: TIBStringField;
    IBT_ProdListaITEMDATASUL: TIBStringField;
    IBT_ProdListaCLASSFISC_DATASUL: TIBStringField;
    IBT_ProdListaNATOPERACAO_DATASUL: TIBStringField;
    IBT_ProdListaUNITEM_DATASUL: TIBStringField;
    IBT_ProdListaUNFAMI_DATASUL: TIBStringField;
    IBT_ProdListaCODTRIB_DATASUL: TIBStringField;
    IBT_ProdListaPERREDUCAOICMS_DATASUL: TIBStringField;
    IBT_ProdListaNIVEL_ISENTO: TIntegerField;
    IBT_ProdListaOBSFRENTE: TIBStringField;
    IBT_ProdListaNCM: TIBStringField;
    IBT_ProdListaBXCARTELA: TIBStringField;
    IBT_ProdListaMONTAR: TIBStringField;
    IBT_ProdListaTIPO: TIBStringField;
    IBT_ProdListaESTLISTA_SN: TIBStringField;
    DTS_ProdLista: TDataSource;
    IBQ_ProEst: TIBQuery;
    IBQ_ProEstCODIGO_ID: TIntegerField;
    IBQ_ProEstPRODUTO: TIBStringField;
    IBQ_ProEstDESCRICAO: TIBStringField;
    IBQ_ProEstPRECO: TFloatField;
    IBQ_ProEstPRECOCUSTO: TFloatField;
    IBQ_ProEstGRUPO: TIntegerField;
    IBQ_ProEstICMS_SN: TIBStringField;
    IBQ_ProEstTRIBUTAR: TIntegerField;
    IBQ_ProEstBALANCA: TIBStringField;
    IBQ_ProEstTARA: TFloatField;
    IBQ_ProEstUNIDADE: TIntegerField;
    IBQ_ProEstATIVO: TIBStringField;
    IBQ_ProEstCOMANDA: TIBStringField;
    IBQ_ProEstLOCAL_IMP: TIntegerField;
    IBQ_ProEstDESCONTO: TFloatField;
    IBQ_ProEstACRESCIMO: TFloatField;
    IBQ_ProEstPROD_MTN: TIntegerField;
    IBQ_ProEstESTOQUE: TIBStringField;
    IBQ_ProEstESTNEGATIVO: TIBStringField;
    IBQ_ProEstESTOQUE_FISICO: TFloatField;
    IBQ_ProEstESTOQUE_VIRTUAL: TFloatField;
    IBQ_ProEstESTOQUEMIN: TFloatField;
    IBQ_ProEstESTOQUEMAX: TFloatField;
    IBQ_ProEstTEMPO: TIBStringField;
    IBQ_ProEstDIA_PROD: TIBStringField;
    IBQ_ProEstIMP_PERS: TIBStringField;
    IBQ_ProEstVALSALDOENT: TFloatField;
    IBQ_ProEstQTDSALDOENT: TFloatField;
    IBQ_ProEstTAXA: TFloatField;
    IBQ_ProEstTAXA_SN: TIBStringField;
    IBQ_ProEstLUCRO: TFloatField;
    IBQ_ProEstMOVEL: TIBStringField;
    IBQ_ProEstPIS: TFloatField;
    IBQ_ProEstREDUCAOICMS: TFloatField;
    IBQ_ProEstCOFINS: TFloatField;
    IBQ_ProEstICMS: TFloatField;
    IBQ_ProEstTRIBUTAR_ANTIGO: TIntegerField;
    IBQ_ProEstTRIBUTAR_FORA_ANTIGO: TIntegerField;
    IBQ_ProEstPRECO_AGREGADO: TFloatField;
    IBQ_ProEstTRIBUTAR_FORA: TIntegerField;
    IBQ_ProEstCST: TIntegerField;
    IBQ_ProEstCOMISSAO: TFloatField;
    IBQ_ProEstCOMISPRSN: TIBStringField;
    IBQ_ProEstITEMDATASUL: TIBStringField;
    IBQ_ProEstCLASSFISC_DATASUL: TIBStringField;
    IBQ_ProEstNATOPERACAO_DATASUL: TIBStringField;
    IBQ_ProEstUNITEM_DATASUL: TIBStringField;
    IBQ_ProEstUNFAMI_DATASUL: TIBStringField;
    IBQ_ProEstCODTRIB_DATASUL: TIBStringField;
    IBQ_ProEstPERREDUCAOICMS_DATASUL: TIBStringField;
    IBQ_ProEstNIVEL_ISENTO: TIntegerField;
    IBQ_ProEstOBSFRENTE: TIBStringField;
    IBQ_ProEstNCM: TIBStringField;
    IBQ_ProEstBXCARTELA: TIBStringField;
    IBQ_ProEstMONTAR: TIBStringField;
    IBQ_ProEstTIPO: TIBStringField;
    IBQ_ProEstESTLISTA_SN: TIBStringField;
    DTS_ProEst: TDataSource;
    IBQ_LisEst: TIBQuery;
    IBQ_LisEstCODIGO_ID: TIntegerField;
    IBQ_LisEstPRODUTO: TIntegerField;
    IBQ_LisEstMATERIAL: TIntegerField;
    IBQ_LisEstQTD: TFloatField;
    IBQ_LisEstPRECOCUSTO: TFloatField;
    IBQ_LisEstBAIXAR: TIBStringField;
    IBQ_LisEstPRECO: TFloatField;
    IBQ_LisEstUNIDADE: TIntegerField;
    IBT_ParametrosFIRMA: TIntegerField;
    IBT_ParametrosSFIRMA: TIBStringField;
    IBT_ParametrosTEMPOINATIVO: TIntegerField;
    IBT_ParametrosACIONABALANCA: TIBStringField;
    IBT_ClienteCELULAR: TIBStringField;
    IBT_ClienteDATA_NASC: TDateField;
    IBT_ConfigMOVEL: TIBStringField;
    IBT_ConfigMODELO: TIBStringField;
    IBT_ConfigGUILHOTINA: TIBStringField;
    IBT_ConfigEXPTICKET: TIBStringField;
    IBT_ParametrosTRVFICHAFINAL: TIBStringField;
    IBT_ParametrosFORMAPAGTO: TIntegerField;
    IBT_ParametrosQTD_ITENS_MONT_FRENTE: TIntegerField;
    IBT_ProdutosMONTAR: TIBStringField;
    IBT_FormaPagtoDOCVINC: TIBStringField;
    IBT_ParametrosNDFICHA: TIntegerField;
    IBQ_FunUse: TIBQuery;
    DTS_FunUse: TDataSource;
    IBQ_FunUseDESCRICAO: TIBStringField;
    IBQ_FunUseCODIGO_ID: TIntegerField;
    IBQ_FunUseLOGIN: TIBStringField;
    IBT_FormaPagtoTIPOES: TIBStringField;
    IBT_FormaPagtoPERMISSAO: TIBStringField;
    IBT_FormaPagtoMULTA: TFloatField;
    IBT_FormaPagtoJUROSDIAS: TFloatField;
    IBT_FormaPagtoCARENCIA: TIntegerField;
    IBT_ProdutosTIPO: TIBStringField;
    IBT_ProdutosESTLISTA_SN: TIBStringField;
    IBT_ProdutosST_ICMSE: TIntegerField;
    IBT_ProdutosST_ICMSS: TIntegerField;
    IBT_ProdutosST_IPI: TIntegerField;
    IBT_ProdutosST_PIS: TIntegerField;
    IBT_ProdutosST_COFINS: TIntegerField;
    IBT_ProdutosICMSS: TFloatField;
    IBT_ProdutosREDS: TFloatField;
    IBT_ProdutosIPI: TFloatField;
    IBT_ProdutosCODSERVICO: TIBStringField;
    IBT_ProdutosISSQN: TFloatField;
    IBT_ProdutosCF: TIBStringField;
    IBT_ProdutosEXTIPI: TIBStringField;
    IBT_ProdutosMODALIDADEBC: TIBStringField;
    IBT_ProdutosCBEMA: TLargeintField;
    IBT_ProdutosABC_LETRA: TIBStringField;
    IBT_ProdutosABC_PERCENTUAL: TFloatField;
    IBT_ProdutosABC: TIBStringField;
    IBT_ProdutosABC_DATAI: TDateField;
    IBT_ProdutosABC_DATAF: TDateField;
    IBT_ProdutosABC_PERCTOTAL: TFloatField;
    IBT_ProdutosTICKETBARRASS_N: TIBStringField;
    IBT_ProdutosCAMINHOTK: TIntegerField;
    IBT_ProdutosTICKETS_N: TIBStringField;
    IBT_ProdutosORIGEM: TIBStringField;
    IBT_ProdutosGTIN: TIBStringField;
    IBT_ProdutosPRECOPROMOCIONAL: TFloatField;
    IBT_ProdutosFIM_PROMOCAO: TDateField;
    IBT_ProdutosTMP_VALIDADE: TIntegerField;
    IBT_ProdutosTIPOITEMATIV: TIntegerField;
    IBT_ProdutosNAT_REC: TIBStringField;
    IBT_ProdutosAUTO_CALC_DIA: TIBStringField;
    IBT_ProdutosOPCAOIMP: TIBStringField;
    IBT_ProdutosST_PIS_ENTRADA: TIntegerField;
    IBT_ProdutosPIS_ENTRADA: TFloatField;
    IBT_ProdutosST_COFINS_ENTRADA: TIntegerField;
    IBT_ProdutosCOFINS_ENTRADA: TFloatField;
    procedure RedeAtualizaDados(Msg: String);
    procedure DataModuleCreate(Sender: TObject);
    procedure IBT_CargoAfterDelete(DataSet: TDataSet);
    procedure IBT_CargoAfterInsert(DataSet: TDataSet);
    procedure IBT_CargoAfterPost(DataSet: TDataSet);
    procedure IBT_PermissaoCalcFields(DataSet: TDataSet);
    procedure IBT_UsuNivelCalcFields(DataSet: TDataSet);
    procedure IBT_ConfigAfterDelete(DataSet: TDataSet);
    procedure IBT_ConfigAfterInsert(DataSet: TDataSet);
    procedure IBT_ConfigAfterPost(DataSet: TDataSet);
    procedure IBT_FichaAfterDelete(DataSet: TDataSet);
    procedure IBT_FichaAfterInsert(DataSet: TDataSet);
    procedure IBT_FichaAfterPost(DataSet: TDataSet);
    procedure IBT_FormaPagtoAfterDelete(DataSet: TDataSet);
    procedure IBT_FormaPagtoAfterInsert(DataSet: TDataSet);
    procedure IBT_FormaPagtoAfterPost(DataSet: TDataSet);
    procedure IBT_GrupoAfterDelete(DataSet: TDataSet);
    procedure IBT_GrupoAfterInsert(DataSet: TDataSet);
    procedure IBT_GrupoAfterPost(DataSet: TDataSet);
    procedure IBT_MesaFechaAfterDelete(DataSet: TDataSet);
    procedure IBT_MesaFechaAfterInsert(DataSet: TDataSet);
    procedure IBT_MesaFechaAfterPost(DataSet: TDataSet);
    procedure IBT_MesaItemAfterDelete(DataSet: TDataSet);
    procedure IBT_MesaItemAfterInsert(DataSet: TDataSet);
    procedure IBT_MesaItemAfterPost(DataSet: TDataSet);
    procedure IBT_PeriodoAfterDelete(DataSet: TDataSet);
    procedure IBT_PeriodoAfterInsert(DataSet: TDataSet);
    procedure IBT_PeriodoAfterPost(DataSet: TDataSet);
    procedure IBT_PontoVendaAfterDelete(DataSet: TDataSet);
    procedure IBT_PontoVendaAfterInsert(DataSet: TDataSet);
    procedure IBT_PontoVendaAfterPost(DataSet: TDataSet);
    procedure IBT_ProdutosAfterDelete(DataSet: TDataSet);
    procedure IBT_ProdutosAfterInsert(DataSet: TDataSet);
    procedure IBT_ProdutosAfterPost(DataSet: TDataSet);
    procedure IBT_TipoPagtoAfterDelete(DataSet: TDataSet);
    procedure IBT_TipoPagtoAfterInsert(DataSet: TDataSet);
    procedure IBT_TipoPagtoAfterPost(DataSet: TDataSet);
    procedure IBT_TributarAfterDelete(DataSet: TDataSet);
    procedure IBT_TributarAfterInsert(DataSet: TDataSet);
    procedure IBT_TributarAfterPost(DataSet: TDataSet);
    procedure IBT_TurnoAfterDelete(DataSet: TDataSet);
    procedure IBT_TurnoAfterInsert(DataSet: TDataSet);
    procedure IBT_TurnoAfterPost(DataSet: TDataSet);
    procedure IBT_UnidadeAfterDelete(DataSet: TDataSet);
    procedure IBT_UnidadeAfterInsert(DataSet: TDataSet);
    procedure IBT_UnidadeAfterPost(DataSet: TDataSet);
    procedure IBT_MesaFechaFAfterDelete(DataSet: TDataSet);
    procedure IBT_MesaFechaFAfterInsert(DataSet: TDataSet);
    procedure IBT_MesaFechaFAfterPost(DataSet: TDataSet);
    procedure IBT_MesaItemFAfterDelete(DataSet: TDataSet);
    procedure IBT_MesaItemFAfterInsert(DataSet: TDataSet);
    procedure IBT_MesaItemFAfterPost(DataSet: TDataSet);
    procedure IBT_FuncionarioAfterDelete(DataSet: TDataSet);
    procedure IBT_FuncionarioAfterInsert(DataSet: TDataSet);
    procedure IBT_FuncionarioAfterPost(DataSet: TDataSet);
    procedure IBT_UsuarioAfterDelete(DataSet: TDataSet);
    procedure IBT_UsuarioAfterInsert(DataSet: TDataSet);
    procedure IBT_UsuarioAfterPost(DataSet: TDataSet);
    procedure IBT_ModulosAfterDelete(DataSet: TDataSet);
    procedure IBT_ModulosAfterInsert(DataSet: TDataSet);
    procedure IBT_ModulosAfterPost(DataSet: TDataSet);
    procedure IBT_PermissaoAfterDelete(DataSet: TDataSet);
    procedure IBT_PermissaoAfterInsert(DataSet: TDataSet);
    procedure IBT_PermissaoAfterPost(DataSet: TDataSet);
    procedure IBT_NivelAfterDelete(DataSet: TDataSet);
    procedure IBT_NivelAfterInsert(DataSet: TDataSet);
    procedure IBT_NivelAfterPost(DataSet: TDataSet);
    procedure IBT_UsuNivelAfterDelete(DataSet: TDataSet);
    procedure IBT_UsuNivelAfterInsert(DataSet: TDataSet);
    procedure IBT_UsuNivelAfterPost(DataSet: TDataSet);
    procedure IBQ_USuNivelCalcFields(DataSet: TDataSet);
    procedure IBT_FichaCalcFields(DataSet: TDataSet);
    procedure IBQ_CalEstoqueCalcFields(DataSet: TDataSet);
    procedure MDM_CardapioMessageAvail(Sender: TObject; Msg: String);
    procedure IBQ_PermissaoFrenteCalcFields(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure IBT_TempTEFAfterDelete(DataSet: TDataSet);
    procedure IBT_TempTEFAfterPost(DataSet: TDataSet);
    procedure IBT_TempTefADMAfterPost(DataSet: TDataSet);
    procedure IBT_TempTefADMAfterDelete(DataSet: TDataSet);
    procedure BT_FormaPagtoAfterDelete(DataSet: TDataSet);
    procedure BT_FormaPagtoAfterInsert(DataSet: TDataSet);
    procedure BT_FormaPagtoAfterPost(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
    Procedure _IBCommit( DataSet: TDataSet );
    Procedure _IBCommitF( DataSet: TDataSet );
  end;

var
  FRM_Modulo: TFRM_Modulo;

implementation

//uses UNF_Funcoes, UNF_Entrada, UNF_Menu, UNF_Manutencao, UNF_TEF,
//     UNF_FuncoesECF;

uses UNF_Funcoes, UNF_Entrada, UNF_FuncoesECF;

{$R *.DFM}

procedure TFRM_Modulo.RedeAtualizaDados(Msg: String);
var
   AtualizaDataSet : Integer;
               reg : string;
begin
   for AtualizaDataSet := 0 to FRM_Modulo.ComponentCount -1 do
   begin
      if (FRM_Modulo.Components[AtualizaDataSet] is TIBTable) then
      begin
         if (TIBTable(FRM_Modulo.Components[AtualizaDataSet]).Name = copy(Msg,6,Length(Trim(Msg)))) and
            (TIBTable(FRM_Modulo.Components[AtualizaDataSet]).State in [dsBrowse]) then
         begin
            Reg := TIBTable(FRM_Modulo.Components[AtualizaDataSet]).Bookmark;
            TIBTable(FRM_Modulo.Components[AtualizaDataSet]).Close;
            TIBTable(FRM_Modulo.Components[AtualizaDataSet]).Open;
            TIBTable(FRM_Modulo.Components[AtualizaDataSet]).Bookmark := Reg;
         end;
      end;

      if (FRM_Modulo.Components[AtualizaDataSet] is TIBQuery) then
      begin
         if (TIBQuery(FRM_Modulo.Components[AtualizaDataSet]).Name = copy(Msg,6,Length(Trim(Msg)))) and
            (TIBQuery(FRM_Modulo.Components[AtualizaDataSet]).State in [dsBrowse]) then
         begin
            Reg := TIBQuery(FRM_Modulo.Components[AtualizaDataSet]).Bookmark;
            TIBQuery(FRM_Modulo.Components[AtualizaDataSet]).Close;
            TIBQuery(FRM_Modulo.Components[AtualizaDataSet]).Open;
            TIBQuery(FRM_Modulo.Components[AtualizaDataSet]).Bookmark := Reg;
         end;
      end;
   end;
end;

Procedure TFRM_Modulo._IBCommit( DataSet: TDataSet );
begin
   with DatabaseIB, IBTransaction1 Do
   begin
      try
        ApplyUpdates(DataSet);
        CommitRetaining;

        SendToMailSlot('*', MDM_Cardapio.Slot, 'AT - ' + DataSet.Name);
      except
        Mensagem('Transação não efetuada, será revertida.'+#13+#10+
                 'Favor tentar novamente.');
        RollbackRetaining;
        raise;
      end;
   end;
end;

Procedure TFRM_Modulo._IBCommitF( DataSet: TDataSet );
begin
   with DatabaseIBF, IBTransactionF Do
   begin
      try
        ApplyUpdates(DataSet);
        CommitRetaining;

        SendToMailSlot('*', MDM_Cardapio.Slot, 'AT - ' + DataSet.Name);
      except
        Mensagem('Transação não efetuada, será revertida.'+#13+#10+
                 'Favor tentar novamente.');
        RollbackRetaining;
        raise;
      end;
   end;
end;

procedure TFRM_Modulo.DataModuleCreate(Sender: TObject);
var
         VarUser_Name, VarPassword : string;
        Contador, Tabelas, i, ller : Integer;
        _Local,_Server,_Path,_Base : String;
    _LocalF,_ServerF,_PathF,_BaseF : String;
    _LocalO,_ServerO,_PathO,_BaseO : String;
                     NumVerificECF : String;
begin
   {Senha IB}
   VarUser_Name  := 'sysdba';
   VarPassword   := 'sysdbambd';
   xAbriuSISTEMA := False;

   Try
      if DataBaseIB.Connected = True then
         DataBaseIB.Connected := False;

      if DataBaseIBF.Connected = True then
         DataBaseIBF.Connected := False;

      if DataBaseIB.Connected = False then
         _app    := GetCurrentDir;

      cCaminho := _app;

      Ini     := TIniFile.Create( _app+'\CONFIG.INI' );

      { ALIAS 1}
      _Local   := Ini.ReadString( 'CONFBASE', 'LOCAL' , '' );
      _Server  := Ini.ReadString( 'CONFBASE', 'SERVER', '' );
      _Path    := Ini.ReadString( 'CONFBASE', 'PATH'  , '' );
      _Base    := Ini.ReadString( 'CONFBASE', 'BASE'  , '' );

      { ALIAS 2}
      _LocalF  := Ini.ReadString( 'BASEFECHA', 'LOCALF' , '' );
      _ServerF := Ini.ReadString( 'BASEFECHA', 'SERVERF', '' );
      _PathF   := Ini.ReadString( 'BASEFECHA', 'PATHF'  , '' );
      _BaseF   := Ini.ReadString( 'BASEFECHA', 'BASEF'  , '' );

      { ALIAS 3}
      _LocalO  := Ini.ReadString( 'BASEOLD', 'LOCALO' , '' );
      _ServerO := Ini.ReadString( 'BASEOLD', 'SERVERO', '' );
      _PathO   := Ini.ReadString( 'BASEOLD', 'PATHO'  , '' );
      _BaseO   := Ini.ReadString( 'BASEOLD', 'BASEO'  , '' );

      { Configura Caixa }
      xcaixa         := Ini.ReadString( 'CONFCAIXA', 'CAIXA'  , '' );
      xlocal         := Ini.ReadString( 'CONFCAIXA', 'LOCAL'  , '' );
      vECF_          := Ini.ReadString( 'CONFCAIXA', 'MODECF' , '' );

      VNumSerie_     := ini.ReadString( 'CONFCAIXA', 'NUMFABECF', '' );
      VTrueFalseEcf_ := ini.ReadString( 'CONFCAIXA', 'ECF'      , 'TRUE' );

      xTPMesaTicket       := Ini.ReadString('CONFCAIXA', 'TPMesaTicket'        , 'M');
      xImpRecibo          := Ini.ReadString('CONFCAIXA', 'ImpRecibo'           , 'N');
      xGuilhotina         := Ini.ReadString('CONFCAIXA', 'Guilhotina'          , 'N');
      xExpTicket          := Ini.ReadString('CONFCAIXA', 'ExpTicket'           , 'N');
      xPorta              := Ini.ReadString('CONFCAIXA', 'Porta'               , 'LPT1');
      xDiaria             := Ini.ReadString('CONFCAIXA', 'DIARIA'              , '');
      xDigito             := Ini.ReadString('CONFCAIXA', 'DIGITO'              , '');
      xLmpLixo            := Ini.ReadString('CONFCAIXA', 'LMPLIXO'             , 'N');
      xContraValeM        := Ini.ReadString('CONFCAIXA', 'CONTRAVALEM'         , 'N');
      xCONTRAVALE         := Ini.ReadString('CONFCAIXA', 'CONTRAVALE'          , 'F');
      xGaveta             := Ini.ReadString('CONFCAIXA', 'GAVETA'              , '');
      xGavetaAUT          := Ini.ReadString('CONFCAIXA', 'GAVETAAUT'           , 'S');
      xGavetaMAN          := Ini.ReadString('CONFCAIXA', 'GAVETAMAN'           , 'S');
      vTPIMPCOZ           := Ini.ReadInteger('CONFCAIXA','TPIMPCOZ'            , 0);
      vImpECFT            := Ini.ReadString('CONFCAIXA', 'ImpECFT'             , 'N');
      xTOLEDOCOM          := Ini.ReadInteger('CONFCAIXA','TOLEDOCOM'           , 0);
      xENTREGABAUT        := Ini.ReadString('CONFCAIXA', 'ENTREGABAUT'         , 'N');
      XImpReciboMensa     := Ini.ReadString('CONFCAIXA', 'ImpReciboMensa'      , 'N');
      _XTravaGavetaA      := ini.ReadString('CONFCAIXA', 'TravaGavetaA'        , 'N');
      _XQTDTRAVA          := ini.ReadString('CONFCAIXA', 'QTDTRAVA'            , '1000');
      _XRECALCPROD        := ini.ReadString('CONFCAIXA', 'RECALCPROD'          , 'N');
      _XVERIFICASALDOZERO := ini.ReadString('CONFCAIXA', 'VERIFICASALDOZERO'   , 'N');
      _XMODExpTicket      := ini.ReadString('CONFCAIXA', 'MODExpTicket'        , '');
      _XENTREGA           := ini.ReadString('CONFCAIXA', 'ENTREGA'             , 'N');
      xNUMFicha           := ini.ReadString('CONFCAIXA', 'NUMFicha'            , 'N');
      _XCUPOMISS          := ini.ReadString('CONFCAIXA', 'CUPOMISS'            , 'S');
      _XIMPCOMPROVDIARIA  := ini.ReadString('CONFCAIXA', 'IMPCOMPROVDIARIA'    , 'N');
      _XESCCANCELTICKET   := ini.ReadString('CONFCAIXA', 'ESCCANCELTICKET'     , 'N');
      _XMENSDESAF8        := ini.ReadString('CONFCAIXA', 'MENSDESAF8'          , 'N');
      _XTRAVAQUARTOFINA   := ini.ReadString('CONFCAIXA', 'TRAVAQUARTOFINA'     , 'N');
      _XEMPRESANOTKT      := ini.ReadString('CONFCAIXA', 'EMPRESANOTKT'        , 'N');
      _XTRAVAF7           := ini.ReadString('CONFCAIXA', 'TRAVAF7'             , 'N');
      _XLOGSISTEMA        := ini.ReadString('CONFCAIXA', 'LOGSISTEMA'          , 'S');
      xZERASEQDIA         := ini.ReadString('CONFCAIXA', 'ZERASEQDIA'          , 'S');
      _COMANDAIMPGRUPO    := ini.ReadString('CONFCAIXA', 'COMANDAIMPGRUPO'     , 'N');
      _AGRUPAITEMDIARIA   := ini.ReadString('CONFCAIXA', 'AGRUPAITEMDIARIA'    , 'N');
      _TRAVADIARIASEMFICHA:= ini.ReadString('CONFCAIXA', 'TRAVADIARIASEMFICHA' , 'N');
      _CONDPAGTODESCACRES := ini.ReadString('CONFCAIXA', 'CONDPAGTODESCACRES'  , 'N');
      _CAT51              := ini.ReadString('CONFCAIXA', 'CAT51'               , 'N');
      ANALISACLIENTE      := ini.ReadString('CONFCAIXA', 'ANALISACLIENTE'      , 'S');
      _IMPCOMANDPEND      := ini.ReadString('CONFCAIXA', 'IMPCOMANDPEND'       , 'N');
      _IMPCOMANDHORA      := ini.ReadString('CONFCAIXA', 'IMPCOMANDHORA'       , 'N');
      _DESCANCDIA         := ini.ReadString('CONFCAIXA', 'DESCANCDIA'          , 'N');
      _PERCANCUNICO       := ini.ReadString('CONFCAIXA', 'PERCANCUNICO'        , 'N');
      _APEGENCANCDIA      := ini.ReadString('CONFCAIXA', 'APEGENCANCDIA'       , 'N');
      _APEGENTRANDIA      := ini.ReadString('CONFCAIXA', 'APEGENTRANDIA'       , 'N');
      xCORTESIAATIVO      := Ini.ReadString('CONFCAIXA', 'CORTESIA'            , 'N');
      xTPBAL              := Ini.ReadString('CONFCAIXA', 'TPBAL'               , '1');
      TPDIAMES            := Ini.ReadString('CONFCAIXA', 'TPDIAMES'            , 'D');
      xTPImpTK            := Ini.Readinteger('CONFCAIXA','TPImpTK'             , 0);
      xTKItemAg           := Ini.ReadString('CONFCAIXA', 'TKItemAg'            , 'N');
      xTOTALNORECEBIDO    := Ini.ReadString('CONFCAIXA', 'TOTALNORECEBIDO'     , 'N');
      xMTREINA            := Ini.ReadString('CONFCAIXA', 'MTREINA'             , 'N');
      xOBSERVACAOFRENTE   := Ini.ReadString('CONFCAIXA', 'OBSERVACAOFRENTE'    , 'N');
      xCONTVIAS           := Ini.ReadInteger('CONFCAIXA','CONTVIAS'            , 1);
      xSAIRSN             := Ini.ReadString('CONFCAIXA', 'SAIRSN'              , 'N');
      _RELWEB             := Ini.ReadString('CONFCAIXA', 'RELWEB'              , 'N');
      xATIVAVIASTIQUET    := Ini.ReadString('CONFCAIXA', 'ATIVAVIASTIQUET'     , 'N');
      xIDENTMESAF9        := Ini.ReadString('CONFCAIXA', 'IDENTMESAF9'         , 'N');
      xBuscaECF           := Ini.ReadString('CONFCAIXA', 'BuscaECF'            , '1');
      xModImpCoz          := Ini.ReadString('CONFCAIXA', 'ModImpCoz'           , '1');
      xPortaECF           := Ini.ReadString('CONFCAIXA', 'PORTAECF'            , 'COM1');
      _AbasSangriaF2F6    := Ini.ReadString('CONFCAIXA', 'AbasSangriaF2F6'     , 'N');
      xTpImpPorta         := Ini.ReadString('CONFCAIXA', 'TpImpPorta'          , '');

      xDividePesoPor      := Ini.ReadInteger('FABRICANTEBALANCA','DIVIDEPESOPOR', 1000);
      BALANCA             := UpperCase(Ini.ReadString('FABRICANTEBALANCA','FABBALANCA', 'TOL'));
      VELOTOL             := Ini.ReadInteger('FABRICANTEBALANCA','VELOTOL', 2400);

      //Bemacash ...............................................................
      vARQUIVOOFF         := Ini.ReadString( 'BEMACASH','ARQUIVOOFF','C:\MBD\');
      vADDDV              := Ini.ReadString( 'BEMACASH','ADDDV','N');
      //........................................................................

      if VELOTOL = 2400 then
         VELOTOL := 0

      else if VELOTOL = 4800 then
         VELOTOL := 1

      else if VELOTOL = 9600 then
         VELOTOL := 2

      else if (VELOTOL <> 2400) and (VELOTOL <> 4800) and (VELOTOL <> 9600) then
         VELOTOL := 0;


      //{tefMBD}
      //LeIniMODULO;

      {se for daruma coloca para expandir observacao do cupom}
      if vECF_ = 'D' then
      begin
         TagExpand      := '<e><b>';
         TagFechaExpand := '</b></e>';
      end
      else
      begin
         TagExpand      := '';
         TagFechaExpand := '';
      end;

      { ALIAS 1}
      if UpperCase(_Local) = 'FALSE' then
         DataBaseIB.DatabaseName := _Server+':'+_Path+_Base
      else
         DataBaseIB.DatabaseName := _Path+_Base;

      DataBaseIB.Params.Clear;
      DataBaseIB.Params.Add('user_name='+VarUser_Name);
      DataBaseIB.Params.Add('password='+VarPassword);
      DataBaseIB.Connected;
      DataBaseIB.Open;
      IBTransaction1.Active := true;
      IBTransaction_Commit.Active := true;

      { ALIAS 2}
      if UpperCase(_LocalF) = 'FALSE' then
         DataBaseIBF.DatabaseName := _ServerF+':'+_PathF+_BaseF
      else
         DataBaseIBF.DatabaseName := _PathF+_BaseF;

      { ALIAS 2}
      DataBaseIBF.Params.Clear;
      DataBaseIBF.Params.Add('user_name='+VarUser_Name);
      DataBaseIBF.Params.Add('password='+VarPassword);
      DataBaseIBF.Connected;
      DataBaseIBF.Open;
      IBTransactionF.Active := true;

      { ALIAS 3}
      if UpperCase(_LocalF) = 'FALSE' then
         DataBaseIBO.DatabaseName := _ServerO+':'+_PathO+_BaseO
      else
         DataBaseIBO.DatabaseName := _PathO+_BaseO;

      { ALIAS 3}
      DataBaseIBO.Params.Clear;
      DataBaseIBO.Params.Add('user_name='+VarUser_Name);
      DataBaseIBO.Params.Add('password='+VarPassword);
      DataBaseIBO.Connected;
      DataBaseIBO.Open;
      IBTransactionO.Active := true;

      Ini.Free;
   except
     if _Base = '' then
        Mensagem('Arquivo Config.ini não encontrado.'+#13+#10+
                 'Seu sistema será fechado!!!')
     else
        Mensagem('Ocorreu um erro na Abertura da Base'+#13+#10+
                 'Seu sistema será fechado!!!');

     Application.Terminate;
     Exit;
   end;

   Contador := 0;

   for i := 0 to FRM_Modulo.ComponentCount -1 do
   begin
      if (Frm_Modulo.Components[i] is TIBTable) then
      begin
         if not(TIBTable(Frm_Modulo.Components[i]).Active) then
         begin
            Inc(Contador);
         end;
      end;
      if (Frm_Modulo.Components[i] is TIBQuery) then
      begin
         if not(TIBQuery(Frm_Modulo.Components[i]).Active) then
         begin
            Inc(Contador);
         end;
      end;
      if (Frm_Modulo.Components[i] is TIBDataSet) then
      begin
         if not(TIBDataSet(Frm_Modulo.Components[i]).Active) then
         begin
            Inc(Contador);
         end;
      end;
   end;

   Frm_entrada.GGE_Progresso.MaxValue := Contador;

   Tabelas := Frm_entrada.GGE_Progresso.MaxValue div Contador;

   For i := 0 to FRM_Modulo.ComponentCount -1 do
   begin
      if (Frm_Modulo.Components[i] is TIBTable) then
      begin
         if not(TIBTable(Frm_Modulo.Components[i]).Active) then
         begin
            try
               TIBTable(Frm_Modulo.Components[i]).Open;
               Frm_entrada.GGE_Progresso.AddProgress(Tabelas);
            except
               Mensagem('Problemas na abertura da tabela ['+
                         TIBTable(Frm_Modulo.Components[i]).TableName+']'+#13+#10+
                        'Seu sistema será fechado!!!');
                        
               Application.Terminate;
               Exit;
            end;
         end;
      end;

      if (Frm_Modulo.Components[i] is TIBQuery) then
      begin
         if not(TIBQuery(Frm_Modulo.Components[i]).Active) then
         begin
            try
              TIBQuery(Frm_Modulo.Components[i]).Open;
              Frm_entrada.GGE_Progresso.AddProgress(Tabelas);
            except
              Mensagem('Problemas na abertura da tabela ['+
                        TIBQuery(Frm_Modulo.Components[i]).Name + ']' +#13 +#10 +
                       'Seu sistema será fechado!!!');
              Application.Terminate;
              Exit;
            end;
         end;
      end;

      if (Frm_Modulo.Components[i] is TIBDataSet) then
      begin
         if not(TIBDataSet(Frm_Modulo.Components[i]).Active) then
         begin
            try
               TIBDataSet(Frm_Modulo.Components[i]).Open;
               Frm_entrada.GGE_Progresso.AddProgress(Tabelas);
            except
               Mensagem('Problemas na abertura da tabela ['+
                         TIBDataSet(Frm_Modulo.Components[i]).Name+']'+#13+#10+
                        'Seu sistema será fechado!!!');
               Application.Terminate;
               Exit;
            end;
         end;
      end;
   end;

   //{cadastra os botoes dos menus para as permissoes}
   //if FRM_Menu = nil then
   //   FRM_Menu := TFRM_Menu.Create(Application);
   //
   //for ller := 0  to FRM_Menu.ComponentCount -1 do
   //begin
   //   if FRM_Menu.Components[ller] is TRxSpeedButton then
   //   begin
   //      IBQ_ModulosFrente.Close;
   //      IBQ_ModulosFrente.SQL.Clear;
   //      IBQ_ModulosFrente.SQL.Add('Select *');
   //      IBQ_ModulosFrente.SQL.Add('From MODULOFRENTE');
   //      IBQ_ModulosFrente.SQL.Add('Where upper(MOD_NAME) = :P_name');
   //      IBQ_ModulosFrente.ParamByName('P_name').Value := UpperCase(copy(TRxSpeedButton(FRM_Menu.Components[ller]).Name,1,120));
   //      IBQ_ModulosFrente.Open;
   //
   //      if IBQ_ModulosFrente.RecordCount = 0 then
   //      begin
   //         IBQ_AtualizaModulosFrente.Close;
   //         IBQ_AtualizaModulosFrente.SQL.Clear;
   //         IBQ_AtualizaModulosFrente.SQL.Add('INSERT INTO MODULOFRENTE (CODIGO_ID, MODULO, MOD_NAME, BOT_NAME)');
   //         IBQ_AtualizaModulosFrente.SQL.Add('                  VALUES (0, :P_MODULO, :P_MOD_NAME, :P_BOT_NAME)');
   //
   //         IBQ_AtualizaModulosFrente.ParamByName('P_MODULO').Value       := stuff(copy(TRxSpeedButton(FRM_Menu.Components[ller]).Caption,1,120),'&','');
   //         IBQ_AtualizaModulosFrente.ParamByName('P_MOD_NAME').Value     := copy(TRxSpeedButton(FRM_Menu.Components[ller]).Name,1,120);
   //         IBQ_AtualizaModulosFrente.ParamByName('P_BOT_NAME').AsString  := '';
   //         IBQ_AtualizaModulosFrente.ExecSQL;
   //
   //         FRM_Modulo.IBTransaction1.CommitRetaining;
   //      end;
   //   end;
   //end;
   //
   //FRM_Menu.Free;
   //FRM_Menu := nil;
   //
   //if FRM_Manutencao = nil then
   //   FRM_Manutencao := TFRM_Manutencao.Create(Application);
   //
   //for ller := 0  to FRM_Manutencao.ComponentCount -1 do
   //begin
   //   if FRM_Manutencao.Components[ller] is TRxSpeedButton then
   //   begin
   //      IBQ_ModulosFrente.Close;
   //      IBQ_ModulosFrente.SQL.Clear;
   //      IBQ_ModulosFrente.SQL.Add('Select *');
   //      IBQ_ModulosFrente.SQL.Add('From MODULOFRENTE');
   //      IBQ_ModulosFrente.SQL.Add('Where upper(MOD_NAME) = :P_name');
   //      IBQ_ModulosFrente.ParamByName('P_name').Value := UpperCase(copy(TRxSpeedButton(FRM_Manutencao.Components[ller]).Name,1,120));
   //      IBQ_ModulosFrente.Open;
   //
   //      if IBQ_ModulosFrente.RecordCount = 0 then
   //      begin
   //         IBQ_AtualizaModulosFrente.Close;
   //         IBQ_AtualizaModulosFrente.SQL.Clear;
   //         IBQ_AtualizaModulosFrente.SQL.Add('INSERT INTO MODULOFRENTE (CODIGO_ID, MODULO, MOD_NAME, BOT_NAME)');
   //         IBQ_AtualizaModulosFrente.SQL.Add('                  VALUES (0, :P_MODULO, :P_MOD_NAME, :P_BOT_NAME)');
   //
   //         IBQ_AtualizaModulosFrente.ParamByName('P_MODULO').Value       := stuff(copy(TRxSpeedButton(FRM_Manutencao.Components[ller]).Caption,1,120),'&','');
   //         IBQ_AtualizaModulosFrente.ParamByName('P_MOD_NAME').Value     := copy(TRxSpeedButton(FRM_Manutencao.Components[ller]).Name,1,120);
   //         IBQ_AtualizaModulosFrente.ParamByName('P_BOT_NAME').AsString  := '';
   //         IBQ_AtualizaModulosFrente.ExecSQL;
   //
   //         FRM_Modulo.IBTransaction1.CommitRetaining;
   //      end;
   //   end;
   //end;
   //
   //FRM_Manutencao.Free;
   //FRM_Manutencao := nil;

   Frm_entrada.GGE_Progresso.Progress := 100;

   { Acertar a Hora }
   SetDTHR(True);

   {tefMBD}
   //LimpaBufferABRIRSISTEMA;
   //fLogin := True;
   //
   //{Acertar Numero ECF}
   //if VTrueFalseEcf_ <> 'FALSE' then
   //begin
   //   FRM_Entrada.EDT_NumFabECF.Text := NumSerie();
   //   NumVerificECF := FRM_Entrada.EDT_NumFabECF.Text;
   //end
   //else if (VTrueFalseEcf_ = 'FALSE') and (vTEFSN = False) then
   //begin
   //   vCupom := False
   //end;
   //
   //if (AllTrim(copy(VNumSerie_,1,15)) <> NumVerificECF) and (VTrueFalseEcf_ <> 'FALSE') then
   //   Mensagem('Numero da ECF não coincide com o Configurado !!!' +#13 +#10 +
   //            'Para VENDER é altamente recomendado que a numeração esteja correta.');
   //
   //xAbriuSISTEMA := True;
end;

procedure TFRM_Modulo.IBT_CargoAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_CargoAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.IBT_CargoAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_PermissaoCalcFields(DataSet: TDataSet);
begin
   IBT_PermissaoDesModulo.AsString    := crypt(IBT_PermissaoMODULO.AsString);
   IBT_PermissaoDesPermissao.AsString := crypt(IBT_PermissaoPERMISSAO.AsString);
end;

procedure TFRM_Modulo.IBT_UsuNivelCalcFields(DataSet: TDataSet);
begin
   IBT_UsuNivelDesLogin.AsString := crypt(IBT_UsuNivelLOGIN.AsString);
end;

procedure TFRM_Modulo.IBT_ConfigAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_ConfigAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.IBT_ConfigAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_FichaAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_FichaAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.IBT_FichaAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_FormaPagtoAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_FormaPagtoAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.IBT_FormaPagtoAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_GrupoAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_GrupoAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.IBT_GrupoAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_MesaFechaAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_MesaFechaAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.IBT_MesaFechaAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_MesaItemAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_MesaItemAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.IBT_MesaItemAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_PeriodoAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_PeriodoAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.IBT_PeriodoAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_PontoVendaAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_PontoVendaAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.IBT_PontoVendaAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_ProdutosAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_ProdutosAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.IBT_ProdutosAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_TipoPagtoAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_TipoPagtoAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.IBT_TipoPagtoAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_TributarAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_TributarAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.IBT_TributarAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_TurnoAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_TurnoAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.IBT_TurnoAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_UnidadeAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_UnidadeAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.IBT_UnidadeAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_MesaFechaFAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_MesaFechaFAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.IBT_MesaFechaFAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_MesaItemFAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_MesaItemFAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.IBT_MesaItemFAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_FuncionarioAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_FuncionarioAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.IBT_FuncionarioAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_UsuarioAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_UsuarioAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.IBT_UsuarioAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_ModulosAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_ModulosAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.IBT_ModulosAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_PermissaoAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_PermissaoAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.IBT_PermissaoAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_NivelAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_NivelAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.IBT_NivelAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_UsuNivelAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_UsuNivelAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.IBT_UsuNivelAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBQ_USuNivelCalcFields(DataSet: TDataSet);
begin
   IBQ_UsuNivelDesLogin.AsString := crypt(IBQ_UsuNivelLOGIN.AsString);
end;

procedure TFRM_Modulo.IBT_FichaCalcFields(DataSet: TDataSet);
begin
   IBT_FichaDescFicha.Value := FormatFloat('0000',IBT_FichaFICHA.Value) +
                               IBT_FichaDIGITO.AsString;
end;

procedure TFRM_Modulo.IBQ_CalEstoqueCalcFields(DataSet: TDataSet);
//begin
////    if (IBQ_CalEstoqueQTDSALDO.AsCurrency <> 0.00) then
////       IBQ_CalEstoquecPreMedio.AsCurrency := IBQ_CalEstoqueVALSALDO.AsCurrency / IBQ_CalEstoqueQTDSALDO.AsCurrency
////    else
////       IBQ_CalEstoquecPreMedio.AsCurrency := 0.00;
//
//    if ((Round((IBQ_CalEstoqueQTDSAIDA.AsFloat*1000))/1000) <> 0.00) then
//       IBQ_CalEstoquecPreMedio.AsCurrency := (Round((IBQ_CalEstoqueVALSAIDA.AsFloat*1000))/1000) / (Round((IBQ_CalEstoqueQTDSAIDA.AsFloat*1000))/1000)
//    else
//       IBQ_CalEstoquecPreMedio.AsCurrency := (Round((IBQ_CalEstoqueVALENTRADA.AsFloat*1000))/1000) / (Round((IBQ_CalEstoqueQTDENTRADA.AsFloat*1000))/1000);

var
   xPrecoMedio: Currency;
begin
    xPrecoMedio := 0;

    if (IBQ_CalEstoqueVALSAIDA.AsFloat <> 0.00) and (IBQ_CalEstoqueQTDSAIDA.AsFloat <> 0.00) then
       xPrecoMedio := (Round((IBQ_CalEstoqueVALSAIDA.AsFloat*1000))/1000) / (Round((IBQ_CalEstoqueQTDSAIDA.AsFloat*1000))/1000);

    if (IBQ_CalEstoqueVALENTRADA.AsFloat <> 0.00) and (IBQ_CalEstoqueQTDENTRADA.AsFloat <> 0.00) then
       xPrecoMedio := (Round((IBQ_CalEstoqueVALENTRADA.AsFloat*1000))/1000) / (Round((IBQ_CalEstoqueQTDENTRADA.AsFloat*1000))/1000);

    IBQ_CalEstoquecPreMedio.AsCurrency := xPrecoMedio;
end;

procedure TFRM_Modulo.MDM_CardapioMessageAvail(Sender: TObject;
  Msg: String);
begin
  MDM_Cardapio.Active := False;

  if copy(Msg,1,2) = 'AT' then
    RedeAtualizaDados(Msg);

  MDM_Cardapio.Active := True;
end;

procedure TFRM_Modulo.IBQ_PermissaoFrenteCalcFields(DataSet: TDataSet);
begin
   IBQ_PermissaoFrenteDesModulo.AsString    := crypt(IBQ_PermissaoFrenteMODULO.AsString);
   IBQ_PermissaoFrenteDesPermissao.AsString := crypt(IBQ_PermissaoFrentePERMISSAO.AsString);
end;

procedure TFRM_Modulo.DataModuleDestroy(Sender: TObject);
begin
   {desliga a trava}
   SystemParametersInfo(97, Word(False), @OldValue, 0);
end;

procedure TFRM_Modulo.IBT_TempTEFAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_TempTEFAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_TempTefADMAfterPost(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.IBT_TempTefADMAfterDelete(DataSet: TDataSet);
begin
  _IBCommit(DataSet);
end;

procedure TFRM_Modulo.BT_FormaPagtoAfterDelete(DataSet: TDataSet);
begin
   _IBCommit(DataSet);
end;

procedure TFRM_Modulo.BT_FormaPagtoAfterInsert(DataSet: TDataSet);
begin
   DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_Modulo.BT_FormaPagtoAfterPost(DataSet: TDataSet);
begin
   _IBCommit(DataSet);
end;

end.
