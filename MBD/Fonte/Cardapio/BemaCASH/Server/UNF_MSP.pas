unit UNF_MSP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, IBDatabase, DB, ShellAPI, IniFileS, IBCustomDataSet,
  IBQuery, ExtCtrls, StdCtrls, ComCtrls, Grids, DBGrids, jpeg, IBTable, DateUtils,
  ADODB;

Const
   WM_TRAYICON = WM_USER+1;

type
    TFRM_MSP = class(TForm)
    MNM_Lista: TMemo;
    IBTransaction1: TIBTransaction;
    DataBaseIB: TIBDatabase;
    PPP_Principal: TPopupMenu;
    Sair1: TMenuItem;
    StatusBar1: TStatusBar;
    TRM_ProcessarPedido: TTimer;
    IBQ_Funcionario: TIBQuery;
    DTS_Funcionario: TDataSource;
    IBQ_FunFicha: TIBQuery;
    IBQ_FuncionarioCODIGO_ID: TIntegerField;
    IBQ_FuncionarioDESCRICAO: TIBStringField;
    IBQ_FuncionarioPONTOVENDA: TIntegerField;
    IBQ_FuncionarioDT_NASCTO: TDateField;
    IBQ_FuncionarioENDERECO: TIBStringField;
    IBQ_FuncionarioBAIRRO: TIBStringField;
    IBQ_FuncionarioCIDADE: TIBStringField;
    IBQ_FuncionarioTELEFONE: TIBStringField;
    IBQ_FuncionarioATIVO: TIBStringField;
    IBQ_FuncionarioADMISSAO: TDateField;
    IBQ_FuncionarioDEMISSAO: TDateField;
    IBQ_Funcionarioturno: TIntegerField;
    IBQ_FuncionarioCARGO: TIntegerField;
    IBQ_FuncionarioSTATUS: TIBStringField;
    IBQ_FuncionarioOBSERVACAO: TBlobField;
    IBQ_FuncionarioMOVEL: TIBStringField;
    IBQ_FuncionarioCOMISSAO: TFloatField;
    IBQ_FuncionarioRG: TIBStringField;
    IBQ_FuncionarioCPF: TIBStringField;
    IBQ_FuncionarioDT_ATESTADO: TDateField;
    IBQ_FunFichaCODIGO_ID: TIntegerField;
    IBQ_FunFichaFICHA: TIntegerField;
    IBQ_FunFichaSEQUENCIA: TIntegerField;
    IBQ_FunFichaSTATUS: TIBStringField;
    IBQ_FunFichaATIVO: TIBStringField;
    IBQ_FunFichaCONSULTA: TIBStringField;
    IBQ_FunFichaTRAVA: TIBStringField;
    IBQ_FunFichaDIGITO: TSmallintField;
    IBQ_FunFichaTP_FICHA: TIBStringField;
    IBQ_FunFichaOPERADOR: TIntegerField;
    IBQ_FunFichaPRODUCAO: TIBStringField;
    IBQ_FunFichaQUARTO: TIBStringField;
    IBQ_FunFichaTAXA: TIBStringField;
    IBQ_FunFichaMOVEL: TIBStringField;
    IBQ_FunFichaFINALIZADA: TIBStringField;
    IBQ_FunFichaXFICHA: TIBStringField;
    IBQ_FunFichaIDFICHA: TIBStringField;
    IBQ_FunFichaGARCOM: TIntegerField;
    IBQ_FunFichaFECHANDO: TIBStringField;
    IBQ_Sequencia: TIBQuery;
    IBQ_SequenciaXCOD_ID: TLargeintField;
    IBQ_Gravar: TIBQuery;
    IBQ_Produtos: TIBQuery;
    IBQ_ProdutosCODIGO_ID: TIntegerField;
    IBQ_ProdutosPRODUTO: TIBStringField;
    IBQ_ProdutosDESCRICAO: TIBStringField;
    IBQ_ProdutosPRECO: TFloatField;
    IBQ_ProdutosPRECOCUSTO: TFloatField;
    IBQ_ProdutosGRUPO: TIntegerField;
    IBQ_ProdutosICMS_SN: TIBStringField;
    IBQ_ProdutosTRIBUTAR: TIntegerField;
    IBQ_ProdutosBALANCA: TIBStringField;
    IBQ_ProdutosTARA: TFloatField;
    IBQ_ProdutosUNIDADE: TIntegerField;
    IBQ_ProdutosATIVO: TIBStringField;
    IBQ_ProdutosCOMANDA: TIBStringField;
    IBQ_ProdutosLOCAL_IMP: TIntegerField;
    IBQ_ProdutosDESCONTO: TFloatField;
    IBQ_ProdutosACRESCIMO: TFloatField;
    IBQ_ProdutosPROD_MTN: TIntegerField;
    IBQ_ProdutosESTOQUE: TIBStringField;
    IBQ_ProdutosESTNEGATIVO: TIBStringField;
    IBQ_ProdutosESTOQUE_FISICO: TFloatField;
    IBQ_ProdutosESTOQUE_VIRTUAL: TFloatField;
    IBQ_ProdutosESTOQUEMIN: TFloatField;
    IBQ_ProdutosESTOQUEMAX: TFloatField;
    IBQ_ProdutosTEMPO: TIBStringField;
    IBQ_ProdutosDIA_PROD: TIBStringField;
    IBQ_ProdutosIMP_PERS: TIBStringField;
    IBQ_ProdutosVALSALDOENT: TFloatField;
    IBQ_ProdutosQTDSALDOENT: TFloatField;
    IBQ_ProdutosTAXA: TFloatField;
    IBQ_ProdutosTAXA_SN: TIBStringField;
    IBQ_ProdutosLUCRO: TFloatField;
    IBQ_ProdutosMOVEL: TIBStringField;
    IBQ_ProdutosPIS: TFloatField;
    IBQ_ProdutosREDUCAOICMS: TFloatField;
    IBQ_ProdutosCOFINS: TFloatField;
    IBQ_ProdutosICMS: TFloatField;
    IBQ_ProdutosTRIBUTAR_ANTIGO: TIntegerField;
    IBQ_ProdutosTRIBUTAR_FORA_ANTIGO: TIntegerField;
    IBQ_ProdutosPRECO_AGREGADO: TFloatField;
    IBQ_ProdutosTRIBUTAR_FORA: TIntegerField;
    IBQ_ProdutosCST: TIntegerField;
    IBQ_ProdutosCOMISSAO: TFloatField;
    IBQ_ProdutosCOMISPRSN: TIBStringField;
    IBQ_ProdutosITEMDATASUL: TIBStringField;
    IBQ_ProdutosCLASSFISC_DATASUL: TIBStringField;
    IBQ_ProdutosNATOPERACAO_DATASUL: TIBStringField;
    IBQ_ProdutosUNITEM_DATASUL: TIBStringField;
    IBQ_ProdutosUNFAMI_DATASUL: TIBStringField;
    IBQ_ProdutosCODTRIB_DATASUL: TIBStringField;
    IBQ_ProdutosPERREDUCAOICMS_DATASUL: TIBStringField;
    IBQ_ProdutosNIVEL_ISENTO: TIntegerField;
    IBQ_ProdutosOBSFRENTE: TIBStringField;
    IBQ_ProdutosNCM: TIBStringField;
    IBQ_ProdutosBXCARTELA: TIBStringField;
    IBQ_ProdutosMONTAR: TIBStringField;
    IBQ_ProdutosTIPO: TIBStringField;
    IBQ_ProdutosESTLISTA_SN: TIBStringField;
    IBQ_ProdutosST_ICMSE: TIntegerField;
    IBQ_ProdutosST_ICMSS: TIntegerField;
    IBQ_ProdutosST_IPI: TIntegerField;
    IBQ_ProdutosST_PIS: TIntegerField;
    IBQ_ProdutosST_COFINS: TIntegerField;
    IBQ_ProdutosICMSS: TFloatField;
    IBQ_ProdutosREDS: TFloatField;
    IBQ_ProdutosIPI: TFloatField;
    IBQ_ProdutosCODSERVICO: TIBStringField;
    IBQ_ProdutosISSQN: TFloatField;
    IBQ_ProdutosCF: TIBStringField;
    IBQ_ProdutosEXTIPI: TIBStringField;
    IBQ_ProdutosMODALIDADEBC: TIBStringField;
    DTS_Produtos: TDataSource;
    IBT_Aliquota: TIBTable;
    IBT_AliquotaCODIGO_ID: TIntegerField;
    IBT_AliquotaCODIGO: TIBStringField;
    IBT_AliquotaDESCRICAO: TIBStringField;
    IBT_AliquotaALIQUOTA: TFloatField;
    IBT_AliquotaSITUACAO: TIBStringField;
    IBT_AliquotaSSITUACAO: TIBStringField;
    IBT_AliquotaALIQUO: TIBStringField;
    IBQ_FormaPagto: TIBQuery;
    IBQ_FormaPagtoCODIGO_ID: TIntegerField;
    IBQ_FormaPagtoDESCONTO: TFloatField;
    IBQ_FormaPagtoTIPOPAGTO: TIntegerField;
    IBQ_FormaPagtoMULTFORM: TIBStringField;
    IBQ_FormaPagtoTEF: TIBStringField;
    IBQ_FormaPagtoTIPO: TIBStringField;
    IBQ_FormaPagtoDESCRICAO: TIBStringField;
    IBQ_FormaPagtoDIAS: TIntegerField;
    IBQ_FormaPagtoQTDTICKET: TIntegerField;
    IBQ_FormaPagtoATIVO: TIBStringField;
    IBQ_FormaPagtoACRESCIMO: TFloatField;
    IBQ_FormaPagtoCORTESIA: TIBStringField;
    IBQ_FormaPagtoDOCVINC: TIBStringField;
    DTS_FormaPagto: TDataSource;
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
    IBQ_MovEstoque: TIBQuery;
    DTQ_MovEstoque: TDataSource;
    IBT_MovEstoque: TIBTable;
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
    IBT_MovEstoqueDATA: TDateTimeField;
    DTS_MovEstoque: TDataSource;
    IBQ_EstGravar: TIBQuery;
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
    IBQ_EstGravarDATA: TDateTimeField;
    IBQ_CalEstoque: TIBQuery;
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
    IBQ_CalEstoquecPreMedio: TCurrencyField;
    IBQ_CalEstoqueDATA: TDateTimeField;
    IBQ_GravaProd: TIBQuery;
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
    IBQ_GravaProdESTOQUE_FISICO: TFloatField;
    IBQ_GravaProdESTOQUE_VIRTUAL: TFloatField;
    IBQ_GravaProdVALSALDOENT: TFloatField;
    IBQ_GravaProdQTDSALDOENT: TFloatField;
    IBQ_GraEstProd: TIBQuery;
    IBQ_Ficha: TIBQuery;
    IBQ_FichaCODIGO_ID: TIntegerField;
    IBQ_FichaFICHA: TIntegerField;
    IBQ_FichaSEQUENCIA: TIntegerField;
    IBQ_FichaSTATUS: TIBStringField;
    IBQ_FichaATIVO: TIBStringField;
    IBQ_FichaCONSULTA: TIBStringField;
    IBQ_FichaTRAVA: TIBStringField;
    IBQ_FichaDIGITO: TSmallintField;
    IBQ_FichaTP_FICHA: TIBStringField;
    IBQ_FichaOPERADOR: TIntegerField;
    IBQ_FichaPRODUCAO: TIBStringField;
    IBQ_FichaQUARTO: TIBStringField;
    IBQ_FichaTAXA: TIBStringField;
    IBQ_FichaMOVEL: TIBStringField;
    IBQ_FichaFINALIZADA: TIBStringField;
    IBQ_FichaXFICHA: TIBStringField;
    IBQ_FichaIDFICHA: TIBStringField;
    IBQ_FichaGARCOM: TIntegerField;
    IBQ_FichaFECHANDO: TIBStringField;
    IBQ_Pesquisa: TIBQuery;
    IBQ_PesCancela: TIBQuery;
    IBQ_PesCancelaCODIGO_ID: TIntegerField;
    IBQ_PesCancelaMESA: TIntegerField;
    IBQ_PesCancelaSEQUENCIA: TIntegerField;
    IBQ_PesCancelaGARCOM: TIntegerField;
    IBQ_PesCancelaPRODUTO: TIntegerField;
    IBQ_PesCancelaQUANTIDADE: TFloatField;
    IBQ_PesCancelaCANCELADA: TIBStringField;
    IBQ_PesCancelaIMP_REMOTA: TIBStringField;
    IBQ_PesCancelaPONTOVENDA: TIntegerField;
    IBQ_PesCancelaHORA: TIBStringField;
    IBQ_PesCancelaDATE: TDateField;
    IBQ_PesCancelaMESAFECHA: TIntegerField;
    IBQ_PesCancelaSEQFECHA: TIntegerField;
    IBQ_PesCancelaGRUPO: TIntegerField;
    IBQ_PesCancelaPRC_UNITARIO: TFloatField;
    IBQ_PesCancelaBALANCA: TIBStringField;
    IBQ_PesCancelaHO: TIBStringField;
    IBQ_PesCancelaTEMPO: TDateTimeField;
    IBQ_PesCancelaOPCANCEL: TIntegerField;
    IBQ_PesCancelaALIQUOTA: TIntegerField;
    IBQ_PesCancelaDATA_INICIO: TDateField;
    IBQ_PesCancelaDATA_FINAL: TDateField;
    IBQ_PesCancelaHORA_INICIO: TIBStringField;
    IBQ_PesCancelaHORA_FINAL: TIBStringField;
    IBQ_PesCancelaTEMPO_INICIAL: TDateTimeField;
    IBQ_PesCancelaTEMPO_FINAL: TDateTimeField;
    IBQ_PesCancelaDESCONTO: TFloatField;
    IBQ_PesCancelaFINALIZADA: TIBStringField;
    IBQ_PesCancelaOBS: TIBStringField;
    IBQ_PesCancelaIMP_DIARIA: TIBStringField;
    IBQ_PesCancelaIMP_CONTINT: TIBStringField;
    IBQ_PesCancelaIMP_CANCELINT: TIBStringField;
    IBQ_PesCancelaCLIENTEDIARIA: TIntegerField;
    IBQ_PesCancelaACRESCIMO: TFloatField;
    IBQ_PesCancelaTAXA: TFloatField;
    IBQ_PesCancelaVAL_DESCONTO: TFloatField;
    IBQ_PesCancelaVAL_ACRESCIMO: TFloatField;
    IBQ_PesCancelaVAL_TAXA: TFloatField;
    IBQ_PesCancelaVAL_PRODUTO: TFloatField;
    IBT_Produtos: TIBTable;
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
    IBT_ProdutosDESCONTO: TFloatField;
    IBT_ProdutosACRESCIMO: TFloatField;
    IBT_ProdutosPROD_MTN: TIntegerField;
    IBT_ProdutosESTOQUE: TIBStringField;
    IBT_ProdutosESTNEGATIVO: TIBStringField;
    IBT_ProdutosESTOQUE_FISICO: TFloatField;
    IBT_ProdutosESTOQUE_VIRTUAL: TFloatField;
    IBT_ProdutosESTOQUEMIN: TFloatField;
    IBT_ProdutosESTOQUEMAX: TFloatField;
    IBT_ProdutosTEMPO: TIBStringField;
    IBT_ProdutosDIA_PROD: TIBStringField;
    IBT_ProdutosIMP_PERS: TIBStringField;
    IBT_ProdutosVALSALDOENT: TFloatField;
    IBT_ProdutosQTDSALDOENT: TFloatField;
    IBT_ProdutosTAXA: TFloatField;
    IBT_ProdutosTAXA_SN: TIBStringField;
    IBT_ProdutosLUCRO: TFloatField;
    IBT_ProdutosMOVEL: TIBStringField;
    IBT_ProdutosPIS: TFloatField;
    IBT_ProdutosREDUCAOICMS: TFloatField;
    IBT_ProdutosCOFINS: TFloatField;
    IBT_ProdutosICMS: TFloatField;
    IBT_ProdutosTRIBUTAR_ANTIGO: TIntegerField;
    IBT_ProdutosTRIBUTAR_FORA_ANTIGO: TIntegerField;
    IBT_ProdutosPRECO_AGREGADO: TFloatField;
    IBT_ProdutosTRIBUTAR_FORA: TIntegerField;
    IBT_ProdutosCST: TIntegerField;
    IBT_ProdutosCOMISSAO: TFloatField;
    IBT_ProdutosCOMISPRSN: TIBStringField;
    IBT_ProdutosITEMDATASUL: TIBStringField;
    IBT_ProdutosCLASSFISC_DATASUL: TIBStringField;
    IBT_ProdutosNATOPERACAO_DATASUL: TIBStringField;
    IBT_ProdutosUNITEM_DATASUL: TIBStringField;
    IBT_ProdutosUNFAMI_DATASUL: TIBStringField;
    IBT_ProdutosCODTRIB_DATASUL: TIBStringField;
    IBT_ProdutosPERREDUCAOICMS_DATASUL: TIBStringField;
    IBT_ProdutosNIVEL_ISENTO: TIntegerField;
    IBT_ProdutosOBSFRENTE: TIBStringField;
    IBT_ProdutosNCM: TIBStringField;
    IBT_ProdutosBXCARTELA: TIBStringField;
    IBT_ProdutosMONTAR: TIBStringField;
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
    cnnSqlServer: TADOConnection;
    ADOQ_NFC: TADOQuery;
    DTS_NFC: TDataSource;
    ADOQ_NFI: TADOQuery;
    DTS_NFI: TDataSource;
    ADOQ_NF: TADOQuery;
    DTS_NF: TDataSource;
    ADOQ_NFFILIAL: TIntegerField;
    ADOQ_NFTPNOTA: TIntegerField;
    ADOQ_NFNUMNOTA: TIntegerField;
    ADOQ_NFSERIE: TStringField;
    ADOQ_NFDTNOTA: TDateTimeField;
    ADOQ_NFDTEMISSAO: TDateTimeField;
    ADOQ_NFDTPEDIDO: TDateTimeField;
    ADOQ_NFDTCANCEL: TDateTimeField;
    ADOQ_NFDTENTREGA: TDateTimeField;
    ADOQ_NFCONDPGTO: TStringField;
    ADOQ_NFESTADO: TStringField;
    ADOQ_NFCODNATOP: TIntegerField;
    ADOQ_NFNUMPEDVEN: TBCDField;
    ADOQ_NFCODCLI: TBCDField;
    ADOQ_NFCODVENDR: TBCDField;
    ADOQ_NFNUMCXA: TIntegerField;
    ADOQ_NFLOCAL: TIntegerField;
    ADOQ_NFPESO: TBCDField;
    ADOQ_NFOBS: TStringField;
    ADOQ_NFVLDESCONTO: TBCDField;
    ADOQ_NFVLDESPFIN: TBCDField;
    ADOQ_NFVLMERCAD: TBCDField;
    ADOQ_NFVLSEGURO: TBCDField;
    ADOQ_NFSTATUS: TIntegerField;
    ADOQ_NFVLTOTAL: TBCDField;
    ADOQ_NFPESOLIQ: TBCDField;
    ADOQ_NFHRHORA: TDateTimeField;
    ADOQ_NFHRDURACAO: TIntegerField;
    ADOQ_NFVLJUROSFIN: TBCDField;
    ADOQ_NFPJUROS: TBCDField;
    ADOQ_NFDTATUEST: TDateTimeField;
    ADOQ_NFFLATUEST: TStringField;
    ADOQ_NFDTNOTAPDV: TDateTimeField;
    ADOQ_NFFLNOTAPDV: TStringField;
    ADOQ_NFNUMNOTAPDV: TIntegerField;
    ADOQ_NFNUMPDV: TIntegerField;
    ADOQ_NFSERIEPDV: TStringField;
    ADOQ_NFTPNOTAPDV: TIntegerField;
    ADOQ_NFQTPRC: TIntegerField;
    ADOQ_NFVLPRC: TBCDField;
    ADOQ_NFOBSFISCAL: TStringField;
    ADOQ_NFDTLIBPED: TDateTimeField;
    ADOQ_NFDTEXPORTACAO: TDateTimeField;
    ADOQ_NFFLCUPOM: TStringField;
    ADOQ_NFVLBASEICMS: TBCDField;
    ADOQ_NFVLICMS: TBCDField;
    ADOQ_NFVLBASEICMSSUB: TBCDField;
    ADOQ_NFVLICMSSUB: TBCDField;
    ADOQ_NFVLFRETE: TBCDField;
    ADOQ_NFVLOUTDESP: TBCDField;
    ADOQ_NFVLIPI: TBCDField;
    ADOQ_NFFLNFMANUAL: TStringField;
    ADOQ_NFFLREPLICA: TStringField;
    ADOQ_NFFLINT: TStringField;
    ADOQ_NFENDCOB: TIntegerField;
    ADOQ_NFENDENT: TIntegerField;
    ADOQ_NFFILPED: TIntegerField;
    ADOQ_NFIDENTPROC: TStringField;
    ADOQ_NFPRACA: TIntegerField;
    ADOQ_NFTIPOPED: TIntegerField;
    ADOQ_NFVLMONTAGEM: TBCDField;
    ADOQ_NFCG: TBCDField;
    ADOQ_NFCMG: TBCDField;
    ADOQ_NFFLOFFLINE: TStringField;
    ADOQ_NFNRSERIEECF: TStringField;
    ADOQ_NFFLIPISUB: TStringField;
    ADOQ_NFFLIPIICMS: TStringField;
    ADOQ_NFNUMPEDPRINC: TBCDField;
    ADOQ_NFCODCONVENIO: TIntegerField;
    ADOQ_NFCODFUNC: TBCDField;
    ADOQ_NFFLMULTIREC: TStringField;
    ADOQ_NFVLJUROS: TBCDField;
    ADOQ_NFVLISS: TBCDField;
    ADOQ_NFFLSEGURO: TStringField;
    ADOQ_NFVLENTRADA: TBCDField;
    ADOQ_NFCODSUPCANCEL: TIntegerField;
    ADOQ_NFCODOPER: TBCDField;
    ADOQ_NFNUMCONTRAFIN: TIntegerField;
    ADOQ_NFCODNATOPCOMPL: TIntegerField;
    ADOQ_NFCODNATOPDIF: TIntegerField;
    ADOQ_NFCODNATOPDIFCOMPL: TIntegerField;
    ADOQ_NFVLBASEICMORIGREPI: TBCDField;
    ADOQ_NFVLICMORIGREPI: TBCDField;
    ADOQ_NFVLICMREPI: TBCDField;
    ADOQ_NFNRMULTRECEB: TIntegerField;
    ADOQ_NFMODELONF: TIntegerField;
    ADOQ_NFVLTAC: TBCDField;
    ADOQ_NFCARENCIA: TIntegerField;
    ADOQ_NFVLTARBANCARIA: TBCDField;
    ADOQ_NFCEP: TIntegerField;
    ADOQ_NFCODSUPLIBBLOQUEIO: TIntegerField;
    ADOQ_NFDTLIBBLOQUEIO: TDateTimeField;
    ADOQ_NFHRLIBBLOQUEIO: TDateTimeField;
    ADOQ_NFOBSFINANCEIRO: TStringField;
    ADOQ_NFTPBLOQUEADO: TStringField;
    ADOQ_NFTOTCUPOMPROMOCIONAL: TIntegerField;
    ADOQ_NFCODSUPLIBCITER: TIntegerField;
    ADOQ_NFVLBASEIPI: TBCDField;
    ADOQ_NFVLISENTOIPI: TBCDField;
    ADOQ_NFVLOUTRASIPI: TBCDField;
    ADOQ_NFCGCCPF: TBCDField;
    ADOQ_NFCEP_VIKAN: TIntegerField;
    ADOQ_NFSEXO_VIKAN: TIntegerField;
    ADOQ_NFNUMCCF: TIntegerField;
    ADOQ_NFNUMDAV: TBCDField;
    ADOQ_NFIE: TStringField;
    ADOQ_NFCFILIAL: TIntegerField;
    ADOQ_NFCNUMNOT: TIntegerField;
    ADOQ_NFCSERIE: TStringField;
    ADOQ_NFCNUMLAN: TIntegerField;
    ADOQ_NFCDATENT: TDateTimeField;
    ADOQ_NFCNUMCXA: TIntegerField;
    ADOQ_NFCNUMPED: TBCDField;
    ADOQ_NFCTIPOPED: TIntegerField;
    ADOQ_NFCTPNOTA: TIntegerField;
    ADOQ_NFCNUMPRC: TIntegerField;
    ADOQ_NFCDATREF: TDateTimeField;
    ADOQ_NFCNUMMOV: TIntegerField;
    ADOQ_NFCCODOPER: TBCDField;
    ADOQ_NFCCLALAN: TDateTimeField;
    ADOQ_NFCCODEVE: TIntegerField;
    ADOQ_NFCVALLAN: TBCDField;
    ADOQ_NFCCCUSTO: TIntegerField;
    ADOQ_NFCNUMBCO: TIntegerField;
    ADOQ_NFCNUMAGE: TIntegerField;
    ADOQ_NFCNUMCTA: TBCDField;
    ADOQ_NFCNUMCHQ: TBCDField;
    ADOQ_NFCCODCON: TIntegerField;
    ADOQ_NFCNUMORP: TStringField;
    ADOQ_NFCINDCAR: TStringField;
    ADOQ_NFCCONDPGTO: TStringField;
    ADOQ_NFCFORMA: TStringField;
    ADOQ_NFCCODPLA: TIntegerField;
    ADOQ_NFCNUMGRP: TIntegerField;
    ADOQ_NFCNUMCOT: TIntegerField;
    ADOQ_NFCDATDEP: TDateTimeField;
    ADOQ_NFCNUMAUT: TBCDField;
    ADOQ_NFCFILORI: TIntegerField;
    ADOQ_NFCMOVORI: TIntegerField;
    ADOQ_NFCFILDES: TIntegerField;
    ADOQ_NFCCXADES: TIntegerField;
    ADOQ_NFCALTTES: TStringField;
    ADOQ_NFCLOTCOT: TIntegerField;
    ADOQ_NFCDATCOT: TDateTimeField;
    ADOQ_NFCCODCLI: TBCDField;
    ADOQ_NFCNUMTIT: TIntegerField;
    ADOQ_NFCDESTIT: TStringField;
    ADOQ_NFCFILPED: TIntegerField;
    ADOQ_NFCCODORI: TIntegerField;
    ADOQ_NFCTRANF: TIntegerField;
    ADOQ_NFCBORCHQ: TIntegerField;
    ADOQ_NFCDEPCHQ: TStringField;
    ADOQ_NFCOBSLAN: TStringField;
    ADOQ_NFCDATEXC: TDateTimeField;
    ADOQ_NFCSITCXA: TIntegerField;
    ADOQ_NFCVALREAL: TBCDField;
    ADOQ_NFCSTATUS: TIntegerField;
    ADOQ_NFCNUMCARTAO: TStringField;
    ADOQ_NFCVALIDCARTAO: TStringField;
    ADOQ_NFCFILNOT: TIntegerField;
    ADOQ_NFCDTVCTO: TDateTimeField;
    ADOQ_NFCFLFINANC: TStringField;
    ADOQ_NFCINTEGRACRC: TStringField;
    ADOQ_NFCNUMDEPOSIDENT: TIntegerField;
    ADOQ_NFCNUMBOLETO: TStringField;
    ADOQ_NFCVLJUROSREAL: TBCDField;
    ADOQ_NFCVLMULTAREAL: TBCDField;
    ADOQ_NFCVLTOTAL: TBCDField;
    ADOQ_NFCVLPREVISTO: TBCDField;
    ADOQ_NFCDTPAGTO: TDateTimeField;
    ADOQ_NFCPMULTAPREV: TBCDField;
    ADOQ_NFCPJUROSPREV: TBCDField;
    ADOQ_NFCCODUSERLIB: TIntegerField;
    ADOQ_NFCVLJUROSPREV: TBCDField;
    ADOQ_NFCVLMULTAPREV: TBCDField;
    ADOQ_NFCNUMCONTRA: TBCDField;
    ADOQ_NFCDIGCONTRA: TIntegerField;
    ADOQ_NFCFLOPERAUTOM: TStringField;
    ADOQ_NFCVLJUROS: TBCDField;
    ADOQ_NFCVLMULTA: TBCDField;
    ADOQ_NFCVLDESCCARNE: TBCDField;
    ADOQ_NFCNUMPRCCOB: TIntegerField;
    ADOQ_NFCNUMDOC: TBCDField;
    ADOQ_NFCHISTCTACONTAB: TStringField;
    ADOQ_NFCCTACONTAB: TBCDField;
    ADOQ_NFCFLDEBCRED: TStringField;
    ADOQ_NFCNUMCONTRAFIN: TIntegerField;
    ADOQ_NFCDIGCONTRAFIN: TIntegerField;
    ADOQ_NFCFLGERAER: TStringField;
    ADOQ_NFCRG: TStringField;
    ADOQ_NFCCODBARRA: TStringField;
    ADOQ_NFCCODCHQ: TStringField;
    ADOQ_NFCTAXADM: TBCDField;
    ADOQ_NFCCODFUNC: TBCDField;
    ADOQ_NFCCODREC: TIntegerField;
    ADOQ_NFCNUMAUTENTIC: TBCDField;
    ADOQ_NFCCODCONVENIO: TIntegerField;
    ADOQ_NFCCODPORT: TIntegerField;
    ADOQ_NFCIDENTPROC: TStringField;
    ADOQ_NFCNUMAUTCHQ: TStringField;
    ADOQ_NFCCODEMPR: TIntegerField;
    ADOQ_NFCFLFISCAL: TStringField;
    ADOQ_NFCCODORIGCRC: TIntegerField;
    ADOQ_NFCTPCLICRC: TStringField;
    ADOQ_NFCFLRECONC: TStringField;
    ADOQ_NFCCODOPERRECONC: TBCDField;
    ADOQ_NFCNUMCXARECONC: TIntegerField;
    ADOQ_NFCNUMMOVRECONC: TIntegerField;
    ADOQ_NFCNRRECRECEB: TBCDField;
    ADOQ_NFCSEQSANGRIA: TIntegerField;
    ADOQ_NFCCGCCPF: TBCDField;
    ADOQ_NFCCODOPERCENTRAL: TBCDField;
    ADOQ_NFCNCC: TBCDField;
    ADOQ_NFCFLOUTROSRECEB: TStringField;
    ADOQ_NFCFLREPLICA: TStringField;
    ADOQ_NFCFLINT: TStringField;
    ADOQ_NFCNUMAUTORIZACAO: TStringField;
    ADOQ_NFCDTEXPORTACAO: TDateTimeField;
    ADOQ_NFCVLTROCO: TBCDField;
    ADOQ_NFCFLENTRADA: TStringField;
    ADOQ_NFCFLLISTCHEQ: TStringField;
    ADOQ_NFCCODTPSEGUR: TIntegerField;
    ADOQ_NFCNRMULTRECEB: TIntegerField;
    ADOQ_NFCCODFILCRC: TIntegerField;
    ADOQ_NFCVLTAC: TBCDField;
    ADOQ_NFCNUMDOCCONV: TStringField;
    ADOQ_NFCQTPRCFIN: TIntegerField;
    ADOQ_NFCFINALIZA: TStringField;
    ADOQ_NFCNUMCCF: TIntegerField;
    ADOQ_NFCNUMGNF: TIntegerField;
    ADOQ_NFCTIPOMOVPDV: TStringField;
    ADOQ_NFCNUMDAV: TBCDField;
    ADOQ_NFITPNOTA: TIntegerField;
    ADOQ_NFINUMNOTA: TIntegerField;
    ADOQ_NFISERIE: TStringField;
    ADOQ_NFIDTNOTA: TDateTimeField;
    ADOQ_NFICODPROD: TBCDField;
    ADOQ_NFIITEM: TIntegerField;
    ADOQ_NFIQTCOMP: TBCDField;
    ADOQ_NFIPRECOUNIT: TBCDField;
    ADOQ_NFIALIQICM: TBCDField;
    ADOQ_NFIALIQICMSUB: TBCDField;
    ADOQ_NFIALIQICMRED: TBCDField;
    ADOQ_NFIVLIPI: TBCDField;
    ADOQ_NFIPORCIPI: TBCDField;
    ADOQ_NFICODEMBAL: TIntegerField;
    ADOQ_NFIDPI: TBCDField;
    ADOQ_NFIDESCCOMPLE: TStringField;
    ADOQ_NFISTATUS: TIntegerField;
    ADOQ_NFINUMPEDVEN: TBCDField;
    ADOQ_NFICODCLI: TBCDField;
    ADOQ_NFIPRECJUR: TBCDField;
    ADOQ_NFIQTDEVOL: TBCDField;
    ADOQ_NFIPRECOUNITLIQ: TBCDField;
    ADOQ_NFIVLSUPINF: TBCDField;
    ADOQ_NFICMUP: TBCDField;
    ADOQ_NFIMEDGER: TBCDField;
    ADOQ_NFIHRHORA: TDateTimeField;
    ADOQ_NFICODSITPROD: TStringField;
    ADOQ_NFIALIQICMSUBUF: TBCDField;
    ADOQ_NFIQTESTOQUE: TBCDField;
    ADOQ_NFIVLDESCITEM: TBCDField;
    ADOQ_NFIVLDESCITEMRAT: TBCDField;
    ADOQ_NFICODPROM: TBCDField;
    ADOQ_NFIQTEMB: TIntegerField;
    ADOQ_NFIVLBASEICMSF: TBCDField;
    ADOQ_NFIVLISENTOF: TBCDField;
    ADOQ_NFIVLNTRIBUTF: TBCDField;
    ADOQ_NFIVLOUTRASF: TBCDField;
    ADOQ_NFIVLICMF: TBCDField;
    ADOQ_NFIVLBASEICMSSUBF: TBCDField;
    ADOQ_NFIVLICMRETF: TBCDField;
    ADOQ_NFIVLDESPACES: TBCDField;
    ADOQ_NFIVLOUTDESP: TBCDField;
    ADOQ_NFICODITPRODKIT: TBCDField;
    ADOQ_NFICODVENDR: TBCDField;
    ADOQ_NFINUMRECEITA: TStringField;
    ADOQ_NFIDTRECEITA: TDateTimeField;
    ADOQ_NFICODPRESCRITOR: TBCDField;
    ADOQ_NFIQTPRESCRITA: TBCDField;
    ADOQ_NFIVLISS: TBCDField;
    ADOQ_NFITPPRESCRITOR: TIntegerField;
    ADOQ_NFIUNIDADE: TStringField;
    ADOQ_NFICTF: TIntegerField;
    ADOQ_NFIFLREPLICA: TStringField;
    ADOQ_NFIFLINT: TStringField;
    ADOQ_NFICODDESPMONTAG: TIntegerField;
    ADOQ_NFIFILORIG: TIntegerField;
    ADOQ_NFIFILPED: TIntegerField;
    ADOQ_NFIVLMONTAGEM: TBCDField;
    ADOQ_NFIFILIAL: TIntegerField;
    ADOQ_NFIVLCOMISSAO: TBCDField;
    ADOQ_NFIVLTOTITEM: TBCDField;
    ADOQ_NFIFLBUSCATRIBUT: TStringField;
    ADOQ_NFIVLDESPFIN: TBCDField;
    ADOQ_NFIVLFRETERAT: TBCDField;
    ADOQ_NFIVLSEGURO: TBCDField;
    ADOQ_NFIVLTOTIPI: TBCDField;
    ADOQ_NFIVLJUROS: TBCDField;
    ADOQ_NFIVLJUROSFIN: TBCDField;
    ADOQ_NFIPRECOORIG: TBCDField;
    ADOQ_NFICODJUST: TStringField;
    ADOQ_NFIITPEDITEM: TIntegerField;
    ADOQ_NFITIPOPED: TIntegerField;
    ADOQ_NFICONVERSAO: TBCDField;
    ADOQ_NFIVLDESCFRETE: TBCDField;
    ADOQ_NFIVLFRETE: TBCDField;
    ADOQ_NFIQTVENDAKIT: TBCDField;
    ADOQ_NFIVLBASEICMORIGREPI: TBCDField;
    ADOQ_NFIVLICMORIGREPI: TBCDField;
    ADOQ_NFIVLICMREPI: TBCDField;
    ADOQ_NFICODOCORRPRECO: TStringField;
    ADOQ_NFIPRECOLISTA: TBCDField;
    ADOQ_NFIPOSICAOCUPOM: TIntegerField;
    ADOQ_NFIFLMDVCOMPSUSP: TStringField;
    ADOQ_NFIFLMDVLOCAL: TStringField;
    ADOQ_NFIFLMDVPROMOCAO: TStringField;
    ADOQ_NFIFLRUPTURAMINQT: TStringField;
    ADOQ_NFIFLRUPTURAVDZERO: TStringField;
    ADOQ_NFIVLTAC: TBCDField;
    ADOQ_NFINLOTE: TIntegerField;
    ADOQ_NFIVLBASEIPI: TBCDField;
    ADOQ_NFIVLISENTOIPI: TBCDField;
    ADOQ_NFIVLOUTRASIPI: TBCDField;
    ADOQ_NFIVLTOTBASEIPI: TBCDField;
    ADOQ_NFINUMCCF: TIntegerField;
    ADOQ_NFICODTOTPARCIMPR: TStringField;
    ADOQ_NFINUMDAV: TBCDField;
    ADOQ_NFIVLBASEICMSSUB: TBCDField;
    ADOQ_NFINrSerie: TStringField;

    procedure pAcessaIniSql;

    function DataDeCriacao(Arq: string): TDateTime;

    procedure BXPedido(NomeArquivo : String; NumeroPedido : Integer);
    procedure BXPedidoSQL(NomeArquivo : String; NumeroPedido : Integer);

    procedure CCVenda(pCaixa:Integer; pCupom:Integer ; pOperador : Integer; pData : TDate; pHora : String);

    function RecProdVir(_TP:string; _matprima:Integer; _QTD:Double): Boolean;
    function lanestoque(_ES:string; _produto:Integer; _Data:TDateTime; _QTD:Double; _Total:Currency;
                        _cliente:Integer; _centrocusto:Integer; _Historico:string ): Boolean;

    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure TRM_ProcessarPedidoTimer(Sender: TObject);
  private
    { Private declarations }
    TrayIconData : TNotifyIconData;
  public
    { Public declarations }
    procedure TrayMessage(var Msg : TMessage); message WM_TRAYICON;
  end;

