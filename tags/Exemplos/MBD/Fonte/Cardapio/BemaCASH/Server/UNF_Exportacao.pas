unit UNF_Exportacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, IBCustomDataSet, IBQuery, IBTable, Criptografar_TLB,
  OleServer;

type
  TFRM_Exportacao = class(TForm)
    PNL_Tipos: TPanel;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    CHK_Produtos: TCheckBox;
    BTN_Exportar: TButton;
    LBL_Status: TLabel;
    BTN_Sair: TButton;
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
    IBT_Tributar: TIBTable;
    IBT_TributarCODIGO_ID: TIntegerField;
    IBT_TributarCODIGO: TIBStringField;
    IBT_TributarDESCRICAO: TIBStringField;
    IBT_TributarALIQUOTA: TFloatField;
    IBT_TributarSITUACAO: TIBStringField;
    IBT_TributarSSITUACAO: TIBStringField;
    IBT_TributarALIQUO: TIBStringField;
    IBQ_ProdutosDesUnidade: TStringField;
    CHK_Aliquotas: TCheckBox;
    IBT_Aliquotas: TIBTable;
    IBT_AliquotasCODIGO_ID: TIntegerField;
    IBT_AliquotasCODIGO: TIBStringField;
    IBT_AliquotasDESCRICAO: TIBStringField;
    IBT_AliquotasALIQUOTA: TFloatField;
    IBT_AliquotasSITUACAO: TIBStringField;
    IBT_AliquotasSSITUACAO: TIBStringField;
    IBT_AliquotasALIQUO: TIBStringField;
    CHK_Clientes: TCheckBox;
    IBT_Clientes: TIBTable;
    IBT_ClientesCODIGO_ID: TIntegerField;
    IBT_ClientesNOMEFANTASIA: TIBStringField;
    IBT_ClientesRAZAOSOCIAL: TIBStringField;
    IBT_ClientesCNPJ: TIBStringField;
    IBT_ClientesCPF: TIBStringField;
    IBT_ClientesIE: TIBStringField;
    IBT_ClientesRG: TIBStringField;
    IBT_ClientesENDERECO: TIBStringField;
    IBT_ClientesBAIRRO: TIBStringField;
    IBT_ClientesCIDADE: TIBStringField;
    IBT_ClientesTELEFONE: TIBStringField;
    IBT_ClientesFAX: TIBStringField;
    IBT_ClientesCONTATO: TIBStringField;
    IBT_ClientesEMAIL: TIBStringField;
    IBT_ClientesSITE: TIBStringField;
    IBT_ClientesATIVO: TIBStringField;
    IBT_ClientesCEP: TIBStringField;
    IBT_ClientesUF: TIBStringField;
    IBT_ClientesTIPOCLIFOR: TIBStringField;
    IBT_ClientesMATRICULA: TIBStringField;
    IBT_ClientesOBSERVACAO: TBlobField;
    IBT_ClientesSALDO_CASTO: TFloatField;
    IBT_ClientesSALDO_LIMITE: TFloatField;
    IBT_ClientesTRAVAMENSAGEM: TIBStringField;
    IBT_ClientesCONTRATO: TIBStringField;
    IBT_ClientesDTCADASTRO: TDateField;
    IBT_ClientesCODCONTMATIC: TIBStringField;
    IBT_ClientesTP_PESSOAL: TIBStringField;
    IBT_ClientesCELULAR: TIBStringField;
    IBT_ClientesDATA_NASC: TDateField;
    CHK_CondPagto: TCheckBox;
    IBT_Formapagto: TIBTable;
    IBT_FormaParcela: TIBTable;
    DTS_FormaPagto: TDataSource;
    IBT_FormaParcelaCODIGO_ID: TIntegerField;
    IBT_FormaParcelaFORMAPAGTO: TIntegerField;
    IBT_FormaParcelaPARCELA: TIntegerField;
    IBT_FormaParcelaDIAS: TIntegerField;
    IBT_FormapagtoCODIGO_ID: TIntegerField;
    IBT_FormapagtoDESCONTO: TFloatField;
    IBT_FormapagtoTIPOPAGTO: TIntegerField;
    IBT_FormapagtoMULTFORM: TIBStringField;
    IBT_FormapagtoTEF: TIBStringField;
    IBT_FormapagtoTIPO: TIBStringField;
    IBT_FormapagtoDESCRICAO: TIBStringField;
    IBT_FormapagtoDIAS: TIntegerField;
    IBT_FormapagtoQTDTICKET: TIntegerField;
    IBT_FormapagtoATIVO: TIBStringField;
    IBT_FormapagtoACRESCIMO: TFloatField;
    IBT_FormapagtoCORTESIA: TIBStringField;
    IBT_FormapagtoDOCVINC: TIBStringField;
    CHK_Operadores: TCheckBox;
    IBT_Funcionario: TIBTable;
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
    IBT_FuncionarioSTATUS: TIBStringField;
    IBT_FuncionarioOBSERVACAO: TBlobField;
    IBT_FuncionarioMOVEL: TIBStringField;
    IBT_FuncionarioCOMISSAO: TFloatField;
    IBT_FuncionarioRG: TIBStringField;
    IBT_FuncionarioCPF: TIBStringField;
    IBT_FuncionarioDT_ATESTADO: TDateField;
    DTS_Funcionario: TDataSource;
    IBT_Usuarios: TIBTable;
    IBT_UsuariosCODIGO_ID: TIntegerField;
    IBT_UsuariosLOGIN: TIBStringField;
    IBT_UsuariosNIVEL: TIntegerField;
    IBT_UsuariosCHPB: TIBStringField;
    IBT_UsuariosFUNCIONARIO: TIntegerField;
    IBT_UsuariosSENHA: TIBStringField;
    IBT_UsuariosARMAZENA: TIBStringField;
    CHK_Vendedores: TCheckBox;
    BemaCript: Tcripto;
    IBT_TipoPagto: TIBTable;
    IBT_TipoPagtoCODIGO_ID: TIntegerField;
    IBT_TipoPagtoDESCRICAO: TIBStringField;
    IBT_TipoPagtoGAVETA: TIBStringField;
    IBT_TipoPagtoJUROS: TFloatField;
    IBT_TipoPagtoNPARCELAS: TIntegerField;
    IBT_TipoPagtoINTERDIAS: TIntegerField;
    IBT_TipoPagtoPENTRADA: TFloatField;
    IBT_FormapagtoTIPOES: TIBStringField;
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
    IBT_ProdutosCBEMA: TLargeintField;
    CHK_CBEMA: TCheckBox;
    IBQ_ProdutosCBEMA: TLargeintField;
    procedure Aliquotas;
    procedure Clientes;
    procedure CondPagto;
    procedure Operadores;
    procedure Produtos;
    procedure Vendedores;
    procedure BTN_SairClick(Sender: TObject);
    procedure BTN_ExportarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_Exportacao: TFRM_Exportacao;

implementation

uses UNF_Funcoes, UNF_Mensagem, UNF_MensagemDeErro, UNF_Modulo,
     UNF_Pergunta, UNF_PesLookUp;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure TFRM_Exportacao.Aliquotas;
var
   log : TextFile;
