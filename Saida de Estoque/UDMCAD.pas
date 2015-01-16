unit UDMCAD;

interface

uses
  SysUtils, Classes,Dialogs,vcl.controls, DB, IBCustomDataSet, IBTable, IBDatabase, DBTables,
   SqlExpr, FMTBcd, Provider, DBClient, frxExportCSV, frxClass, frxExportPDF,
  Data.DBXFirebird, frxDBXComponents, frxDCtrl, IniFileS, Windows, Forms,
  frxExportXLS, frxExportRTF ;


type
  TDMCAD = class(TDataModule)
    IBDCADCLIENTE: TIBDatabase;
    IBTransaction1: TIBTransaction;
    CadItem: TIBDataSet;
    DTSitem: TDataSource;
    CADPACIENTE: TIBDataSet;
    DTSPaciente: TDataSource;
    CADPACIENTECODIGO_SUS: TIntegerField;
    CADPACIENTEENDERECO: TIBStringField;
    CADPACIENTEID_PACIENTE: TIntegerField;
    CADPACIENTENOME: TIBStringField;
    CADPACIENTERESPONSAVEL: TIBStringField;
    CADPACIENTERG: TIntegerField;
    CADPACIENTETELEFONE: TIBStringField;
    CADPACIENTETELEFONE_RESP: TIBStringField;
    USUARIOS: TIBDataSet;
    DTSUsuario: TDataSource;
    CadItemCODIGO: TIntegerField;
    CadItemDESCRICAO: TIBStringField;
    CadItemID_ITEM: TIntegerField;
    CadItemITEM: TIBStringField;
    DTSLancMaterial: TDataSource;
    PesquisaPaciente: TIBDataSet;
    DTSPesquisa1: TDataSource;
    PesquisaPacienteCODIGO_SUS: TIntegerField;
    PesquisaPacienteENDERECO: TIBStringField;
    PesquisaPacienteID_PACIENTE: TIntegerField;
    PesquisaPacienteNOME: TIBStringField;
    PesquisaPacienteRESPONSAVEL: TIBStringField;
    PesquisaPacienteRG: TIntegerField;
    PesquisaPacienteTELEFONE: TIBStringField;
    PesquisaPacienteTELEFONE_RESP: TIBStringField;
    PesquisaPacienteTIPO: TIBStringField;
    PesquisaMaterial: TIBDataSet;
    DTSPesquisa2: TDataSource;
    PesquisaMaterialCODIGO: TIntegerField;
    PesquisaMaterialDESCRICAO: TIBStringField;
    PesquisaMaterialID_ITEM: TIntegerField;
    PesquisaMaterialITEM: TIBStringField;
    LancMaterial: TIBDataSet;
    LancMaterialDATA_SAIDA: TDateField;
    LancMaterialID_ITEM: TIntegerField;
    LancMaterialID_PACIENTE: TIntegerField;
    LancMaterialID_SAIDAESTOQUE: TIntegerField;
    LancMaterialQUANTIDADE: TIntegerField;
    LancMaterialUSUARIO: TIBStringField;
    USUARIOSID_USUARIO: TIntegerField;
    USUARIOSNOME: TIBStringField;
    USUARIOSSENHA: TIBStringField;
    USUARIOSUSUARIO: TIBStringField;
    DTSPesquisa3: TDataSource;
    PesquisaLancamento: TIBDataSet;
    PesquisaLancamentoDATA_SAIDA: TDateField;
    PesquisaLancamentoID_ITEM: TIntegerField;
    PesquisaLancamentoID_PACIENTE: TIntegerField;
    PesquisaLancamentoID_SAIDAESTOQUE: TIntegerField;
    PesquisaLancamentoQUANTIDADE: TIntegerField;
    PesquisaLancamentoUSUARIO: TIBStringField;
    PesquisaLancamentoITEM: TIBStringField;
    PesquisaLancamentoDESCRICAO: TIBStringField;
    PesquisaLancamentoNOME: TIBStringField;
    PesquisaLancamentoCODIGO_SUS: TIntegerField;
    frxReport: TfrxReport;
    SQLConnection1: TSQLConnection;
    frxDBXComponents1: TfrxDBXComponents;
    frxDialogControls1: TfrxDialogControls;
    CADPACIENTEDATA_CADASTRO: TDateField;
    CadItemDATA_CADASTRO: TDateField;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    frxXLSExport1: TfrxXLSExport;

    procedure DataModuleCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCAD: TDMCAD;

implementation

uses UCadCliente,  UPrincipal, ULogin, UCadUsuario;

{$R *.dfm}

procedure TDMCAD.DataModuleCreate(Sender: TObject);
var
   VarUser_Name, VarPassword : string;
   _app : string;
   Ini : TIniFile;
  _Local,_Server,_Path,_Base : String;
begin
   {Senha IB}
   VarUser_Name := 'sysdba';
   VarPassword  := 'htsys';

   Try
      if IBDCADCLIENTE.Connected = True then
         IBDCADCLIENTE.Connected := False;

      if IBDCADCLIENTE.Connected = False then
         _app := GetCurrentDir;

      Ini     := TIniFile.Create( _app+'\TECHSYS.INI' );
      { ALIAS 1}
      _Local   := Ini.ReadString( 'DATABASE', 'LOCAL' , '' );
      _Server  := Ini.ReadString( 'DATABASE', 'SERVER', '' );
      _Path    := Ini.ReadString( 'DATABASE', 'PATH'  , '' );
      _Base    := Ini.ReadString( 'DATABASE', 'BASE'  , '' );

     { ALIAS 1}
      if UpperCase(_Local) = 'FALSE' then
         IBDCADCLIENTE.DatabaseName := _Server+':'+_Path+_Base
      else
         IBDCADCLIENTE.DatabaseName := _Path+_Base;

      IBDCADCLIENTE.Params.Clear;
      IBDCADCLIENTE.Params.Add('user_name='+VarUser_Name);
      IBDCADCLIENTE.Params.Add('password='+VarPassword);
      IBDCADCLIENTE.Connected;
      IBDCADCLIENTE.Open;

      IBTransaction1.Active := true;

      Ini.Free;
   except

       if _Base = '' then
       begin
          showmessage('Arquivo Config.ini não encontrado' + #10 + 'Seu Sistema será fechado!!!');
       end
       else
          showmessage('Ocorreu um erro na Abertura da base' + #10 + 'Seu Sistema será fechado!!!');


       Application.Terminate;
       Exit;

   {   if _Base = '' then

         showmessage(Handle, pchar('Arquivo Config.ini não encontrado.'+#13+#10+
                                  'Seu sistema será fechado!!!') , pchar('HighTech System'), 16);

      else
         MessageBox(Handle, pchar('Ocorreu um erro na Abertura da Base'+#13+#10+
                                  'Seu sistema será fechado!!!') , pchar('HighTech System'), 16);

      Application.Terminate;
      Exit;  }

   End;
end;

end.