var
      FRM_MSP : TFRM_MSP;
  vARQUIVOOFF : String;
       vADDDV : String;
     _TPBaixa : String;
         _app : String;

implementation

{$R *.dfm}

procedure TFRM_MSP.pAcessaIniSql;
var
                 Ini : TIniFile;
   vStringConnection : string;
begin
   Try
      with cnnSqlServer do
      begin
         if Connected = True then
            Connected := False;

         Ini := TIniFile.Create(_app+'\CONFIGSQL.INI' );

         vStringConnection := Ini.ReadString('CONFBASE','STRINGCONNECTION','');

         cnnSqlServer.ConnectionString := vStringConnection;

         cnnSqlServer.Open;
      end;
   except
      ShowMessage('Ocorreu um erro na Abertura da Base SQLSERVER'+#13+#10+
                  'Seu sistema será fechado!!!');
      Application.Terminate;
      Exit;
   end;
end;

function TFRM_MSP.DataDeCriacao(Arq: string): TDateTime;
var
   ffd : TWin32FindData;
   dft : DWORD;
   lft : TFileTime;
     h : THandle;
begin
   h := Windows.FindFirstFile(PChar(Arq), ffd);

   try
      if (INVALID_HANDLE_VALUE <> h) then
      begin
         FileTimeToLocalFileTime(ffd.ftCreationTime, lft);
         FileTimeToDosDateTime(lft, LongRec(dft).Hi, LongRec(dft).Lo);
         Result := FileDateToDateTime(dft);
      end
      else
         Result := Now;
   finally
      Windows.FindClose(h);
   end;
