unit UNF_Modulo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ADODB, BDE, IBDatabase, IBCustomDataSet, IBTable, IBQuery, DBTables,IniFileS;

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
    IBT_ProdutosDesPortaImpressora: TStringField;
    IBT_MesaItemGRUPO: TIntegerField;
    IBT_MesaItemPRC_UNITARIO: TFloatField;
    IBT_MesaItemBALANCA: TIBStringField;
    IBT_MesaItemHO: TIBStringField;
    DataBaseIBF: TIBDatabase;
    IBTransactionF: TIBTransaction;
    IBT_MesaItemTEMPO: TDateTimeField;
    IBT_MesaItemOPCANCEL: TIntegerField;
    IBT_MesaItemALIQUOTA: TIntegerField;
    IBT_ProdutosDESCONTO: TFloatField;
    IBT_ProdutosACRESCIMO: TFloatField;
    IBQ_DTSystem: TIBQuery;
    IBQ_DTSystemDATA_SER: TDateField;
    IBQ_DTSystemHORA_SER: TTimeField;
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
    DTS_Terminal: TDataSource;
    IBT_Terminal: TIBTable;
    IBT_TerminalIP: TIBStringField;
    IBT_TerminalIMP_LOCAL: TIBStringField;
    IBT_TerminalIMP_TIPO: TIBStringField;
    IBT_TerminalIMPRESSORA: TIBStringField;
    IBT_ConfigMOVEL: TIBStringField;
    IBT_ConfigMODELO: TIBStringField;
    IBT_ConfigGUILHOTINA: TIBStringField;
    IBT_ConfigEXPTICKET: TIBStringField;
    IBT_Parametros: TIBTable;
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
    IBT_ParametrosMSG_COMANDA: TIBStringField;
    IBT_ParametrosCLIENTEPERSO: TIBStringField;
    IBT_ParametrosFRENTEFUNC: TIntegerField;
    IBT_ParametrosVIAS: TIntegerField;
    IBT_ParametrosNUMLINHAS: TIntegerField;
    IBT_ParametrosNFENTRADAIMP: TIBStringField;
    IBT_ParametrosFIRMA: TIntegerField;
    IBT_ParametrosSFIRMA: TIBStringField;
    IBT_ParametrosTEMPOINATIVO: TIntegerField;
    IBT_ParametrosACIONABALANCA: TIBStringField;
    IBT_ParametrosTRVFICHAFINAL: TIBStringField;
    DTS_Parametros: TDataSource;
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
    IBT_ParametrosFORMAPAGTO: TIntegerField;
    IBT_ParametrosQTD_ITENS_MONT_FRENTE: TIntegerField;
    IBT_ParametrosNDFICHA: TIntegerField;
    procedure RedeAtualizaDados(Msg: String);
    procedure DataModuleCreate(Sender: TObject);
    procedure IBT_CargoAfterDelete(DataSet: TDataSet);
    procedure IBT_CargoAfterInsert(DataSet: TDataSet);
    procedure IBT_CargoAfterPost(DataSet: TDataSet);
    procedure IBT_PermissaoCalcFields(DataSet: TDataSet);
    procedure IBT_UsuNivelCalcFields(DataSet: TDataSet);
    procedure MDM_CardapioMessageAvail(Sender: TObject; Msg: String);

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

uses UNF_Funcoes, UNF_Entrada;

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
         ApplyUpdates( DataSet );
         CommitRetaining;
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
         ApplyUpdates( DataSet );
         CommitRetaining;
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
                                 i : Integer;
                 Contador, Tabelas : Integer;
                               Ini : TIniFile;
        _Local,_Server,_Path,_Base : String;
    _LocalF,_ServerF,_PathF,_BaseF : String;
begin
   {Senha IB}
   VarUser_Name := 'sysdba';
   VarPassword  := 'sysdbambd';

   Try
      if DataBaseIB.Connected = True then
         DataBaseIB.Connected := False;

      if DataBaseIBF.Connected = True then
         DataBaseIBF.Connected := False;

      if DataBaseIB.Connected = False then
         _app    := GetCurrentDir;

      Ini     := TIniFile.Create( _app+'\CONFIG.INI' );

      vPorta         := Ini.ReadInteger('CONEXAO','PORTA',0);
      cDescricao     := Ini.ReadString('CONEXAO','DESCRICAO','');
      xOBSMT         := Ini.ReadString('CONEXAO','OBSMT','N');

      { ALIAS 1}
      _Local         := Ini.ReadString( 'CONFBASE', 'LOCAL' , '' );
      _Server        := Ini.ReadString( 'CONFBASE', 'SERVER', '' );
      _Path          := Ini.ReadString( 'CONFBASE', 'PATH'  , '' );
      _Base          := Ini.ReadString( 'CONFBASE', 'BASE'  , '' );

      { ALIAS 2}
      _LocalF        := Ini.ReadString( 'BASEFECHA', 'LOCALF' , '' );
      _ServerF       := Ini.ReadString( 'BASEFECHA', 'SERVERF', '' );
      _PathF         := Ini.ReadString( 'BASEFECHA', 'PATHF'  , '' );
      _BaseF         := Ini.ReadString( 'BASEFECHA', 'BASEF'  , '' );

      vSGERE         := Ini.ReadString( 'CONEXAO', 'SGERE'    , 'N' );
      xDigito        := Ini.ReadString( 'CONEXAO', 'DIGITO'   , 'S' );
      vTPIMPCOZ      := Ini.ReadInteger( 'CONEXAO','TPIMPCOZ' ,1 );
      xQTDTrava      := Ini.ReadInteger( 'CONEXAO','QTDTrava' ,1000);
      xQTDMensagem   := Ini.ReadInteger( 'CONEXAO','QTDMensagem' ,6);

      // Arquivos bemacash
      vARQUIVOOFF      := Ini.ReadString( 'BEMACASH','ARQUIVOOFF','C:\MBD\');

      // Cria o diretorios
      if not DirectoryExists(vARQUIVOOFF) then
         ForceDirectories(vARQUIVOOFF);

      if not DirectoryExists(vARQUIVOOFF+'BKP\') then
         ForceDirectories(vARQUIVOOFF+'BKP\');

      if not DirectoryExists(vARQUIVOOFF+'GERAR\') then
         ForceDirectories(vARQUIVOOFF+'GERAR\');

      if not DirectoryExists(vARQUIVOOFF+'ERRO\') then
         ForceDirectories(vARQUIVOOFF+'ERRO\');

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

   For i := 0 to FRM_Modulo.ComponentCount -1 do
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
               TIBQuery(Frm_Modulo.Components[i]).Name+']'+#13+#10+
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

   Frm_entrada.GGE_Progresso.Progress := 100;

   { ver}
   //FRM_Terminal.PPP_ConectarClick(Self);
   //
   //FRM_Terminal.IBQ_DesFicha.Close;
   //FRM_Terminal.IBQ_DesFicha.ExecSQL;
   //
   //FRM_Terminal.IBTransaction_Commit.Commit;
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

procedure TFRM_Modulo.MDM_CardapioMessageAvail(Sender: TObject;
  Msg: String);
begin
  if copy(Msg,1,2) = 'AT' then
     RedeAtualizaDados(Msg);
end;

end.
