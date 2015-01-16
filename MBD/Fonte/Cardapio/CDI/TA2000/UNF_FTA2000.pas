unit UNF_FTA2000;

interface

//--------------TA2000-----------------//
// Declaracao da funcao que permite entrar com dados nos display e tambem ler dados
function iEnviarDadosFormatados_TA2000_Daruma(szTexto: String; szRetorno: String): Integer; StdCall; External 'DarumaFrameWork.dll'
function regPorta_TA2000_Daruma(stParametro: String): Integer; StdCall; External 'DarumaFrameWork.dll'
function regAuditoria_TA2000_Daruma(stParametro: String): Integer; StdCall; External 'DarumaFrameWork.dll'
function regMensagemBoasVindasLinha1_TA2000_Daruma(stParametro: String): Integer; StdCall; External 'DarumaFrameWork.dll'
function regMensagemBoasVindasLinha2_TA2000_Daruma(stParametro: String): Integer; StdCall; External 'DarumaFrameWork.dll'
function regMarcadorOpcao_TA2000_Daruma(stParametro: String): Integer; StdCall; External 'DarumaFrameWork.dll'
function regMascara_TA2000_Daruma(stParametro: String): Integer; StdCall; External 'DarumaFrameWork.dll'
function regMascaraLetra_TA2000_Daruma(stParametro: String): Integer; StdCall; External 'DarumaFrameWork.dll'
function regMascaraNumero_TA2000_Daruma(stParametro: String): Integer; StdCall; External 'DarumaFrameWork.dll'
function regMascaraEco_TA2000_Daruma(stParametro: String): Integer; StdCall; External 'DarumaFrameWork.dll'
function eDefinirProduto_Daruma(szProduto: String): Integer; StdCall; External 'DarumaFrameWork.dll'

//Dual--------------------------------------------------------------------------
function iImprimirTexto_DUAL_DarumaFramework(stTexto: String; iTam: Integer ): Integer; StdCall; External 'DarumaFrameWork.dll'

implementation

end.