end;

procedure TFRM_MSP.BXPedido(NomeArquivo : String; NumeroPedido : Integer);
var
                        vLer, vGravar : Textfile;
                               vlinha : String;
   // Tipo C ...................................................................
                              //cFilial : Integer;
            cCaixa, cOperador, cCupom : Integer;
                                cData : TDate;
                                cHora : String;
   // Tipo V ...................................................................
                            vVendedor : Integer;
   // Tipo P ...................................................................
                              pPedido : Integer;
   // Tipo DT ..................................................................
                           dtDesconto : Double;
   // Tipo T ...................................................................
                               tValor : Double;

                   gFicha, gSequencia : Integer;
                           xEncPedido : Boolean;
begin
   try
      // Pegar Totais ==========================================================
      AssignFile(vLer,(vARQUIVOOFF+NomeArquivo));
      Reset(vLer);

      // Usar DV
      if (vADDDV = 'S') then
         pPedido := StrtoInt(Copy(FormatFloat('00000',NumeroPedido),1,4))
      else
         pPedido := NumeroPedido;

      //cFilial    := 0;
      cCaixa     := 0;
      cOperador  := 0;
      cData      := 0;
      cHora      := '';
      cCupom     := 0;
      vVendedor  := 0;
      dtDesconto := 0;
      tValor     := 0;

      gFicha     := 0;
      gSequencia := 0;

      While not SeekEof(vLer) do
      begin
         Readln(vLer,vlinha);

         if ((Copy(vlinha,1,1) = 'C') and (Copy(vlinha,1,2) <> 'CL'))then
         begin
            //cFilial   := StrToInt(Copy(vlinha,2,4));
            cCaixa    := StrToInt(Copy(vlinha,6,3));
            cOperador := StrToInt(Copy(vlinha,9,9));
            cData     := StrToDate(Copy(vlinha,18,8));
            cHora     := Copy(vlinha,26,2)+':'+Copy(vlinha,28,2)+':'+Copy(vlinha,30,2);
            cCupom    := StrToInt(Copy(vlinha,32,6));
         end;

         if (Copy(vlinha,1,1) = 'V') then
         begin
            vVendedor := StrToInt(Copy(vlinha,2,9));
         end;

         //if (Copy(vlinha,1,1) = 'P') then
         //begin
         //   if (StrToInt(Copy(vlinha,2,9)) > 0) then
         //       pPedido := StrToInt(Copy(vlinha,2,9));
         //end;

         if (Copy(vlinha,1,1) = 'D') then
         begin
            if (Copy(vlinha,1,2) = 'DT') then
            begin
               dtDesconto := StrToFloat(Copy(vlinha,3,4))/100;
            end;
         end;

         if (Copy(vlinha,1,1) = 'T') then
         begin
            tValor := StrToFloat(Copy(vlinha,2,12))/100;
         end;
      end;

      CloseFile(vLer);
      //========================================================================

      // Lancar ================================================================
      // Localiza o Funcionario ................................................
      IBQ_Funcionario.Close;
      IBQ_Funcionario.SQL.Clear;
      IBQ_Funcionario.SQL.Add('select *');
      IBQ_Funcionario.SQL.Add('from funcionario');
      IBQ_Funcionario.SQL.Add('where (Codigo_ID = :PCodigo_ID)');
      IBQ_Funcionario.ParamByName('PCodigo_ID').Value := cOperador;
      IBQ_Funcionario.Open;

       xEncPedido := False;
      // Caso venha de um Pedido................................................
      if (pPedido > 0) then
      begin
         IBQ_Ficha.Close;
         IBQ_Ficha.SQL.Clear;
         IBQ_Ficha.SQL.Add('Select *');
         IBQ_Ficha.SQL.Add('from ficha');
         IBQ_Ficha.SQL.Add('where (Ficha = :PFicha)');
         IBQ_Ficha.ParamByName('PFicha').Value :=  pPedido;
         IBQ_Ficha.Open;

         IBQ_Ficha.Last;
         IBQ_Ficha.First;

         if (IBQ_Ficha.RecordCount > 0) then
         begin
            gFicha     := pPedido;
            gSequencia := IBQ_FichaSEQUENCIA.AsInteger;

            // Deletar Mesaitem.................................................
            IBQ_Gravar.Close;
            IBQ_Gravar.SQL.Clear;
            IBQ_Gravar.SQL.Add('Delete from MesaItem');
            IBQ_Gravar.SQL.Add('where (Mesa = :PMesa)');
            IBQ_Gravar.ParamByName('PMesa').AsInteger      := gFicha;
            IBQ_Gravar.SQL.Add('and (Sequencia = :PSequencia)');
            IBQ_Gravar.ParamByName('PSequencia').AsInteger := gSequencia;
            IBQ_Gravar.ExecSQL;

            IBTransaction1.CommitRetaining;

            xEncPedido := True;
         end
         else
         begin
            xEncPedido := False;
         end;

         // Baixa na Ficha -----------------------------------------------------
         IBQ_Gravar.Close;
         IBQ_Gravar.SQL.Clear;
         IBQ_Gravar.SQL.Add('update ficha');
         IBQ_Gravar.SQL.Add('set sequencia = :p_sequencia, status = :p_status, finalizada = :p_final, IDFicha = :p_IDFicha, Garcom = :P_Garcom, fechando = :P_fechando');
         IBQ_Gravar.ParamByName('p_sequencia').Value := 0;
         IBQ_Gravar.ParamByName('p_status').Value    := 'P';
         IBQ_Gravar.ParamByName('p_final').Value     := 'N';
         IBQ_Gravar.ParamByName('p_IDFicha').Value   := '';
         IBQ_Gravar.ParamByName('P_Garcom').Value    := null;
         IBQ_Gravar.ParamByName('P_fechando').Value  := null;
         IBQ_Gravar.SQL.Add('where (ficha = :p_ficha)');
         IBQ_Gravar.ParamByName('p_ficha').Value     := pPedido;
         IBQ_Gravar.ExecSQL;
         // --------------------------------------------------------------------
      end;


      // Caso não tenha Pedido..................................................
      if not xEncPedido then
      begin
         // Gera uma sequancia .................................................
         IBQ_Sequencia.Close;
         IBQ_Sequencia.Open;

         gSequencia := IBQ_SequenciaXCOD_ID.Value;

         // Verifica se tem um ficha para o funcionario.........................
         IBQ_FunFicha.Close;
         IBQ_FunFicha.Open;

         IBQ_FunFicha.Last;
         IBQ_FunFicha.First;

         if (IBQ_FunFicha.RecordCount > 0) then
            gFicha  := IBQ_FunFichaFICHA.Value
         else
            gFicha  := 9999;
      end;

      // Grava mesafecha .......................................................
      IBQ_Gravar.Close;
      IBQ_Gravar.SQL.Clear;
      IBQ_Gravar.SQL.Add('insert into MESAFECHA ');
      IBQ_Gravar.SQL.Add('( ');
      IBQ_Gravar.SQL.Add('CODIGO_ID, ');
      IBQ_Gravar.SQL.Add('MESA, ');
      IBQ_Gravar.SQL.Add('SEQUENCIA, ');
      IBQ_Gravar.SQL.Add('VALOR, ');
      IBQ_Gravar.SQL.Add('TROCO, ');
      IBQ_Gravar.SQL.Add('TIPO_PAGTO, ');
      IBQ_Gravar.SQL.Add('HORA_PAGTO, ');
      IBQ_Gravar.SQL.Add('DATA_PAGTO, ');
      IBQ_Gravar.SQL.Add('OPERADOR, ');
      IBQ_Gravar.SQL.Add('DESCONTO, ');
      IBQ_Gravar.SQL.Add('CANCELADO, ');
      IBQ_Gravar.SQL.Add('PONTOVENDA, ');
      IBQ_Gravar.SQL.Add('SEQ_FISCAL, ');
      IBQ_Gravar.SQL.Add('NUM_CAIXA, ');
      IBQ_Gravar.SQL.Add('COK, ');
      IBQ_Gravar.SQL.Add('MESAFECHA, ');
      IBQ_Gravar.SQL.Add('SEQFECHA, ');
      //IBQ_Gravar.SQL.Add('TEMPO, ');
      IBQ_Gravar.SQL.Add('OPCANCEL, ');
      IBQ_Gravar.SQL.Add('CLIENTE, ');
      IBQ_Gravar.SQL.Add('VAL_DESCONTOI, ');
      IBQ_Gravar.SQL.Add('VAL_ACRESCIMOI, ');
      IBQ_Gravar.SQL.Add('VAL_TAXAI, ');
      IBQ_Gravar.SQL.Add('CAT_CNPJ, ');
      IBQ_Gravar.SQL.Add('CAT_NOME, ');
      IBQ_Gravar.SQL.Add('CAT_ENDERECO, ');
      IBQ_Gravar.SQL.Add('NUMSERIEIMPRESSORA, ');
      IBQ_Gravar.SQL.Add('CORTESIA, ');
      IBQ_Gravar.SQL.Add('TURNO, ');
      IBQ_Gravar.SQL.Add('IMPRESSO, ');
      IBQ_Gravar.SQL.Add('PESSOAS ');
      IBQ_Gravar.SQL.Add(' ) Values (');
      IBQ_Gravar.SQL.Add(':PCODIGO_ID, ');
      IBQ_Gravar.SQL.Add(':PMESA, ');
      IBQ_Gravar.SQL.Add(':PSEQUENCIA, ');
      IBQ_Gravar.SQL.Add(':PVALOR, ');
      IBQ_Gravar.SQL.Add(':PTROCO, ');
      IBQ_Gravar.SQL.Add(':PTIPO_PAGTO, ');
      IBQ_Gravar.SQL.Add(':PHORA_PAGTO, ');
      IBQ_Gravar.SQL.Add(':PDATA_PAGTO, ');
      IBQ_Gravar.SQL.Add(':POPERADOR, ');
      IBQ_Gravar.SQL.Add(':PDESCONTO, ');
      IBQ_Gravar.SQL.Add(':PCANCELADO, ');
      IBQ_Gravar.SQL.Add(':PPONTOVENDA, ');
      IBQ_Gravar.SQL.Add(':PSEQ_FISCAL, ');
      IBQ_Gravar.SQL.Add(':PNUM_CAIXA, ');
      IBQ_Gravar.SQL.Add(':PCOK, ');
      IBQ_Gravar.SQL.Add(':PMESAFECHA, ');
      IBQ_Gravar.SQL.Add(':PSEQFECHA, ');
      //IBQ_Gravar.SQL.Add(':PTEMPO, ');
      IBQ_Gravar.SQL.Add(':POPCANCEL, ');
      IBQ_Gravar.SQL.Add(':PCLIENTE, ');
      IBQ_Gravar.SQL.Add(':PVAL_DESCONTOI, ');
      IBQ_Gravar.SQL.Add(':PVAL_ACRESCIMOI, ');
      IBQ_Gravar.SQL.Add(':PVAL_TAXAI, ');
      IBQ_Gravar.SQL.Add(':PCAT_CNPJ, ');
      IBQ_Gravar.SQL.Add(':PCAT_NOME, ');
      IBQ_Gravar.SQL.Add(':PCAT_ENDERECO, ');
      IBQ_Gravar.SQL.Add(':PNUMSERIEIMPRESSORA, ');
      IBQ_Gravar.SQL.Add(':PCORTESIA, ');
      IBQ_Gravar.SQL.Add(':PTURNO, ');
      IBQ_Gravar.SQL.Add(':PIMPRESSO, ');
      IBQ_Gravar.SQL.Add(':PPESSOAS ');
      IBQ_Gravar.SQL.Add(' )');
      IBQ_Gravar.ParamByName('PCODIGO_ID').Value          := 0;
      IBQ_Gravar.ParamByName('PMESA').Value               := gFicha;
      IBQ_Gravar.ParamByName('PSEQUENCIA').Value          := gSequencia;
      IBQ_Gravar.ParamByName('PVALOR').Value              := tValor;
      IBQ_Gravar.ParamByName('PTROCO').Value              := 0;
      IBQ_Gravar.ParamByName('PTIPO_PAGTO').Value         := Null;
      IBQ_Gravar.ParamByName('PHORA_PAGTO').Value         := copy(cHora,1,5);
      IBQ_Gravar.ParamByName('PDATA_PAGTO').AsDate        := cData;
      IBQ_Gravar.ParamByName('POPERADOR').Value           := cOperador;
      IBQ_Gravar.ParamByName('PDESCONTO').Value           := dtDesconto;
      IBQ_Gravar.ParamByName('PCANCELADO').Value          := 'N';
      IBQ_Gravar.ParamByName('PPONTOVENDA').Value         := IBQ_FuncionarioPONTOVENDA.Value;
      IBQ_Gravar.ParamByName('PSEQ_FISCAL').Value         := cCupom;         //Copy(sr.Name,3,6);
      IBQ_Gravar.ParamByName('PNUM_CAIXA').Value          := cCaixa;
      IBQ_Gravar.ParamByName('PCOK').Value                := 'S';
      IBQ_Gravar.ParamByName('PMESAFECHA').Value          := gFicha;
      IBQ_Gravar.ParamByName('PSEQFECHA').Value           := gSequencia;
      //IBQ_Gravar.ParamByName('PTEMPO').Value              := Now;
      IBQ_Gravar.ParamByName('POPCANCEL').Value           := Null;
      IBQ_Gravar.ParamByName('PCLIENTE').Value            := Null;           // Verificar
      IBQ_Gravar.ParamByName('PVAL_DESCONTOI').Value      := 0;
      IBQ_Gravar.ParamByName('PVAL_ACRESCIMOI').Value     := 0;
      IBQ_Gravar.ParamByName('PVAL_TAXAI').Value          := 0;
      IBQ_Gravar.ParamByName('PCAT_CNPJ').Value           := '';
      IBQ_Gravar.ParamByName('PCAT_NOME').Value           := '';
      IBQ_Gravar.ParamByName('PCAT_ENDERECO').Value       := '';
      IBQ_Gravar.ParamByName('PNUMSERIEIMPRESSORA').Value := '';             // Verificar
      IBQ_Gravar.ParamByName('PCORTESIA').Value           := 'N';
      IBQ_Gravar.ParamByName('PTURNO').Value              := IBQ_Funcionarioturno.Value;;
      IBQ_Gravar.ParamByName('PIMPRESSO').Value           := 'N';
      IBQ_Gravar.ParamByName('PPESSOAS').Value            := '1';
      IBQ_Gravar.ExecSQL;
      // Fim da gravação do mesafecha ..........................................

      // Ler Formas ............................................................
      AssignFile(vLer,(vARQUIVOOFF+NomeArquivo));
      Reset(vLer);

      While not SeekEof(vLer) do
      begin
         Readln(vLer,vlinha);

         if (Copy(vlinha,1,1) = 'F') then
         begin
            // Grava mesacond ..................................................
            IBQ_Gravar.Close;
            IBQ_Gravar.SQL.Clear;
            IBQ_Gravar.SQL.Add('insert into MESACOND ');
            IBQ_Gravar.SQL.Add('( ');
            IBQ_Gravar.SQL.Add('CODIGO_ID, ');
            IBQ_Gravar.SQL.Add('MESA, ');
            IBQ_Gravar.SQL.Add('SEQUENCIA, ');
            IBQ_Gravar.SQL.Add('TIPO_PAGTO, ');
            IBQ_Gravar.SQL.Add('TOTAL, ');
            IBQ_Gravar.SQL.Add('HORA_PAGTO, ');
            IBQ_Gravar.SQL.Add('DATA_PAGTO, ');
            IBQ_Gravar.SQL.Add('MESAFECHA, ');
            IBQ_Gravar.SQL.Add('SEQFECHA, ');
            //IBQ_Gravar.SQL.Add('TEMPO, ');
            IBQ_Gravar.SQL.Add('FECHA, ');
            IBQ_Gravar.SQL.Add('DEVEDOR, ');
            IBQ_Gravar.SQL.Add('CORTESIA, ');
            IBQ_Gravar.SQL.Add('TURNO ');
            IBQ_Gravar.SQL.Add(' ) Values (');
            IBQ_Gravar.SQL.Add(':PCODIGO_ID, ');
            IBQ_Gravar.SQL.Add(':PMESA, ');
            IBQ_Gravar.SQL.Add(':PSEQUENCIA, ');
            IBQ_Gravar.SQL.Add(':PTIPO_PAGTO, ');
            IBQ_Gravar.SQL.Add(':PTOTAL, ');
            IBQ_Gravar.SQL.Add(':PHORA_PAGTO, ');
            IBQ_Gravar.SQL.Add(':PDATA_PAGTO, ');
            IBQ_Gravar.SQL.Add(':PMESAFECHA, ');
            IBQ_Gravar.SQL.Add(':PSEQFECHA, ');
            //IBQ_Gravar.SQL.Add(':PTEMPO, ');
            IBQ_Gravar.SQL.Add(':PFECHA, ');
            IBQ_Gravar.SQL.Add(':PDEVEDOR, ');
            IBQ_Gravar.SQL.Add(':PCORTESIA, ');
            IBQ_Gravar.SQL.Add(':PTURNO ');
            IBQ_Gravar.SQL.Add(' )');
            IBQ_Gravar.ParamByName('PCODIGO_ID').Value   := 0;
            IBQ_Gravar.ParamByName('PMESA').Value        := gFicha;
            IBQ_Gravar.ParamByName('PSEQUENCIA').Value   := gSequencia;
            IBQ_Gravar.ParamByName('PTIPO_PAGTO').Value  := StrtoFloat(Copy(vlinha,2,4));
            IBQ_Gravar.ParamByName('PTOTAL').Value       := StrtoFloat(Copy(vlinha,6,12))/100;
            IBQ_Gravar.ParamByName('PHORA_PAGTO').Value  := copy(cHora,1,5);
            IBQ_Gravar.ParamByName('PDATA_PAGTO').AsDate := cData;
            IBQ_Gravar.ParamByName('PMESAFECHA').Value   := gFicha;
            IBQ_Gravar.ParamByName('PSEQFECHA').Value    := gSequencia;
            //IBQ_Gravar.ParamByName('PTEMPO').Value       := ;
            IBQ_Gravar.ParamByName('PFECHA').Value       := Null;
            IBQ_Gravar.ParamByName('PDEVEDOR').Value     := StrtoFloat(Copy(vlinha,6,12))/100;
            IBQ_Gravar.ParamByName('PCORTESIA').Value    := 'N';
            IBQ_Gravar.ParamByName('PTURNO').Value       := Null;
            IBQ_Gravar.ExecSQL;
         end;
      end;

      CloseFile(vLer);
      //========================================================================

      // Ler Itens .............................................................
      AssignFile(vLer,(vARQUIVOOFF+NomeArquivo));
      Reset(vLer);

      While not SeekEof(vLer) do
      begin
         Readln(vLer,vlinha);

         // Itens ..............................................................
         if (Copy(vlinha,1,1) = 'I') then
         begin
            // Localiza o Produtos .............................................
            IBQ_Produtos.Close;
            IBQ_Produtos.SQL.Clear;
            IBQ_Produtos.SQL.Add('Select *');
            IBQ_Produtos.SQL.Add('from produtos');

            //------------------------------------------------------------------
            IBQ_Produtos.SQL.Add('where (CBEMA = :PCBEMA)');
            IBQ_Produtos.ParamByName('PCBEMA').Value := Trim(Copy(vlinha,2,12));
            //IBQ_Produtos.ParamByName('PCBEMA').Value := Trim(Copy(vlinha,2,13));
            //------------------------------------------------------------------

            IBQ_Produtos.Open;

            IBQ_Produtos.Last;
            IBQ_Produtos.First;

            // Localiza o Aliquota .............................................
            IBT_Aliquota.Close;
            IBT_Aliquota.Open;

            IBT_Aliquota.Last;
            IBT_Aliquota.First;

            // Localiza o Vendedor .............................................
            IBQ_Funcionario.Close;
            IBQ_Funcionario.SQL.Clear;
            IBQ_Funcionario.SQL.Add('select *');
            IBQ_Funcionario.SQL.Add('from funcionario');
            IBQ_Funcionario.SQL.Add('where (Codigo_ID = :PCodigo_ID)');
            IBQ_Funcionario.ParamByName('PCodigo_ID').Value := vVendedor;
            IBQ_Funcionario.Open;

            IBQ_Funcionario.Last;
            IBQ_Funcionario.First;

            // Grava mesafecha .................................................
            IBQ_Gravar.Close;
            IBQ_Gravar.SQL.Clear;
            IBQ_Gravar.SQL.Add('insert into MESAITEM ');
            IBQ_Gravar.SQL.Add('( ');
            IBQ_Gravar.SQL.Add('CODIGO_ID, ');
            IBQ_Gravar.SQL.Add('MESA, ');
            IBQ_Gravar.SQL.Add('SEQUENCIA, ');
            IBQ_Gravar.SQL.Add('GARCOM, ');
            IBQ_Gravar.SQL.Add('PRODUTO, ');
            IBQ_Gravar.SQL.Add('QUANTIDADE, ');
            IBQ_Gravar.SQL.Add('CANCELADA, ');
            IBQ_Gravar.SQL.Add('IMP_REMOTA, ');
            IBQ_Gravar.SQL.Add('PONTOVENDA, ');
            IBQ_Gravar.SQL.Add('HORA, ');
            IBQ_Gravar.SQL.Add('"DATE", ');
            IBQ_Gravar.SQL.Add('MESAFECHA, ');
            IBQ_Gravar.SQL.Add('SEQFECHA, ');
            IBQ_Gravar.SQL.Add('GRUPO, ');
            IBQ_Gravar.SQL.Add('PRC_UNITARIO, ');
            IBQ_Gravar.SQL.Add('BALANCA, ');
            //IBQ_Gravar.SQL.Add('HO, ');
            //IBQ_Gravar.SQL.Add('TEMPO, ');
            IBQ_Gravar.SQL.Add('OPCANCEL, ');
            IBQ_Gravar.SQL.Add('ALIQUOTA, ');
            IBQ_Gravar.SQL.Add('DATA_INICIO, ');
            IBQ_Gravar.SQL.Add('DATA_FINAL, ');
            IBQ_Gravar.SQL.Add('HORA_INICIO, ');
            IBQ_Gravar.SQL.Add('HORA_FINAL, ');
            //IBQ_Gravar.SQL.Add('TEMPO_INICIAL, ');
            //IBQ_Gravar.SQL.Add('TEMPO_FINAL, ');
            IBQ_Gravar.SQL.Add('DESCONTO, ');
            IBQ_Gravar.SQL.Add('FINALIZADA, ');
            IBQ_Gravar.SQL.Add('OBS, ');
            IBQ_Gravar.SQL.Add('IMP_DIARIA, ');
            IBQ_Gravar.SQL.Add('IMP_CONTINT, ');
            IBQ_Gravar.SQL.Add('IMP_CANCELINT, ');
            IBQ_Gravar.SQL.Add('CLIENTEDIARIA, ');
            IBQ_Gravar.SQL.Add('ACRESCIMO, ');
            IBQ_Gravar.SQL.Add('TAXA, ');
            //IBQ_Gravar.SQL.Add('VAL_TAXA, ');
            //IBQ_Gravar.SQL.Add('VAL_DESCONTO, ');
            //IBQ_Gravar.SQL.Add('VAL_ACRESCIMO, ');
            //IBQ_Gravar.SQL.Add('VAL_PRODUTO, ');
            IBQ_Gravar.SQL.Add('ALIQUO, ');
            IBQ_Gravar.SQL.Add('PIS, ');
            IBQ_Gravar.SQL.Add('COFINS, ');
            IBQ_Gravar.SQL.Add('ICMS, ');
            IBQ_Gravar.SQL.Add('COMISSAOPR, ');
            IBQ_Gravar.SQL.Add('COMISSAOFU, ');
            IBQ_Gravar.SQL.Add('COMISPRSN, ');
            IBQ_Gravar.SQL.Add('CORTESIA, ');
            IBQ_Gravar.SQL.Add('TURNO, ');
            IBQ_Gravar.SQL.Add('STATUSCONT, ');
            IBQ_Gravar.SQL.Add('REDUCAO, ');
            IBQ_Gravar.SQL.Add('OBSERVACAO, ');
            IBQ_Gravar.SQL.Add('COMPLEMENTO, ');
            IBQ_Gravar.SQL.Add('POSICAO, ');
            IBQ_Gravar.SQL.Add('LIGACOMP, ');
            IBQ_Gravar.SQL.Add('NIVEL_ISENTO, ');
            IBQ_Gravar.SQL.Add('IMPRESSO, ');
            IBQ_Gravar.SQL.Add('PESSOAS, ');
            IBQ_Gravar.SQL.Add('TAXA_MEM ');
            IBQ_Gravar.SQL.Add(' ) Values (');
            IBQ_Gravar.SQL.Add(':PCODIGO_ID, ');
            IBQ_Gravar.SQL.Add(':PMESA, ');
            IBQ_Gravar.SQL.Add(':PSEQUENCIA, ');
            IBQ_Gravar.SQL.Add(':PGARCOM, ');
            IBQ_Gravar.SQL.Add(':PPRODUTO, ');
            IBQ_Gravar.SQL.Add(':PQUANTIDADE, ');
            IBQ_Gravar.SQL.Add(':PCANCELADA, ');
            IBQ_Gravar.SQL.Add(':PIMP_REMOTA, ');
            IBQ_Gravar.SQL.Add(':PPONTOVENDA, ');
            IBQ_Gravar.SQL.Add(':PHORA, ');
            IBQ_Gravar.SQL.Add(':PDATE, ');
            IBQ_Gravar.SQL.Add(':PMESAFECHA, ');
            IBQ_Gravar.SQL.Add(':PSEQFECHA, ');
            IBQ_Gravar.SQL.Add(':PGRUPO, ');
            IBQ_Gravar.SQL.Add(':PPRC_UNITARIO, ');
            IBQ_Gravar.SQL.Add(':PBALANCA, ');
            //IBQ_Gravar.SQL.Add(':PHO, ');
            //IBQ_Gravar.SQL.Add(':PTEMPO, ');
            IBQ_Gravar.SQL.Add(':POPCANCEL, ');
            IBQ_Gravar.SQL.Add(':PALIQUOTA, ');
            IBQ_Gravar.SQL.Add(':PDATA_INICIO, ');
            IBQ_Gravar.SQL.Add(':PDATA_FINAL, ');
            IBQ_Gravar.SQL.Add(':PHORA_INICIO, ');
            IBQ_Gravar.SQL.Add(':PHORA_FINAL, ');
            //IBQ_Gravar.SQL.Add(':PTEMPO_INICIAL, ');
            //IBQ_Gravar.SQL.Add(':PTEMPO_FINAL, ');
            IBQ_Gravar.SQL.Add(':PDESCONTO, ');
            IBQ_Gravar.SQL.Add(':PFINALIZADA, ');
            IBQ_Gravar.SQL.Add(':POBS, ');
            IBQ_Gravar.SQL.Add(':PIMP_DIARIA, ');
            IBQ_Gravar.SQL.Add(':PIMP_CONTINT, ');
            IBQ_Gravar.SQL.Add(':PIMP_CANCELINT, ');
            IBQ_Gravar.SQL.Add(':PCLIENTEDIARIA, ');
            IBQ_Gravar.SQL.Add(':PACRESCIMO, ');
            IBQ_Gravar.SQL.Add(':PTAXA, ');
            //IBQ_Gravar.SQL.Add(':PVAL_TAXA, ');
            //IBQ_Gravar.SQL.Add(':PVAL_DESCONTO, ');
            //IBQ_Gravar.SQL.Add(':PVAL_ACRESCIMO, ');
            //IBQ_Gravar.SQL.Add(':PVAL_PRODUTO, ');
            IBQ_Gravar.SQL.Add(':PALIQUO, ');
            IBQ_Gravar.SQL.Add(':PPIS, ');
            IBQ_Gravar.SQL.Add(':PCOFINS, ');
            IBQ_Gravar.SQL.Add(':PICMS, ');
            IBQ_Gravar.SQL.Add(':PCOMISSAOPR, ');
            IBQ_Gravar.SQL.Add(':PCOMISSAOFU, ');
            IBQ_Gravar.SQL.Add(':PCOMISPRSN, ');
            IBQ_Gravar.SQL.Add(':PCORTESIA, ');
            IBQ_Gravar.SQL.Add(':PTURNO, ');
            IBQ_Gravar.SQL.Add(':PSTATUSCONT, ');
            IBQ_Gravar.SQL.Add(':PREDUCAO, ');
            IBQ_Gravar.SQL.Add(':POBSERVACAO, ');
            IBQ_Gravar.SQL.Add(':PCOMPLEMENTO, ');
            IBQ_Gravar.SQL.Add(':PPOSICAO, ');
            IBQ_Gravar.SQL.Add(':PLIGACOMP, ');
            IBQ_Gravar.SQL.Add(':PNIVEL_ISENTO, ');
            IBQ_Gravar.SQL.Add(':PIMPRESSO, ');
            IBQ_Gravar.SQL.Add(':PPESSOAS, ');
            IBQ_Gravar.SQL.Add(':PTAXA_MEM ');
            IBQ_Gravar.SQL.Add(' )');
            IBQ_Gravar.ParamByName('PCODIGO_ID').Value         := 0;
            IBQ_Gravar.ParamByName('PMESA').Value              := gFicha;
            IBQ_Gravar.ParamByName('PSEQUENCIA').Value         := gSequencia;

            // Vendedor
            if (IBQ_FuncionarioCODIGO_ID.AsInteger > 0) then
               IBQ_Gravar.ParamByName('PGARCOM').Value         := IBQ_FuncionarioCODIGO_ID.Value
            else
               IBQ_Gravar.ParamByName('PGARCOM').Value         := Null;

            // Produto
            if (IBQ_ProdutosCODIGO_ID.AsInteger > 0) then
               IBQ_Gravar.ParamByName('PPRODUTO').Value        := IBQ_ProdutosCODIGO_ID.Value
            else
               IBQ_Gravar.ParamByName('PPRODUTO').Value        := Null;

            IBQ_Gravar.ParamByName('PQUANTIDADE').Value        := StrToFloat(Copy(vlinha,15,8))/1000;
            IBQ_Gravar.ParamByName('PCANCELADA').Value         := 'N';
            IBQ_Gravar.ParamByName('PIMP_REMOTA').Value        := 'N';

            // Ponto de venda
            if (IBQ_FuncionarioPONTOVENDA.AsInteger > 0) then
               IBQ_Gravar.ParamByName('PPONTOVENDA').Value     := IBQ_FuncionarioPONTOVENDA.Value
            else
               IBQ_Gravar.ParamByName('PPONTOVENDA').Value     := Null;

            IBQ_Gravar.ParamByName('PHORA').Value              := copy(cHora,1,5);
            IBQ_Gravar.ParamByName('PDATE').AsDate             := cData;
            IBQ_Gravar.ParamByName('PMESAFECHA').Value         := gFicha;
            IBQ_Gravar.ParamByName('PSEQFECHA').Value          := gSequencia;

            // Grupo
            if (IBQ_ProdutosGRUPO.AsInteger > 0) then
               IBQ_Gravar.ParamByName('PGRUPO').Value          := IBQ_ProdutosGRUPO.Value
            else
               IBQ_Gravar.ParamByName('PGRUPO').Value          := Null;

            IBQ_Gravar.ParamByName('PPRC_UNITARIO').Value      := StrToFloat(Copy(vlinha,23,11))/100;
            IBQ_Gravar.ParamByName('PBALANCA').Value           := 'N';
            //IBQ_Gravar.ParamByName('PHO').Value              := ;
            //IBQ_Gravar.ParamByName('PTEMPO').Value           := ;
            IBQ_Gravar.ParamByName('POPCANCEL').Value          := Null;

            // Aliquota
            if (IBQ_ProdutosTRIBUTAR.AsInteger > 0) then
               IBQ_Gravar.ParamByName('PALIQUOTA').Value       := IBQ_ProdutosTRIBUTAR.Value
            else
               IBQ_Gravar.ParamByName('PALIQUOTA').Value       := Null;

            IBQ_Gravar.ParamByName('PDATA_INICIO').Value    := Null;
            IBQ_Gravar.ParamByName('PDATA_FINAL').Value     := Null;
            IBQ_Gravar.ParamByName('PHORA_INICIO').Value    := Null;
            IBQ_Gravar.ParamByName('PHORA_FINAL').Value     := Null;
            //IBQ_Gravar.ParamByName('PTEMPO_INICIAL').Value  := ;
            //IBQ_Gravar.ParamByName('PTEMPO_FINAL').Value    := ;
            IBQ_Gravar.ParamByName('PDESCONTO').Value       := StrtoFloat(Copy(vlinha,36,4))/100;
            IBQ_Gravar.ParamByName('PFINALIZADA').Value     := 'S';
            IBQ_Gravar.ParamByName('POBS').Value            := Null;
            IBQ_Gravar.ParamByName('PIMP_DIARIA').Value     := Null;
            IBQ_Gravar.ParamByName('PIMP_CONTINT').Value    := Null;
            IBQ_Gravar.ParamByName('PIMP_CANCELINT').Value  := Null;
            IBQ_Gravar.ParamByName('PCLIENTEDIARIA').Value  := Null;
            IBQ_Gravar.ParamByName('PACRESCIMO').Value      := 0;
            IBQ_Gravar.ParamByName('PTAXA').Value           := 0;
            //IBQ_Gravar.ParamByName('PVAL_TAXA').Value       := ;
            //IBQ_Gravar.ParamByName('PVAL_DESCONTO').Value   := ;
            //IBQ_Gravar.ParamByName('PVAL_ACRESCIMO').Value  := ;
            //IBQ_Gravar.ParamByName('PVAL_PRODUTO').Value    := ;
            IBQ_Gravar.ParamByName('PALIQUO').Value         := IBT_AliquotaALIQUO.Value;
            IBQ_Gravar.ParamByName('PPIS').Value            := 0;
            IBQ_Gravar.ParamByName('PCOFINS').Value         := 0;
            IBQ_Gravar.ParamByName('PICMS').Value           := 0;
            IBQ_Gravar.ParamByName('PCOMISSAOPR').Value     := Null;
            IBQ_Gravar.ParamByName('PCOMISSAOFU').Value     := Null;
            IBQ_Gravar.ParamByName('PCOMISPRSN').Value      := Null;
            IBQ_Gravar.ParamByName('PCORTESIA').Value       := 'N';

            // Turno
            if (IBQ_Funcionarioturno.AsInteger > 0) then
               IBQ_Gravar.ParamByName('PTURNO').Value       := IBQ_Funcionarioturno.Value
            else
               IBQ_Gravar.ParamByName('PTURNO').Value       := Null;

            IBQ_Gravar.ParamByName('PSTATUSCONT').Value     := Null;
            IBQ_Gravar.ParamByName('PREDUCAO').Value        := Null;
            IBQ_Gravar.ParamByName('POBSERVACAO').Value     := Null;
            IBQ_Gravar.ParamByName('PCOMPLEMENTO').Value    := 'N';
            IBQ_Gravar.ParamByName('PPOSICAO').Value        := Null;
            IBQ_Gravar.ParamByName('PLIGACOMP').Value       := Null;
            IBQ_Gravar.ParamByName('PNIVEL_ISENTO').Value   := 0;
            IBQ_Gravar.ParamByName('PIMPRESSO').Value       := 'S';
            IBQ_Gravar.ParamByName('PPESSOAS').Value        := Null;
            IBQ_Gravar.ParamByName('PTAXA_MEM').Value       := Null;
            IBQ_Gravar.ExecSQL;

            // Baixa no estoque ................................................
            if (IBQ_ProdutosESTOQUE.AsString = 'S') then
            begin
               lanestoque('S',
                          IBQ_ProdutosCODIGO_ID.Value,
                          Now,
                          StrToFloat(Copy(vlinha,15,8))/1000,
                          ((StrToFloat(Copy(vlinha,23,11))/100)*(StrToFloat(Copy(vlinha,15,8))/1000)),
                          0,
                          0,
                          'Venda');
            end;
         end;
      end;
      CloseFile(vLer);
      //========================================================================

      // Confirmar a venda......................................................
      IBTransaction1.CommitRetaining;
      // .......................................................................

      // BKP do arquivo de pedido ..............................................
      CopyFile(Pchar(vARQUIVOOFF+NomeArquivo),Pchar(vARQUIVOOFF+'BKP\'+NomeArquivo),False);
      DeleteFile(vARQUIVOOFF+NomeArquivo);
   except
      IBTransaction1.Rollback;

      try
         CloseFile(vLer);
         CloseFile(vGravar);
      finally
         // Erro do arquivo de pedido ..............................................
         CopyFile(Pchar(vARQUIVOOFF+NomeArquivo),Pchar(vARQUIVOOFF+'ERRO\'+NomeArquivo),False);
         DeleteFile(vARQUIVOOFF+NomeArquivo);
      end;
   end;
end;

procedure TFRM_MSP.BXPedidoSQL(NomeArquivo : String; NumeroPedido : Integer);
var
             vLer, vGravar : Textfile;
                    vlinha : String;
   cCaixa, cCupom, pPedido : Integer;
        gFicha, gSequencia : Integer;
                xEncPedido : Boolean;
                vDTArquivo : TDateTime;
begin
   try
      cCaixa     := 0;
      cCupom     := 0;

      gFicha     := 0;
      gSequencia := 0;

      // Pegar Totais ==========================================================
      AssignFile(vLer,(vARQUIVOOFF+NomeArquivo));
      Reset(vLer);

      vDTArquivo := DataDeCriacao((vARQUIVOOFF+NomeArquivo));

      While not SeekEof(vLer) do
      begin
         Readln(vLer,vlinha);

         if ((Copy(vlinha,1,1) = 'C') and (Copy(vlinha,1,2) <> 'CL'))then
         begin
            cCaixa    := StrToInt(Copy(vlinha,6,3));
            cCupom    := StrToInt(Copy(vlinha,32,6));
         end;
      end;

      CloseFile(vLer);

      // Consulta banco SQL ====================================================
      ADOQ_NF.Close;
      ADOQ_NF.Parameters.ParamByName('pNUMNOTA').Value := cCupom;
      ADOQ_NF.Parameters.ParamByName('pSERIE').Value   := 'U'+ FormatFloat('00',cCaixa);
      ADOQ_NF.Open;

      ADOQ_NFI.Close;
      ADOQ_NFI.Open;

      ADOQ_NFC.Close;
      ADOQ_NFC.Open;

      // Pedidos diferentes
      if (NumeroPedido <> ADOQ_NFNUMDAV.AsInteger) then
      begin
         // Excluir PP por erro no numero de pedido e arquivos
         if (ADOQ_NFNUMDAV.AsInteger > 0) and (NumeroPedido <= 0) then
         begin

         end;
      end;

      // Usar DV
      if (vADDDV = 'S') then
         pPedido := StrtoInt(Copy(FormatFloat('00000',ADOQ_NFNUMDAV.AsInteger),1,4))
      else
         pPedido := ADOQ_NFNUMDAV.AsInteger;

      // Lancar ================================================================
      // Localiza o Funcionario ................................................
      IBQ_Funcionario.Close;
      IBQ_Funcionario.SQL.Clear;
      IBQ_Funcionario.SQL.Add('select *');
      IBQ_Funcionario.SQL.Add('from funcionario');
      IBQ_Funcionario.SQL.Add('where (Codigo_ID = :PCodigo_ID)');
      IBQ_Funcionario.ParamByName('PCodigo_ID').Value := ADOQ_NFCODOPER.Value;
      IBQ_Funcionario.Open;

      // Caso venha de um Pedido................................................
      xEncPedido := False;
      if (pPedido > 0) then
      begin
         IBQ_Ficha.Close;
         IBQ_Ficha.SQL.Clear;
         IBQ_Ficha.SQL.Add('Select *');
         IBQ_Ficha.SQL.Add('from ficha');
         IBQ_Ficha.SQL.Add('where (Ficha = :PFicha)');
         IBQ_Ficha.ParamByName('PFicha').Value :=  pPedido;
         IBQ_Ficha.Open;

         IBQ_Ficha.Last;
         IBQ_Ficha.First;

         if (IBQ_Ficha.RecordCount > 0) then
         begin
            gFicha     := pPedido;
            gSequencia := IBQ_FichaSEQUENCIA.AsInteger;

            // Deletar Mesaitem.................................................
            IBQ_Gravar.Close;
            IBQ_Gravar.SQL.Clear;
            IBQ_Gravar.SQL.Add('Delete from MesaItem');
            IBQ_Gravar.SQL.Add('where (Mesa = :PMesa)');
            IBQ_Gravar.ParamByName('PMesa').AsInteger      := gFicha;
            IBQ_Gravar.SQL.Add('and (Sequencia = :PSequencia)');
            IBQ_Gravar.ParamByName('PSequencia').AsInteger := gSequencia;
            IBQ_Gravar.ExecSQL;

            IBTransaction1.CommitRetaining;

            xEncPedido := True;
         end
         else
         begin
            xEncPedido := False;
         end;

         // Baixa na Ficha -----------------------------------------------------
         IBQ_Gravar.Close;
         IBQ_Gravar.SQL.Clear;
         IBQ_Gravar.SQL.Add('update ficha');
         IBQ_Gravar.SQL.Add('set sequencia = :p_sequencia, status = :p_status, finalizada = :p_final, IDFicha = :p_IDFicha, Garcom = :P_Garcom, fechando = :P_fechando');
         IBQ_Gravar.ParamByName('p_sequencia').Value := 0;
         IBQ_Gravar.ParamByName('p_status').Value    := 'P';
         IBQ_Gravar.ParamByName('p_final').Value     := 'N';
         IBQ_Gravar.ParamByName('p_IDFicha').Value   := '';
         IBQ_Gravar.ParamByName('P_Garcom').Value    := null;
         IBQ_Gravar.ParamByName('P_fechando').Value  := null;
         IBQ_Gravar.SQL.Add('where (ficha = :p_ficha)');
         IBQ_Gravar.ParamByName('p_ficha').Value     := pPedido;
         IBQ_Gravar.ExecSQL;
         // --------------------------------------------------------------------
      end;


      // Caso não tenha Pedido..................................................
      if not xEncPedido then
      begin
         // Gera uma sequancia .................................................
         IBQ_Sequencia.Close;
         IBQ_Sequencia.Open;

         gSequencia := IBQ_SequenciaXCOD_ID.Value;

         // Verifica se tem um ficha para o funcionario.........................
         IBQ_FunFicha.Close;
         IBQ_FunFicha.Open;

         IBQ_FunFicha.Last;
         IBQ_FunFicha.First;

         if (IBQ_FunFicha.RecordCount > 0) then
            gFicha  := IBQ_FunFichaFICHA.Value
         else
            gFicha  := 9999;
      end;

      // Grava mesafecha .......................................................
      IBQ_Gravar.Close;
      IBQ_Gravar.SQL.Clear;
      IBQ_Gravar.SQL.Add('insert into MESAFECHA ');
      IBQ_Gravar.SQL.Add('( ');
      IBQ_Gravar.SQL.Add('CODIGO_ID, ');
      IBQ_Gravar.SQL.Add('MESA, ');
      IBQ_Gravar.SQL.Add('SEQUENCIA, ');
      IBQ_Gravar.SQL.Add('VALOR, ');
      IBQ_Gravar.SQL.Add('TROCO, ');
      IBQ_Gravar.SQL.Add('TIPO_PAGTO, ');
      IBQ_Gravar.SQL.Add('HORA_PAGTO, ');
      IBQ_Gravar.SQL.Add('DATA_PAGTO, ');
      IBQ_Gravar.SQL.Add('OPERADOR, ');
      IBQ_Gravar.SQL.Add('DESCONTO, ');
      IBQ_Gravar.SQL.Add('CANCELADO, ');
      IBQ_Gravar.SQL.Add('PONTOVENDA, ');
      IBQ_Gravar.SQL.Add('SEQ_FISCAL, ');
      IBQ_Gravar.SQL.Add('NUM_CAIXA, ');
      IBQ_Gravar.SQL.Add('COK, ');
      IBQ_Gravar.SQL.Add('MESAFECHA, ');
      IBQ_Gravar.SQL.Add('SEQFECHA, ');
      IBQ_Gravar.SQL.Add('OPCANCEL, ');
      IBQ_Gravar.SQL.Add('CLIENTE, ');
      IBQ_Gravar.SQL.Add('VAL_DESCONTOI, ');
      IBQ_Gravar.SQL.Add('VAL_ACRESCIMOI, ');
      IBQ_Gravar.SQL.Add('VAL_TAXAI, ');
      IBQ_Gravar.SQL.Add('CAT_CNPJ, ');
      IBQ_Gravar.SQL.Add('CAT_NOME, ');
      IBQ_Gravar.SQL.Add('CAT_ENDERECO, ');
      IBQ_Gravar.SQL.Add('NUMSERIEIMPRESSORA, ');
      IBQ_Gravar.SQL.Add('CORTESIA, ');
      IBQ_Gravar.SQL.Add('TURNO, ');
      IBQ_Gravar.SQL.Add('IMPRESSO, ');
      IBQ_Gravar.SQL.Add('PESSOAS ');
      IBQ_Gravar.SQL.Add(' ) Values (');
      IBQ_Gravar.SQL.Add(':PCODIGO_ID, ');
      IBQ_Gravar.SQL.Add(':PMESA, ');
      IBQ_Gravar.SQL.Add(':PSEQUENCIA, ');
      IBQ_Gravar.SQL.Add(':PVALOR, ');
      IBQ_Gravar.SQL.Add(':PTROCO, ');
      IBQ_Gravar.SQL.Add(':PTIPO_PAGTO, ');
      IBQ_Gravar.SQL.Add(':PHORA_PAGTO, ');
      IBQ_Gravar.SQL.Add(':PDATA_PAGTO, ');
      IBQ_Gravar.SQL.Add(':POPERADOR, ');
      IBQ_Gravar.SQL.Add(':PDESCONTO, ');
      IBQ_Gravar.SQL.Add(':PCANCELADO, ');
      IBQ_Gravar.SQL.Add(':PPONTOVENDA, ');
      IBQ_Gravar.SQL.Add(':PSEQ_FISCAL, ');
      IBQ_Gravar.SQL.Add(':PNUM_CAIXA, ');
      IBQ_Gravar.SQL.Add(':PCOK, ');
      IBQ_Gravar.SQL.Add(':PMESAFECHA, ');
      IBQ_Gravar.SQL.Add(':PSEQFECHA, ');
      IBQ_Gravar.SQL.Add(':POPCANCEL, ');
      IBQ_Gravar.SQL.Add(':PCLIENTE, ');
      IBQ_Gravar.SQL.Add(':PVAL_DESCONTOI, ');
      IBQ_Gravar.SQL.Add(':PVAL_ACRESCIMOI, ');
      IBQ_Gravar.SQL.Add(':PVAL_TAXAI, ');
      IBQ_Gravar.SQL.Add(':PCAT_CNPJ, ');
      IBQ_Gravar.SQL.Add(':PCAT_NOME, ');
      IBQ_Gravar.SQL.Add(':PCAT_ENDERECO, ');
      IBQ_Gravar.SQL.Add(':PNUMSERIEIMPRESSORA, ');
      IBQ_Gravar.SQL.Add(':PCORTESIA, ');
      IBQ_Gravar.SQL.Add(':PTURNO, ');
      IBQ_Gravar.SQL.Add(':PIMPRESSO, ');
      IBQ_Gravar.SQL.Add(':PPESSOAS ');
      IBQ_Gravar.SQL.Add(' )');
      IBQ_Gravar.ParamByName('PCODIGO_ID').Value          := 0;
      IBQ_Gravar.ParamByName('PMESA').Value               := gFicha;
      IBQ_Gravar.ParamByName('PSEQUENCIA').Value          := gSequencia;
      IBQ_Gravar.ParamByName('PVALOR').Value              := ADOQ_NFVLTOTAL.Value;
      IBQ_Gravar.ParamByName('PTROCO').Value              := 0;
      IBQ_Gravar.ParamByName('PTIPO_PAGTO').Value         := Null;
      IBQ_Gravar.ParamByName('PHORA_PAGTO').Value         := FormatDateTime('hh:mm', ADOQ_NFHRHORA.Value);

      //IBQ_Gravar.ParamByName('PDATA_PAGTO').AsDate        := ADOQ_NFDTNOTA.Value;
      IBQ_Gravar.ParamByName('PDATA_PAGTO').AsDate        := vDTArquivo;

      IBQ_Gravar.ParamByName('POPERADOR').Value           := ADOQ_NFCODOPER.Value;
      IBQ_Gravar.ParamByName('PDESCONTO').Value           := ADOQ_NFVLDESCONTO.Value;
      IBQ_Gravar.ParamByName('PCANCELADO').Value          := 'N';
      IBQ_Gravar.ParamByName('PPONTOVENDA').Value         := IBQ_FuncionarioPONTOVENDA.Value;
      IBQ_Gravar.ParamByName('PSEQ_FISCAL').Value         := ADOQ_NFNUMNOTA.Value;
      IBQ_Gravar.ParamByName('PNUM_CAIXA').Value          := ADOQ_NFNUMCXA.Value;
      IBQ_Gravar.ParamByName('PCOK').Value                := 'S';
      IBQ_Gravar.ParamByName('PMESAFECHA').Value          := gFicha;
      IBQ_Gravar.ParamByName('PSEQFECHA').Value           := gSequencia;
      IBQ_Gravar.ParamByName('POPCANCEL').Value           := Null;
      IBQ_Gravar.ParamByName('PCLIENTE').Value            := Null;  //ADOQ_NFCODCLI.Value;
      IBQ_Gravar.ParamByName('PVAL_DESCONTOI').Value      := 0;
      IBQ_Gravar.ParamByName('PVAL_ACRESCIMOI').Value     := 0;
      IBQ_Gravar.ParamByName('PVAL_TAXAI').Value          := 0;
      IBQ_Gravar.ParamByName('PCAT_CNPJ').Value           := '';
      IBQ_Gravar.ParamByName('PCAT_NOME').Value           := '';
      IBQ_Gravar.ParamByName('PCAT_ENDERECO').Value       := '';
      IBQ_Gravar.ParamByName('PNUMSERIEIMPRESSORA').Value := '';
      IBQ_Gravar.ParamByName('PCORTESIA').Value           := 'N';
      IBQ_Gravar.ParamByName('PTURNO').Value              := IBQ_Funcionarioturno.Value;;
      IBQ_Gravar.ParamByName('PIMPRESSO').Value           := 'N';
      IBQ_Gravar.ParamByName('PPESSOAS').Value            := '1';
      IBQ_Gravar.ExecSQL;
      // Fim da gravação do mesafecha ..........................................

      // Ler Formas ............................................................
      ADOQ_NFC.First;
      While not ADOQ_NFC.Eof do
      begin
         // Grava mesacond ..................................................
         IBQ_Gravar.Close;
         IBQ_Gravar.SQL.Clear;
         IBQ_Gravar.SQL.Add('insert into MESACOND ');
         IBQ_Gravar.SQL.Add('( ');
         IBQ_Gravar.SQL.Add('CODIGO_ID, ');
         IBQ_Gravar.SQL.Add('MESA, ');
         IBQ_Gravar.SQL.Add('SEQUENCIA, ');
         IBQ_Gravar.SQL.Add('TIPO_PAGTO, ');
         IBQ_Gravar.SQL.Add('TOTAL, ');
         IBQ_Gravar.SQL.Add('HORA_PAGTO, ');
         IBQ_Gravar.SQL.Add('DATA_PAGTO, ');
         IBQ_Gravar.SQL.Add('MESAFECHA, ');
         IBQ_Gravar.SQL.Add('SEQFECHA, ');
         IBQ_Gravar.SQL.Add('FECHA, ');
         IBQ_Gravar.SQL.Add('DEVEDOR, ');
         IBQ_Gravar.SQL.Add('CORTESIA, ');
         IBQ_Gravar.SQL.Add('TURNO ');
         IBQ_Gravar.SQL.Add(' ) Values (');
         IBQ_Gravar.SQL.Add(':PCODIGO_ID, ');
         IBQ_Gravar.SQL.Add(':PMESA, ');
         IBQ_Gravar.SQL.Add(':PSEQUENCIA, ');
         IBQ_Gravar.SQL.Add(':PTIPO_PAGTO, ');
         IBQ_Gravar.SQL.Add(':PTOTAL, ');
         IBQ_Gravar.SQL.Add(':PHORA_PAGTO, ');
         IBQ_Gravar.SQL.Add(':PDATA_PAGTO, ');
         IBQ_Gravar.SQL.Add(':PMESAFECHA, ');
         IBQ_Gravar.SQL.Add(':PSEQFECHA, ');
         IBQ_Gravar.SQL.Add(':PFECHA, ');
         IBQ_Gravar.SQL.Add(':PDEVEDOR, ');
         IBQ_Gravar.SQL.Add(':PCORTESIA, ');
         IBQ_Gravar.SQL.Add(':PTURNO ');
         IBQ_Gravar.SQL.Add(' )');
         IBQ_Gravar.ParamByName('PCODIGO_ID').Value   := 0;
         IBQ_Gravar.ParamByName('PMESA').Value        := gFicha;
         IBQ_Gravar.ParamByName('PSEQUENCIA').Value   := gSequencia;
         IBQ_Gravar.ParamByName('PTIPO_PAGTO').Value  := ADOQ_NFCCONDPGTO.AsInteger;
         IBQ_Gravar.ParamByName('PTOTAL').Value       := ADOQ_NFCVALLAN.Value;
         IBQ_Gravar.ParamByName('PHORA_PAGTO').Value  := FormatDateTime('hh:mm', ADOQ_NFHRHORA.Value);

         //IBQ_Gravar.ParamByName('PDATA_PAGTO').AsDate := ADOQ_NFCDATENT.Value;
         IBQ_Gravar.ParamByName('PDATA_PAGTO').AsDate := vDTArquivo;

         IBQ_Gravar.ParamByName('PMESAFECHA').Value   := gFicha;
         IBQ_Gravar.ParamByName('PSEQFECHA').Value    := gSequencia;
         IBQ_Gravar.ParamByName('PFECHA').Value       := Null;
         IBQ_Gravar.ParamByName('PDEVEDOR').Value     := ADOQ_NFCVALLAN.Value;
         IBQ_Gravar.ParamByName('PCORTESIA').Value    := 'N';
         IBQ_Gravar.ParamByName('PTURNO').Value       := Null;
         IBQ_Gravar.ExecSQL;

         ADOQ_NFC.Next;
      end;

      // Ler Itens .............................................................
      ADOQ_NFI.First;
      While not ADOQ_NFI.EOF do
      begin
         // Localiza o Produtos .............................................
         IBQ_Produtos.Close;
         IBQ_Produtos.SQL.Clear;
         IBQ_Produtos.SQL.Add('Select *');
         IBQ_Produtos.SQL.Add('from produtos');
         IBQ_Produtos.SQL.Add('where (CBEMA = :PCBEMA)');
         IBQ_Produtos.ParamByName('PCBEMA').Value := ADOQ_NFICODPROD.Value;
         //IBQ_Produtos.ParamByName('PCBEMA').Value := Copy(Trim(ADOQ_NFICODPROD.AsString),1,Length(Trim(ADOQ_NFICODPROD.AsString))-1);
         IBQ_Produtos.Open;
         //------------------------------------------------------------------

         IBQ_Produtos.Last;
         IBQ_Produtos.First;

         // Localiza o Aliquota .............................................
         IBT_Aliquota.Close;
         IBT_Aliquota.Open;

         IBT_Aliquota.Last;
         IBT_Aliquota.First;

         // Localiza o Vendedor .............................................
         IBQ_Funcionario.Close;
         IBQ_Funcionario.SQL.Clear;
         IBQ_Funcionario.SQL.Add('select *');
         IBQ_Funcionario.SQL.Add('from funcionario');
         IBQ_Funcionario.SQL.Add('where (Codigo_ID = :PCodigo_ID)');
         IBQ_Funcionario.ParamByName('PCodigo_ID').Value := ADOQ_NFICODVENDR.Value;
         IBQ_Funcionario.Open;

         IBQ_Funcionario.Last;
         IBQ_Funcionario.First;

         // Grava mesafecha .................................................
         IBQ_Gravar.Close;
         IBQ_Gravar.SQL.Clear;
         IBQ_Gravar.SQL.Add('insert into MESAITEM ');
         IBQ_Gravar.SQL.Add('( ');
         IBQ_Gravar.SQL.Add('CODIGO_ID, ');
         IBQ_Gravar.SQL.Add('MESA, ');
         IBQ_Gravar.SQL.Add('SEQUENCIA, ');
         IBQ_Gravar.SQL.Add('GARCOM, ');
         IBQ_Gravar.SQL.Add('PRODUTO, ');
         IBQ_Gravar.SQL.Add('QUANTIDADE, ');
         IBQ_Gravar.SQL.Add('CANCELADA, ');
         IBQ_Gravar.SQL.Add('IMP_REMOTA, ');
         IBQ_Gravar.SQL.Add('PONTOVENDA, ');
         IBQ_Gravar.SQL.Add('HORA, ');
         IBQ_Gravar.SQL.Add('"DATE", ');
         IBQ_Gravar.SQL.Add('MESAFECHA, ');
         IBQ_Gravar.SQL.Add('SEQFECHA, ');
         IBQ_Gravar.SQL.Add('GRUPO, ');
         IBQ_Gravar.SQL.Add('PRC_UNITARIO, ');
         IBQ_Gravar.SQL.Add('BALANCA, ');
         IBQ_Gravar.SQL.Add('OPCANCEL, ');
         IBQ_Gravar.SQL.Add('ALIQUOTA, ');
         IBQ_Gravar.SQL.Add('DATA_INICIO, ');
         IBQ_Gravar.SQL.Add('DATA_FINAL, ');
         IBQ_Gravar.SQL.Add('HORA_INICIO, ');
         IBQ_Gravar.SQL.Add('HORA_FINAL, ');
         IBQ_Gravar.SQL.Add('DESCONTO, ');
         IBQ_Gravar.SQL.Add('FINALIZADA, ');
         IBQ_Gravar.SQL.Add('OBS, ');
         IBQ_Gravar.SQL.Add('IMP_DIARIA, ');
         IBQ_Gravar.SQL.Add('IMP_CONTINT, ');
         IBQ_Gravar.SQL.Add('IMP_CANCELINT, ');
         IBQ_Gravar.SQL.Add('CLIENTEDIARIA, ');
         IBQ_Gravar.SQL.Add('ACRESCIMO, ');
         IBQ_Gravar.SQL.Add('TAXA, ');
         IBQ_Gravar.SQL.Add('ALIQUO, ');
         IBQ_Gravar.SQL.Add('PIS, ');
         IBQ_Gravar.SQL.Add('COFINS, ');
         IBQ_Gravar.SQL.Add('ICMS, ');
         IBQ_Gravar.SQL.Add('COMISSAOPR, ');
         IBQ_Gravar.SQL.Add('COMISSAOFU, ');
         IBQ_Gravar.SQL.Add('COMISPRSN, ');
         IBQ_Gravar.SQL.Add('CORTESIA, ');
         IBQ_Gravar.SQL.Add('TURNO, ');
         IBQ_Gravar.SQL.Add('STATUSCONT, ');
         IBQ_Gravar.SQL.Add('REDUCAO, ');
         IBQ_Gravar.SQL.Add('OBSERVACAO, ');
         IBQ_Gravar.SQL.Add('COMPLEMENTO, ');
         IBQ_Gravar.SQL.Add('POSICAO, ');
         IBQ_Gravar.SQL.Add('LIGACOMP, ');
         IBQ_Gravar.SQL.Add('NIVEL_ISENTO, ');
         IBQ_Gravar.SQL.Add('IMPRESSO, ');
         IBQ_Gravar.SQL.Add('PESSOAS, ');
         IBQ_Gravar.SQL.Add('TAXA_MEM ');
         IBQ_Gravar.SQL.Add(' ) Values (');
         IBQ_Gravar.SQL.Add(':PCODIGO_ID, ');
         IBQ_Gravar.SQL.Add(':PMESA, ');
         IBQ_Gravar.SQL.Add(':PSEQUENCIA, ');
         IBQ_Gravar.SQL.Add(':PGARCOM, ');
         IBQ_Gravar.SQL.Add(':PPRODUTO, ');
         IBQ_Gravar.SQL.Add(':PQUANTIDADE, ');
         IBQ_Gravar.SQL.Add(':PCANCELADA, ');
         IBQ_Gravar.SQL.Add(':PIMP_REMOTA, ');
         IBQ_Gravar.SQL.Add(':PPONTOVENDA, ');
         IBQ_Gravar.SQL.Add(':PHORA, ');
         IBQ_Gravar.SQL.Add(':PDATE, ');
         IBQ_Gravar.SQL.Add(':PMESAFECHA, ');
         IBQ_Gravar.SQL.Add(':PSEQFECHA, ');
         IBQ_Gravar.SQL.Add(':PGRUPO, ');
         IBQ_Gravar.SQL.Add(':PPRC_UNITARIO, ');
         IBQ_Gravar.SQL.Add(':PBALANCA, ');
         IBQ_Gravar.SQL.Add(':POPCANCEL, ');
         IBQ_Gravar.SQL.Add(':PALIQUOTA, ');
         IBQ_Gravar.SQL.Add(':PDATA_INICIO, ');
         IBQ_Gravar.SQL.Add(':PDATA_FINAL, ');
         IBQ_Gravar.SQL.Add(':PHORA_INICIO, ');
         IBQ_Gravar.SQL.Add(':PHORA_FINAL, ');
         IBQ_Gravar.SQL.Add(':PDESCONTO, ');
         IBQ_Gravar.SQL.Add(':PFINALIZADA, ');
         IBQ_Gravar.SQL.Add(':POBS, ');
         IBQ_Gravar.SQL.Add(':PIMP_DIARIA, ');
         IBQ_Gravar.SQL.Add(':PIMP_CONTINT, ');
         IBQ_Gravar.SQL.Add(':PIMP_CANCELINT, ');
         IBQ_Gravar.SQL.Add(':PCLIENTEDIARIA, ');
         IBQ_Gravar.SQL.Add(':PACRESCIMO, ');
         IBQ_Gravar.SQL.Add(':PTAXA, ');
         IBQ_Gravar.SQL.Add(':PALIQUO, ');
         IBQ_Gravar.SQL.Add(':PPIS, ');
         IBQ_Gravar.SQL.Add(':PCOFINS, ');
         IBQ_Gravar.SQL.Add(':PICMS, ');
         IBQ_Gravar.SQL.Add(':PCOMISSAOPR, ');
         IBQ_Gravar.SQL.Add(':PCOMISSAOFU, ');
         IBQ_Gravar.SQL.Add(':PCOMISPRSN, ');
         IBQ_Gravar.SQL.Add(':PCORTESIA, ');
         IBQ_Gravar.SQL.Add(':PTURNO, ');
         IBQ_Gravar.SQL.Add(':PSTATUSCONT, ');
         IBQ_Gravar.SQL.Add(':PREDUCAO, ');
         IBQ_Gravar.SQL.Add(':POBSERVACAO, ');
         IBQ_Gravar.SQL.Add(':PCOMPLEMENTO, ');
         IBQ_Gravar.SQL.Add(':PPOSICAO, ');
         IBQ_Gravar.SQL.Add(':PLIGACOMP, ');
         IBQ_Gravar.SQL.Add(':PNIVEL_ISENTO, ');
         IBQ_Gravar.SQL.Add(':PIMPRESSO, ');
         IBQ_Gravar.SQL.Add(':PPESSOAS, ');
         IBQ_Gravar.SQL.Add(':PTAXA_MEM ');
         IBQ_Gravar.SQL.Add(' )');
         IBQ_Gravar.ParamByName('PCODIGO_ID').Value         := 0;
         IBQ_Gravar.ParamByName('PMESA').Value              := gFicha;
         IBQ_Gravar.ParamByName('PSEQUENCIA').Value         := gSequencia;

         // Vendedor
         if (IBQ_FuncionarioCODIGO_ID.AsInteger > 0) then
            IBQ_Gravar.ParamByName('PGARCOM').Value         := IBQ_FuncionarioCODIGO_ID.Value
         else
            IBQ_Gravar.ParamByName('PGARCOM').Value         := Null;

         // Produto
         if (IBQ_ProdutosCODIGO_ID.AsInteger > 0) then
            IBQ_Gravar.ParamByName('PPRODUTO').Value        := IBQ_ProdutosCODIGO_ID.Value
         else
            IBQ_Gravar.ParamByName('PPRODUTO').Value        := Null;

         IBQ_Gravar.ParamByName('PQUANTIDADE').Value        := ADOQ_NFIQTCOMP.Value;
         IBQ_Gravar.ParamByName('PCANCELADA').Value         := 'N';
         IBQ_Gravar.ParamByName('PIMP_REMOTA').Value        := 'N';

         // Ponto de venda
         if (IBQ_FuncionarioPONTOVENDA.AsInteger > 0) then
            IBQ_Gravar.ParamByName('PPONTOVENDA').Value     := IBQ_FuncionarioPONTOVENDA.Value
         else
            IBQ_Gravar.ParamByName('PPONTOVENDA').Value     := Null;

         IBQ_Gravar.ParamByName('PHORA').Value              := FormatDateTime('hh:mm', ADOQ_NFHRHORA.Value);
         IBQ_Gravar.ParamByName('PDATE').AsDate             := ADOQ_NFIDTNOTA.Value;
         IBQ_Gravar.ParamByName('PMESAFECHA').Value         := gFicha;
         IBQ_Gravar.ParamByName('PSEQFECHA').Value          := gSequencia;

         // Grupo
         if (IBQ_ProdutosGRUPO.AsInteger > 0) then
            IBQ_Gravar.ParamByName('PGRUPO').Value          := IBQ_ProdutosGRUPO.Value
         else
            IBQ_Gravar.ParamByName('PGRUPO').Value          := Null;

         IBQ_Gravar.ParamByName('PPRC_UNITARIO').Value      := ADOQ_NFIPRECOUNIT.Value;
         IBQ_Gravar.ParamByName('PBALANCA').Value           := 'N';
         IBQ_Gravar.ParamByName('POPCANCEL').Value          := Null;

         // Aliquota
         if (IBQ_ProdutosTRIBUTAR.AsInteger > 0) then
            IBQ_Gravar.ParamByName('PALIQUOTA').Value       := IBQ_ProdutosTRIBUTAR.Value
         else
            IBQ_Gravar.ParamByName('PALIQUOTA').Value       := Null;

         IBQ_Gravar.ParamByName('PDATA_INICIO').Value    := Null;
         IBQ_Gravar.ParamByName('PDATA_FINAL').Value     := Null;
         IBQ_Gravar.ParamByName('PHORA_INICIO').Value    := Null;
         IBQ_Gravar.ParamByName('PHORA_FINAL').Value     := Null;
         IBQ_Gravar.ParamByName('PDESCONTO').Value       := ADOQ_NFIVLDESCITEM.Value;
         IBQ_Gravar.ParamByName('PFINALIZADA').Value     := 'S';
         IBQ_Gravar.ParamByName('POBS').Value            := Null;
         IBQ_Gravar.ParamByName('PIMP_DIARIA').Value     := Null;
         IBQ_Gravar.ParamByName('PIMP_CONTINT').Value    := Null;
         IBQ_Gravar.ParamByName('PIMP_CANCELINT').Value  := Null;
         IBQ_Gravar.ParamByName('PCLIENTEDIARIA').Value  := Null;
         IBQ_Gravar.ParamByName('PACRESCIMO').Value      := 0;
         IBQ_Gravar.ParamByName('PTAXA').Value           := 0;
         IBQ_Gravar.ParamByName('PALIQUO').Value         := IBT_AliquotaALIQUO.Value;
         IBQ_Gravar.ParamByName('PPIS').Value            := 0;
         IBQ_Gravar.ParamByName('PCOFINS').Value         := 0;
         IBQ_Gravar.ParamByName('PICMS').Value           := 0;
         IBQ_Gravar.ParamByName('PCOMISSAOPR').Value     := Null;
         IBQ_Gravar.ParamByName('PCOMISSAOFU').Value     := Null;
         IBQ_Gravar.ParamByName('PCOMISPRSN').Value      := Null;
         IBQ_Gravar.ParamByName('PCORTESIA').Value       := 'N';

         // Turno
         if (IBQ_Funcionarioturno.AsInteger > 0) then
            IBQ_Gravar.ParamByName('PTURNO').Value       := IBQ_Funcionarioturno.Value
         else
            IBQ_Gravar.ParamByName('PTURNO').Value       := Null;

         IBQ_Gravar.ParamByName('PSTATUSCONT').Value     := Null;
         IBQ_Gravar.ParamByName('PREDUCAO').Value        := Null;
         IBQ_Gravar.ParamByName('POBSERVACAO').Value     := Null;
         IBQ_Gravar.ParamByName('PCOMPLEMENTO').Value    := 'N';
         IBQ_Gravar.ParamByName('PPOSICAO').Value        := Null;
         IBQ_Gravar.ParamByName('PLIGACOMP').Value       := Null;
         IBQ_Gravar.ParamByName('PNIVEL_ISENTO').Value   := 0;
         IBQ_Gravar.ParamByName('PIMPRESSO').Value       := 'S';
         IBQ_Gravar.ParamByName('PPESSOAS').Value        := Null;
         IBQ_Gravar.ParamByName('PTAXA_MEM').Value       := Null;
         IBQ_Gravar.ExecSQL;

         // Baixa no estoque ................................................
         if (IBQ_ProdutosESTOQUE.AsString = 'S') then
         begin
            lanestoque('S',
                       IBQ_ProdutosCODIGO_ID.Value,
                       Now,
                       ADOQ_NFIQTCOMP.Value,
                       (ADOQ_NFIQTCOMP.Value*ADOQ_NFIPRECOUNIT.Value),
                       0,
                       0,
                       'Venda');
         end;

         ADOQ_NFI.Next;
      end;
      //========================================================================

      // Confirmar a venda......................................................
      IBTransaction1.CommitRetaining;
      // .......................................................................

      // BKP do arquivo de pedido ..............................................
      CopyFile(Pchar(vARQUIVOOFF+NomeArquivo),Pchar(vARQUIVOOFF+'BKP\'+NomeArquivo),False);
      DeleteFile(vARQUIVOOFF+NomeArquivo);
   except
      IBTransaction1.Rollback;

      try
         CloseFile(vLer);
         CloseFile(vGravar);
      finally
         // Erro do arquivo de pedido ..............................................
         CopyFile(Pchar(vARQUIVOOFF+NomeArquivo),Pchar(vARQUIVOOFF+'ERRO\'+NomeArquivo),False);
         DeleteFile(vARQUIVOOFF+NomeArquivo);




      end;
   end;
end;

procedure TFRM_MSP.CCVenda(pCaixa:Integer; pCupom:Integer ; pOperador : Integer; pData : TDate; pHora : String);
var
   ytempo : TDateTime;
begin
   try
      // Localiza Venda --------------------------------------------------------
      IBQ_Pesquisa.Close;
      IBQ_Pesquisa.SQL.Clear;
      IBQ_Pesquisa.SQL.Add('select *');
      IBQ_Pesquisa.SQL.Add('from mesafecha');
      IBQ_Pesquisa.SQL.Add('where (SEQ_FISCAL = :pSEQ_FISCAL) and (NUM_CAIXA = :pNUM_CAIXA)');
      IBQ_Pesquisa.ParamByName('pSEQ_FISCAL').Value := pCupom;
      IBQ_Pesquisa.ParamByName('pNUM_CAIXA').Value  := pCaixa;
      IBQ_Pesquisa.Open;

      IBQ_Pesquisa.Last;
      IBQ_Pesquisa.First;
      //------------------------------------------------------------------------

      IBT_Produtos.Close;
      IBT_Produtos.Open;

      if (IBQ_Pesquisa.RecordCount > 0) then
      begin
         IBQ_Gravar.Close;
         IBQ_Gravar.SQL.Clear;
         IBQ_Gravar.SQL.Add('update mesafecha');
         IBQ_Gravar.SQL.Add('set cancelado = :P_SN, opcancel = :popcancel');
         IBQ_Gravar.ParamByName('P_SN').Value        := 'S';
         IBQ_Gravar.ParamByName('popcancel').Value   := pOperador;
         IBQ_Gravar.SQL.Add('where (mesafecha = :p_mesa) and (seqfecha = :p_sequencia)');
         IBQ_Gravar.ParamByName('p_mesa').Value      := IBQ_Pesquisa.FieldByName('mesafecha').Value;
         IBQ_Gravar.ParamByName('p_sequencia').Value := IBQ_Pesquisa.FieldByName('seqfecha').Value;
         IBQ_Gravar.ExecSQL;
      end;

      if (IBQ_Pesquisa.RecordCount > 0) then
      begin
         { Acertar estoque }
         IBQ_PesCancela.Close;
         IBQ_PesCancela.SQL.Clear;
         IBQ_PesCancela.SQL.Add('select *');
         IBQ_PesCancela.SQL.Add('from mesaitem');
         IBQ_PesCancela.SQL.Add('where (mesafecha = :p_mesa) and (seqfecha = :p_sequencia)');
         IBQ_PesCancela.ParamByName('p_mesa').Value      := IBQ_Pesquisa.FieldByName('mesafecha').Value;
         IBQ_PesCancela.ParamByName('p_sequencia').Value := IBQ_Pesquisa.FieldByName('seqfecha').Value;
         IBQ_PesCancela.SQL.Add('and (cancelada <> :p_cancelada)');
         IBQ_PesCancela.ParamByName('p_cancelada').Value := 'S';
         IBQ_PesCancela.Open;

         IBQ_PesCancela.First;
         while not IBQ_PesCancela.Eof do
         begin
            IBT_Produtos.Locate('CODIGO_ID',IBQ_PesCancelaPRODUTO.Value,[]);

            if IBT_ProdutosESTOQUE.Value = 'S' then
            begin
               ytempo := Now;

               lanestoque('E',
                          IBT_ProdutosCODIGO_ID.Value,
                          ytempo,
                          StrToFloat(FormatFloat('########0.000',IBQ_PesCancela.FieldByName('QUANTIDADE').Value)),
                          IBT_ProdutosPRECOCUSTO.Value*StrToFloat(FormatFloat('########0.000',IBQ_PesCancela.FieldByName('QUANTIDADE').Value)),
                          0,
                          0,
                          'Venda - Cancelada');
            end;

            IBQ_PesCancela.Next;
         end;

         IBQ_Gravar.Close;
         IBQ_Gravar.SQL.Clear;
         IBQ_Gravar.SQL.Add('update mesaitem');
         IBQ_Gravar.SQL.Add('set cancelada = :P_SN, opcancel = :popcancel, "DATE" = :P_data, hora = :P_hora');
         IBQ_Gravar.ParamByName('P_SN').Value          := 'S';
         IBQ_Gravar.ParamByName('popcancel').AsInteger := pOperador;

         IBQ_Gravar.ParamByName('P_data').AsDate       := Date;
         IBQ_Gravar.ParamByName('P_hora').AsString     := FormatDateTime('hh:mm', Now);

         //IBQ_Gravar.ParamByName('P_data').AsDate       := pData;
         //IBQ_Gravar.ParamByName('P_hora').AsString     := copy(pHora,1,5);

         IBQ_Gravar.SQL.Add('where (mesafecha = :p_mesa) and (seqfecha = :p_sequencia)');
         IBQ_Gravar.ParamByName('p_mesa').Value        := IBQ_Pesquisa.FieldByName('mesafecha').Value;
         IBQ_Gravar.ParamByName('p_sequencia').Value   := IBQ_Pesquisa.FieldByName('seqfecha').Value;
         IBQ_Gravar.ExecSQL;
      end;

      IBTransaction1.CommitRetaining;
   except
      IBTransaction1.Rollback;
   end;
end;

function TFRM_MSP.RecProdVir(_TP:string; _matprima:Integer; _QTD:Double): Boolean;
begin
  try
     { Altera a quantidade virtual do produto }
     IBQ_GravaProd.Close;
     IBQ_GravaProd.SQL.Clear;
     IBQ_GravaProd.SQL.Add('UPDATE PRODUTOS');
     IBQ_GravaProd.SQL.Add('set ESTOQUE_VIRTUAL = ESTOQUE_VIRTUAL + :p_ESTOQUE_VIRTUAL');

     if _TP = 'E' then
        IBQ_GravaProd.ParamByName('p_ESTOQUE_VIRTUAL').Value := _QTD
     else
        IBQ_GravaProd.ParamByName('p_ESTOQUE_VIRTUAL').Value := _QTD*(-1);

     IBQ_GravaProd.SQL.Add('Where codigo_id = :codigo_id');
     IBQ_GravaProd.ParamByName('codigo_id').Value := _matprima ;
     IBQ_GravaProd.ExecSQL;

     IBTransaction1.CommitRetaining;

     Result := True;
  except
     Result := False;
  end;
end;

function TFRM_MSP.lanestoque(_ES:string; _produto:Integer; _Data:TDateTime; _QTD:Double; _Total:Currency;
                             _cliente:Integer; _centrocusto:Integer; _Historico:string ): Boolean;
var
   _lproduto : Integer;
       _lQTD : Double;
begin
   { Lanca no Estoque }
   try
      //Pesquisar produto
      IBQ_ProEst.Close;
      IBQ_ProEst.SQL.Clear;
      IBQ_ProEst.SQL.Add('select * from PRODUTOS');
      IBQ_ProEst.SQL.Add('where (Codigo_id = :P_CodigoID)');
      IBQ_ProEst.ParamByName('P_CodigoID').Value := _produto;
      IBQ_ProEst.Open;

      if (IBQ_ProEstESTLISTA_SN.Value = 'N') then
      begin
         if _ES = 'E' then
         begin
            IBQ_MovEstoque.Close;
            IBQ_MovEstoque.SQL.Clear;

            if _cliente <> 0 then
            begin
               IBQ_MovEstoque.SQL.Add('INSERT INTO MOVTOSTQ (CODIGO_ID, PRODUTOS, CLIFOR, HISTORICO, VALENTRADA, QTDENTRADA, VALSAIDA, QTDSAIDA, VALSALDO, QTDSALDO, DATA)');
               IBQ_MovEstoque.SQL.Add('              VALUES (0, :P_PRODUTOS, :P_CLIFOR, :P_HISTORICO, :P_VALENTRADA, :P_QTDENTRADA, :P_VALSAIDA, :P_QTDSAIDA, :P_VALSALDO, :P_QTDSALDO, :P_DATA)');
            end
            else
            begin
               IBQ_MovEstoque.SQL.Add('INSERT INTO MOVTOSTQ (CODIGO_ID, PRODUTOS, HISTORICO, VALENTRADA, QTDENTRADA, VALSAIDA, QTDSAIDA, VALSALDO, QTDSALDO, DATA)');
               IBQ_MovEstoque.SQL.Add('              VALUES (0, :P_PRODUTOS, :P_HISTORICO, :P_VALENTRADA, :P_QTDENTRADA, :P_VALSAIDA, :P_QTDSAIDA, :P_VALSALDO, :P_QTDSALDO, :P_DATA)');
            end;

            IBQ_MovEstoque.ParamByName('P_PRODUTOS').Value    := _produto;

            if _cliente <> 0 then
               IBQ_MovEstoque.ParamByName('P_CLIFOR').Value   := _cliente;

            IBQ_MovEstoque.ParamByName('P_HISTORICO').Value   := _Historico;
            IBQ_MovEstoque.ParamByName('P_VALENTRADA').Value  := _Total;
            IBQ_MovEstoque.ParamByName('P_QTDENTRADA').Value  := _QTD;
            IBQ_MovEstoque.ParamByName('P_VALSAIDA').Value    := 0.00;
            IBQ_MovEstoque.ParamByName('P_QTDSAIDA').Value    := 0.00;
            IBQ_MovEstoque.ParamByName('P_VALSALDO').Value    := 0.00;
            IBQ_MovEstoque.ParamByName('P_QTDSALDO').Value    := 0.00;
            IBQ_MovEstoque.ParamByName('P_DATA').Value        := _Data;
            IBQ_MovEstoque.ExecSQL;

            IBTransaction1.CommitRetaining;
         end
         else if _ES = 'S' then
         begin
            //if _XVERIFICASALDOZERO = 'S' then
            //begin
            //   IBQ_CalEstoque.Close;
            //   IBQ_CalEstoque.SQL.Clear;
            //   IBQ_CalEstoque.SQL.Add('Select *');
            //   IBQ_CalEstoque.SQL.Add('From MOVTOSTQ');
            //   IBQ_CalEstoque.SQL.Add('Where produtos = :P_produtos');
            //   IBQ_CalEstoque.ParamByName('P_produtos').Value := _produto;
            //   IBQ_CalEstoque.Open;
            //
            //   if IBQ_CalEstoque.RecordCount = 0 then
            //      ShowMessage('Não há nada lançado para este produto no estoque !!!');
            //end;

            IBQ_MovEstoque.Close;
            IBQ_MovEstoque.SQL.Clear;

            if _cliente <> 0 then
            begin
               IBQ_MovEstoque.SQL.Add('INSERT INTO MOVTOSTQ (CODIGO_ID, PRODUTOS, CLIFOR, HISTORICO, VALENTRADA, QTDENTRADA, VALSAIDA, QTDSAIDA, VALSALDO, QTDSALDO, DATA)');
               IBQ_MovEstoque.SQL.Add('              VALUES (0, :P_PRODUTOS, :P_CLIFOR, :P_HISTORICO, :P_VALENTRADA, :P_QTDENTRADA, :P_VALSAIDA, :P_QTDSAIDA, :P_VALSALDO, :P_QTDSALDO, :P_DATA)');
            end
            else
            begin
               IBQ_MovEstoque.SQL.Add('INSERT INTO MOVTOSTQ (CODIGO_ID, PRODUTOS, HISTORICO, VALENTRADA, QTDENTRADA, VALSAIDA, QTDSAIDA, VALSALDO, QTDSALDO, DATA)');
               IBQ_MovEstoque.SQL.Add('              VALUES (0, :P_PRODUTOS, :P_HISTORICO, :P_VALENTRADA, :P_QTDENTRADA, :P_VALSAIDA, :P_QTDSAIDA, :P_VALSALDO, :P_QTDSALDO, :P_DATA)');
            end;

            IBQ_MovEstoque.ParamByName('P_PRODUTOS').Value    := _produto;

            if _cliente <> 0 then
               IBQ_MovEstoque.ParamByName('P_CLIFOR').Value   := _cliente;

            IBQ_MovEstoque.ParamByName('P_HISTORICO').Value   := _Historico;
            IBQ_MovEstoque.ParamByName('P_VALENTRADA').Value  := 0.00;
            IBQ_MovEstoque.ParamByName('P_QTDENTRADA').Value  := 0.00;
            IBQ_MovEstoque.ParamByName('P_VALSAIDA').Value    := 0.00;
            IBQ_MovEstoque.ParamByName('P_QTDSAIDA').Value    := _QTD;
            IBQ_MovEstoque.ParamByName('P_VALSALDO').Value    := 0.00;
            IBQ_MovEstoque.ParamByName('P_QTDSALDO').Value    := 0.00;
            IBQ_MovEstoque.ParamByName('P_DATA').Value        := _Data;
            IBQ_MovEstoque.ExecSQL;

            IBTransaction1.CommitRetaining;
         end;

         { Recalcular estoque virtual }
         RecProdVir(_ES,_produto,_QTD);
      end
      else
      begin
         IBQ_LisEst.Close;
         IBQ_LisEst.Open;

         IBQ_LisEst.First;
         while not IBQ_LisEst.EOF do
         begin
            _lproduto := IBQ_LisEstMATERIAL.Value;
            _lQTD     := IBQ_LisEstQTD.Value*_QTD;

            if _ES = 'E' then
            begin
               IBQ_MovEstoque.Close;
               IBQ_MovEstoque.SQL.Clear;

               if _cliente <> 0 then
               begin
                  IBQ_MovEstoque.SQL.Add('INSERT INTO MOVTOSTQ (CODIGO_ID, PRODUTOS, CLIFOR, HISTORICO, VALENTRADA, QTDENTRADA, VALSAIDA, QTDSAIDA, VALSALDO, QTDSALDO, DATA)');
                  IBQ_MovEstoque.SQL.Add('              VALUES (0, :P_PRODUTOS, :P_CLIFOR, :P_HISTORICO, :P_VALENTRADA, :P_QTDENTRADA, :P_VALSAIDA, :P_QTDSAIDA, :P_VALSALDO, :P_QTDSALDO, :P_DATA)');
               end
               else
               begin
                  IBQ_MovEstoque.SQL.Add('INSERT INTO MOVTOSTQ (CODIGO_ID, PRODUTOS, HISTORICO, VALENTRADA, QTDENTRADA, VALSAIDA, QTDSAIDA, VALSALDO, QTDSALDO, DATA)');
                  IBQ_MovEstoque.SQL.Add('              VALUES (0, :P_PRODUTOS, :P_HISTORICO, :P_VALENTRADA, :P_QTDENTRADA, :P_VALSAIDA, :P_QTDSAIDA, :P_VALSALDO, :P_QTDSALDO, :P_DATA)');
               end;

               IBQ_MovEstoque.ParamByName('P_PRODUTOS').Value    := _lproduto;

               if _cliente <> 0 then
                  IBQ_MovEstoque.ParamByName('P_CLIFOR').Value   := _cliente;

               IBQ_MovEstoque.ParamByName('P_HISTORICO').Value   := _Historico;
               IBQ_MovEstoque.ParamByName('P_VALENTRADA').Value  := IBQ_LisEstPRECOCUSTO.Value*_lQTD;
               IBQ_MovEstoque.ParamByName('P_QTDENTRADA').Value  := _lQTD;
               IBQ_MovEstoque.ParamByName('P_VALSAIDA').Value    := 0.00;
               IBQ_MovEstoque.ParamByName('P_QTDSAIDA').Value    := 0.00;
               IBQ_MovEstoque.ParamByName('P_VALSALDO').Value    := 0.00;
               IBQ_MovEstoque.ParamByName('P_QTDSALDO').Value    := 0.00;
               IBQ_MovEstoque.ParamByName('P_DATA').Value        := _Data;
               IBQ_MovEstoque.ExecSQL;

               IBTransaction1.CommitRetaining;
            end
            else if _ES = 'S' then
            begin
               //if _XVERIFICASALDOZERO = 'S' then
               //begin
               //   IBQ_CalEstoque.Close;
               //   IBQ_CalEstoque.SQL.Clear;
               //   IBQ_CalEstoque.SQL.Add('Select *');
               //   IBQ_CalEstoque.SQL.Add('From MOVTOSTQ');
               //   IBQ_CalEstoque.SQL.Add('Where produtos = :P_produtos');
               //   IBQ_CalEstoque.ParamByName('P_produtos').Value := _produto;
               //   IBQ_CalEstoque.Open;
               //
               //   if IBQ_CalEstoque.RecordCount = 0 then
               //      ShowMessage('Não há nada lançado para este produto no estoque !!!');
               //end;

               IBQ_MovEstoque.Close;
               IBQ_MovEstoque.SQL.Clear;

               if _cliente <> 0 then
               begin
                  IBQ_MovEstoque.SQL.Add('INSERT INTO MOVTOSTQ (CODIGO_ID, PRODUTOS, CLIFOR, HISTORICO, VALENTRADA, QTDENTRADA, VALSAIDA, QTDSAIDA, VALSALDO, QTDSALDO, DATA)');
                  IBQ_MovEstoque.SQL.Add('              VALUES (0, :P_PRODUTOS, :P_CLIFOR, :P_HISTORICO, :P_VALENTRADA, :P_QTDENTRADA, :P_VALSAIDA, :P_QTDSAIDA, :P_VALSALDO, :P_QTDSALDO, :P_DATA)');
               end
               else
               begin
                  IBQ_MovEstoque.SQL.Add('INSERT INTO MOVTOSTQ (CODIGO_ID, PRODUTOS, HISTORICO, VALENTRADA, QTDENTRADA, VALSAIDA, QTDSAIDA, VALSALDO, QTDSALDO, DATA)');
                  IBQ_MovEstoque.SQL.Add('              VALUES (0, :P_PRODUTOS, :P_HISTORICO, :P_VALENTRADA, :P_QTDENTRADA, :P_VALSAIDA, :P_QTDSAIDA, :P_VALSALDO, :P_QTDSALDO, :P_DATA)');
               end;

               IBQ_MovEstoque.ParamByName('P_PRODUTOS').Value    := _lproduto;

               if _cliente <> 0 then
                  IBQ_MovEstoque.ParamByName('P_CLIFOR').Value   := _cliente;

               IBQ_MovEstoque.ParamByName('P_HISTORICO').Value   := _Historico;
               IBQ_MovEstoque.ParamByName('P_VALENTRADA').Value  := 0.00;
               IBQ_MovEstoque.ParamByName('P_QTDENTRADA').Value  := 0.00;
               IBQ_MovEstoque.ParamByName('P_VALSAIDA').Value    := 0.00;
               IBQ_MovEstoque.ParamByName('P_QTDSAIDA').Value    := _lQTD;
               IBQ_MovEstoque.ParamByName('P_VALSALDO').Value    := 0.00;
               IBQ_MovEstoque.ParamByName('P_QTDSALDO').Value    := 0.00;
               IBQ_MovEstoque.ParamByName('P_DATA').Value        := _Data;
               IBQ_MovEstoque.ExecSQL;

               IBTransaction1.CommitRetaining;
            end;
   
            { Recalcular estoque virtual }
            RecProdVir(_ES,_lproduto,_lQTD);

            IBQ_LisEst.Next;
         end;
      end;

      Result := True;
   except
      Result := False;
   end;
end;

procedure TFRM_MSP.TrayMessage(var Msg: TMessage);
var
  Pt : TPoint;
begin
   case Msg.lParam of
      WM_LBUTTONDOWN:
      begin
         FRM_MSP.Show;
      end;
      WM_MBUTTONDOWN:
      begin
         FRM_MSP.Hide;
      end;
      WM_RBUTTONDOWN:
      begin
         GetCursorPos(Pt);
         FRM_MSP.PPP_Principal.Popup(Pt.X,Pt.Y);
      end;
   end;
end;

procedure TFRM_MSP.FormDestroy(Sender: TObject);
begin
   Shell_NotifyIcon(NIM_DELETE,@TrayIconData);
end;

procedure TFRM_MSP.FormCreate(Sender: TObject);
var
                              Ini : TIniFile;
        VarUser_Name, VarPassword : string;
       _Local,_Server,_Path,_Base : String;
begin
   Application.ShowMainForm := False;

   // Colocar na Bandeja........................................................
   with TrayIconData do
   begin
      cbSize           := sizeof(TrayIconData);
      Wnd              := Self.Handle;
      uId              := 0;
      uCallBackMessage := WM_TRAYICON;
      uFlags           := NIF_ICON or NIF_TIP or NIF_MESSAGE;
      hIcon            := Application.Icon.Handle;
      szTip            := 'MSP';
   end;

   Shell_NotifyIcon(NIM_ADD,@TrayIconData);
   //...........................................................................

   {Senha IB}
   VarUser_Name := 'sysdba';
   VarPassword  := 'sysdbambd';
   _app         := GetCurrentDir;

   Try
      if DataBaseIB.Connected = True then
         DataBaseIB.Connected := False;

      Ini     := TIniFile.Create( _app+'\CONFIG.INI' );

      { ALIAS 1}
      _Local         := Ini.ReadString( 'CONFBASE', 'LOCAL' , '' );
      _Server        := Ini.ReadString( 'CONFBASE', 'SERVER', '' );
      _Path          := Ini.ReadString( 'CONFBASE', 'PATH'  , '' );
      _Base          := Ini.ReadString( 'CONFBASE', 'BASE'  , '' );

      // Arquivos bemacash
      vARQUIVOOFF    := Ini.ReadString( 'BEMACASH','ARQUIVOOFF','C:\MBD\');
      vADDDV         := Ini.ReadString( 'BEMACASH','ADDDV','N');
      _TPBaixa       := Ini.ReadString( 'BEMACASH','TPBaixa','A');   // A - Arquivo / B - Banco

      // Cria o diretorios
      if not DirectoryExists(vARQUIVOOFF) then
         ForceDirectories(vARQUIVOOFF);

      if not DirectoryExists(vARQUIVOOFF+'BKP\') then
         ForceDirectories(vARQUIVOOFF+'BKP\');

      if not DirectoryExists(vARQUIVOOFF+'GERAR\') then
         ForceDirectories(vARQUIVOOFF+'GERAR\');

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

      IBTransaction1.Active := True;

      Ini.Free;
   except
      if _Base = '' then
         ShowMessage('Arquivo Config.ini não encontrado.'+#13+#10+
                     'Seu sistema será fechado!!!')
      else
         ShowMessage('Ocorreu um erro na Abertura da Base'+#13+#10+
                     'Seu sistema será fechado!!!');

      Application.Terminate;
      Exit;
   end;

   FRM_MSP.Caption := 'MSP';

   //TRM_ProcessarPedido.Enabled := True;

   pAcessaIniSql;
end;

procedure TFRM_MSP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caNone;
   Hide;
end;

procedure TFRM_MSP.Sair1Click(Sender: TObject);
begin
   Close;
   Application.Terminate;
end;

procedure TFRM_MSP.TRM_ProcessarPedidoTimer(Sender: TObject);
var
                       Ini : TIniFile;

                        SR : TSearchRec;
                   IsFound : Integer;

                        SR1 : TSearchRec;
                   IsFound1 : Integer;


                    vlinha : String;
                      vLer : Textfile;
   vPedido, vCupom, vCount : Integer;

   // Tipo C ...................................................................
                              //cFilial : Integer;
            cCaixa, cOperador, cCupom : Integer;
                                cData : TDate;
                                cHora : String;

                             vDataArq : TDateTime;
begin
   // Escutar pedidos do Bemacash
   TRM_ProcessarPedido.Enabled := False;

   try
      Ini         := TIniFile.Create( GetCurrentDir+'\CONFIG.INI' );
      vARQUIVOOFF := Ini.ReadString( 'BEMACASH','ARQUIVOOFF','C:\MBD\');


      // Pegar lista de arquivos ...............................................
      IsFound1 := FindFirst(vARQUIVOOFF+'cf*.*', faAnyFile, SR1);
      Sleep(3000);
      IsFound := FindFirst(vARQUIVOOFF+'pp*.*', faAnyFile, SR);
      //........................................................................



      Sleep(1000);
      // (pp)-Pedido ...........................................................
      while IsFound = 0 do
      begin
         // Verifica se o arquivo ainda existe
         if not FileExists((vARQUIVOOFF+sr.Name)) then
         begin
            IsFound := FindNext(SR);
            Continue;
         end;

         try
            // ler arquivo......................................................
            AssignFile(vLer,(vARQUIVOOFF+sr.Name));
            Reset(vLer);

            vCount  := 0;
            vPedido := -1;
            vCupom  := -1;

            While not SeekEof(vLer) do
            begin
               Readln(vLer,vlinha);
               Inc(vCount,1);

               if (vCount = 1) then
                  vPedido := StrToInt(Copy(vlinha,2,6));

               if (vCount = 1) then
                  vCupom  := StrToInt(Copy(vlinha,15,10));
            end;

            CloseFile(vLer);
            //.....................................................................

            if (_TPBaixa = 'A') then
               BXPedido('CF'+FormatFloat('000000',vCupom)+copy(SR.Name,9,4),vPedido)
            else
               BXPedidoSQL('CF'+FormatFloat('000000',vCupom)+copy(SR.Name,9,4),vPedido);

            // BKP do arquivo de pedido .........................................
            CopyFile(Pchar(vARQUIVOOFF+sr.Name),Pchar(vARQUIVOOFF+'BKP\'+sr.Name),False);
            DeleteFile(vARQUIVOOFF+sr.Name);

            IsFound := FindNext(SR);
         except
            IsFound := FindNext(SR);
            Continue;
         end;
      end;

      FindClose(SR);
      // .......................................................................





      Sleep(1000);
      // (cf) - Cupom ..........................................................
      while IsFound1 = 0 do
      begin
         // Verifica se o arquivo ainda existe..................................
         if not FileExists(vARQUIVOOFF+SR1.Name) then
         begin
            IsFound1 := FindNext(SR1);
            Continue;
         end;

         // Verifica se o arquivo tem mais de 3 minutos de vida.................
         vDataArq := DataDeCriacao(vARQUIVOOFF+SR1.Name);

         if not (Now > IncMinute(vDataArq ,3)) then
         begin
            IsFound1 := FindNext(SR1);
            Continue;
         end;

         try
            if (_TPBaixa = 'A') then
               BXPedido(SR1.Name,0)
            else
               BXPedidoSQL(SR1.Name,0);

            IsFound1 := FindNext(SR1);
         except
            IsFound1 := FindNext(SR1);
            Continue;
         end;
      end;

      FindClose(SR1);
      //........................................................................





      // (cc)- Cancelamento de cupom ...........................................
      IsFound := FindFirst(vARQUIVOOFF+'cc*.*', faAnyFile, SR);
      while IsFound = 0 do
      begin
         // Verifica se o arquivo ainda existe..................................
         if not FileExists(vARQUIVOOFF+SR.Name) then
         begin
            IsFound := FindNext(SR);
            Continue;
         end;

         // Verifica se o arquivo tem mais de 5 minutos de vida.................
         vDataArq := DataDeCriacao(vARQUIVOOFF+SR.Name);

         if not (Now > IncMinute(vDataArq ,5)) then
         begin
            IsFound := FindNext(SR);
            Continue;
         end;
         
         try
            // ler arquivo......................................................
            AssignFile(vLer,(vARQUIVOOFF+sr.Name));
            Reset(vLer);

            cCaixa    := 0;
            cOperador := 0;
            cData     := Now;
            cHora     := '00:00';
            cCupom    := 0;

            While not SeekEof(vLer) do
            begin
               Readln(vLer,vlinha);

               if ((Copy(vlinha,1,1) = 'C') and (Copy(vlinha,1,2) <> 'CL'))then
               begin
                  //cFilial   := StrToInt(Copy(vlinha,2,4));
                  cCaixa    := StrToInt(Copy(vlinha,6,3));
                  cOperador := StrToInt(Copy(vlinha,9,9));
                  cData     := StrToDate(Copy(vlinha,18,8));
                  cHora     := Copy(vlinha,26,2)+':'+Copy(vlinha,28,2)+':'+Copy(vlinha,30,2);
                  cCupom    := StrToInt(Copy(vlinha,32,6));
               end;
            end;

            CloseFile(vLer);
            // .................................................................

            CCVenda(cCaixa,cCupom,cOperador,cData,cHora);

            // BKP do arquivo do arquivo de cancelamento .......................
            CopyFile(Pchar(vARQUIVOOFF+sr.Name),Pchar(vARQUIVOOFF+'BKP\'+sr.Name),False);
            DeleteFile(vARQUIVOOFF+sr.Name);

            IsFound := FindNext(SR);
         except
            // ERRO do arquivo do arquivo de cancelamento ......................
            CopyFile(Pchar(vARQUIVOOFF+sr.Name),Pchar(vARQUIVOOFF+'ERRO\'+sr.Name),False);
            DeleteFile(vARQUIVOOFF+sr.Name);

            IsFound := FindNext(SR);
            Continue;
         end;
      end;

      FindClose(SR);
      // .......................................................................
   except
      Ini.Free;
   end;

   Sleep(1000);
   TRM_ProcessarPedido.Enabled := True;
end;

initialization
   vADDDV := 'N';

end.