begin
   try
      AssignFile(log,vARQUIVOOFF+'GERAR\'+'OFF_CAD_TABALIQUOTAS.PDV');
      Rewrite(log,vARQUIVOOFF+'GERAR\'+'OFF_CAD_TABALIQUOTAS.PDV');
      Append(log);

      // Layout do arquivo -----------------------------------------------------
      WriteLn(log,'CODIGO;STR(2)' + #9 +
                  'ALIQUOTA;DBL');

      IBT_Aliquotas.Close;
      IBT_Aliquotas.Open;

      // Descarregar o arquivo -------------------------------------------------
      IBT_Aliquotas.First;
      while not IBT_Aliquotas.Eof do
      begin
         LBL_Status.Caption := 'Aliquota : ' + IBT_AliquotasCODIGO.AsString + '-'+ IBT_AliquotasDESCRICAO.AsString;
         LBL_Status.Refresh;

         Write(log,copy(IBT_AliquotasCODIGO.AsString,1,2)+#9);                         //'CODIGO;STR(2)'
         Writeln(log,FormatFloat('000000',Round(IBT_AliquotasALIQUOTA.Value*10000)));  //'ALIQUOTA;DBL'

         IBT_Aliquotas.Next;
      end;

      CloseFile(log);

      CopyFile(Pchar(vARQUIVOOFF+'OFF_CAD_TABALIQUOTAS.PDV'),Pchar(vARQUIVOOFF+'BKP\OFF_CAD_TABALIQUOTAS.PDV'),False);
      CopyFile(Pchar(vARQUIVOOFF+'GERAR\OFF_CAD_TABALIQUOTAS.PDV'),Pchar(vARQUIVOOFF+'OFF_CAD_TABALIQUOTAS.PDV'),False);

      CHK_Aliquotas.Checked := False;
      CHK_Aliquotas.Enabled := False;
      LBL_Status.Caption := 'Fim da exportação do arquivo das Aliquotas!';
   except
      CloseFile(log);
      Mensagem('Erro na criação do arquivo das Aliquotas!');
   end;
end;

//------------------------------------------------------------------------------
procedure TFRM_Exportacao.Clientes;
var
   log : TextFile;
begin
   try
      AssignFile(log,vARQUIVOOFF+'GERAR\'+'OFF_CLIENTES.PDV');
      Rewrite(log,vARQUIVOOFF+'GERAR\'+'OFF_CLIENTES.PDV');
      Append(log);

      // Layout do arquivo -----------------------------------------------------
      WriteLn(log,'CODCLI;INT' + #9 +
                  'DIGCLI;INT' + #9 +
                  'NOMCLI;STR(40)' + #9 +
                  'CODSITCRED;STR(2)' + #9 +
                  'CODCONVENIO;INT' + #9 +
                  'VLLIMITECONVENIO;DBL' + #9 +
                  'VLSALDOCONVENIO;DBL' + #9 +
                  'FLEFETUACOMPRALIMITE;STR(1)' + #9 +
                  'CGCCPF;INT' + #9 +
                  'ENDERECO;STR(40)' + #9 +
                  'BAIRRO;STR(30)' + #9 +
                  'CIDADE;STR(60)' + #9 +
                  'ESTADO;STR(2)' + #9 +
                  'CEP;INT' + #9 +
                  'DDD;STR(4)' + #9 +
                  'FONE;STR(8)' + #9 +
                  'CODFUNCIONARIO;INT' + #9 +
                  'NUMERO;INT' + #9 +
                  'COMPLEMENTO;STR(20)' + #9 +
                  'STATUS;INT' + #9 +
                  'NATJUR;STR(1)' + #9 +
                  'SENHA;STR(8)' + #9 +
                  'VLLIMCRE;DBL' + #9 +
                  'FLREVENDEDOR;STR(1)' + #9 +
                  'CODTABDESC;STR(6)' + #9 +
                  'CONDPGTO;STR(3)' + #9 +
                  'NRDIASCARENCIA;STR(2)' + #9 +
                  'FLCOBRJURCARENCIA;STR(1)' + #9 +
                  'FLNAONEGATIVA;STR(1)' + #9 +
                  'NUMDOC;STR(15)' + #9 +
                  'FLSIMPLES;STR(1)' + #9 +
                  'FLMICROEMP;STR(1)' + #9 +
                  'TPINSC;STR(1)' + #9 +
                  'TPCREDITSCORE;STR(1)' + #9 +
                  'CODGRPECON;STR(6)' + #9 +
                  'PLIMCRE;DBL');

      // Consumidor-------------------------------------------------------------
      WriteLn(log,'0' + #9 +
                  '0' + #9 +
                  'CONSUMIDOR' + #9 +
                  '0' + #9 +
                  '0' + #9 +
                  '0' + #9 +
                  '0' + #9 +
                  'N' + #9 +
                        #9 +
                  '0' + #9 +
                  '0' + #9 +
                  '0' + #9 +
                  'SP' + #9 +
                  '0' + #9 +
                  '0' + #9 +
                  '0' + #9 +
                  '0' + #9 +
                  '0' + #9 +
                  '0' + #9 +
                  '9' + #9 +
                  '0' + #9 +
                  '0' + #9 +
                  '0' + #9 +
                  '0' + #9 +
                  '0' + #9 +
                  '0' + #9 +
                  '0' + #9 +
                  '0' + #9 +
                  '0' + #9 +
                  '0' + #9 +
                  'N' + #9 +
                  'N' + #9 +
                  '0' + #9 +
                  '0' + #9 +
                  '0' + #9 +
                  '0');

      IBT_Clientes.Close;
      IBT_Clientes.Open;

      // Descarregar o arquivo -------------------------------------------------
      IBT_Clientes.First;
      while not IBT_Clientes.Eof do
      begin
         LBL_Status.Caption := 'CLIENTES : ' + IBT_ClientesMATRICULA.AsString + '-'+ IBT_ClientesNOMEFANTASIA.AsString;
         LBL_Status.Refresh;

         Write(log,IBT_ClientesCODIGO_ID.AsString+#9);                                          //'CODCLI;INT'
         Write(log,'0'+#9);                                                                     //'DIGCLI;INT'
         Write(log,Copy(IBT_ClientesNOMEFANTASIA.AsString,1,40)+#9);                            //'NOMCLI;STR(40)'
         Write(log,'0'+#9);                                                                     //'CODSITCRED;STR(2)'
         Write(log,'0'+#9);                                                                     //'CODCONVENIO;INT'
         Write(log,'0'+#9);                                                                     //'VLLIMITECONVENIO;DBL'
         Write(log,'0'+#9);                                                                     //'VLSALDOCONVENIO;DBL'
         Write(log,'N'+#9);                                                                     //'FLEFETUACOMPRALIMITE;STR(1)'
         Write(log,ApenasNumerosStr(IBT_ClientesCNPJ.AsString)+#9);                             //'CGCCPF;INT'
         Write(log,Copy(IBT_ClientesENDERECO.AsString,1,40)+#9);                                //'ENDERECO;STR(40)'
         Write(log,Copy(IBT_ClientesBairro.AsString,1,30)+#9);                                  //'BAIRRO;STR(30)'
         Write(log,Copy(IBT_ClientesCidade.AsString,1,60)+#9);                                  //'CIDADE;STR(60)'
         Write(log,Copy(IBT_ClientesUF.AsString,1,2)+#9);                                       //'ESTADO;STR(2)'

         if (ApenasNumerosStr(IBT_ClientesCEP.AsString) <> '') then                             //'CEP;INT'
            Write(log,ApenasNumerosStr(IBT_ClientesCEP.AsString)+#9)
         else
            Write(log,'0'+#9);

         Write(log,'0'+#9);                                                                     //'DDD;STR(4)'
         Write(log,'0'+#9);                                                                     //'FONE;STR(8)'
         Write(log,'0'+#9);                                                                     //'CODFUNCIONARIO;INT'
         Write(log,IBT_ClientesCODIGO_ID.AsString+#9);                                          //'NUMERO;INT'
         Write(log,'0'+#9);                                                                     //'COMPLEMENTO;STR(20)'
         Write(log,'1'+#9);                                                                     //'STATUS;INT'
         Write(log,'0'+#9);                                                                     //'NATJUR;STR(1)'
         Write(log,'0'+#9);                                                                     //'SENHA;STR(8)'
         Write(log,FormatFloat('00000000000000',Round(IBT_ClientesSALDO_LIMITE.Value*100))+#9); //'VLLIMCRE;DBL'
         Write(log,'0'+#9);                                                                     //'FLREVENDEDOR;STR(1)'
         Write(log,'0'+#9);                                                                     //'CODTABDESC;STR(6)'
         Write(log,'0'+#9);                                                                     //'CONDPGTO;STR(3)'
         Write(log,'0'+#9);                                                                     //'NRDIASCARENCIA;STR(2)'
         Write(log,'0'+#9);                                                                     //'FLCOBRJURCARENCIA;STR(1)'
         Write(log,'0'+#9);                                                                     //'FLNAONEGATIVA;STR(1)'
         Write(log,'0'+#9);                                                                     //'NUMDOC;STR(15)'
         Write(log,'N'+#9);                                                                     //'FLSIMPLES;STR(1)'
         Write(log,'N'+#9);                                                                     //'FLMICROEMP;STR(1)'
         Write(log,'0'+#9);                                                                     //'TPINSC;STR(1)'
         Write(log,'0'+#9);                                                                     //'TPCREDITSCORE;STR(1)'
         Write(log,'0'+#9);                                                                     //'CODGRPECON;STR(6)'
         Writeln(log,'0');                                                                      //'PLIMCRE;DBL'

         IBT_Clientes.Next;
      end;

      CloseFile(log);

      CopyFile(Pchar(vARQUIVOOFF+'OFF_CLIENTES.PDV'),Pchar(vARQUIVOOFF+'BKP\OFF_CLIENTES.PDV'),False);
      CopyFile(Pchar(vARQUIVOOFF+'GERAR\OFF_CLIENTES.PDV'),Pchar(vARQUIVOOFF+'OFF_CLIENTES.PDV'),False);

      CHK_Clientes.Checked := False;
      CHK_Clientes.Enabled := False;
      LBL_Status.Caption   := 'Fim da exportação do arquivo dos Clientes!';
   except
      CloseFile(log);
      Mensagem('Erro na criação do Arquivo dos Clientes!');
   end;
end;

//------------------------------------------------------------------------------
procedure TFRM_Exportacao.CondPagto;
var
                             lEventoCX : TextFile;
   lCXAEvento, lCondPagto, LFormaPagto : TextFile;
begin
   try
      // CX Evento -------------------------------------------------------------
      AssignFile(lCXAEvento,vARQUIVOOFF+'GERAR\'+'OFF_CXA_EVENTO.PDV');
      Rewrite(lCXAEvento,vARQUIVOOFF+'GERAR\'+'OFF_CXA_EVENTO.PDV');
      Append(lCXAEvento);

      WriteLn(lCXAEvento,'CODEVE;INT'     +#9+
                         'DSCEVE;STR(30)' +#9+
                         'RESEVE;STR(30)' +#9+
                         'CODEVEENT;INT');
      //------------------------------------------------------------------------


      // Formas Pagto ----------------------------------------------------------
      AssignFile(LFormaPagto,vARQUIVOOFF+'GERAR\'+'OFF_FORMAS_PGTO.PDV');
      Rewrite(LFormaPagto,vARQUIVOOFF+'GERAR\'+'OFF_FORMAS_PGTO.PDV');
      Append(LFormaPagto);

      WriteLn(LFormaPagto,'CONDPGTO;STR(3)' +#9+
                          'CODEVE;INT'      +#9+
                          'DTINICIO;DTE'    +#9+
                          'DTFINAL;DTE'     +#9+
                          'GERCXA;STR(1)'   +#9+
                          'STATUS;INT'      +#9+
                          'GERCRC;STR(1)'   +#9+
                          'CODEVECRC;INT'   +#9+
                          'FLENTRADA;STR(1)');
      //------------------------------------------------------------------------


      // Evento  Caixa ---------------------------------------------------------
      AssignFile(lEventoCX,vARQUIVOOFF+'GERAR\'+'OFF_EVENTOS_CAIXA.PDV');
      Rewrite(lEventoCX,vARQUIVOOFF+'GERAR\'+'OFF_EVENTOS_CAIXA.PDV');
      Append(lEventoCX);

      WriteLn(lEventoCX, 'CODEVE;INT'             +#9+
                         'DSCEVE;STR(30)'         +#9+
                         'RESEVE;STR(30)'         +#9+
                         'SENEVE;STR(15)'         +#9+
                         'APLSAL;INT'             +#9+
                         'GRPSAL;INT'             +#9+
                         'EVECON;INT'             +#9+
                         'RELSIN;STR(1)'          +#9+
                         'TRANSF;STR(1)'          +#9+
                         'FILDES;INT'             +#9+
                         'NUMPED;STR(1)'          +#9+
                         'NUMDOC;STR(1)'          +#9+
                         'CCUSTO;STR(1)'          +#9+
                         'DADCHQ;STR(1)'          +#9+
                         'CODCON;STR(1)'          +#9+
                         'NUMORP;STR(1)'          +#9+
                         'INDCAR;STR(1)'          +#9+
                         'CONPGT;STR(3)'          +#9+
                         'DADCON;STR(1)'          +#9+
                         'CXADES;STR(1)'          +#9+
                         'DATDEP;STR(1)'          +#9+
                         'NUMAUT;STR(1)'          +#9+
                         'RELCTB;STR(1)'          +#9+
                         'GERNCR;STR(1)'          +#9+
                         'CODORI;INT'             +#9+
                         'NUMTIT;STR(1)'          +#9+
                         'EVECRC;INT'             +#9+
                         'CODPOR;INT'             +#9+
                         'NATCON;STR(1)'          +#9+
                         'RECDEV;STR(1)'          +#9+
                         'IMPMIN;STR(1)'          +#9+
                         'LIBEXC;STR(1)'          +#9+
                         'LIBINC;STR(1)'          +#9+
                         'STATUS;INT'             +#9+
                         'FLDEPOSIDENT;STR(1)'    +#9+
                         'FLPAGTOCARNE;STR(1)'    +#9+
                         'FLDTVALID;STR(1)'       +#9+
                         'FLEMITECOBRANCA;STR(1)' +#9+
                         'CODEVEENT;INT'          +#9+
                         'CTACONTAB;INT'          +#9+
                         'FLDIGDOC;STR(1)'        +#9+
                         'FLTPEVENTO;STR(1)'      +#9+
                         'FLCHQPRE;STR(1)'        +#9+
                         'FLTEF;STR(1)'           +#9+
                         'FLLIBFAT;STR(1)'        +#9+
                         'VLLIMITE;DBL'           +#9+
                         'FLCREDIARIO;STR(1)'     +#9+
                         'QTDAUTENTIC;INT'        +#9+
                         'DESCRESAUTENTIC;STR(4)' +#9+
                         'FLAUTENTIC;STR(1)'      +#9+
                         'FLTROCO;STR(1)'         +#9+
                         'FLGAVETA;STR(1)'        +#9+
                         'FLLECODBARRA;STR(1)'    +#9+
                         'CODSEGMENTO;INT'        +#9+
                         'FLCODCHQ;STR(1)'        +#9+
                         'TPDOCEXTERNO;STR(2)'    +#9+
                         'FLCODFUNC;STR(1)'       +#9+
                         'CARMAG;STR(1)'          +#9+
                         'FLGERDUPLICATA;STR(1)'  +#9+
                         'FLCODREC;STR(1)'        +#9+
                         'FLVCTO;STR(1)'          +#9+
                         'FLVLPARCIAL;STR(1)'     +#9+
                         'CODEVECRC;INT'          +#9+
                         'GERCRC;STR(1)'          +#9+
                         'FLCODPORT;STR(1)'       +#9+
                         'FLOS;STR(1)'            +#9+
                         'CODORIGFIN;INT'         +#9+
                         'FLCGCCPF;STR(1)'        +#9+
                         'FLLISTA;STR(1)'         +#9+
                         'CODCONV;INT'            +#9+
                         'CODEVECRCBXAUT;INT'     +#9+
                         'FLBXAUTCRC;STR(1)'      +#9+
                         'FLDESP;STR(1)'          +#9+
                         'VLSANIMED;DBL'          +#9+
                         'VLSANEXP;DBL'           +#9+
                         'CODCONTA;INT'           +#9+
                         'FLSANCOFAUT;STR(1)'     +#9+
                         'FLCOMPOESANGRIA;STR(1)' +#9+
                         'FLAVISTA;STR(1)'        +#9+
                         'FLCONVENIO;STR(1)'      +#9+
                         'FLDIN;STR(1)'           +#9+
                         'FLCONTANEG;STR(1)'      +#9+
                         'CODCONVENIO;INT'        +#9+
                         'PDESCSEGURO;DBL'        +#9+
                         'EVECONTACOR;INT'        +#9+
                         'FLRECDEV;STR(1)'        +#9+
                         'FLCLIENTE;INT'          +#9+
                         'VLCLIENTE;INT'          +#9+
                         'CODEVECRCBXCONV;INT'    +#9+
                         'FLSINAL;STR(1)'         +#9+
                         'FLSITCRED;STR(1)'       +#9+
                         'FLCORRESPBANC;STR(1)'   +#9+
                         'FLADIANTAMENTO;STR(1)'  +#9+
                         'FLLIMITESAN;STR(1)'     +#9+
                         'FLSUBCONVENIO;STR(1)'   +#9+
                         'CODEVESTORNOCXA;INT'    +#9+
                         'FLCODCONAUTO;STR(1)'    +#9+
                         'VLCODARETIRA;DBL'       +#9+
                         'VLCODAENTREGA;DBL'      +#9+
                         'FLCAMPPROMOCAO;STR(1)'  +#9+
                         'MULTCUPOM;INT'          +#9+
                         'FLANEGOCIAR;STR(1)'     +#9+
                         'FLNUMDOCCONV;STR(1)'    +#9+
                         'FLIMPCOMPREC;STR(1)');

      IBT_Formapagto.Close;
      IBT_Formapagto.Open;

      // Descarregar o arquivo -------------------------------------------------
      IBT_Formapagto.First;
      while not IBT_Formapagto.Eof do
      begin
         LBL_Status.Caption := 'Evento Caixa : ' + IBT_FormapagtoCODIGO_ID.AsString + '-'+ IBT_FormapagtoDESCRICAO.AsString;
         LBL_Status.Refresh;

         //---------------------
         IBT_FormaParcela.Close;
         IBT_FormaParcela.Open;

         IBT_FormaParcela.Last;
         IBT_FormaParcela.First;
         //---------------------

         // CX Evento ----------------------------------------------------------
         Write(lCXAEvento,IBT_FormapagtoTIPOPAGTO.AsString+#9);                 //'CODEVE;INT'     +#9+
         Write(lCXAEvento,copy(IBT_FormapagtoDESCRICAO.AsString,1,30)+#9);      //'DSCEVE;STR(30)' +#9+
         Write(lCXAEvento,copy(IBT_FormapagtoDESCRICAO.AsString,1,30)+#9);      //'RESEVE;STR(30)' +#9+
         Writeln(lCXAEvento,IBT_FormapagtoTIPOPAGTO.AsString);                  //'CODEVEENT;INT');
         //---------------------------------------------------------------------

         // Formas Pagto ----------------------------------------------------------
         Write(LFormaPagto,IBT_FormapagtoTIPOPAGTO.AsString+#9);                //'CONDPGTO;STR(3)'
         Write(LFormaPagto,IBT_FormapagtoCODIGO_ID.AsString+#9);                //'CODEVE;INT'
         Write(LFormaPagto,'01/01/2000'+#9);                                    //'DTINICIO;DTE'
         Write(LFormaPagto,'31/12/2100'+#9);                                    //'DTFINAL;DTE'
         Write(LFormaPagto,'S'+#9);                                             //'GERCXA;STR(1)'
         Write(LFormaPagto,#9);                                                 //'STATUS;INT'
         Write(LFormaPagto,'N'+#9);                                             //'GERCRC;STR(1)'
         Write(LFormaPagto,#9);                                                 //'CODEVECRC;INT'
         Writeln(LFormaPagto,'T');                                              //'FLENTRADA;STR(1)'
         //------------------------------------------------------------------------

         Write(lEventoCX,IBT_FormapagtoCODIGO_ID.AsString+#9);                  //'CODEVE;INT'
         Write(lEventoCX,copy(IBT_FormapagtoDESCRICAO.AsString,1,30)+#9);       //'DSCEVE;STR(30)'
         Write(lEventoCX,copy(IBT_FormapagtoDESCRICAO.AsString,1,30)+#9);       //'RESEVE;STR(30)'
         Write(lEventoCX,#9);                                                   //'SENEVE;STR(15)'
         Write(lEventoCX,#9);                                                   //'APLSAL;INT'
         Write(lEventoCX,#9);                                                   //'GRPSAL;INT'
         Write(lEventoCX,#9);                                                   //'EVECON;INT'
         Write(lEventoCX,copy(IBT_FormapagtoTIPOES.AsString,1,1)+#9);           //'RELSIN;STR(1)'
         Write(lEventoCX,#9);                                                   //'TRANSF;STR(1)'
         Write(lEventoCX,#9);                                                   //'FILDES;INT'
         Write(lEventoCX,'N'+#9);                                               //'NUMPED;STR(1)'
         Write(lEventoCX,'N'+#9);                                               //'NUMDOC;STR(1)'
         Write(lEventoCX,'N'+#9);                                               //'CCUSTO;STR(1)'

         if (UpperCase(Copy(AllTrim(IBT_FormapagtoDESCRICAO.AsString),1,3)) = 'CHE') then  //'DADCHQ;STR(1)'
            Write(lEventoCX,'S'+#9)
         else
            Write(lEventoCX,'N'+#9);

         Write(lEventoCX,'N'+#9);                                               //'CODCON;STR(1)'
         Write(lEventoCX,'N'+#9);                                               //'NUMORP;STR(1)'

         // Alterado pelo Comparação dos arquivos
         if (IBT_FormapagtoTEF.Value = 'S') then                                //'INDCAR;STR(1)'
            Write(lEventoCX,''+#9)
         else
            Write(lEventoCX,'N'+#9);

         Write(lEventoCX,'N'+#9);                                               //'CONPGT;STR(3)'
         Write(lEventoCX,'N'+#9);                                               //'DADCON;STR(1)'
         Write(lEventoCX,#9);                                                   //'CXADES;STR(1)'
         Write(lEventoCX,'N'+#9);                                               //'DATDEP;STR(1)'
         Write(lEventoCX,'N'+#9);                                               //'NUMAUT;STR(1)'
         Write(lEventoCX,#9);                                                   //'RELCTB;STR(1)'
         Write(lEventoCX,#9);                                                   //'GERNCR;STR(1)'
         Write(lEventoCX,#9);                                                   //'CODORI;INT'
         Write(lEventoCX,'N'+#9);                                               //'NUMTIT;STR(1)'
         Write(lEventoCX,#9);                                                   //'EVECRC;INT'
         Write(lEventoCX,#9);                                                   //'CODPOR;INT'

         // Alterado pelo Comparação dos arquivos
         if (IBT_FormapagtoTEF.Value = 'S') then                                //'NATCON;STR(1)'
             Write(lEventoCX,'C'+#9)
         else
             Write(lEventoCX,#9);

         Write(lEventoCX,'N'+#9);                                               //'RECDEV;STR(1)'
         Write(lEventoCX,#9);                                                   //'IMPMIN;STR(1)'
         Write(lEventoCX,#9);                                                   //'LIBEXC;STR(1)'
         Write(lEventoCX,#9);                                                   //'LIBINC;STR(1)'
         Write(lEventoCX,#9);                                                   //'STATUS;INT'
         Write(lEventoCX,'N'+#9);                                               //'FLDEPOSIDENT;STR(1)'
         Write(lEventoCX,'S'+#9);                                               //'FLPAGTOCARNE;STR(1)'
         Write(lEventoCX,'N'+#9);                                               //'FLDTVALID;STR(1)'
         Write(lEventoCX,#9);                                                   //'FLEMITECOBRANCA;STR(1)'
         Write(lEventoCX,#9);                                                   //'CODEVEENT;INT'
         Write(lEventoCX,#9);                                                   //'CTACONTAB;INT'
         Write(lEventoCX,'N'+#9);                                               //'FLDIGDOC;STR(1)'
         Write(lEventoCX,'F'+#9);                                               //'FLTPEVENTO;STR(1)'
         Write(lEventoCX,'N'+#9);                                               //'FLCHQPRE;STR(1)'

         if (IBT_FormapagtoTEF.Value = 'S') then                                //'FLTEF;STR(1)'
            Write(lEventoCX,'S'+#9)
         else
            Write(lEventoCX,'N'+#9);

         Write(lEventoCX,'N'+#9);                                               //'FLLIBFAT;STR(1)'
         Write(lEventoCX,'0'+#9);                                               //'VLLIMITE;DBL'
         Write(lEventoCX,'N'+#9);                                               //'FLCREDIARIO;STR(1)'
         Write(lEventoCX,'0'+#9);                                               //'QTDAUTENTIC;INT'
         Write(lEventoCX,#9);                                                   //'DESCRESAUTENTIC;STR(4)'
         Write(lEventoCX,'N'+#9);                                               //'FLAUTENTIC;STR(1)'

         if (IBT_FormapagtoTEF.Value = 'S') then                                //'FLTROCO;STR(1)'
            Write(lEventoCX,'N'+#9)
         else
            Write(lEventoCX,'S'+#9);

         if (IBT_FormapagtoTEF.Value = 'S') then                                //'FLGAVETA;STR(1)'
             Write(lEventoCX,'N'+#9)
         else
             Write(lEventoCX,'S'+#9);

         Write(lEventoCX,#9);                                                   //'FLLECODBARRA;STR(1)'
         Write(lEventoCX,#9);                                                   //'CODSEGMENTO;INT'
         Write(lEventoCX,'N'+#9);                                               //'FLCODCHQ;STR(1)'
         Write(lEventoCX,#9);                                                   //'TPDOCEXTERNO;STR(2)'
         Write(lEventoCX,'N'+#9);                                               //'FLCODFUNC;STR(1)'

         // Alterado pelo Comparação dos arquivos
         if (IBT_FormapagtoTEF.Value = 'S') then                                //'CARMAG;STR(1)'
             Write(lEventoCX,'S'+#9)
         else
             Write(lEventoCX,'N'+#9);

         Write(lEventoCX,'N'+#9);                                               //'FLGERDUPLICATA;STR(1)'
         Write(lEventoCX,'N'+#9);                                               //'FLCODREC;STR(1)'
         Write(lEventoCX,#9);                                                   //'FLVCTO;STR(1)'
         Write(lEventoCX,#9);                                                   //'FLVLPARCIAL;STR(1)'

         // Alterado pelo Comparação dos arquivos
         if (IBT_FormapagtoTEF.Value = 'S') then                                //'CODEVECRC;INT'
            Write(lEventoCX,'4'+#9)
         else
            Write(lEventoCX,#9);

         Write(lEventoCX,'N'+#9);                                               //'GERCRC;STR(1)'
         Write(lEventoCX,'N'+#9);                                               //'FLCODPORT;STR(1)'
         Write(lEventoCX,'N'+#9);                                               //'FLOS;STR(1)'
         Write(lEventoCX,#9);                                                   //'CODORIGFIN;INT'

         if (UpperCase(Copy(AllTrim(IBT_FormapagtoDESCRICAO.AsString),1,3)) = 'MEN') then //'FLCGCCPF;STR(1)'
            Write(lEventoCX,'S'+#9)
         else
            Write(lEventoCX,'N'+#9);

         Write(lEventoCX,#9);                                                   //'FLLISTA;STR(1)'
         Write(lEventoCX,#9);                                                   //'CODCONV;INT'
         Write(lEventoCX,#9);                                                   //'CODEVECRCBXAUT;INT'
         Write(lEventoCX,'N'+#9);                                               //'FLBXAUTCRC;STR(1)'

         // Alterado pelo Comparação dos arquivos
         Write(lEventoCX,#9);                                                   //'FLDESP;STR(1)'

         Write(lEventoCX,'0'+#9);                                               //'VLSANIMED;DBL'
         Write(lEventoCX,'0'+#9);                                               //'VLSANEXP;DBL'
         Write(lEventoCX,#9);                                                   //'CODCONTA;INT'
         Write(lEventoCX,'N'+#9);                                               //'FLSANCOFAUT;STR(1)'
         Write(lEventoCX,'S'+#9);                                               //'FLCOMPOESANGRIA;STR(1)'

         // Alterado pelo Comparação dos arquivos
         if (IBT_FormapagtoTEF.Value = 'S') then                                //'FLAVISTA;STR(1)'
             Write(lEventoCX,'N'+#9)
         else
             Write(lEventoCX,'S'+#9);

         Write(lEventoCX,'N'+#9);                                               //'FLCONVENIO;STR(1)'

         if (UpperCase(Copy(AllTrim(IBT_FormapagtoDESCRICAO.AsString),1,3)) = 'DIN') then //'FLDIN;STR(1)'
            Write(lEventoCX,'S'+#9)
         else
            Write(lEventoCX,'N'+#9);

         Write(lEventoCX,'N'+#9);                                               //'FLCONTANEG;STR(1)'
         Write(lEventoCX,'0'+#9);                                               //'CODCONVENIO;INT'
         Write(lEventoCX,'0'+#9);                                               //'PDESCSEGURO;DBL'
         Write(lEventoCX,#9);                                                   //'EVECONTACOR;INT'
         Write(lEventoCX,'N'+#9);                                               //'FLRECDEV;STR(1)'
         Write(lEventoCX,'0'+#9);                                               //'FLCLIENTE;INT'
         Write(lEventoCX,'0'+#9);                                               //'VLCLIENTE;INT'
         Write(lEventoCX,#9);                                                   //'CODEVECRCBXCONV;INT'
         Write(lEventoCX,'N'+#9);                                               //'FLSINAL;STR(1)'

         if (IBT_FormapagtoTEF.Value = 'S') then                                //'FLSITCRED;STR(1)'
            Write(lEventoCX,'N'+#9)
         else
            Write(lEventoCX,'N'+#9);

         Write(lEventoCX,#9);                                                   //'FLCORRESPBANC;STR(1)'
         Write(lEventoCX,#9);                                                   //'FLADIANTAMENTO;STR(1)'
         Write(lEventoCX,'N'+#9);                                               //'FLLIMITESAN;STR(1)'
         Write(lEventoCX,'N'+#9);                                               //'FLSUBCONVENIO;STR(1)'
         Write(lEventoCX,#9);                                                   //'CODEVESTORNOCXA;INT'

         if (IBT_FormapagtoTEF.Value = 'S') then                                //'FLCODCONAUTO;STR(1)'
            Write(lEventoCX,'S'+#9)
         else
            Write(lEventoCX,#9);

         Write(lEventoCX,#9);                                                   //'VLCODARETIRA;DBL'
         Write(lEventoCX,#9);                                                   //'VLCODAENTREGA;DBL'
         Write(lEventoCX,'N'+#9);                                               //'FLCAMPPROMOCAO;STR(1)'
         Write(lEventoCX,#9);                                                   //'MULTCUPOM;INT'
         Write(lEventoCX,'N'+#9);                                               //'FLANEGOCIAR;STR(1)'
         Write(lEventoCX,'N'+#9);                                               //'FLNUMDOCCONV;STR(1)'
         Writeln(lEventoCX,'N');                                                //'FLIMPCOMPREC;STR(1)'

         IBT_Formapagto.Next;
      end;

      // CX Evento - Diego -----------------------------------------------------
      Write(lCXAEvento,'999'+#9);                                               //'CODEVE;INT'     +#9+
      Write(lCXAEvento,'SANGRIA'+#9);                                           //'DSCEVE;STR(30)' +#9+
      Write(lCXAEvento,'SANGRIA'+#9);                                           //'RESEVE;STR(30)' +#9+
      Writeln(lCXAEvento,'');                                                   //'CODEVEENT;INT');
      //------------------------------------------------------------------------

      // Evento CX - Diego -----------------------------------------------------
      Write(lEventoCX,'999'+#9);                                                //'CODEVE;INT'
      Write(lEventoCX,'SANGRIA'+#9);                                            //'DSCEVE;STR(30)'
      Write(lEventoCX,'SANGRIA'+#9);                                            //'RESEVE;STR(30)'
      Write(lEventoCX,#9);                                                      //'SENEVE;STR(15)'
      Write(lEventoCX,#9);                                                      //'APLSAL;INT'
      Write(lEventoCX,#9);                                                      //'GRPSAL;INT'
      Write(lEventoCX,#9);                                                      //'EVECON;INT'
      Write(lEventoCX,'-'+#9);                                                  //'RELSIN;STR(1)'
      Write(lEventoCX,#9);                                                      //'TRANSF;STR(1)'
      Write(lEventoCX,#9);                                                      //'FILDES;INT'
      Write(lEventoCX,#9);                                                      //'NUMPED;STR(1)'
      Write(lEventoCX,'N'+#9);                                                  //'NUMDOC;STR(1)'
      Write(lEventoCX,#9);                                                      //'CCUSTO;STR(1)'
      Write(lEventoCX,#9);                                                      //'DADCHQ;STR(1)'
      Write(lEventoCX,#9);                                                      //'CODCON;STR(1)'
      Write(lEventoCX,#9);                                                      //'NUMORP;STR(1)'
      Write(lEventoCX,#9);                                                      //'INDCAR;STR(1)'
      Write(lEventoCX,#9);                                                      //'CONPGT;STR(3)'
      Write(lEventoCX,#9);                                                      //'DADCON;STR(1)'
      Write(lEventoCX,#9);                                                      //'CXADES;STR(1)'
      Write(lEventoCX,#9);                                                      //'DATDEP;STR(1)'
      Write(lEventoCX,#9);                                                      //'NUMAUT;STR(1)'
      Write(lEventoCX,#9);                                                      //'RELCTB;STR(1)'
      Write(lEventoCX,#9);                                                      //'GERNCR;STR(1)'
      Write(lEventoCX,#9);                                                      //'CODORI;INT'
      Write(lEventoCX,#9);                                                      //'NUMTIT;STR(1)'
      Write(lEventoCX,#9);                                                      //'EVECRC;INT'
      Write(lEventoCX,#9);                                                      //'CODPOR;INT'
      Write(lEventoCX,#9);                                                      //'NATCON;STR(1)'
      Write(lEventoCX,'N'+#9);                                                  //'RECDEV;STR(1)'
      Write(lEventoCX,#9);                                                      //'IMPMIN;STR(1)'
      Write(lEventoCX,#9);                                                      //'LIBEXC;STR(1)'
      Write(lEventoCX,#9);                                                      //'LIBINC;STR(1)'
      Write(lEventoCX,#9);                                                      //'STATUS;INT'
      Write(lEventoCX,#9);                                                      //'FLDEPOSIDENT;STR(1)'
      Write(lEventoCX,'S'+#9);                                                  //'FLPAGTOCARNE;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLDTVALID;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLEMITECOBRANCA;STR(1)'
      Write(lEventoCX,#9);                                                      //'CODEVEENT;INT'
      Write(lEventoCX,#9);                                                      //'CTACONTAB;INT'
      Write(lEventoCX,'N'+#9);                                                  //'FLDIGDOC;STR(1)'
      Write(lEventoCX,'M'+#9);                                                  //'FLTPEVENTO;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLCHQPRE;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLTEF;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLLIBFAT;STR(1)'
      Write(lEventoCX,'0'+#9);                                                  //'VLLIMITE;DBL'
      Write(lEventoCX,#9);                                                      //'FLCREDIARIO;STR(1)'
      Write(lEventoCX,'0'+#9);                                                  //'QTDAUTENTIC;INT'
      Write(lEventoCX,#9);                                                      //'DESCRESAUTENTIC;STR(4)'
      Write(lEventoCX,'N'+#9);                                                  //'FLAUTENTIC;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLTROCO;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLGAVETA;STR(1)'
      Write(lEventoCX,'N'+#9);                                                  //'FLLECODBARRA;STR(1)'
      Write(lEventoCX,#9);                                                      //'CODSEGMENTO;INT'
      Write(lEventoCX,#9);                                                      //'FLCODCHQ;STR(1)'
      Write(lEventoCX,#9);                                                      //'TPDOCEXTERNO;STR(2)'
      Write(lEventoCX,'N'+#9);                                                  //'FLCODFUNC;STR(1)'
      Write(lEventoCX,#9);                                                      //'CARMAG;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLGERDUPLICATA;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLCODREC;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLVCTO;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLVLPARCIAL;STR(1)'
      Write(lEventoCX,#9);                                                      //'CODEVECRC;INT'
      Write(lEventoCX,'N'+#9);                                                  //'GERCRC;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLCODPORT;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLOS;STR(1)'
      Write(lEventoCX,#9);                                                      //'CODORIGFIN;INT'
      Write(lEventoCX,#9);                                                      //'FLCGCCPF;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLLISTA;STR(1)'
      Write(lEventoCX,#9);                                                      //'CODCONV;INT'
      Write(lEventoCX,#9);                                                      //'CODEVECRCBXAUT;INT'
      Write(lEventoCX,#9);                                                      //'FLBXAUTCRC;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLDESP;STR(1)'
      Write(lEventoCX,#9);                                                      //'VLSANIMED;DBL'
      Write(lEventoCX,#9);                                                      //'VLSANEXP;DBL'
      Write(lEventoCX,#9);                                                      //'CODCONTA;INT'
      Write(lEventoCX,#9);                                                      //'FLSANCOFAUT;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLCOMPOESANGRIA;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLAVISTA;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLCONVENIO;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLDIN;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLCONTANEG;STR(1)'
      Write(lEventoCX,#9);                                                      //'CODCONVENIO;INT'
      Write(lEventoCX,#9);                                                      //'PDESCSEGURO;DBL'
      Write(lEventoCX,'13'+#9);                                                 //'EVECONTACOR;INT'
      Write(lEventoCX,'N'+#9);                                                  //'FLRECDEV;STR(1)'
      Write(lEventoCX,'0'+#9);                                                  //'FLCLIENTE;INT'
      Write(lEventoCX,'0'+#9);                                                  //'VLCLIENTE;INT'
      Write(lEventoCX,#9);                                                      //'CODEVECRCBXCONV;INT'
      Write(lEventoCX,'N'+#9);                                                  //'FLSINAL;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLSITCRED;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLCORRESPBANC;STR(1)'
      Write(lEventoCX,#9);                                                      //'FLADIANTAMENTO;STR(1)'
      Write(lEventoCX,'N'+#9);                                                  //'FLLIMITESAN;STR(1)'
      Write(lEventoCX,'N'+#9);                                                  //'FLSUBCONVENIO;STR(1)'
      Write(lEventoCX,#9);                                                      //'CODEVESTORNOCXA;INT'
      Write(lEventoCX,#9);                                                      //'FLCODCONAUTO;STR(1)'
      Write(lEventoCX,#9);                                                      //'VLCODARETIRA;DBL'
      Write(lEventoCX,#9);                                                      //'VLCODAENTREGA;DBL'
      Write(lEventoCX,'N'+#9);                                                  //'FLCAMPPROMOCAO;STR(1)'
      Write(lEventoCX,#9);                                                      //'MULTCUPOM;INT'
      Write(lEventoCX,'N'+#9);                                                  //'FLANEGOCIAR;STR(1)'
      Write(lEventoCX,'N'+#9);                                                  //'FLNUMDOCCONV;STR(1)'
      Writeln(lEventoCX,'N');                                                   //'FLIMPCOMPREC;STR(1)'
      //------------------------------------------------------------------------

      CloseFile(lEventoCX);

      CloseFile(lCXAEvento);
      CloseFile(LFormaPagto);

      CopyFile(Pchar(vARQUIVOOFF+'OFF_EVENTOS_CAIXA.PDV'),Pchar(vARQUIVOOFF+'BKP\OFF_EVENTOS_CAIXA.PDV'),False);
      CopyFile(Pchar(vARQUIVOOFF+'GERAR\OFF_EVENTOS_CAIXA.PDV'),Pchar(vARQUIVOOFF+'OFF_EVENTOS_CAIXA.PDV'),False);

      CopyFile(Pchar(vARQUIVOOFF+'OFF_CXA_EVENTO.PDV'),Pchar(vARQUIVOOFF+'BKP\OFF_CXA_EVENTO.PDV'),False);
      CopyFile(Pchar(vARQUIVOOFF+'GERAR\OFF_CXA_EVENTO.PDV'),Pchar(vARQUIVOOFF+'OFF_CXA_EVENTO.PDV'),False);

      CopyFile(Pchar(vARQUIVOOFF+'OFF_FORMAS_PGTO.PDV'),Pchar(vARQUIVOOFF+'BKP\OFF_FORMAS_PGTO.PDV'),False);
      CopyFile(Pchar(vARQUIVOOFF+'GERAR\OFF_FORMAS_PGTO.PDV'),Pchar(vARQUIVOOFF+'OFF_FORMAS_PGTO.PDV'),False);
      //------------------------------------------------------------------------

      // Cond. Pagto -----------------------------------------------------------
      AssignFile(lCondPagto,vARQUIVOOFF+'GERAR\'+'OFF_CONDICOES_PGTO.PDV');
      Rewrite(lCondPagto,vARQUIVOOFF+'GERAR\'+'OFF_CONDICOES_PGTO.PDV');
      Append(lCondPagto);

      // Layout do arquivo -----------------------------------------------------
      WriteLn(lCondPagto,'CONDPGTO;STR(3)'                  +#9+
                         'DESCRICAO;STR(20)'                +#9+
                         'PJUROS;DBL'                       +#9+
                         'DTINICIO;DTE'                     +#9+
                         'DTFINAL;DTE'                      +#9+
                         'PENTRADA;DBL'                     +#9+
                         'PARCELA;INT'                      +#9+
                         'INTERDIAS;INT'                    +#9+
                         'STATUS;INT'                       +#9+
                         'QPCOMISSAO;DBL'                   +#9+
                         'FINANC;STR(1)'                    +#9+
                         'NRDIASVC1;INT'                    +#9+
                         'DTPRIMPARC;DTE'                   +#9+
                         'UNIDARRED;INT'                    +#9+
                         'NRDIASMAX;INT'                    +#9+
                         'FLVENCTO;STR(1)'                  +#9+
                         'VLMINFAT;DBL'                     +#9+
                         'VLMAXFAT;DBL'                     +#9+
                         'PJUROSMIN;DBL'                    +#9+
                         'FLENTVAR;STR(1)'                  +#9+
                         'DIASMAXALTVCT;INT'                +#9+
                         'FLVENCTOIGUAIS;STR(1)'            +#9+
                         'FLENTRFINANC;STR(1)'              +#9+
                         'PARCELAMAX;INT'                   +#9+
                         'FLENTPRC;STR(1)'                  +#9+
                         'INTERDIASVC1;INT'                 +#9+
                         'FLVLPRC;STR(1)'                   +#9+
                         'FLENTRADA;STR(1)'                 +#9+
                         'VLMINPRC;DBL'                     +#9+
                         'FLENTFIX;STR(1)'                  +#9+
                         'OBS;STR(10)'                      +#9+
                         'FLCONTROLALIMITE;STR(1)'          +#9+
                         'FLPROIBEPDV;STR(1)'               +#9+
                         'FLCLIENTE;STR(1)'                 +#9+
                         'FLPGTOCONTA;STR(1)'               +#9+
                         'FLCREDIARIO;STR(1)'               +#9+
                         'TAXADM;DBL'                       +#9+
                         'CODCON;INT'                       +#9+
                         'FLADIANTAMENTO;STR(1)'            +#9+
                         'FLVLBASEICMLIQ;STR(1)'            +#9+
                         'CODREGRAVENCTO;INT'               +#9+
                         'FLCALCJURPRIMPARC;STR(1)'         +#9+
                         'FLSOMAJUROSFINANCTOTNOTA;STR(1)'  +#9+
                         'FLVENDACONSUMIDOR;STR(1)'         +#9+
                         'FATORFINANC;DBL'                  +#9+
                         'FLFATORFINANC;STR(1)'             +#9+
                         'FLFINANCPARC;STR(1)'              +#9+
                         'FLTABFINANCEIRA;STR(1)'           +#9+
                         'CONDPGTOMULTPARC;STR(3)');

      IBT_TipoPagto.Close;
      IBT_TipoPagto.Open;

      // Descarregar o arquivo -------------------------------------------------
      IBT_TipoPagto.First;
      while not IBT_TipoPagto.Eof do
      begin
         LBL_Status.Caption := 'Cond. Pagto : ' + IBT_TipoPagtoCODIGO_ID.AsString + '-'+ IBT_TipoPagtoDESCRICAO.AsString;
         LBL_Status.Refresh;

         // Cond. Pagto --------------------------------------------------------
         Write(lCondPagto,copy(IBT_TipoPagtoCODIGO_ID.AsString,1,3)+#9);                                  //'CONDPGTO;STR(3)'
         Write(lCondPagto,copy(IBT_TipoPagtoDESCRICAO.AsString,1,20)+#9);                                 //'DESCRICAO;STR(20)'
         Write(lCondPagto,FormatFloat('00000000000',Round(IBT_TipoPagtoJUROS.Value*1000000000))+#9);      //'PJUROS;DBL'
         Write(lCondPagto,'01/01/2000'+#9);                                                               //'DTINICIO;DTE'
         Write(lCondPagto,'31/12/2100'+#9);                                                               //'DTFINAL;DTE'
         Write(lCondPagto,FormatFloat('000000',IBT_TipoPagtoPENTRADA.Value*10000)+#9);                    //'PENTRADA;DBL'
         Write(lCondPagto,IntToStr(IBT_TipoPagtoNPARCELAS.AsInteger)+#9);                                 //'PARCELA;INT'
         Write(lCondPagto,IntToStr(IBT_TipoPagtoINTERDIAS.AsInteger)+#9);                                 //'INTERDIAS;INT'
         Write(lCondPagto,'0'+#9);                                                                        //'STATUS;INT'
         Write(lCondPagto,'0'+#9);                                                                        //'QPCOMISSAO;DBL'
         Write(lCondPagto,'P'+#9);                                                                        //'FINANC;STR(1)'
         Write(lCondPagto,IntToStr(IBT_TipoPagtoINTERDIAS.AsInteger)+#9);                                 //'NRDIASVC1;INT'
         Write(lCondPagto,#9);                                                                            //'DTPRIMPARC;DTE'
         Write(lCondPagto,'2'+#9);                                                                        //'UNIDARRED;INT'
         Write(lCondPagto,'0'+#9);                                                                        //'NRDIASMAX;INT'
         Write(lCondPagto,'N'+#9);                                                                        //'FLVENCTO;STR(1)'
         Write(lCondPagto,'0'+#9);                                                                        //'VLMINFAT;DBL'
         Write(lCondPagto,'0'+#9);                                                                        //'VLMAXFAT;DBL'
         Write(lCondPagto,'0'+#9);                                                                        //'PJUROSMIN;DBL'
         Write(lCondPagto,'N'+#9);                                                                        //'FLENTVAR;STR(1)'
         Write(lCondPagto,'0'+#9);                                                                        //'DIASMAXALTVCT;INT'
         Write(lCondPagto,'N'+#9);                                                                        //'FLVENCTOIGUAIS;STR(1)'
         Write(lCondPagto,'N'+#9);                                                                        //'FLENTRFINANC;STR(1)'
         Write(lCondPagto,IntToStr(IBT_TipoPagtoNPARCELAS.AsInteger)+#9);                                 //'PARCELAMAX;INT'

         // 'N' para avista... O resto = 'S'
         Write(lCondPagto,'N'+#9);                                                                        //'FLENTPRC;STR(1)'

         Write(lCondPagto,IntToStr(IBT_TipoPagtoINTERDIAS.AsInteger)+#9);                                 //'INTERDIASVC1;INT'

         // Mudado para acompanhar o arquivo enviado
         Write(lCondPagto,'N'+#9);                                                                        //'FLVLPRC;STR(1)'

         Write(lCondPagto,'S'+#9);                                                                        //'FLENTRADA;STR(1)'
         Write(lCondPagto,'0'+#9);                                                                        //'VLMINPRC;DBL'
         Write(lCondPagto,'0'+#9);                                                                        //'FLENTFIX;STR(1)'
         Write(lCondPagto,'0'+#9);                                                                        //'OBS;STR(10)'
         Write(lCondPagto,'N'+#9);                                                                        //'FLCONTROLALIMITE;STR(1)'
         Write(lCondPagto,'N'+#9);                                                                        //'FLPROIBEPDV;STR(1)'
         Write(lCondPagto,'N'+#9);                                                                        //'FLCLIENTE;STR(1)'
         Write(lCondPagto,'S'+#9);                                                                        //'FLPGTOCONTA;STR(1)'
         Write(lCondPagto,'N'+#9);                                                                        //'FLCREDIARIO;STR(1)'
         Write(lCondPagto,'0'+#9);                                                                        //'TAXADM;DBL'
         Write(lCondPagto,'0'+#9);                                                                        //'CODCON;INT'

         // Mudado para acompanhar o arquivo enviado
         Write(lCondPagto,'0'+#9);                                                                        //'FLADIANTAMENTO;STR(1)'
         Write(lCondPagto,'N'+#9);                                                                        //'FLVLBASEICMLIQ;STR(1)'

         Write(lCondPagto,'0'+#9);                                                                        //'CODREGRAVENCTO;INT'
         Write(lCondPagto,'N'+#9);                                                                        //'FLCALCJURPRIMPARC;STR(1)'

         // Vazio para avista ... O resto = 'N'
         Write(lCondPagto,#9);                                                                            //'FLSOMAJUROSFINANCTOTNOTA;STR(1)'

         Write(lCondPagto,'S'+#9);                                                                        //'FLVENDACONSUMIDOR;STR(1)'
         Write(lCondPagto,'1'+#9);                                                                        //'FATORFINANC;DBL'
         Write(lCondPagto,'N'+#9);                                                                        //'FLFATORFINANC;STR(1)'
         Write(lCondPagto,'N'+#9);                                                                        //'FLFINANCPARC;STR(1)'
         Write(lCondPagto,'N'+#9);                                                                        //'FLTABFINANCEIRA;STR(1)'
         Writeln(lCondPagto,'0');                                                                         //'CONDPGTOMULTPARC;STR(3)'
         //---------------------------------------------------------------------
         
         IBT_TipoPagto.Next;
      end;

      CloseFile(lCondPagto);

      CopyFile(Pchar(vARQUIVOOFF+'OFF_CONDICOES_PGTO.PDV'),Pchar(vARQUIVOOFF+'BKP\OFF_CONDICOES_PGTO.PDV'),False);
      CopyFile(Pchar(vARQUIVOOFF+'GERAR\OFF_CONDICOES_PGTO.PDV'),Pchar(vARQUIVOOFF+'OFF_CONDICOES_PGTO.PDV'),False);

      CHK_CondPagto.Checked := False;
      CHK_CondPagto.Enabled := False;
      LBL_Status.Caption := 'Fim da exportação do arquivo das Cond. Pagto!';
   except
      CloseFile(lCXAEvento);
      CloseFile(LFormaPagto);
      CloseFile(lCondPagto);
      Mensagem('Erro na criação do arquivo das Cond. Pagto!');
   end;
end;

//------------------------------------------------------------------------------
procedure TFRM_Exportacao.Operadores;
var
   lOperadores, lSegUser : TextFile;
begin
   try
      // Operadores ------------------------------------------------------------
      AssignFile(lOperadores,vARQUIVOOFF+'GERAR\'+'OFF_OPERADORES_CAIXA.PDV');
      Rewrite(lOperadores,vARQUIVOOFF+'GERAR\'+'OFF_OPERADORES_CAIXA.PDV');
      Append(lOperadores);

      // Layout do arquivo -----------------------------------------------------
      WriteLn(lOperadores,'CODFIL;INT'          + #9 +
                          'CODOPER;INT'         + #9 +
                          'NOME;STR(40)'        + #9 +
                          'SENHA;STR(16)'       + #9 +
                          'SENHAAUX;STR(6)'     + #9 +
                          'STATUS;INT'          + #9 +
                          'CODGER;INT'          + #9 +
                          'PDESCSUP;DBL'        + #9 +
                          'FLCARTAOOPER;STR(1)' + #9 +
                          'NUMCARTAOOPER;INT');
      // -----------------------------------------------------------------------

      // Usuarios --------------------------------------------------------------
      AssignFile(lSegUser,vARQUIVOOFF+'GERAR\'+'OFF_SEG_USER.PDV');
      Rewrite(lSegUser,vARQUIVOOFF+'GERAR\'+'OFF_SEG_USER.PDV');
      Append(lSegUser);

      // Layout do arquivo -----------------------------------------------------
      WriteLn(lSegUser,'USERID;STR(20)' +#9+
                       'CODFIL;INT'     +#9+
                       'CODUSER;DBL'    +#9+
                       'COD_ID;DBL'     +#9+
                       'NOME;STR(20)'   +#9+
                       'STATUS;DBL'     +#9+
                       'SENHAAUX;STR(16)');
      // -----------------------------------------------------------------------


      //---------------------
      IBT_Funcionario.Close;
      IBT_Funcionario.Open;

      IBT_Usuarios.Close;
      IBT_Usuarios.Open;
      //---------------------

      // Descarregar o arquivo -------------------------------------------------
      IBT_Funcionario.First;
      while not IBT_Funcionario.Eof do
      begin
         if Trim(crypt(IBT_UsuariosLOGIN.AsString)) = '' then
         begin
            IBT_Funcionario.Next;
            Continue;
         end;

         LBL_Status.Caption := 'Op. Caixa : '+IBT_FuncionarioCODIGO_ID.AsString+'-'+IBT_FuncionarioDESCRICAO.AsString;
         LBL_Status.Refresh;

         Write(lOperadores,'1'+#9);                                                                  //'CODFIL;INT'
         Write(lOperadores,IBT_FuncionarioCODIGO_ID.AsString+#9);                                    //'CODOPER;INT'
         Write(lOperadores,copy(IBT_FuncionarioDESCRICAO.AsString,1,40)+#9);                         //'NOME;STR(40)'
         Write(lOperadores,copy(BemaCript.Criptografar(crypt(IBT_UsuariosSENHA.AsString)),1,16)+#9); //'SENHA;STR(16)'
         Write(lOperadores,#9);                                                                      //'SENHAAUX;STR(6)'
         Write(lOperadores,'0'+#9);                                                                  //'STATUS;INT'
         Write(lOperadores,#9);                                                                      //'CODGER;INT'
         Write(lOperadores,'99'+#9);                                                                 //'PDESCSUP;DBL'
         Write(lOperadores,'N'+#9);                                                                  //'FLCARTAOOPER;STR(1)'
         Writeln(lOperadores,'');                                                                    //'NUMCARTAOOPER;INT'

         Write(lSegUser,copy(IBT_FuncionarioDESCRICAO.AsString,1,20)+#9);                            //'USERID;STR(20)'
         Write(lSegUser,'1'+#9);                                                                     //'CODFIL;INT'
         Write(lSegUser,IBT_FuncionarioCODIGO_ID.AsString+#9);                                       //'CODUSER;DBL'
         Write(lSegUser,IBT_FuncionarioCODIGO_ID.AsString+#9);                                       //'COD_ID;DBL'
         Write(lSegUser,copy(IBT_FuncionarioDESCRICAO.AsString,1,20)+#9);                            //'NOME;STR(20)'
         Write(lSegUser,'0'+#9);                                                                     //'STATUS;DBL'
         Writeln(lSegUser,copy(BemaCript.Criptografar(crypt(IBT_UsuariosSENHA.AsString)),1,16));     //'SENHAAUX;STR(16)'

         IBT_Funcionario.Next;
      end;

      CloseFile(lOperadores);
      CloseFile(lSegUser);

      CopyFile(Pchar(vARQUIVOOFF+'OFF_OPERADORES_CAIXA.PDV'),Pchar(vARQUIVOOFF+'BKP\OFF_OPERADORES_CAIXA.PDV'),False);
      CopyFile(Pchar(vARQUIVOOFF+'GERAR\OFF_OPERADORES_CAIXA.PDV'),Pchar(vARQUIVOOFF+'OFF_OPERADORES_CAIXA.PDV'),False);

      CopyFile(Pchar(vARQUIVOOFF+'OFF_SEG_USER.PDV'),Pchar(vARQUIVOOFF+'BKP\OFF_SEG_USER.PDV'),False);
      CopyFile(Pchar(vARQUIVOOFF+'GERAR\OFF_SEG_USER.PDV'),Pchar(vARQUIVOOFF+'OFF_SEG_USER.PDV'),False);

      CHK_Operadores.Checked := False;
      CHK_Operadores.Enabled := False;
      LBL_Status.Caption := 'Fim da exportação do arquivo dos Operadores!';
   except
      CloseFile(lOperadores);
      CloseFile(lSegUser);
      Mensagem('Erro na criação do Arquivo dos Operadores!');
   end;
end;

//------------------------------------------------------------------------------
procedure TFRM_Exportacao.Produtos;
var
   lBarras, lProdutos, lPreco : TextFile;
begin
   // Corrigir codigo do produtos na geração------------------------------------
   if CHK_CBEMA.Checked then
   begin
      IBT_Produtos.Close;
      IBT_Produtos.Open;

      IBT_Produtos.First;
      while not IBT_Produtos.Eof do
      begin
         LBL_Status.Caption := 'Criando CBEMA : ' + IBT_ProdutosPRODUTO.AsString + '-'+ IBT_ProdutosDESCRICAO.AsString;
         LBL_Status.Refresh;

         try
            IBT_Produtos.Edit;

            if (Length(Trim(IBT_Produtosproduto.asString)) <= 8) then
               IBT_ProdutosCBEMA.Value := StrToInt64(IBT_Produtosproduto.AsString)
            else
               IBT_ProdutosCBEMA.Value := StrToInt64('99'+StrZero(IBT_ProdutosCODIGO_ID.Value,6));

            IBT_Produtos.Post;
            FRM_Modulo.IBTransaction1.CommitRetaining;
         except
            IBT_Produtos.Cancel;

            IBT_Produtos.Edit;
            IBT_ProdutosCBEMA.IsNull;
            IBT_Produtos.Post;

            FRM_Modulo.IBTransaction1.CommitRetaining;
            IBT_Produtos.Next;
            Continue;
         end;

         IBT_Produtos.Next;
      end;
    end;
    // -------------------------------------------------------------------------

   try
      // Barras ----------------------------------------------------------------
      AssignFile(lBarras,vARQUIVOOFF+'GERAR\'+'L_OFF_CODIGOS_BARRA.PDV');
      Rewrite(lBarras,vARQUIVOOFF+'GERAR\'+'L_OFF_CODIGOS_BARRA.PDV');
      Append(lBarras);

      // Layout do arquivo -----------------------------------------------------
      WriteLn(lBarras,'CODBARRA;INT' + #9 +
                      'CODEMBAL;INT' + #9 +
                      'CODPROD;INT'  + #9 +
                      'STATUS;INT'   + #9 +
                      'QTEMB;INT'    + #9 +
                      'FATOR;DBL'    + #9 +
                      'CONVERSAO;DBL');

      CloseFile(lBarras);

      CopyFile(Pchar(vARQUIVOOFF+'L_OFF_CODIGOS_BARRA.PDV'),Pchar(vARQUIVOOFF+'BKP\L_OFF_CODIGOS_BARRA.PDV'),False);
      CopyFile(Pchar(vARQUIVOOFF+'GERAR\L_OFF_CODIGOS_BARRA.PDV'),Pchar(vARQUIVOOFF+'L_OFF_CODIGOS_BARRA.PDV'),False);
      //------------------------------------------------------------------------

      // Precos ----------------------------------------------------------------
      AssignFile(lPreco,vARQUIVOOFF+'GERAR\'+'L_OFF_PRECOS.PDV');
      Rewrite(lPreco,vARQUIVOOFF+'GERAR\'+'L_OFF_PRECOS.PDV');
      Append(lPreco);

      // Layout do arquivo -----------------------------------------------------
      WriteLn(lPreco,'CODPROD;INT' + #9 +
                     'PRECO;DBL'   + #9 +
                     'FILIAL;INT');

      CloseFile(lPreco);

      CopyFile(Pchar(vARQUIVOOFF+'L_OFF_PRECOS.PDV'),Pchar(vARQUIVOOFF+'BKP\L_OFF_PRECOS.PDV'),False);
      CopyFile(Pchar(vARQUIVOOFF+'GERAR\L_OFF_PRECOS.PDV'),Pchar(vARQUIVOOFF+'L_OFF_PRECOS.PDV'),False);
      //------------------------------------------------------------------------

      // Produtos --------------------------------------------------------------
      AssignFile(lProdutos,vARQUIVOOFF+'GERAR\'+'L_OFF_PRODUTOS.PDV');
      Rewrite(lProdutos,vARQUIVOOFF+'GERAR\'+'L_OFF_PRODUTOS.PDV');
      Append(lProdutos);

      // Layout do arquivo -----------------------------------------------------
      WriteLn(lProdutos,'CODPROD;INT' + #9 +
      	                'PRECO;DBL'  + #9 +
                        'DIGPROD;INT'  + #9 +
                        'DESCRICAO;STR(70)'  + #9 +
                        'DESCRESUMIDA;STR(40)'  + #9 +
                        'CTF;INT' + #9 +
                        'ALIQICMS;DBL' + #9 +
                        'ALIQICMRED;DBL' + #9 +
                        'ALIQICMSUB;DBL' + #9 +
                        'TIPOPROD;INT' + #9 +
                        'FLNRSERIE;STR(1)' + #9 +
                        'NIVELPROD1;INT' + #9 +
                        'FLCORINGA;STR(1)' + #9 +
                        'FLCONTROLADO;STR(1)' + #9 +
                        'TIPOPROCESSO;INT' + #9 +
                        'FLSERVICO;STR(1)' + #9 +
                        'FLPROMOCAO;STR(1)' + #9 +
                        'CMUP;INT' + #9 +
                        'FOTO;STR(1)' + #9 +
                        'QTEMBMOVIM;DBL' + #9 +
                        'FLTERCEIRO;STR(1)' + #9 +
                        'FLCOMISSAO;STR(1)' + #9 +
                        'COMISSAO;INT' + #9 +
                        'PMARGINF;DBL' + #9 +
                        'CODEMBAL;INT' + #9 +
                        'FLSELFCOLOR;STR(1)' + #9 +
                        'PDESCPROM;DBL' + #9 +
                        'DESCAUTOITEM;DBL' + #9 +
                        'CODFORNE;INT' + #9 +
                        'COR;STR(10)' + #9 +
                        'ESPECIFICACAO;STR(6)' + #9 +
                        'UNIDMAIOR;STR(2)' + #9 +
                        'UNIDMENOR;STR(2)' + #9 +
                        'QTEMB;INT' + #9 +
                        'CODPRODDF;DBL' + #9 +
                        'CODFAM;INT' + #9 +
                        'FLMONTAGEM;STR(1)' + #9 +
                        'QTEMBMOVIMVENDA;DBL' + #9 +
                        'CODPRODVASILHAME;INT' + #9 +
                        'FLREDUDIFER;STR(1)' + #9 +
                        'CODOCORRPRECO;STR(2)' + #9 +
                        'CONVERSAO;DBL' + #9 +
                        'FLLOTEVENCTO;STR(1)' + #9 +
                        'FLREPI;STR(1)' + #9 +
                        'FLESTDIR;STR(1)' + #9 +
                        'FLNRSIMCARD;STR(1)' + #9 +
                        'PRECOREF;DBL' + #9 +
                        'FLCARTAOESPECIAL;STR(1)' + #9 +
                        'FLCUPOMEXTRA;STR(1)' + #9 +
                        'FLVALEPRESENTE;STR(1)' + #9 +
                        'FLPRODDEFRESALIQIPIECF;STR(1)' + #9+
                        'DTVALINIC;DTE' + #9+
                        'DTVALFIM;DTE');

      CloseFile(lProdutos);

      CopyFile(Pchar(vARQUIVOOFF+'L_OFF_PRODUTOS.PDV'),Pchar(vARQUIVOOFF+'BKP\L_OFF_PRODUTOS.PDV'),False);
      CopyFile(Pchar(vARQUIVOOFF+'GERAR\L_OFF_PRODUTOS.PDV'),Pchar(vARQUIVOOFF+'L_OFF_PRODUTOS.PDV'),False);
      //------------------------------------------------------------------------

      // Barras ----------------------------------------------------------------
      AssignFile(lBarras,vARQUIVOOFF+'GERAR\'+'OFF_CODIGOS_BARRA.PDV');
      Rewrite(lBarras,vARQUIVOOFF+'GERAR\'+'OFF_CODIGOS_BARRA.PDV');
      Append(lBarras);
      //------------------------------------------------------------------------

      // Precos ----------------------------------------------------------------
      AssignFile(lPreco,vARQUIVOOFF+'GERAR\'+'OFF_PRECOS.PDV');
      Rewrite(lPreco,vARQUIVOOFF+'GERAR\'+'OFF_PRECOS.PDV');
      Append(lPreco);
      //------------------------------------------------------------------------

      // Produtos --------------------------------------------------------------
      AssignFile(lProdutos,vARQUIVOOFF+'GERAR\'+'OFF_PRODUTOS.PDV');
      Rewrite(lProdutos,vARQUIVOOFF+'GERAR\'+'OFF_PRODUTOS.PDV');
      Append(lProdutos);
      //------------------------------------------------------------------------

      //-----------------
      IBQ_Produtos.Close;
      IBQ_Produtos.SQL.Clear;
      IBQ_Produtos.SQL.Add('select *');
      IBQ_Produtos.SQL.Add('from PRODUTOS');
      IBQ_Produtos.SQL.Add('where CBEMA is NOT Null');
      IBQ_Produtos.SQL.Add('order by codigo_id');
      IBQ_Produtos.Open;

      IBT_Tributar.Close;
      IBT_Tributar.Open;
      //----------------

      // Descarregar o arquivo -------------------------------------------------
      IBQ_Produtos.First;
      while not IBQ_Produtos.Eof do
      begin
         LBL_Status.Caption := 'Produto : ' + IBQ_ProdutosPRODUTO.AsString + '-'+ IBQ_ProdutosDESCRICAO.AsString;
         LBL_Status.Refresh;

         

         // Barras -------------------------------------------------------------
         Write(lBarras,copy(IBQ_Produtosproduto.Value,1,14)+#9);                //'CODBARRA;INT'
         Write(lBarras,'1'+#9);                                                 //'CODEMBAL;INT'
         Write(lBarras,IBQ_Produtoscbema.AsString+#9);                          //'CODPROD;INT'
         Write(lBarras,'1'+#9);                                                 //'STATUS;INT'
         Write(lBarras,'1'+#9);                                                 //'QTEMB;INT'
         Write(lBarras,'1'+#9);                                                 //'FATOR;DBL'
         Writeln(lBarras,'0');                                                  //'CONVERSAO;DBL'
         // --------------------------------------------------------------------



         // Precos -------------------------------------------------------------
         Write(lPreco,IBQ_Produtoscbema.AsString+#9);                                         //'CODPROD;INT'
         Write(lPreco,FormatFloat('00000000000000',Round(IBQ_ProdutosPRECO.Value*10000))+#9); //'PRECO;DBL'
         Writeln(lPreco,'1');                                                                 //'FILIAL;INT'
         // --------------------------------------------------------------------



         // Produtos------------------------------------------------------------
         Write(lProdutos,IBQ_Produtoscbema.AsString+#9);                                          //'CODPROD;INT'
         Write(lProdutos,FormatFloat('00000000000000',Round(IBQ_ProdutosPRECO.Value*10000))+#9);  //'PRECO;DBL'
         Write(lProdutos,'0'+#9);                                                                 //'DIGPROD;INT'
         Write(lProdutos,copy(IBQ_ProdutosDESCRICAO.AsString,1,70)+#9);                           //'DESCRICAO;STR(70)'
         Write(lProdutos,copy(IBQ_ProdutosDESCRICAO.AsString,1,40)+#9);                           //'DESCRESUMIDA;STR(40)'

         if (IBT_TributarSITUACAO.AsString = 'T') then                                            //'CTF;INT'
            Write(lProdutos,'0'+#9)
         else if (IBT_TributarSITUACAO.AsString = 'S') then
            Write(lProdutos,'6'+#9)
         else if (IBT_TributarSITUACAO.AsString = 'N') then  // 40 ele coloca 4 no banco = N1
            Write(lProdutos,'40'+#9)                         // 4 ele coloca 0 no banco = ERRO
         else if (IBT_TributarSITUACAO.AsString = 'I') then  // Troca de 4 para 2 a pedido do diego
            Write(lProdutos,'2'+#9)                          // (4 = Isenção) (2 = Redução de ICMS)
         else
            Write(lProdutos,'0'+#9);

         Write(lProdutos,FormatFloat('000000',Round(IBT_TributarALIQUOTA.Value*10000))+#9);       //'ALIQICMS;DBL'
         Write(lProdutos,FormatFloat('000000',Round(0*10000))+#9);                                //'ALIQICMRED;DBL'
         Write(lProdutos,FormatFloat('000000',Round(0*10000))+#9);                                //'ALIQICMSUB;DBL'
         Write(lProdutos,'1'+#9);                                                                 //'TIPOPROD;INT'
         Write(lProdutos,#9);                                                                     //'FLNRSERIE;STR(1)'
         Write(lProdutos,'1'+#9);                                                                 //'NIVELPROD1;INT'
         Write(lProdutos,'N'+#9);                                                                 //'FLCORINGA;STR(1)'
         Write(lProdutos,'N'+#9);                                                                 //'FLCONTROLADO;STR(1)'
         Write(lProdutos,'0'+#9);                                                                 //'TIPOPROCESSO;INT'
         Write(lProdutos,'N'+#9);                                                                 //'FLSERVICO;STR(1)'
         Write(lProdutos,#9);                                                                     //'FLPROMOCAO;STR(1)'
         Write(lProdutos,'0'+#9);                                                                 //'CMUP;INT'
         Write(lProdutos,'\'+#9);                                                                 //'FOTO;STR(1)'
         Write(lProdutos,'0'+#9);                                                                 //'QTEMBMOVIM;DBL'
         Write(lProdutos,#9);                                                                     //'FLTERCEIRO;STR(1)'
         Write(lProdutos,'N'+#9);                                                                 //'FLCOMISSAO;STR(1)'
         Write(lProdutos,'0'+#9);                                                                 //'COMISSAO;INT'
         Write(lProdutos,'0'+#9);                                                                 //'PMARGINF;DBL'
         Write(lProdutos,'0'+#9);                                                                 //'CODEMBAL;INT'
         Write(lProdutos,#9);                                                                     //'FLSELFCOLOR;STR(1)'
         Write(lProdutos,'0'+#9);                                                                 //'PDESCPROM;DBL'
         Write(lProdutos,FormatFloat('000000',Round(IBQ_ProdutosDESCONTO.Value*100))+#9);         //'DESCAUTOITEM;DBL'
         Write(lProdutos,#9);                                                                     //'CODFORNE;INT'
         Write(lProdutos,'UN'+#9);                                                                //'COR;STR(10)'
         Write(lProdutos,'GENERI'+#9);                                                            //'ESPECIFICACAO;STR(6)'
         Write(lProdutos,copy(IBQ_ProdutosDesUnidade.Value,1,2)+#9);                              //'UNIDMAIOR;STR(2)'
         Write(lProdutos,copy(IBQ_ProdutosDesUnidade.Value,1,2)+#9);                              //'UNIDMENOR;STR(2)'
         Write(lProdutos,'1'+#9);                                                                 //'QTEMB;INT'
         Write(lProdutos,#9);                                                                     //'CODPRODDF;DBL'
         Write(lProdutos,'55000'+#9);                                                             //'CODFAM;INT'
         Write(lProdutos,#9);                                                                     //'FLMONTAGEM;STR(1)'
         Write(lProdutos,'0'+#9);                                                                 //'QTEMBMOVIMVENDA;DBL'
         Write(lProdutos,'0'+#9);                                                                 //'CODPRODVASILHAME;INT'
         Write(lProdutos,#9);                                                                     //'FLREDUDIFER;STR(1)'
         Write(lProdutos,#9);                                                                     //'CODOCORRPRECO;STR(2)'
         Write(lProdutos,'0'+#9);                                                                 //'CONVERSAO;DBL'
         Write(lProdutos,#9);                                                                     //'FLLOTEVENCTO;STR(1)'
         Write(lProdutos,#9);                                                                     //'FLREPI;STR(1)'
         Write(lProdutos,#9);                                                                     //'FLESTDIR;STR(1)'
         Write(lProdutos,#9);                                                                     //'FLNRSIMCARD;STR(1)'
         Write(lProdutos,FormatFloat('00000000000000',Round(IBQ_ProdutosPRECO.Value*10000))+#9);  //'PRECOREF;DBL'
         Write(lProdutos,#9);                                                                     //'FLCARTAOESPECIAL;STR(1)'
         Write(lProdutos,#9);                                                                     //'FLCUPOMEXTRA;STR(1)'
         Write(lProdutos,#9);                                                                     //'FLVALEPRESENTE;STR(1)'
         Write(lProdutos,#9);                                                                     //'FLPRODDEFRESALIQIPIECF;S'
         Write(lProdutos,DateToStr(Date+30)+#9);                                                  //'DTVALINIC;DTE'
         WriteLN(lProdutos,DateToStr(Date+90));                                                   //'DTVALFIM;DTE'
         //---------------------------------------------------------------------

         IBQ_Produtos.Next;
      end;

      CloseFile(lBarras);
      CloseFile(lPreco);
      CloseFile(lProdutos);

      CopyFile(Pchar(vARQUIVOOFF+'OFF_CODIGOS_BARRA.PDV'),Pchar(vARQUIVOOFF+'BKP\OFF_CODIGOS_BARRA.PDV'),False);
      CopyFile(Pchar(vARQUIVOOFF+'GERAR\OFF_CODIGOS_BARRA.PDV'),Pchar(vARQUIVOOFF+'OFF_CODIGOS_BARRA.PDV'),False);

      CopyFile(Pchar(vARQUIVOOFF+'OFF_PRECOS.PDV'),Pchar(vARQUIVOOFF+'BKP\OFF_PRECOS.PDV'),False);
      CopyFile(Pchar(vARQUIVOOFF+'GERAR\OFF_PRECOS.PDV'),Pchar(vARQUIVOOFF+'OFF_PRECOS.PDV'),False);

      CopyFile(Pchar(vARQUIVOOFF+'OFF_PRODUTOS.PDV'),Pchar(vARQUIVOOFF+'BKP\OFF_PRODUTOS.PDV'),False);
      CopyFile(Pchar(vARQUIVOOFF+'GERAR\OFF_PRODUTOS.PDV'),Pchar(vARQUIVOOFF+'OFF_PRODUTOS.PDV'),False);

      CHK_Produtos.Checked := False;
      CHK_Produtos.Enabled := False;

      LBL_Status.Caption := 'Fim da exportação do arquivo dos PRODUTOS!';
   except
      CloseFile(lBarras);
      CloseFile(lPreco);
      CloseFile(lProdutos);
      Mensagem('Erro na criação do arquivo dos PRODUTOS!');
   end;
end;

//------------------------------------------------------------------------------
procedure TFRM_Exportacao.Vendedores;
var
   log : textfile;
begin
   try
      AssignFile(log,vARQUIVOOFF+'GERAR\'+'OFF_VENDEDORES.PDV');
      Rewrite(log,vARQUIVOOFF+'GERAR\'+'OFF_VENDEDORES.PDV');
      Append(log);

      // Layout do arquivo -----------------------------------------------------
      WriteLn(log,'CODFIL;INT'       +#9+
                  'CODVENDR;INT'     +#9+
                  'NOME;STR(30)'     +#9+
                  'SENHAAUX;STR(16)' +#9+
                  'PDESC;DBL'        +#9+
                  'CODSUP;STR(10)'   +#9+
                  'STATUS;STR(1)'    +#9+
                  'PCOMISSAO;STR(1)');

      //---------------------
      IBT_Funcionario.Close;
      IBT_Funcionario.Open;

      IBT_Usuarios.Close;
      IBT_Usuarios.Open;
      //---------------------

      // Descarregar o arquivo -------------------------------------------------
      IBT_Funcionario.First;
      while not IBT_Funcionario.Eof do
      begin
         LBL_Status.Caption := 'Vendedores : '+IBT_FuncionarioCODIGO_ID.AsString+'-'+IBT_FuncionarioDESCRICAO.AsString;
         LBL_Status.Refresh;

         Write(log,'1'+#9);                                                                  //'CODFIL;INT'
         Write(log,IBT_FuncionarioCODIGO_ID.AsString+#9);                                    //'CODVENDR;INT'
         Write(log,copy(IBT_FuncionarioDESCRICAO.AsString,1,30)+#9);                         //'NOME;STR(30)'
         Write(log,copy(BemaCript.Criptografar(crypt(IBT_UsuariosSENHA.AsString)),1,16)+#9); //'SENHAAUX;STR(16)'
         Write(log,'99'+#9);                                                                 //'PDESC;DBL'
         Write(log,'0'#9);                                                                   //'CODSUP;STR(10)'
         Write(log,'1'+#9);                                                                  //'STATUS;STR(1)'
         Writeln(log,'0');                                                                   //'PCOMISSAO;STR(1)'

         IBT_Funcionario.Next;
      end;

      CloseFile(log);

      CopyFile(Pchar(vARQUIVOOFF+'OFF_VENDEDORES.PDV'),Pchar(vARQUIVOOFF+'BKP\OFF_VENDEDORES.PDV'),False);
      CopyFile(Pchar(vARQUIVOOFF+'GERAR\OFF_VENDEDORES.PDV'),Pchar(vARQUIVOOFF+'OFF_VENDEDORES.PDV'),False);

      CHK_Vendedores.Checked := False;
      CHK_Vendedores.Enabled := False;
      LBL_Status.Caption := 'Fim da exportação do arquivo dos Vendedores!';
   except
      CloseFile(log);
      Mensagem('Erro na criação do Arquivo dos Vendedores!');
   end;
end;

procedure TFRM_Exportacao.BTN_SairClick(Sender: TObject);
begin
   Close;
end;

procedure TFRM_Exportacao.BTN_ExportarClick(Sender: TObject);
begin
   // Aliquotas ................................................................
   if CHK_Aliquotas.Checked then
      Aliquotas;

   // Clientes .................................................................
   if CHK_Clientes.Checked then
      Clientes;

   // CondPagto ................................................................
   if CHK_CondPagto.Checked then
      CondPagto;

   // Operadores ...............................................................
   if CHK_Operadores.Checked then
      Operadores;

   // Produtos .................................................................
   if CHK_Produtos.Checked then
      Produtos;

   // Vendedores ...............................................................
   if CHK_Vendedores.Checked then
      Vendedores;

   Mensagem('Exportação Finalizada!');
end;

procedure TFRM_Exportacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action         := caFree;
  FRM_Exportacao := nil;
end;

end.
