unit UNF_TA2000;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, IBDatabase, DB, ShellAPI, IniFileS, IBCustomDataSet,
  IBQuery, ExtCtrls, StdCtrls, ComCtrls, Grids, DBGrids,Tlhelp32,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZConnection, DBCtrls,
  IBTable, DBClient,  RxGIF;

Const
   WM_TRAYICON = WM_USER+1;
   
type
  TFRM_TA2000 = class(TForm)
    IBTransaction1: TIBTransaction;
    DataBaseIB: TIBDatabase;
    IBQ_Gravar: TIBQuery;
    ZConnection: TZConnection;
    ZQRY_Cliente: TZQuery;
    IBT_Clientes: TIBTable;
    ZQRY_ClienteCODIGO_ID: TIntegerField;
    ZQRY_ClienteNOMEFANTASIA: TStringField;
    ZQRY_ClienteRAZAOSOCIAL: TStringField;
    ZQRY_ClienteCNPJ: TStringField;
    ZQRY_ClienteCPF: TStringField;
    ZQRY_ClienteIE: TStringField;
    ZQRY_ClienteRG: TStringField;
    ZQRY_ClienteENDERECO: TStringField;
    ZQRY_ClienteBAIRRO: TStringField;
    ZQRY_ClienteCIDADE: TStringField;
    ZQRY_ClienteTELEFONE: TStringField;
    ZQRY_ClienteFAX: TStringField;
    ZQRY_ClienteCONTATO: TStringField;
    ZQRY_ClienteSITE: TStringField;
    ZQRY_ClienteATIVO: TStringField;
    ZQRY_ClienteCEP: TStringField;
    ZQRY_ClienteUF: TStringField;
    ZQRY_ClienteTIPOCLIFOR: TStringField;
    ZQRY_ClienteMATRICULA: TStringField;
    ZQRY_ClienteOBSERVACAO: TBlobField;
    ZQRY_ClienteSALDO_CASTO: TFloatField;
    ZQRY_ClienteSALDO_LIMITE: TFloatField;
    ZQRY_ClienteTRAVAMENSAGEM: TStringField;
    ZQRY_ClienteCONTRATO: TStringField;
    ZQRY_ClienteDTCADASTRO: TDateField;
    ZQRY_ClienteCODCONTMATIC: TStringField;
    ZQRY_ClienteTP_PESSOAL: TStringField;
    ZQRY_ClienteCELULAR: TStringField;
    ZQRY_ClienteDATA_NASC: TDateField;
    ZQRY_ClienteCONVENIO: TIntegerField;
    ZQRY_ClienteDT_VENCFINANCLI: TIntegerField;
    ZQRY_ClientePAIS: TStringField;
    ZQRY_ClienteBACEN: TStringField;
    ZQRY_ClienteNUMEROCASA: TStringField;
    ZQRY_ClienteCOD_IBGE_CIDADE: TStringField;
    ZQRY_ClienteSUFRAMA: TStringField;
    ZQRY_ClienteTEL_DELIVERY: TStringField;
    ZQRY_ClienteMENSALISTAS_N: TStringField;
    ZQRY_ClienteDT_ALTERACAO: TDateField;
    ZQRY_ClienteSEXO: TStringField;
    IBT_Parametros: TIBTable;
    IBT_ParametrosCODIGO_ID: TIntegerField;
    IBT_ParametrosHOST: TIBStringField;
    IBT_ParametrosPORTA: TIntegerField;
    IBT_ParametrosDATABASE: TIBStringField;
    IBT_ParametrosLOGIN: TIBStringField;
    IBT_ParametrosSENHA: TIBStringField;
    IBT_ParametrosPONTOVENDA: TIntegerField;
    IBT_ParametrosPDDESCRICAO: TIBStringField;
    IBT_ParametrosPDCHAVE: TIBStringField;
    CDS_Ingresso: TClientDataSet;
    CDS_IngressoEvento: TIntegerField;
    CDS_IngressoLote: TIntegerField;
    CDS_IngressoCPF: TStringField;
    CDS_IngressoSexo: TStringField;
    CDS_IngressoQTD: TFloatField;
    CDS_IngressoTotal: TFloatField;
    CDS_IngressoNumIngresso: TStringField;
    CDS_IngressoData: TSQLTimeStampField;
    IBQ_Evento: TIBQuery;
    IBQ_Lote: TIBQuery;
    IBQ_LoteCODIGO_ID: TIntegerField;
    IBQ_LoteCDIMESTRE: TIntegerField;
    IBQ_LotePONTOVENDA: TIntegerField;
    IBQ_LoteDT_ATUALIZA: TDateField;
    IBQ_LoteDT_INICIO: TDateField;
    IBQ_LoteDT_FIM: TDateField;
    IBQ_LoteNUM_ING_M: TIntegerField;
    IBQ_LoteNUM_ING_F: TIntegerField;
    IBQ_LoteVAL_ING_M: TFloatField;
    IBQ_LoteVAL_ING_F: TFloatField;
    IBQ_LoteVEN_ING_M: TIntegerField;
    IBQ_LoteVEN_ING_F: TIntegerField;
    IBQ_LoteEVENTO: TIntegerField;
    ZQRY_Evento: TZQuery;
    ZQRY_EventoCODIGO_ID: TIntegerField;
    ZQRY_EventoCIDMASTER: TIntegerField;
    ZQRY_EventoCODIGO: TStringField;
    ZQRY_EventoDESCRICAO: TStringField;
    ZQRY_EventoDT_ATUALIZA: TDateField;
    ZQRY_Lote: TZQuery;
    ZQRY_LoteCODIGO_ID: TIntegerField;
    ZQRY_LoteCDIMESTRE: TIntegerField;
    ZQRY_LotePONTOVENDA: TIntegerField;
    ZQRY_LoteDT_ATUALIZA: TDateField;
    ZQRY_LoteDT_INICIO: TDateField;
    ZQRY_LoteDT_FIM: TDateField;
    ZQRY_LoteNUM_ING_M: TIntegerField;
    ZQRY_LoteNUM_ING_F: TIntegerField;
    ZQRY_LoteVAL_ING_M: TFloatField;
    ZQRY_LoteVAL_ING_F: TFloatField;
    ZQRY_LoteVEN_ING_M: TIntegerField;
    ZQRY_LoteVEN_ING_F: TIntegerField;
    ZQRY_LoteEVENTO: TIntegerField;
    IBQ_Pesquisa: TIBQuery;
    ZQRY_Versao: TZQuery;
    ZQRY_VersaoPONTOVENDA: TIntegerField;
    ZQRY_VersaoCLIFOR: TDateTimeField;
    ZQRY_VersaoEVENTO: TDateTimeField;
    ZQRY_VersaoLOTE: TDateTimeField;
    IBQ_Clientes: TIBQuery;
    IBQ_ClientesCNPJ: TIBStringField;
    IBQ_ClientesCPF: TIBStringField;
    IBQ_ClientesIE: TIBStringField;
    IBQ_ClientesRG: TIBStringField;
    IBQ_ClientesNOMEFANTASIA: TIBStringField;
    IBQ_ClientesRAZAOSOCIAL: TIBStringField;
    IBQ_ClientesEMAIL: TIBStringField;
    IBQ_ClientesCELULAR: TIBStringField;
    IBQ_ClientesCIDADE: TIBStringField;
    IBQ_ClientesSEXO: TIBStringField;
    IBT_Ingresso: TIBTable;
    IBT_IngressoCODIGO_ID: TIntegerField;
    IBT_IngressoPONTOVENDA: TIntegerField;
    IBT_IngressoEVENTO: TIntegerField;
    IBT_IngressoLOTE: TIntegerField;
    IBT_IngressoDATA: TDateTimeField;
    IBT_IngressoNUMINGRESSO: TIBStringField;
    IBT_IngressoCPF: TIBStringField;
    IBT_IngressoCHAVE: TIBStringField;
    IBT_IngressoVALOR: TFloatField;
    IBT_IngressoQTD: TFloatField;
    IBT_IngressoDT_ENVIO: TDateTimeField;
    IBT_IngressoSEXO: TIBStringField;
    IBQ_cIngresso: TIBQuery;
    IBQ_cIngressoCINGRESSO: TIntegerField;
    IBT_IngressoCINGRESSO: TIntegerField;
    CDS_IngressocLote: TIntegerField;
    ZQRY_Gravar: TZQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    BlobField1: TBlobField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField20: TStringField;
    StringField21: TStringField;
    DateField1: TDateField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    DateField2: TDateField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    DateField3: TDateField;
    StringField32: TStringField;
    ZQRY_LoteCLOTE: TIntegerField;
    IBQ_LoteCLOTE: TIntegerField;
    v: TImage;
    IBQ_ImpIgresso: TIBQuery;
    IBQ_ImpIgressoCODIGO_ID: TIntegerField;
    IBQ_ImpIgressoPONTOVENDA: TIntegerField;
    IBQ_ImpIgressoEVENTO: TIntegerField;
    IBQ_ImpIgressoLOTE: TIntegerField;
    IBQ_ImpIgressoDATA: TDateTimeField;
    IBQ_ImpIgressoNUMINGRESSO: TIBStringField;
    IBQ_ImpIgressoCPF: TIBStringField;
    IBQ_ImpIgressoCHAVE: TIBStringField;
    IBQ_ImpIgressoVALOR: TFloatField;
    IBQ_ImpIgressoQTD: TFloatField;
    IBQ_ImpIgressoDT_ENVIO: TDateTimeField;
    IBQ_ImpIgressoSEXO: TIBStringField;
    IBQ_ImpIgressoCINGRESSO: TIntegerField;
    IBT_Evento: TIBTable;
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
    IBT_ClienteMATRICULA: TIBStringField;
    IBT_ClienteOBSERVACAO: TBlobField;
    IBT_ClienteSALDO_CASTO: TFloatField;
    IBT_ClienteSALDO_LIMITE: TFloatField;
    IBT_ClienteTRAVAMENSAGEM: TIBStringField;
    IBT_ClienteCONTRATO: TIBStringField;
    IBT_ClienteDTCADASTRO: TDateField;
    IBT_ClienteCODCONTMATIC: TIBStringField;
    IBT_ClienteTP_PESSOAL: TIBStringField;
    IBT_ClienteCELULAR: TIBStringField;
    IBT_ClienteDATA_NASC: TDateField;
    IBT_ClienteCONVENIO: TIntegerField;
    IBT_ClienteDT_VENCFINANCLI: TIntegerField;
    IBT_ClientePAIS: TIBStringField;
    IBT_ClienteBACEN: TIBStringField;
    IBT_ClienteNUMEROCASA: TIBStringField;
    IBT_ClienteCOD_IBGE_CIDADE: TIBStringField;
    IBT_ClienteSUFRAMA: TIBStringField;
    IBT_ClienteTEL_DELIVERY: TIBStringField;
    IBT_ClienteMENSALISTAS_N: TIBStringField;
    IBT_ClienteDT_ALTERACAO: TDateField;
    IBT_ClienteSEXO: TIBStringField;
    IBT_EventoCODIGO_ID: TIntegerField;
    IBT_EventoCIDMASTER: TIntegerField;
    IBT_EventoCODIGO: TIBStringField;
    IBT_EventoDESCRICAO: TIBStringField;
    IBT_EventoDT_ATUALIZA: TDateField;
    IBQ_ImpIgressonome_cli: TStringField;
    TRM_Focar: TTimer;
    ZQRY_EventoDATA_SHOW: TDateField;
    ZQRY_EventoTOTAL_INGR_F: TIntegerField;
    ZQRY_EventoTOTAL_INGR_M: TIntegerField;
    ZQRY_EventoMSG_LIVRE: TStringField;
    ZQRY_EventoATIVO_SN: TStringField;
    IBQ_EventoCODIGO_ID: TIntegerField;
    IBQ_EventoCIDMASTER: TIntegerField;
    IBQ_EventoCODIGO: TIBStringField;
    IBQ_EventoDESCRICAO: TIBStringField;
    IBQ_EventoDT_ATUALIZA: TDateField;
    IBQ_EventoDATA_SHOW: TDateField;
    IBQ_EventoTOTAL_INGR_F: TIntegerField;
    IBQ_EventoTOTAL_INGR_M: TIntegerField;
    IBQ_EventoMSG_LIVRE: TIBStringField;
    IBQ_EventoATIVO_SN: TIBStringField;
    ZQRY_PontoVenda: TZQuery;
    ZQRY_PontoVendaCODIGO_ID: TIntegerField;
    ZQRY_PontoVendaDESCRICAO: TStringField;
    IBQ_Ingressos: TIBQuery;
    IBQ_IngressosEVENTO: TIntegerField;
    IBQ_IngressosSEXO: TIBStringField;
    IBQ_IngressosVALOR: TFloatField;
    IBQ_IngressosdesEvento: TStringField;
    ZQRY_ClienteDATA_MODIF: TDateField;
    ZQRY_ClienteEMAIL: TStringField;
    IBQ_IngressosLOTE: TIntegerField;
    IBQ_EventoOBS: TIBStringField;
    ZQRY_EventoOBS: TStringField;
    IBQ_CountIngresso: TIBQuery;
    IBQ_CountIngressoCOUNT: TIntegerField;
    ZQL_CountIng: TZQuery;
    ZQL_CountIngcount: TLargeintField;
    ZQRY_LoteUNIFICADO: TStringField;
    ZQRY_LoteALLPDV: TStringField;
    IBQ_LoteUNIFICADO: TIBStringField;
    IBQ_LoteALLPDV: TIBStringField;
    ZQRY_ING: TZQuery;
    IBQ_ING: TIBQuery;
    IBQ_SumLote: TIBQuery;
    IBQ_SumLoteTOT_F: TLargeintField;
    IBQ_SumLoteTOT_M: TLargeintField;
    ZQRY_INGtot_vend: TFloatField;
    ZQRY_INGsexo: TStringField;
    IBQ_INGEVENTO: TIntegerField;
    IBQ_INGLOTE: TIntegerField;
    IBQ_EventoTIPO: TIBStringField;
    ZQRY_EventoTIPO: TStringField;
    IBQ_IngressosQTD: TIntegerField;
    IBQ_CountIngCPF: TIBQuery;
    IBQ_CountIngCPFCOUNT: TIntegerField;

    procedure ForceForegroundWindow(hwnd: THandle);
    function cpf(num: string): boolean;
    function Repl(C: string; Tamanho: integer):string;
    function RandomString(expr: string): string;

    procedure TA;

    function taEnviaComando(fComando:String; fTamanho:Integer):String;
    procedure taCursor(fTP:String);
    procedure taMensagem(fTP:String;fMensagem:String);

    procedure taLimpaTela;
    function taMenu:String;

    function taAtualiza:String;
    function taAtualizaLote(fEvento : String):String;
    function taValLoteWeb(fEvento:String; fLote:String): Boolean;

    procedure taTelaIngresso(fTela:Integer);
    function taTelaConfirma:Boolean;

    function taGravarIngresso(vQTD:Double):String;

    function taImpIngresso(vNumIngresso:String):Boolean;

    function taEnviaIngresso(TP:String;vNumIngresso:String):Boolean;


    // Get Ingresso............
    function taGetEvento(fTexto:String):String;
    function taGetCPF(fTexto:String):String;
    function taGetSexo(fTexto:String):String;
    function taGetQTD(fTexto:String):String;
    // Valida Ingresso .......................
    function taValEvento(fRet:String):Boolean;
    function taValCPF(fRet:String):Boolean;
    function taValSexo(fRet:String):Boolean;
    function taValQTD(fRet:String):Boolean;
    //...........................

    //Relatorio Acerto.............................
    function RelAcerto(fDia : String;fEvento : String): String;
    function taValData(fDia : String): String;
    //.............................................

    { Mata qq processo do windows funciona em 98/ME/NT/00 e XP }
    function KillTask_(ExeFileName: string): Integer;

    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TRM_FocarTimer(Sender: TObject);

  private
    { Private declarations }
    //TrayIconData : TNotifyIconData;
  public
    { Public declarations }
    //procedure TrayMessage(var Msg : TMessage); message WM_TRAYICON;
  end;

var
  FRM_TA2000 : TFRM_TA2000;
   VarVersao : String;
                          vPontoVenda : Integer;
  vcpf,vIEvento, vICPF, vISexo, vIQTD,
                             vCancela : String;
                             cTempoFB : Integer;
                     cQtdIng,cPORTA_IP: Integer;
                 cMOD_IMP, cPORTA,cIP : String;
   cCLIENTES, cEVENTO, cLOTE, cVERSAO : String;
                     CPONTOV, cENVIA  : String;
                  cPV, cTPMENU,cTempo : String;

implementation

uses UNF_TesteComunicacao, UNF_FTA2000, uSocketPing;

{$R *.dfm}

function TFRM_TA2000.taValLoteWeb(fEvento:String; fLote:String): Boolean;
begin

   ZQRY_ING.Close;
   ZQRY_ING.SQL.Clear;
   ZQRY_ING.SQL.Add('select sum(qtd) as tot_vend, sexo');
   ZQRY_ING.SQL.Add('from INGRESSO');
   ZQRY_ING.SQL.Add('where 1=1');
   ZQRY_ING.SQL.Add('and evento = :Pevento');
   ZQRY_ING.SQL.Add('and lote = :Plote');
   ZQRY_ING.ParamByName('Pevento').Value   := StrToInt(fEvento);
   ZQRY_ING.ParamByName('Plote').Value     := StrToInt(fLote);
   ZQRY_ING.SQL.Add('group by sexo');
   ZQRY_ING.Open;

   ZQRY_ING.First;

   while not ZQRY_ING.Eof do
   begin

      // Baixa Saldo ...........................................................
      IBQ_Gravar.Close;
      IBQ_Gravar.SQL.Clear;
      IBQ_Gravar.SQL.Add('update lote ');
      if (UpperCase(ZQRY_INGsexo.Value) = 'F') then
      begin
         IBQ_Gravar.SQL.Add('set VEN_ING_F = (:PVEN_ING_F)');
         IBQ_Gravar.ParamByName('PVEN_ING_F').Value := ZQRY_INGtot_vend.Value;
      end
      else
      begin
         IBQ_Gravar.SQL.Add('set VEN_ING_M = (:PVEN_ING_M)');
         IBQ_Gravar.ParamByName('PVEN_ING_M').Value := ZQRY_INGtot_vend.Value;
      end;
      IBQ_Gravar.SQL.Add('where 1=1');
      IBQ_Gravar.SQL.Add('and (evento = :Pevento)');
      IBQ_Gravar.SQL.Add('and (Clote =  :PClote)');
      IBQ_Gravar.ParamByName('Pevento').AsInteger  := StrToInt(fEvento);
      IBQ_Gravar.ParamByName('PClote').AsInteger   := StrToInt(fLote);
      IBQ_Gravar.ExecSQL;
      IBTransaction1.CommitRetaining;
      //........................................................................

      ZQRY_ING.Next;

   end;

end;


function TFRM_TA2000.taValData(fDia : String): String;
var
dia,mes,ano,data : string;
begin
   try
     dia := copy(fDia,1,2);
     mes := copy(fDia,3,2);
     ano := copy(fDia,5,2);

     data := dia+'/'+mes+'/'+ano;

     StrToDate(data);

     Result := data;

   except
   
   on EConvertError do
      begin
         taMensagem('1','Data Inválida!...');
         Result := '';
      end;
   end;

end;

procedure TFRM_TA2000.ForceForegroundWindow(hwnd: THandle);
  // (W) 2001 Daniel Rolf
  // http://www.finecode.de
  // rolf@finecode.de
var
  hlp: TForm;
begin
  hlp := TForm.Create(nil);
  try
    hlp.BorderStyle := bsNone;
    hlp.SetBounds(0, 0, 1, 1);
    hlp.FormStyle := fsStayOnTop;
    hlp.Show;
    mouse_event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
    mouse_event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
    SetForegroundWindow(hwnd);
  finally
    hlp.Free;
  end;
end;

{ Mata qq processo do windows funciona em 98/ME/NT/00 e XP }
function TFRM_TA2000.KillTask_(ExeFileName: string): Integer;
const
   PROCESS_TERMINATE = $0001;
var
   ContinueLoop: BOOL;
   FSnapshotHandle: THandle;
   FProcessEntry32: TProcessEntry32;
begin
   Result := 0;
   FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
   FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
   ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

   while Integer(ContinueLoop) <> 0 do
   begin
      if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName))) then
         Result := Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0), FProcessEntry32.th32ProcessID), 0));

      ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
end;
   CloseHandle(FSnapshotHandle);
end;

// Validar CPF .................................................................
function TFRM_TA2000.cpf(num: string): boolean;
var
  n1,n2,n3,n4,n5,n6,n7,n8,n9 : integer;
  d1,d2                      : integer;
  digitado, calculado        : string;
begin
   n1 := StrToInt64(num[1]);
   n2 := StrToInt64(num[2]);
   n3 := StrToInt64(num[3]);
   n4 := StrToInt64(num[4]);
   n5 := StrToInt64(num[5]);
   n6 := StrToInt64(num[6]);
   n7 := StrToInt64(num[7]);
   n8 := StrToInt64(num[8]);
   n9 := StrToInt64(num[9]);
   d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 +
         n3 * 8 + n2 * 9 + n1 * 10;
   d1 := 11 - (d1 mod 11);

   if d1 >= 10 then
      d1 := 0;

   d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5  + n6 * 6  +
         n5 * 7 + n4 * 8 + n3 * 9 + n2 * 10 + n1 * 11 ;
   d2 := 11 - (d2 mod 11);

   if d2 >= 10 then
      d2 := 0;

   calculado := inttostr(d1) + inttostr(d2);
   digitado  := num[10]      + num[11];

   if calculado = digitado then
      cpf := True
   else
      cpf := False;
end;

// Replicar Caracter ...........................................................
function TFRM_TA2000.Repl(C: string; Tamanho: integer): string;
var
   Conteudo: string;
   Contar: integer;
begin
   Conteudo := '';
   for Contar := 1 to Tamanho do
   begin
      Conteudo := Conteudo + C;
      Application.ProcessMessages;
   end;
   Repl := Conteudo;
end;

// Criar String Random .........................................................
function TFRM_TA2000.RandomString(expr: string): string;
{
  (c) 2002 Uros Gaber, PowerCom d.o.o. 
  expr values that combine (*nix style) 
  1: A..Z 
  2: a..z 
  4: 0..9 
  if you want 
  (A..Z, a..z) use 3; 
  (A..Z, a..z, 0..9) use 7 
  (A..Z, 0..9) use 5 
  (a..z, 0..9) use 6 
  i.e. RandomString('123'); to generate a 3 letters random string... 
} 
var 
  i: Byte; 
  s: string; 
  v: Byte;
begin 
  Randomize;
  SetLength(Result, Length(expr));
  for i:=1 to Length(expr) do
  begin
    s:='';
    try
      v:=StrToInt(Expr[i]);
    except
      v:=0;
    end;
    if (v-4) >= 0 then
    begin
      s:=s+'0123456789';
      dec(v, 4);
    end;
    if (v-2) >= 0 then
    begin
      s:=s+'abcdefghijklmnopqrstuvwxyz';
      dec(v, 2);
    end;
    if (v-1) >= 0 then
      s:=s+'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    Result[i]:=s[Random(Length(s)-1)+1];
  end;
end;

function TFRM_TA2000.taGravarIngresso(vQTD:Double):String;
var
   vNumIngresso : String;
     vCIngresso : Int64;
begin
   try
      // Contar novo ingresso...................................................
      IBQ_cIngresso.Close;
      IBQ_cIngresso.SQL.Clear;
      IBQ_cIngresso.SQL.Add('select max(cIngresso) as cIngresso ');
      IBQ_cIngresso.SQL.Add('from ingresso');
      IBQ_cIngresso.SQL.Add('where (Evento = :PEvento)');
      IBQ_cIngresso.ParamByName('PEvento').AsInteger     := CDS_IngressoEvento.AsInteger;
      IBQ_cIngresso.SQL.Add('and (Lote = :PLote)');
      IBQ_cIngresso.ParamByName('PLote').AsInteger       := CDS_IngressocLote.AsInteger;
      IBQ_cIngresso.SQL.Add('and (PontoVenda = :PPontoVenda)');
      IBQ_cIngresso.ParamByName('PPontoVenda').AsInteger := vPontoVenda;
      IBQ_cIngresso.Open;

      vCIngresso    := (IBQ_cIngressoCINGRESSO.AsInteger+1);
      //........................................................................

      vNumIngresso  := FormatFloat('0000',CDS_IngressoEvento.Value) +
                       FormatFloat('00',CDS_IngressocLote.Value)    +
                       FormatFloat('00',vPontoVenda)                +
                       FormatFloat('000000',vCIngresso);

      IBT_Ingresso.Close;
      IBT_Ingresso.Open;

      IBT_Ingresso.Append;
      IBT_IngressoCODIGO_ID.Value    := 0;
      IBT_IngressoPONTOVENDA.Value   := vPontoVenda;
      IBT_IngressoEVENTO.Value       := CDS_IngressoEvento.Value;
      IBT_IngressoLOTE.Value         := CDS_IngressocLote.Value;
      IBT_IngressoDATA.AsDateTime    := CDS_IngressoData.AsDateTime;
      IBT_IngressoCPF.Value          := CDS_IngressoCPF.Value;
      IBT_IngressoVALOR.Value        := CDS_IngressoTotal.Value;
      IBT_IngressoQTD.Value          := vQTD;
      IBT_IngressoSEXO.Value         := CDS_IngressoSexo.Value;
      //........................................................................
      IBT_IngressoCINGRESSO.Value    := vCIngresso;
      IBT_IngressoNUMINGRESSO.Value  := vNumIngresso;
      IBT_IngressoCHAVE.Value        := RandomString('55555555555555');
      //........................................................................
      IBT_Ingresso.Post;

      IBTransaction1.CommitRetaining;

      // Baixa Saldo ...........................................................
      IBQ_Gravar.Close;
      IBQ_Gravar.SQL.Clear;
      IBQ_Gravar.SQL.Add('update lote ');
      if (UpperCase(CDS_IngressoSexo.Value) = 'F') then
      begin
         IBQ_Gravar.SQL.Add('set VEN_ING_F = (VEN_ING_F + :PVEN_ING_F)');
         IBQ_Gravar.ParamByName('PVEN_ING_F').Value := vQTD;
      end
      else
      begin
         IBQ_Gravar.SQL.Add('set VEN_ING_M = (VEN_ING_M + :PVEN_ING_M)');
         IBQ_Gravar.ParamByName('PVEN_ING_M').Value := vQTD;
      end;
      IBQ_Gravar.SQL.Add('where (Codigo_ID = :PCodigo_ID)');
      IBQ_Gravar.ParamByName('PCodigo_ID').AsInteger := CDS_IngressoLote.Value;
      IBQ_Gravar.ExecSQL;
      IBTransaction1.CommitRetaining;
      //........................................................................

      Result := vNumIngresso ;
   except
      Result := '';
   end;
end;

function TFRM_TA2000.taImpIngresso(vNumIngresso:String):Boolean;
var
   nome_evento, num_ing, chave, data, lote,preco,
   qtd, ponto, nome_cli, cpf_cnpj, cod_bar, sexo,
   msg_livre1,msg_livre2,msg_livre3,obs,unificado,
                                             tipo : string;
                                              Lst : TextFile;
                                              T,E : Integer;
begin
   try
      //INGRESSO.................................................................
      IBQ_ImpIgresso.Close;
      IBQ_ImpIgresso.SQL.Clear;
      IBQ_ImpIgresso.SQL.Add('select * from ingresso');
      IBQ_ImpIgresso.SQL.Add('where (1=1)');
      IBQ_ImpIgresso.SQL.Add('and (NUMINGRESSO = :P_ingresso) ');
      IBQ_ImpIgresso.ParamByName('P_ingresso').Value := vNumIngresso;
      IBQ_ImpIgresso.Open;
      IBQ_ImpIgresso.First;
      //.........................................................................

      //EVENTO...................................................................
      IBQ_Evento.Close;
      IBQ_Evento.SQL.Clear;
      IBQ_Evento.SQL.Add('Select *');
      IBQ_Evento.SQL.Add('From Evento');
      IBQ_Evento.SQL.Add('where (CIDMASTER = :PCIDMASTER)');
      IBQ_Evento.ParamByName('PCIDMASTER').Value := IBQ_ImpIgressoEVENTO.Value;
      IBQ_Evento.Open;
      //.........................................................................

      //LOTE.....................................................................
      IBQ_Lote.Close;
      IBQ_Lote.SQL.Clear;
      IBQ_Lote.SQL.Add(' Select *');
      IBQ_Lote.SQL.Add(' From LOTE');
      IBQ_Lote.SQL.Add(' where 1 = 1');
      IBQ_Lote.SQL.Add(' and EVENTO = :PEVENTO');
      IBQ_Lote.SQL.Add(' and CLOTE = :PCLOTE');
      IBQ_Lote.ParamByName('PEVENTO').Value := IBQ_ImpIgressoEVENTO.Value;
      IBQ_Lote.ParamByName('PCLOTE').Value  := IBQ_ImpIgressoLOTE.Value;
      IBQ_Lote.Open;
      //.........................................................................


      nome_evento := IBQ_EventoDESCRICAO.value;
      data        := FormatDateTime('dd/mm/yy',IBQ_EventoDATA_SHOW.AsDateTime);
      lote        := IntToStr(IBQ_ImpIgressoLOTE.AsInteger);
      ponto       := IBQ_ImpIgressoPONTOVENDA.AsString;
      nome_cli    := IBQ_ImpIgressonome_cli.AsString;
      cpf_cnpj    := IBQ_ImpIgressoCPF.AsString;
      sexo        := IBQ_ImpIgressoSEXO.AsString;
      unificado   := IBQ_LoteUNIFICADO.AsString;
      qtd         := FloatToStr(IBQ_ImpIgressoQTD.AsFloat);
      preco       := FormatFloat('###,###,#00.00',IBQ_ImpIgressoVALOR.AsFloat);
      num_ing     := IBQ_ImpIgressoNUMINGRESSO.AsString;
      chave       := IBQ_ImpIgressoCHAVE.AsString;
      cod_bar     := copy(num_ing+'              ',1,14);
      obs         := IBQ_EventoOBS.AsString;
      msg_livre1  := copy(IBQ_EventoMSG_LIVRE.AsString,1,40);
      msg_livre2  := copy(IBQ_EventoMSG_LIVRE.AsString,41,40);
      msg_livre3  := copy(IBQ_EventoMSG_LIVRE.AsString,121,40);
      tipo        := IBQ_EventoTIPO.AsString;

      AssignFile(Lst,cPORTA);
      Rewrite(Lst);

      WriteLn(Lst,#27+'l'+#13+#27+#69+#14+'MARINELLI HALL'+#20+#27+#70+#27+'l'+#1);
      WriteLn(Lst,#27+#69'                     Apresenta:'+#27+#70);

      WriteLn(Lst,Repl(' ',48));

      //centralizado.............................................................


      if Length(nome_evento) > 40 then
      begin
         T := (20 - Length(copy(nome_evento,41,20)));
         //E := round(T/2);

         WriteLn(Lst,'     '+#27+#69+#14+copy(nome_evento,1,20)+#20+#27+#70);
         WriteLn(Lst,'     '+#27+#69+#14+copy(nome_evento,21,20)+#20+#27+#70);
         WriteLn(Lst,'     '+Repl(' ',T)+#27+#69+#14+copy(nome_evento,41,20)+#20+#27+#70);
      end
      else if Length(nome_evento) > 20 then
      begin
         T := (20 - Length(copy(nome_evento,21,20)));
         //E := round(T/2);

         WriteLn(Lst,'     '+#27+#69+#14+copy(nome_evento,1,20)+#20+#27+#70);
         WriteLn(Lst,'     '+Repl(' ',T)+#27+#69+#14+copy(nome_evento,21,20)+#20+#27+#70);
      end
      else
      begin
         T := (20 - Length(copy(nome_evento,1,20)));
         //E := round(T/2);

         WriteLn(Lst,'     '+Repl(' ',T)+#27+#69+#14+copy(nome_evento,1,20)+#20+#27+#70);
      end;
      //.........................................................................

      WriteLn(Lst,#27+#69+'     Dia:  '+#14+data+#20+#27+#70);
      WriteLn(Lst,#27+#69+'     MARINELLI HALL'+#27+#70);
      WriteLn(Lst,#27+#69+'     PINDAMONHANGABA-SP'+#27+#70);
      WriteLn(Lst,#27+#69+'     '+obs +#27+#70);

      WriteLn(Lst,Repl(' ',48));

      T := (20 - Length(tipo));

      WriteLn(Lst,'     '+Repl(' ',T)+#27+#69+#14+tipo+#20+#27+#70+#27+'l'+#1);

      if unificado = 'S' then
         WriteLn(Lst,'     '+#27+#69+#14+'INGRESSO UNICO'+'-MEIA'+#20+#27+#70+#27+'l'+#1)
      else
      begin
         if ((sexo = 'm') OR (sexo = 'M')) then
            WriteLn(Lst,#27+'l'+#10+#27+#69+#14+'MASCULINO'+'-MEIA'+#20+#27+#70+#27+'l'+#1)
         else
         if ((sexo = 'f') OR (sexo = 'F')) then
            WriteLn(Lst,#27+'l'+#10+#27+#69+#14+'FEMININO'+'-MEIA'+#20+#27+#70+#27+'l'+#1);
      end;

      WriteLn(Lst,Repl(' ',48));

      WriteLn(Lst,#27+#69+'     Valor..:   R$ '+preco+#27+#70);

      WriteLn(Lst,Repl(' ',48));

      WriteLn(Lst,#27+#69+'     Proibida a entrada de menores de 18  anos'+#27+#70);
      WriteLn(Lst,#27+#69+'     e obrigatorio a apresentacao de documento'+#27+#70);
      WriteLn(Lst,#27+#69+'     de identidade                            '+#27+#70);

      WriteLn(Lst,Repl(' ',48));

      if msg_livre1 <> '' then
      begin
         //
         WriteLn(Lst,#27+#69+'     '+msg_livre1+#27+#70);
      end;
      if msg_livre2 <> '' then
      begin
         //
         WriteLn(Lst,#27+#69+'     '+msg_livre2+#27+#70);
      end;
      if msg_livre3 <> '' then
      begin
         //
         WriteLn(Lst,#27+#69+'     '+msg_livre3+#27+#70);
      end;
      WriteLn(Lst,Repl(' ',48));
      Write(Lst,#27+'l'+#13);
      Write(Lst,#27+#69+'CH'+chave);
      Writeln(Lst,#27+'b'+#5+#3+#120+#1+cod_bar+#0);
      Write(Lst,#27+'l'+#1);

      WriteLn(Lst,#10+#13);//salto
      WriteLn(Lst,#10+#13);//salto
      WriteLn(Lst,#10+#13);//salto
      WriteLn(Lst,#10+#13);//salto
      WriteLn(Lst,#27+#109);//guilhotina

      CloseFile(Lst);

      Sleep(2000);

      Result := True;
   except
      //Mensagem
      taLimpaTela;
      taMensagem('1','Erro na impressão...');
      Sleep(1000);
      CloseFile(Lst);
      Result := False;

   end;
end;

function TFRM_TA2000.taEnviaIngresso(TP:String;vNumIngresso:String):Boolean;
var
  R : Integer;
begin
   try
      //R := uSocketPing.Ping(10000, '186.202.13.3', 3306);

      if uSocketPing.Ping(10000, cIP, cPORTA_IP) = 0 then
      begin
         if (cENVIA = 'S') then
         begin
            if (TP = '0') then
            begin
               taEnviaComando('<limpar>1</limpar>',81);
               taEnviaComando('<imprimir><texto>Buscando Ingressos </texto><linha>1</linha><coluna>1</coluna></imprimir>',81);
            end;

            IBQ_Pesquisa.Close;
            IBQ_Pesquisa.SQL.Clear;
            IBQ_Pesquisa.SQL.Add('select * from INGRESSO       ');

            if (TP = '0') then
               IBQ_Pesquisa.SQL.Add('Where (DT_ENVIO is null)     ')
            else
            begin
               IBQ_Pesquisa.SQL.Add('Where (NUMINGRESSO = :P_NUM) ');
               IBQ_Pesquisa.ParamByName('P_NUM').AsString   := vNumIngresso;
            end;

            IBQ_Pesquisa.Open;

            IBQ_Pesquisa.First;
            while not IBQ_Pesquisa.EOF do
            begin
               if (TP = '0') then
               begin
                  taEnviaComando('<limpar>1</limpar>',81);
                  taEnviaComando('<imprimir><texto>Conectando... </texto><linha>1</linha><coluna>1</coluna></imprimir>',81);
               end;

               ZConnection.Disconnect;
               ZConnection.Connect;

               if (TP = '0') then
               begin
                  taEnviaComando('<limpar>1</limpar>',81);
                  taEnviaComando('<imprimir><texto>Gravando... </texto><linha>1</linha><coluna>1</coluna></imprimir>',81);
               end;

               with ZQRY_Gravar do
               begin
                  Close;
                  SQL.Clear;
                  SQL.Add('insert into INGRESSO                                           ');
                  SQL.Add('(                                                              ');
                  SQL.Add('   CODIGO_ID,      PONTOVENDA,    EVENTO,    LOTE,     DATA,   ');
                  SQL.Add('   NUMINGRESSO,    CPF,           CHAVE,     VALOR,    QTD,    ');
                  SQL.Add('   DT_ENVIO,       SEXO                                        ');
                  SQL.Add(')                                                              ');
                  SQL.Add('Values                                                         ');
                  SQL.Add('(                                                              ');
                  SQL.Add('   :P_CODIGO_ID,   :P_PONTOVENDA, :P_EVENTO, :P_LOTE,  :P_DATA,');
                  SQL.Add('   :P_NUMINGRESSO, :P_CPF,        :P_CHAVE,  :P_VALOR, :P_QTD, ');
                  SQL.Add('   :P_DT_ENVIO,    :P_SEXO                                     ');
                  SQL.Add(')                                                              ');
                  ParamByName('P_CODIGO_ID').AsInteger   := IBQ_Pesquisa.Fieldbyname('Codigo_ID').AsInteger;
                  ParamByName('P_PONTOVENDA').AsInteger  := IBQ_Pesquisa.Fieldbyname('PONTOVENDA').AsInteger;
                  ParamByName('P_EVENTO').AsInteger      := IBQ_Pesquisa.Fieldbyname('EVENTO').AsInteger;
                  ParamByName('P_LOTE').AsInteger        := IBQ_Pesquisa.Fieldbyname('LOTE').AsInteger;
                  ParamByName('P_DATA').AsDateTime       := IBQ_Pesquisa.Fieldbyname('DATA').AsDateTime;
                  ParamByName('P_NUMINGRESSO').AsString  := IBQ_Pesquisa.Fieldbyname('NUMINGRESSO').AsString;
                  ParamByName('P_CPF').AsString          := IBQ_Pesquisa.Fieldbyname('CPF').AsString;
                  ParamByName('P_CHAVE').AsString        := IBQ_Pesquisa.Fieldbyname('CHAVE').AsString;
                  ParamByName('P_VALOR').AsFloat         := IBQ_Pesquisa.Fieldbyname('VALOR').AsFloat;
                  ParamByName('P_QTD').AsFloat           := IBQ_Pesquisa.Fieldbyname('QTD').AsFloat;
                  ParamByName('P_DT_ENVIO').AsDateTime   := Now;
                  ParamByName('P_SEXO').AsString         := IBQ_Pesquisa.Fieldbyname('SEXO').AsString;

                  ExecSQL;
               end;

               ZConnection.Disconnect;

               //......................................................................
               if (TP = '0') then
               begin
                  taEnviaComando('<limpar>1</limpar>',81);
                  taEnviaComando('<imprimir><texto>Trocando Status... </texto><linha>1</linha><coluna>1</coluna></imprimir>',81);
               end;

               IBQ_Gravar.Close;
               IBQ_Gravar.SQL.Clear;
               IBQ_Gravar.SQL.Add('update ingresso ');
               IBQ_Gravar.SQL.Add('set DT_Envio = :PDT_Envio');
               IBQ_Gravar.ParamByName('PDT_Envio').AsDateTime := now;
               IBQ_Gravar.SQL.Add('where (Codigo_ID = :PCodigo_ID)');
               IBQ_Gravar.ParamByName('PCodigo_ID').AsInteger := IBQ_Pesquisa.Fieldbyname('Codigo_ID').AsInteger;
               IBQ_Gravar.ExecSQL;
               IBTransaction1.CommitRetaining;
               //......................................................................

               IBQ_Pesquisa.Next;
            end;

            if (TP = '0') then
            begin
               taEnviaComando('<limpar>1</limpar>',81);
               taEnviaComando('<imprimir><texto>Tranferencia Finalizada... </texto><linha>1</linha><coluna>1</coluna></imprimir>',81);
            end;
         end;

         ZConnection.Disconnect;
         Result := True;
      end
      else
        taMensagem('1','   ');
   except
      ZConnection.Disconnect;
      Result := False;
   end;
end;

procedure TFRM_TA2000.TA;
Var
   vRet : String;
  vFoco : Integer;
begin
   taCursor('1');
   taLimpaTela;

   vFoco := 1;
   while True do
   begin
      try
         // Evento
         if (vFoco = 1) then
         begin
            //Limpar CDS.....................
            CDS_Ingresso.EmptyDataSet;

            CDS_Ingresso.Append;
            CDS_IngressoData.AsDateTime := Now;
            CDS_Ingresso.Post;

            vIEvento := '      ';
            vICPF    := '           ';
            vISexo   := ' ';
            vIQTD    := '        ';
            //...............................

            taTelaIngresso(vFoco);
            taEnviaComando('<imprimir><texto>      </texto><linha>1</linha><coluna>5</coluna></imprimir>',81);
            vRet := taGetEvento(vIEvento);

            if not taValEvento(vRet) then
               vFoco := 1
            else
               vFoco := 2;

            Continue;
         end;

         // CPF
         if (vFoco = 2) then
         begin
            //taTelaIngresso(vFoco);
            taEnviaComando('<imprimir><texto>              </texto><linha>1</linha><coluna>15</coluna></imprimir>',81);
            vRet := taGetCPF(vICPF);

            // Voltar
            if (Copy(vRet,1,1) = '@') then
            begin
               if vcpf = 'S' then
               begin
                  vFoco := 4;
                  taMensagem('1','                    ');
                  vcpf := 'N';
                  Continue;
               end
               else
               begin
                  vFoco := 1;
                  taMensagem('1','                    ');
                  Continue;
               end;
            end;

            if not taValCPF(vRet) then
               vFoco := 2
            else
            begin
               if vcpf = 'S' then
               begin
                  if taTelaConfirma then
                  begin
                     vFoco := 1;
                     taLimpaTela;
                     Continue;
                  end
                  else
                  begin
                     taLimpaTela;
                     taMensagem('1','Erro na inclusão');
                     vFoco := 1;

                  end;
               end
               else if vCancela = 'S' then
               begin
                 vCancela := 'N';
                 vFoco := 1;
                 taLimpaTela;
                 Continue;
               end
               else
               begin
                  vFoco := 3;
                  
                  taMensagem('1','                    ');
               end;
            end;

            Continue;
         end;

         // Sexo
         if (vFoco = 3) then
         begin
            //taTelaIngresso(vFoco);

            //...................................................................
            taEnviaComando('<imprimir><texto> </texto><linha>1</linha><coluna>38</coluna></imprimir>',81);
            vRet := taGetSexo(vISexo);

            // Voltar
            if (Copy(vRet,1,1) = '@') then
            begin
               vFoco := 2;
               taMensagem('1','                    ');
               Continue;
            end;

            // Validar
            if not taValSexo(vRet) then
               vFoco := 3
            else
            begin
               vFoco := 4;
               taMensagem('1','                    ');
            end;

           Continue;
         end;

         // QTD
         if (vFoco = 4) then
         begin
            //taTelaIngresso(vFoco);
            taEnviaComando('<imprimir><texto>       </texto><linha>2</linha><coluna>28</coluna></imprimir>',81);
            vRet := taGetQTD(vIQTD);

            // Voltar
            if (Copy(vRet,1,1) = '@') then
            begin
               vFoco := 3;
               taMensagem('1','                    ');
               Continue;
            end;

            // Validar
            if not taValQTD(vRet) then
            begin
               if vcpf = 'S' then
                  vFoco := 2
               else
                  vFoco := 4
            end
            else
            begin
               if vCancela = 'S' then
               begin
                 vCancela := 'N';
                 vFoco := 1;
                 taLimpaTela;
                 Continue;
               end
               else
               if taTelaConfirma then
               begin
                  vFoco := 1;
                  taLimpaTela;
               end
               else
               begin
                  taLimpaTela;
                  taMensagem('1','Erro na inclusão');
                  vFoco := 1;

               end;
            end;
         end;


         Continue;
      except
         vFoco := 1;
         taLimpaTela;
         Continue;
      end;
   end;
end;

function TFRM_TA2000.taTelaConfirma:Boolean;
Var
   vConfirma, vNumIngresso : String;
                      R,vI : integer;
begin
   try

      //R := uSocketPing.Ping(10000, '186.202.13.3', 3306);

      while True do
      begin
         vcpf := 'N';
         taLimpaTela;
         taEnviaComando('<imprimir><texto>Eve: ' + FormatFloat('#####0',CDS_IngressoEvento.Value)                              +
                                       '  QTD: ' + FormatFloat('#####0',CDS_IngressoQTD.Value)                                 +
                                       '  Tot: ' + FormatFloat('R$ ###,##0.00',CDS_IngressoQTD.Value*CDS_IngressoTotal.Value)  +
                                  '</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

         taEnviaComando('<imprimir><texto>Confirma venda dos Ingressos (S/N)? </texto><linha>2</linha><coluna>1</coluna></imprimir>',81);

         vConfirma :=  '';
         while True do
         begin
            vConfirma := Pchar(taEnviaComando('<edicao><enter></enter><esc>-27</esc><tipo>3</tipo><tamanho>1</tamanho><linha>2</linha><coluna>36</coluna></edicao>',1));

            if ((UpperCase(vConfirma) <> 'S')  or
                (UpperCase(vConfirma) <> 'N')) then
            begin
               Break;
            end;
         end;

         if (UpperCase(vConfirma) = 'S') then
         begin
            for vI := 1 to CDS_IngressoQTD.AsInteger do
            begin
               vNumIngresso := taGravarIngresso(1);

               if (vNumIngresso = '') then
               begin

               end
               else
               begin
                  if not taImpIngresso(vNumIngresso) then
                  begin
                     IBQ_Gravar.Close;
                     IBQ_Gravar.SQL.Clear;
                     IBQ_Gravar.SQL.Add('delete from Ingresso');
                     IBQ_Gravar.SQL.Add('where (NUMINGRESSO = :PNUMINGRESSO)');
                     IBQ_Gravar.ParamByName('PNUMINGRESSO').Value := vNumIngresso;
                     IBQ_Gravar.Open;
                     IBTransaction1.CommitRetaining;
                     // Deletar ingresso...
                  end;

                  if not taEnviaIngresso('1',vNumIngresso) then
                  begin
                     // Marcar não enviado
                  end
                  else
                  begin
                     // Marcar enviado
                     if uSocketPing.Ping(10000, '186.202.13.3', 3306) = 0 then
                     begin
                        ZConnection.Connect;
                        taValLoteWeb(vIEvento,IntToStr(CDS_IngressocLote.value));
                        ZConnection.Connect;
                     end;
                  end;
               end;
            end;
         end
         else
         begin
            // Mensagem e e voltar
         end;

         Break;
      end;
     Result := True;
   except
      Result := False;
   end;
end;


function TFRM_TA2000.taAtualiza:String;
var
   vCount,R : Integer;
begin
   try
      //R := uSocketPing.Ping(10000, '186.202.13.3', 3306);

      if uSocketPing.Ping(10000, '186.202.13.3', 3306) = 0 then
      begin

         taLimpaTela;

         ZConnection.Disconnect;

         //...........................................................................
         IBT_Parametros.Close;
         IBT_Parametros.Open;

         try
            if (cPV = 'P') then
               vPontoVenda := IBT_ParametrosPONTOVENDA.Value
            else
               vPontoVenda := StrToInt(cPV);
         except
            vPontoVenda := IBT_ParametrosPONTOVENDA.Value;
         end;
         //...........................................................................


         // Atualizar cliente.........................................................
         if (cCLIENTES = 'S') then
         begin
            taEnviaComando('<limpar>1</limpar>',81);
            taEnviaComando('<imprimir><texto>Atualizando Cliente Local</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

            IBQ_Pesquisa.Close;
            IBQ_Pesquisa.SQL.Clear;
            IBQ_Pesquisa.SQL.Add('select max(DATA_MODIF) as ultdt');
            IBQ_Pesquisa.SQL.Add('from clifor');
            IBQ_Pesquisa.Open;

            // Apenas as não atualizadas...........................................
            //IBQ_Gravar.Close;
            //IBQ_Gravar.SQL.Clear;
            //IBQ_Gravar.SQL.Add('delete from Clifor');
            //IBQ_Gravar.ExecSQL;
            //.....................................................................

            ZConnection.Disconnect;
            ZConnection.Connect;

            // Limpa banco web
            taEnviaComando('<limpar>1</limpar>',81);
            taEnviaComando('<imprimir><texto>Conectando...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);
            ZQRY_Cliente.Close;
            ZQRY_Cliente.SQL.Clear;
            ZQRY_Cliente.SQL.Add('select * ');
            ZQRY_Cliente.SQL.Add('from CLIFOR');
            ZQRY_Cliente.SQL.Add('where (DATA_MODIF >= :PDATA_MODIF)');
            ZQRY_Cliente.ParamByName('PDATA_MODIF').AsDateTime := IBQ_Pesquisa.FieldByName('ultdt').AsDateTime;
            ZQRY_Cliente.Open;

            ZQRY_Cliente.First;

            vCount := 0;

            taEnviaComando('<limpar>1</limpar>',81);
            taEnviaComando('<imprimir><texto>Atualizando Cliente...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

            while not ZQRY_Cliente.Eof do
            begin
               Inc(vCount,1);
               // Lentidão
               //taEnviaComando('<imprimir><texto>Atualizando Cliente:'+IntToStr(vCount)+'/'+IntToStr(ZQRY_Cliente.RecordCount)+'</texto><linha>1</linha><coluna>1</coluna></imprimir>');

               IBQ_Gravar.Close;
               IBQ_Gravar.SQL.Clear;
               IBQ_Gravar.SQL.Add('insert into CLIFOR');
               IBQ_Gravar.SQL.Add('(CODIGO_ID,NOMEFANTASIA,RAZAOSOCIAL,CNPJ,CPF,IE,RG,ENDERECO,BAIRRO,CIDADE,TELEFONE,FAX,CONTATO,EMAIL,SITE,ATIVO,CEP,UF,TIPOCLIFOR,MATRICULA, ');
               IBQ_Gravar.SQL.Add(' OBSERVACAO,SALDO_CASTO,SALDO_LIMITE,TRAVAMENSAGEM,CONTRATO,DTCADASTRO,CODCONTMATIC,TP_PESSOAL,CELULAR,DATA_NASC, ');
               IBQ_Gravar.SQL.Add(' CONVENIO,DT_VENCFINANCLI,PAIS,BACEN,NUMEROCASA,COD_IBGE_CIDADE,SUFRAMA,TEL_DELIVERY,MENSALISTAS_N,DT_ALTERACAO, SEXO) ');
               IBQ_Gravar.SQL.Add(' Values ');
               IBQ_Gravar.SQL.Add('(:CODIGO_ID,:NOMEFANTASIA,:RAZAOSOCIAL,:CNPJ,:CPF,:IE,:RG,:ENDERECO,:BAIRRO,:CIDADE,:TELEFONE,:FAX,:CONTATO,:EMAIL,:SITE,:ATIVO,:CEP,:UF,:TIPOCLIFOR, ');
               IBQ_Gravar.SQL.Add(' :MATRICULA,:OBSERVACAO,:SALDO_CASTO,:SALDO_LIMITE,:TRAVAMENSAGEM,:CONTRATO,:DTCADASTRO,:CODCONTMATIC,:TP_PESSOAL,:CELULAR,:DATA_NASC, ');
               IBQ_Gravar.SQL.Add(' :CONVENIO,:DT_VENCFINANCLI,:PAIS,:BACEN,:NUMEROCASA,:COD_IBGE_CIDADE,:SUFRAMA,:TEL_DELIVERY,:MENSALISTAS_N,:DT_ALTERACAO, :SEXO) ');
               IBQ_Gravar.ParamByName('CODIGO_ID').AsInteger       := ZQRY_ClienteCODIGO_ID.Value;
               IBQ_Gravar.ParamByName('NOMEFANTASIA').AsString     := ZQRY_ClienteNOMEFANTASIA.Value;
               IBQ_Gravar.ParamByName('RAZAOSOCIAL').AsString      := ZQRY_ClienteRAZAOSOCIAL.Value;
               IBQ_Gravar.ParamByName('CNPJ').AsString             := ZQRY_ClienteCNPJ.Value;
               IBQ_Gravar.ParamByName('CPF').AsString              := ZQRY_ClienteCPF.Value;
               IBQ_Gravar.ParamByName('IE').AsString               := ZQRY_ClienteIE.Value;
               IBQ_Gravar.ParamByName('RG').AsString               := ZQRY_ClienteRG.Value;
               IBQ_Gravar.ParamByName('ENDERECO').AsString         := ZQRY_ClienteENDERECO.Value;
               IBQ_Gravar.ParamByName('BAIRRO').AsString           := ZQRY_ClienteBAIRRO.Value;
               IBQ_Gravar.ParamByName('CIDADE').AsString           := ZQRY_ClienteCIDADE.Value;
               IBQ_Gravar.ParamByName('TELEFONE').AsString         := ZQRY_ClienteTELEFONE.Value;
               IBQ_Gravar.ParamByName('FAX').AsString              := ZQRY_ClienteFAX.Value;
               IBQ_Gravar.ParamByName('CONTATO').AsString          := ZQRY_ClienteCONTATO.Value;
               IBQ_Gravar.ParamByName('EMAIL').AsString            := ZQRY_ClienteEMAIL.Value;
               IBQ_Gravar.ParamByName('SITE').AsString             := ZQRY_ClienteSITE.Value;
               IBQ_Gravar.ParamByName('ATIVO').AsString            := ZQRY_ClienteATIVO.Value;
               IBQ_Gravar.ParamByName('CEP').AsString              := ZQRY_ClienteCEP.Value;
               IBQ_Gravar.ParamByName('UF').AsString               := ZQRY_ClienteUF.Value;
               IBQ_Gravar.ParamByName('TIPOCLIFOR').AsString       := ZQRY_ClienteTIPOCLIFOR.Value;
               IBQ_Gravar.ParamByName('MATRICULA').AsString        := ZQRY_ClienteMATRICULA.Value;
               IBQ_Gravar.ParamByName('OBSERVACAO').Value          := ZQRY_ClienteOBSERVACAO.Value;
               IBQ_Gravar.ParamByName('SALDO_CASTO').AsFloat       := ZQRY_ClienteSALDO_CASTO.Value;
               IBQ_Gravar.ParamByName('SALDO_LIMITE').AsFloat      := ZQRY_ClienteSALDO_LIMITE.Value;
               IBQ_Gravar.ParamByName('TRAVAMENSAGEM').AsString    := ZQRY_ClienteTRAVAMENSAGEM.Value;
               IBQ_Gravar.ParamByName('CONTRATO').AsString         := ZQRY_ClienteCONTRATO.Value;
               IBQ_Gravar.ParamByName('DTCADASTRO').AsDate         := ZQRY_ClienteDTCADASTRO.Value;
               IBQ_Gravar.ParamByName('CODCONTMATIC').AsString     := ZQRY_ClienteCODCONTMATIC.Value;
               IBQ_Gravar.ParamByName('TP_PESSOAL').AsString       := ZQRY_ClienteTP_PESSOAL.Value;
               IBQ_Gravar.ParamByName('CELULAR').AsString          := ZQRY_ClienteCELULAR.Value;
               IBQ_Gravar.ParamByName('DATA_NASC').AsDate          := ZQRY_ClienteDATA_NASC.Value;
               IBQ_Gravar.ParamByName('CONVENIO').AsInteger        := ZQRY_ClienteCONVENIO.Value;
               IBQ_Gravar.ParamByName('DT_VENCFINANCLI').AsInteger := ZQRY_ClienteDT_VENCFINANCLI.Value;
               IBQ_Gravar.ParamByName('PAIS').AsString             := ZQRY_ClientePAIS.Value;
               IBQ_Gravar.ParamByName('BACEN').AsString            := ZQRY_ClienteBACEN.Value;
               IBQ_Gravar.ParamByName('NUMEROCASA').AsString       := ZQRY_ClienteNUMEROCASA.Value;
               IBQ_Gravar.ParamByName('COD_IBGE_CIDADE').AsString  := ZQRY_ClienteCOD_IBGE_CIDADE.Value;
               IBQ_Gravar.ParamByName('SUFRAMA').AsString          := ZQRY_ClienteSUFRAMA.Value;
               IBQ_Gravar.ParamByName('TEL_DELIVERY').AsString     := ZQRY_ClienteTEL_DELIVERY.Value;
               IBQ_Gravar.ParamByName('MENSALISTAS_N').AsString    := ZQRY_ClienteMENSALISTAS_N.Value;
               IBQ_Gravar.ParamByName('DT_ALTERACAO').AsDate       := ZQRY_ClienteDT_ALTERACAO.Value;
               IBQ_Gravar.ParamByName('SEXO').AsString             := ZQRY_ClienteSEXO.Value;
               IBQ_Gravar.ExecSQL;

               IBTransaction1.CommitRetaining;

               ZQRY_Cliente.Next;
            end;

            taEnviaComando('<limpar>1</limpar>',81);
            taEnviaComando('<imprimir><texto>Atualizado: '+IntToStr(vCount)+'/'+IntToStr(ZQRY_Cliente.RecordCount)+' Clientes...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

            ZConnection.Disconnect;
         end;
         //...........................................................................



         // Atualizar Ponto de Venda..................................................
         if (cPONTOV = 'S') then
         begin
            taEnviaComando('<limpar>1</limpar>',81);
            taEnviaComando('<imprimir><texto>Atualizando Ponto de Venda Local</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

            IBQ_Gravar.Close;
            IBQ_Gravar.SQL.Clear;
            IBQ_Gravar.SQL.Add('delete from PONTOVENDA');
            IBQ_Gravar.ExecSQL;
            IBTransaction1.CommitRetaining;

            ZConnection.Disconnect;
            ZConnection.Connect;

            // Limpa banco web
            taEnviaComando('<limpar>1</limpar>',81);
            taEnviaComando('<imprimir><texto>Conectando...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);
            ZQRY_PontoVenda.Close;
            ZQRY_PontoVenda.Open;

            ZQRY_PontoVenda.First;

            vCount := 0;

            taEnviaComando('<limpar>1</limpar>',81);
            taEnviaComando('<imprimir><texto>Atualizando Ponto de Venda...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

            while not ZQRY_PontoVenda.Eof do
            begin
               Inc(vCount,1);

               IBQ_Gravar.Close;
               IBQ_Gravar.SQL.Clear;
               IBQ_Gravar.SQL.Add('insert into PONTOVENDA');
               IBQ_Gravar.SQL.Add('(CODIGO_ID, DESCRICAO)');
               IBQ_Gravar.SQL.Add(' Values ');
               IBQ_Gravar.SQL.Add('(:PCODIGO_ID, :PDESCRICAO)');
               IBQ_Gravar.ParamByName('PCODIGO_ID').AsInteger       := ZQRY_PontoVendaCODIGO_ID.Value;
               IBQ_Gravar.ParamByName('PDESCRICAO').AsString        := ZQRY_PontoVendaDESCRICAO.Value;
               IBQ_Gravar.ExecSQL;

               IBTransaction1.CommitRetaining;

               ZQRY_PontoVenda.Next;
            end;

            taEnviaComando('<limpar>1</limpar>',81);
            taEnviaComando('<imprimir><texto>Atualizado: '+IntToStr(vCount)+'/'+IntToStr(ZQRY_PontoVenda.RecordCount)+' Ponto de Venda...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

            ZConnection.Disconnect;
         end;
         // ..........................................................................

         // Atualizar Evento .........................................................
         if (cEVENTO = 'S') then
         begin
            taEnviaComando('<limpar>1</limpar>',81);
            taEnviaComando('<imprimir><texto>Atualizando Evento Local</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

            IBQ_Gravar.Close;
            IBQ_Gravar.SQL.Clear;
            IBQ_Gravar.SQL.Add('delete from Evento');
            IBQ_Gravar.ExecSQL;
            IBTransaction1.CommitRetaining;

            ZConnection.Disconnect;
            ZConnection.Connect;

            // Limpa banco web
            taEnviaComando('<limpar>1</limpar>',81);
            taEnviaComando('<imprimir><texto>Conectando...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);
            ZQRY_Evento.Close;
            ZQRY_Evento.Open;

            ZQRY_Evento.First;

            vCount := 0;

            taEnviaComando('<limpar>1</limpar>',81);
            taEnviaComando('<imprimir><texto>Atualizando Evento...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

            while not ZQRY_Evento.Eof do
            begin
               Inc(vCount,1);

               IBQ_Gravar.Close;
               IBQ_Gravar.SQL.Clear;
               IBQ_Gravar.SQL.Add('insert into EVENTO');
               IBQ_Gravar.SQL.Add('(CODIGO_ID, CIDMASTER, CODIGO, DESCRICAO, DT_ATUALIZA, DATA_SHOW, TOTAL_INGR_F,TOTAL_INGR_M, MSG_LIVRE, OBS, ATIVO_SN, TIPO)');
               IBQ_Gravar.SQL.Add(' Values ');
               IBQ_Gravar.SQL.Add('(:PCODIGO_ID, :PCIDMASTER, :PCODIGO, :PDESCRICAO, :PDT_ATUALIZA, :PDATA_SHOW, :PTOTAL_INGR_F,:PTOTAL_INGR_M, :PMSG_LIVRE, :POBS, :PATIVO_SN, :PTIPO)');
               IBQ_Gravar.ParamByName('PCODIGO_ID').AsInteger       := ZQRY_EventoCODIGO_ID.Value;
               IBQ_Gravar.ParamByName('PCIDMASTER').AsInteger       := ZQRY_EventoCIDMASTER.Value;
               IBQ_Gravar.ParamByName('PCODIGO').AsString           := ZQRY_EventoCODIGO.Value;
               IBQ_Gravar.ParamByName('PDESCRICAO').AsString        := ZQRY_EventoDESCRICAO.Value;
               IBQ_Gravar.ParamByName('PDT_ATUALIZA').AsDate        := ZQRY_EventoDT_ATUALIZA.Value;
               IBQ_Gravar.ParamByName('PDATA_SHOW').AsDate          := ZQRY_EventoDATA_SHOW.Value;
               IBQ_Gravar.ParamByName('PTOTAL_INGR_F').AsInteger    := ZQRY_EventoTOTAL_INGR_F.Value;
               IBQ_Gravar.ParamByName('PTOTAL_INGR_M').AsInteger    := ZQRY_EventoTOTAL_INGR_M.Value;
               IBQ_Gravar.ParamByName('PMSG_LIVRE').AsString        := ZQRY_EventoMSG_LIVRE.Value;
               IBQ_Gravar.ParamByName('POBS').AsString              := ZQRY_EventoOBS.Value;
               IBQ_Gravar.ParamByName('PATIVO_SN').AsString         := ZQRY_EventoATIVO_SN.Value;
               IBQ_Gravar.ParamByName('PTIPO').AsString             := ZQRY_EventoTIPO.Value;
               IBQ_Gravar.ExecSQL;

               IBTransaction1.CommitRetaining;

               ZQRY_Evento.Next;
            end;

            taEnviaComando('<limpar>1</limpar>',81);
            taEnviaComando('<imprimir><texto>Atualizado: '+IntToStr(vCount)+'/'+IntToStr(ZQRY_Evento.RecordCount)+' Eventos...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

            ZConnection.Disconnect;
         end;
         // ..........................................................................



         // Atualizar Lote ...........................................................
         if (cLOTE = 'S') then
         begin
            taEnviaComando('<limpar>1</limpar>',81);
            taEnviaComando('<imprimir><texto>Atualizando Lote Local</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

            //IBQ_Gravar.Close;
            //IBQ_Gravar.SQL.Clear;
            //IBQ_Gravar.SQL.Add('delete from Lote');
            //IBQ_Gravar.ExecSQL;


            // Limpa banco web
            taEnviaComando('<limpar>1</limpar>',81);
            taEnviaComando('<imprimir><texto>Conectando...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

            ZConnection.Disconnect;
            ZConnection.Connect;
            ZQRY_Lote.Close;
            ZQRY_Lote.SQL.Clear;
            ZQRY_Lote.SQL.Add('select * ');
            ZQRY_Lote.SQL.Add('from LOTE ');
            ZQRY_Lote.SQL.Add('where (PONTOVENDA = :PPONTOVENDA) ');
            ZQRY_Lote.SQL.Add('or (ALLPDV = :PALLPDV)');
            ZQRY_Lote.ParamByName('PALLPDV').Value := 'S';
            ZQRY_Lote.ParamByName('PPONTOVENDA').Value := vPontoVenda;
            ZQRY_Lote.Open;

            ZQRY_Lote.First;

            vCount := 0;

            taEnviaComando('<limpar>1</limpar>',81);
            taEnviaComando('<imprimir><texto>Atualizando Lote...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

            while not ZQRY_Lote.Eof do
            begin
               Inc(vCount,1);

               IBQ_Pesquisa.Close;
               IBQ_Pesquisa.SQL.Clear;
               IBQ_Pesquisa.SQL.Add('select * ');
               IBQ_Pesquisa.SQL.Add('From Lote ');
               IBQ_Pesquisa.SQL.Add('where (CODIGO_ID = :PCODIGO_ID)');
               IBQ_Pesquisa.SQL.Add('or (ALLPDV = :PALLPDV)');
               IBQ_Pesquisa.ParamByName('PALLPDV').Value := 'S';
               IBQ_Pesquisa.ParamByName('PCODIGO_ID').Value := ZQRY_LoteCODIGO_ID.Value;
               IBQ_Pesquisa.Open;

               IBQ_Pesquisa.Last;
               IBQ_Pesquisa.First;

               if (IBQ_Pesquisa.RecordCount <= 0) then
               begin
                  IBQ_Gravar.Close;
                  IBQ_Gravar.SQL.Clear;
                  IBQ_Gravar.SQL.Add('insert into LOTE');
                  IBQ_Gravar.SQL.Add('(CODIGO_ID, CDIMESTRE, PONTOVENDA, DT_ATUALIZA, DT_INICIO, DT_FIM, NUM_ING_M, ');
                  IBQ_Gravar.SQL.Add(' NUM_ING_F, VAL_ING_M, VAL_ING_F, VEN_ING_M, VEN_ING_F, EVENTO, CLOTE, UNIFICADO, ALLPDV)');
                  IBQ_Gravar.SQL.Add(' Values ');
                  IBQ_Gravar.SQL.Add('(:PCODIGO_ID, :PCDIMESTRE, :PPONTOVENDA, :PDT_ATUALIZA, :PDT_INICIO, :PDT_FIM, :PNUM_ING_M, ');
                  IBQ_Gravar.SQL.Add(' :PNUM_ING_F, :PVAL_ING_M, :PVAL_ING_F, :PVEN_ING_M, :PVEN_ING_F, :PEVENTO, :PCLOTE, :PUNIFICADO, :PALLPDV) ');
                  IBQ_Gravar.ParamByName('PCODIGO_ID').AsInteger    := ZQRY_LoteCODIGO_ID.Value;
                  IBQ_Gravar.ParamByName('PCDIMESTRE').AsInteger    := ZQRY_LoteCDIMESTRE.Value;
                  IBQ_Gravar.ParamByName('PPONTOVENDA').AsInteger   := ZQRY_LotePONTOVENDA.Value;
                  IBQ_Gravar.ParamByName('PDT_ATUALIZA').AsDateTime := ZQRY_LoteDT_ATUALIZA.Value;
                  IBQ_Gravar.ParamByName('PDT_INICIO').AsDateTime   := ZQRY_LoteDT_INICIO.Value;
                  IBQ_Gravar.ParamByName('PDT_FIM').AsDateTime      := ZQRY_LoteDT_FIM.Value;
                  IBQ_Gravar.ParamByName('PNUM_ING_M').AsInteger    := ZQRY_LoteNUM_ING_M.Value;
                  IBQ_Gravar.ParamByName('PNUM_ING_F').AsInteger    := ZQRY_LoteNUM_ING_F.Value;
                  IBQ_Gravar.ParamByName('PVAL_ING_M').AsFloat      := ZQRY_LoteVAL_ING_M.Value;
                  IBQ_Gravar.ParamByName('PVAL_ING_F').AsFloat      := ZQRY_LoteVAL_ING_F.Value;
                  IBQ_Gravar.ParamByName('PVEN_ING_M').AsInteger    := ZQRY_LoteVEN_ING_M.Value;
                  IBQ_Gravar.ParamByName('PVEN_ING_F').AsInteger    := ZQRY_LoteVEN_ING_F.Value;
                  IBQ_Gravar.ParamByName('PEVENTO').AsInteger       := ZQRY_LoteEVENTO.Value;
                  IBQ_Gravar.ParamByName('PCLOTE').AsInteger        := ZQRY_LoteCLOTE.Value;
                  IBQ_Gravar.ParamByName('PUNIFICADO').Value        := ZQRY_LoteUNIFICADO.Value;
                  IBQ_Gravar.ParamByName('PALLPDV').Value           := ZQRY_LoteALLPDV.Value;
                  IBQ_Gravar.ExecSQL;
               end
               else
               begin
                  IBQ_Gravar.Close;
                  IBQ_Gravar.SQL.Clear;
                  IBQ_Gravar.SQL.Add('UPDATE LOTE SET ' );
                  IBQ_Gravar.SQL.Add(' DT_ATUALIZA = :PDT_ATUALIZA, DT_INICIO = :PDT_INICIO, DT_FIM = :PDT_FIM, NUM_ING_M = :PNUM_ING_M,');
                  IBQ_Gravar.SQL.Add(' NUM_ING_F = :PNUM_ING_F, VAL_ING_M = :PVAL_ING_M, VAL_ING_F = :PVAL_ING_F, EVENTO = :PEVENTO, CLOTE = :PCLOTE ,');
                  IBQ_Gravar.SQL.Add(' UNIFICADO = :PUNIFICADO, ALLPDV = :PALLPDV' );
                  IBQ_Gravar.SQL.Add('WHERE (CODIGO_ID = :PCODIGO_ID) ' );
                  IBQ_Gravar.ParamByName('PCODIGO_ID').AsInteger    := ZQRY_LoteCODIGO_ID.Value;
                  IBQ_Gravar.ParamByName('PDT_ATUALIZA').AsDateTime := ZQRY_LoteDT_ATUALIZA.Value;
                  IBQ_Gravar.ParamByName('PDT_INICIO').AsDate       := ZQRY_LoteDT_INICIO.Value;
                  IBQ_Gravar.ParamByName('PDT_FIM').AsDate          := ZQRY_LoteDT_FIM.Value;
                  IBQ_Gravar.ParamByName('PNUM_ING_M').AsInteger    := ZQRY_LoteNUM_ING_M.Value;
                  IBQ_Gravar.ParamByName('PNUM_ING_F').AsInteger    := ZQRY_LoteNUM_ING_F.Value;
                  IBQ_Gravar.ParamByName('PVAL_ING_M').AsFloat      := ZQRY_LoteVAL_ING_M.Value;
                  IBQ_Gravar.ParamByName('PVAL_ING_F').AsFloat      := ZQRY_LoteVAL_ING_F.Value;
                  IBQ_Gravar.ParamByName('PEVENTO').AsInteger       := ZQRY_LoteEVENTO.Value;
                  IBQ_Gravar.ParamByName('PCLOTE').AsInteger        := ZQRY_LoteCLOTE.Value;
                  IBQ_Gravar.ParamByName('PUNIFICADO').Value        := ZQRY_LoteUNIFICADO.Value;
                  IBQ_Gravar.ParamByName('PALLPDV').Value           := ZQRY_LoteALLPDV.Value;
                  IBQ_Gravar.ExecSQL;
               end;

               IBTransaction1.CommitRetaining;

               ZQRY_Lote.Next;
            end;

            taEnviaComando('<limpar>1</limpar>',81);
            taEnviaComando('<imprimir><texto>Atualizado: '+IntToStr(vCount)+'/'+IntToStr(ZQRY_Lote.RecordCount)+' Lote...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

            ZConnection.Disconnect;
         end;
         // ..........................................................................


         // Atualizar Versao .........................................................
         if (cVERSAO = 'S') then
         begin
            taEnviaComando('<limpar>1</limpar>',81);
            taEnviaComando('<imprimir><texto>Atualizando Versão Local</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

            IBQ_Gravar.Close;
            IBQ_Gravar.SQL.Clear;
            IBQ_Gravar.SQL.Add('delete from Versao');
            IBQ_Gravar.ExecSQL;
            IBTransaction1.CommitRetaining;



            // Limpa banco web
            taEnviaComando('<limpar>1</limpar>',81);
            taEnviaComando('<imprimir><texto>Conectando...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

            ZConnection.Disconnect;
            ZConnection.Connect;
            ZQRY_Versao.Close;
            ZQRY_Versao.Open;

            ZQRY_Versao.First;

            vCount := 0;

            taEnviaComando('<limpar>1</limpar>',81);
            taEnviaComando('<imprimir><texto>Atualizando Versão...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

            while not ZQRY_Versao.Eof do
            begin
               Inc(vCount,1);
               IBQ_Gravar.Close;
               IBQ_Gravar.SQL.Clear;
               IBQ_Gravar.SQL.Add('insert into VERSAO ');
               IBQ_Gravar.SQL.Add('(PONTOVENDA, CLIFOR, EVENTO, LOTE )');
               IBQ_Gravar.SQL.Add(' Values ');
               IBQ_Gravar.SQL.Add('(:PPONTOVENDA, :PCLIFOR, :PEVENTO, :PLOTE )');
               IBQ_Gravar.ParamByName('PPONTOVENDA').AsInteger := ZQRY_VersaoPONTOVENDA.Value;
               IBQ_Gravar.ParamByName('PCLIFOR').AsDateTime    := ZQRY_VersaoCLIFOR.Value;
               IBQ_Gravar.ParamByName('PEVENTO').AsDateTime    := ZQRY_VersaoEVENTO.Value;
               IBQ_Gravar.ParamByName('PLOTE').AsDateTime      := ZQRY_VersaoLOTE.Value;
               IBQ_Gravar.ExecSQL;

               IBTransaction1.CommitRetaining;

               ZQRY_Versao.Next;
            end;

            taEnviaComando('<limpar>1</limpar>',81);
            taEnviaComando('<imprimir><texto>Atualizado: '+IntToStr(vCount)+'/'+IntToStr(ZQRY_Versao.RecordCount)+' Versão...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

            ZConnection.Disconnect;
         end;
         // ..........................................................................

         if (cENVIA = 'S') then
         begin
            //Verificar não Enviados.....................................................
            IBQ_ING.Close;
            IBQ_ING.SQL.Clear;
            IBQ_ING.SQL.Add('select Evento, Lote');
            IBQ_ING.SQL.Add('from INGRESSO');
            IBQ_ING.SQL.Add('where 1=1');
            IBQ_ING.SQL.Add('and DT_ENVIO is null');
            IBQ_ING.SQL.Add('group by Evento, Lote');
            IBQ_ING.Open;
            IBQ_ING.First;
            //...........................................................................

            // Enviar Ingressos .........................................................
            if not taEnviaIngresso('0','') then
            begin
               // Tratar erro...
            end
            else
            begin


                while not IBQ_ING.Eof  do
                begin
                   ZConnection.Connect;
                   taValLoteWeb(IntToStr(IBQ_INGEVENTO.Value),IntToStr(IBQ_INGLOTE.Value));
                   ZConnection.Disconnect;

                   IBQ_ING.Next;

                end;




            end;
         end;

         taEnviaComando('<limpar>1</limpar>',81);
         taEnviaComando('<imprimir><texto>Atualização Ok...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);
         Sleep(3000);
         Result := '1';
      end
      else
         taEnviaComando('<imprimir><texto>Não conectado à Internet...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);
   except
      ZConnection.Disconnect;
      taEnviaComando('<limpar>1</limpar>',81);
      taEnviaComando('<imprimir><texto>Erro na atualização! Tente Novamente!</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);
      Sleep(3000);
      Result := '0';
   end;
end;

function TFRM_TA2000.taAtualizaLote(fEvento : String):String;
var
   R : Integer;
begin
   try

      //R := uSocketPing.Ping(10000, '186.202.13.3', 3306);

      if uSocketPing.Ping(10000, '186.202.13.3', 3306) = 0 then
      begin
         // Atualizar Lote ...........................................................
         if (cLOTE = 'S') then
         begin
            // Mensagem em Tela
            //taEnviaComando('<limpar>1</limpar>',81);
            //taEnviaComando('<imprimir><texto>Atualizando Lote Local</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

            // Limpa banco web
            //taEnviaComando('<limpar>1</limpar>',81);
            //taEnviaComando('<imprimir><texto>Conectando...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);
            //.....................................................................

            ZConnection.Disconnect;
            ZConnection.Connect;

            ZQRY_Lote.Close;
            ZQRY_Lote.SQL.Clear;
            ZQRY_Lote.SQL.Add('select * ');
            ZQRY_Lote.SQL.Add('from LOTE ');
            ZQRY_Lote.SQL.Add('where ((PONTOVENDA = :PPONTOVENDA) ');
            ZQRY_Lote.ParamByName('PPONTOVENDA').Value := vPontoVenda;
            ZQRY_Lote.SQL.Add('or (ALLPDV = :PALLPDV)) ');
            ZQRY_Lote.ParamByName('PALLPDV').Value := 'S';
            ZQRY_Lote.SQL.Add('and (EVENTO = :PEVENTO) ');
            ZQRY_Lote.ParamByName('PEVENTO').AsInteger := StrToInt(fEvento);
            ZQRY_Lote.Open;

            ZQRY_Lote.First;

            //vCount := 0;
            //taEnviaComando('<limpar>1</limpar>',81);
            //taEnviaComando('<imprimir><texto>Atualizando Lote...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

            while not ZQRY_Lote.Eof do
            begin
               //Inc(vCount,1);

               IBQ_Pesquisa.Close;
               IBQ_Pesquisa.SQL.Clear;
               IBQ_Pesquisa.SQL.Add('select * ');
               IBQ_Pesquisa.SQL.Add('From Lote ');
               IBQ_Pesquisa.SQL.Add('where (CODIGO_ID = :PCODIGO_ID)');
               IBQ_Pesquisa.ParamByName('PCODIGO_ID').Value := ZQRY_LoteCODIGO_ID.Value;
               IBQ_Pesquisa.Open;

               IBQ_Pesquisa.Last;
               IBQ_Pesquisa.First;

               if (IBQ_Pesquisa.RecordCount <= 0) then
               begin
                  IBQ_Gravar.Close;
                  IBQ_Gravar.SQL.Clear;
                  IBQ_Gravar.SQL.Add('insert into LOTE');
                  IBQ_Gravar.SQL.Add('(CODIGO_ID, CDIMESTRE, PONTOVENDA, DT_ATUALIZA, DT_INICIO, DT_FIM, NUM_ING_M, ');
                  IBQ_Gravar.SQL.Add(' NUM_ING_F, VAL_ING_M, VAL_ING_F, VEN_ING_M, VEN_ING_F, EVENTO, CLOTE, UNIFICADO, ALLPDV)');
                  IBQ_Gravar.SQL.Add(' Values ');
                  IBQ_Gravar.SQL.Add('(:PCODIGO_ID, :PCDIMESTRE, :PPONTOVENDA, :PDT_ATUALIZA, :PDT_INICIO, :PDT_FIM, :PNUM_ING_M, ');
                  IBQ_Gravar.SQL.Add(' :PNUM_ING_F, :PVAL_ING_M, :PVAL_ING_F, :PVEN_ING_M, :PVEN_ING_F, :PEVENTO, :PCLOTE, :PUNIFICADO, :PALLPDV) ');
                  IBQ_Gravar.ParamByName('PCODIGO_ID').AsInteger    := ZQRY_LoteCODIGO_ID.Value;
                  IBQ_Gravar.ParamByName('PCDIMESTRE').AsInteger    := ZQRY_LoteCDIMESTRE.Value;
                  IBQ_Gravar.ParamByName('PPONTOVENDA').AsInteger   := ZQRY_LotePONTOVENDA.Value;
                  IBQ_Gravar.ParamByName('PDT_ATUALIZA').AsDateTime := ZQRY_LoteDT_ATUALIZA.Value;
                  IBQ_Gravar.ParamByName('PDT_INICIO').AsDateTime   := ZQRY_LoteDT_INICIO.Value;
                  IBQ_Gravar.ParamByName('PDT_FIM').AsDateTime      := ZQRY_LoteDT_FIM.Value;
                  IBQ_Gravar.ParamByName('PNUM_ING_M').AsInteger    := ZQRY_LoteNUM_ING_M.Value;
                  IBQ_Gravar.ParamByName('PNUM_ING_F').AsInteger    := ZQRY_LoteNUM_ING_F.Value;
                  IBQ_Gravar.ParamByName('PVAL_ING_M').AsFloat      := ZQRY_LoteVAL_ING_M.Value;
                  IBQ_Gravar.ParamByName('PVAL_ING_F').AsFloat      := ZQRY_LoteVAL_ING_F.Value;
                  IBQ_Gravar.ParamByName('PVEN_ING_M').AsInteger    := ZQRY_LoteVEN_ING_M.Value;
                  IBQ_Gravar.ParamByName('PVEN_ING_F').AsInteger    := ZQRY_LoteVEN_ING_F.Value;
                  IBQ_Gravar.ParamByName('PEVENTO').AsInteger       := ZQRY_LoteEVENTO.Value;
                  IBQ_Gravar.ParamByName('PCLOTE').AsInteger        := ZQRY_LoteCLOTE.Value;
                  IBQ_Gravar.ParamByName('PUNIFICADO').Value        := ZQRY_LoteUNIFICADO.Value;
                  IBQ_Gravar.ParamByName('PALLPDV').Value           := ZQRY_LoteALLPDV.Value;
                  IBQ_Gravar.ExecSQL;

               end
               else
               begin
                  IBQ_Gravar.Close;
                  IBQ_Gravar.SQL.Clear;
                  IBQ_Gravar.SQL.Add('UPDATE LOTE SET ' );
                  IBQ_Gravar.SQL.Add(' DT_ATUALIZA = :PDT_ATUALIZA, DT_INICIO = :PDT_INICIO, DT_FIM = :PDT_FIM, NUM_ING_M = :PNUM_ING_M, ');
                  IBQ_Gravar.SQL.Add(' NUM_ING_F = :PNUM_ING_F, VAL_ING_M = :PVAL_ING_M, VAL_ING_F = :PVAL_ING_F, EVENTO = :PEVENTO, CLOTE = :PCLOTE ,');
                  IBQ_Gravar.SQL.Add(' UNIFICADO = :PUNIFICADO, ALLPDV = :PALLPDV' );
                  IBQ_Gravar.SQL.Add('WHERE (CODIGO_ID = :PCODIGO_ID) ' );
                  IBQ_Gravar.ParamByName('PCODIGO_ID').AsInteger   := ZQRY_LoteCODIGO_ID.Value;
                  IBQ_Gravar.ParamByName('PDT_ATUALIZA').AsDateTime := ZQRY_LoteDT_ATUALIZA.Value;
                  IBQ_Gravar.ParamByName('PDT_INICIO').AsDate       := ZQRY_LoteDT_INICIO.Value;
                  IBQ_Gravar.ParamByName('PDT_FIM').AsDate          := ZQRY_LoteDT_FIM.Value;
                  IBQ_Gravar.ParamByName('PNUM_ING_M').AsInteger    := ZQRY_LoteNUM_ING_M.Value;
                  IBQ_Gravar.ParamByName('PNUM_ING_F').AsInteger    := ZQRY_LoteNUM_ING_F.Value;
                  IBQ_Gravar.ParamByName('PVAL_ING_M').AsFloat      := ZQRY_LoteVAL_ING_M.Value;
                  IBQ_Gravar.ParamByName('PVAL_ING_F').AsFloat      := ZQRY_LoteVAL_ING_F.Value;
                  IBQ_Gravar.ParamByName('PEVENTO').AsInteger       := ZQRY_LoteEVENTO.Value;
                  IBQ_Gravar.ParamByName('PCLOTE').AsInteger        := ZQRY_LoteCLOTE.Value;
                  IBQ_Gravar.ParamByName('PUNIFICADO').Value        := ZQRY_LoteUNIFICADO.Value;
                  IBQ_Gravar.ParamByName('PALLPDV').Value           := ZQRY_LoteALLPDV.Value;
                  IBQ_Gravar.ExecSQL;



               end;

               IBTransaction1.CommitRetaining;

                //Atualiza saldo Web..............................................
                taValLoteWeb(IntToStr(ZQRY_LoteEVENTO.Value),IntToStr(ZQRY_LoteCLOTE.Value));



               ZQRY_Lote.Next;
            end;

            //taEnviaComando('<limpar>1</limpar>',81);
            //taEnviaComando('<imprimir><texto>Atualizado: '+IntToStr(vCount)+'/'+IntToStr(ZQRY_Lote.RecordCount)+' Lote...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

            ZConnection.Disconnect;
            Result := '1';
         end;
          Result := '0';
      end
      else
         taMensagem('1','   ');
   except
      ZConnection.Disconnect;
      Result := '0';
   end;
end;

function TFRM_TA2000.taEnviaComando(fComando:String; fTamanho:Integer):String;
var
     iRetorno : Integer;
    szRetorno : String;
begin
   try
      Result := '';

      SetLength(szRetorno, fTamanho);
      iRetorno := iEnviarDadosFormatados_TA2000_Daruma(fComando,szRetorno);

      if (iRetorno = 1) then
         Result := Pchar(szRetorno)
      else
         Result := '@'+Pchar(szRetorno);

   except
      Result := '@';
   end;
end;

procedure TFRM_TA2000.taCursor(fTP:String);
begin
   try
      taEnviaComando('<modocursor>'+fTP+'</modocursor>',81);
   except
      // Tratar Erro
   end;
end;

procedure TFRM_TA2000.taMensagem(fTP:String;fMensagem:String);
begin
   try
      if (fTP = '1') then
      begin
         taEnviaComando('<modocursor>0</modocursor>',81);
         taEnviaComando('<imprimir><texto>'+Copy(Trim(fMensagem)+'                    ',1,20)+'</texto><linha>2</linha><coluna>1</coluna></imprimir>',81);
         taEnviaComando('<modocursor>1</modocursor>',81);
      end;
   except
      // Tratar Erro
   end;
end;

procedure TFRM_TA2000.taLimpaTela;
begin
   try
      if Copy(taEnviaComando('<limpar>0</limpar>',81),1,1) = '@' then
         taMensagem('1','Erro no cmd Limpar!');
   except
      // Tratar Erro
   end;
end;

function TFRM_TA2000.taMenu:String;
Var
  vRet : String;
begin
   while True do
   begin
      try
         taLimpaTela;

         if (cTPMENU = '1') then // Campacto
         begin
            vRet := Pchar(taEnviaComando('<menu><estilo>2</estilo><direcao>v</direcao>'     +
                                                '<opcao1>Atualizar Dados</opcao1>'          +
                                                '<opcao2>Ingresso</opcao2>'                 +
                                                '<opcao3>Relatorio Acerto</opcao3>'         +
                                                '<opcao4>Encerrar</opcao4>'                 +
                                         '</menu>',81));

            Result := copy(vRet,1,1);

            if (copy(vRet,1,1) = '1') then // Atualizar Dados
            begin
               taAtualiza;
            end;

            if (copy(vRet,1,1) = '2') then // Ingresso
            begin
               taLimpaTela;
               taCursor('1');
               Exit;
            end;

            if (copy(vRet,1,1) = '3') then // Relatorio Acerto
            begin

               vRet := Pchar(taEnviaComando('<menu><estilo>2</estilo><direcao>v</direcao>'     +
                                            '<opcao1>Fecha Dia</opcao1>'                       +
                                            '<opcao2>Fecha Evento</opcao2>'                    +
                                            '</menu>',81));

               if (copy(vRet,1,1) = '1') then // Fecha Dia
               begin
                  taEnviaComando('<limpar>0</limpar>',81);
                  taEnviaComando('<imprimir><texto>Data:</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

                  Result := taValData(Pchar(taEnviaComando('<edicao><enter></enter><esc>-27</esc><tipo>3</tipo><tamanho>8</tamanho><linha>1</linha><coluna>6</coluna></edicao>',8)));



                  if Result <> '' then
                  begin



                     RelAcerto(Result,'');

                     taEnviaComando('<limpar>1</limpar>',81);

                     taEnviaComando('<imprimir><texto>Operação realizadacom êxito ...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);
                  end;

                  taEnviaComando('<imprimir><texto>Data invalida ...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

               end;

               if (copy(vRet,1,1) = '2') then // Por Evento
               begin
                  taEnviaComando('<limpar>0</limpar>',81);
                  taEnviaComando('<imprimir><texto>Eve:</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);







                  Result := Pchar(taEnviaComando('<edicao><enter></enter><esc>-27</esc><tipo>3</tipo><tamanho>5</tamanho><linha>1</linha><coluna>5</coluna></edicao>',5));

                  if Result <> '' then
                  begin
                     RelAcerto('',Result);

                     taEnviaComando('<limpar>1</limpar>',81);

                     taEnviaComando('<imprimir><texto>Operação realizadacom êxito ...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);
                  end
                  else
                     taEnviaComando('<imprimir><texto>Evento não informado ...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);
               end;

            end;

            if (copy(vRet,1,1) = '4') then // Encerrar
            begin
               taAtualiza;
               taLimpaTela;
               taEnviaComando('<limpar>1</limpar>',81);
               taEnviaComando('<imprimir><texto>Desligando TA...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

               taEnviaComando('<encerrar>1</encerrar>',81);  // 1-Desliga o TA2000
                                                             // 2-Reinicia o TA2000
                                                             // 3-Realiza Logoff no TA2000
               Application.Terminate;
               Abort;
            end;
         end
         else // Completo
         begin
            vRet := Pchar(taEnviaComando('<menu><estilo>2</estilo><direcao>v</direcao>'     +
                                               '<opcao1>Atualizar Dados</opcao1>'           +
                                               '<opcao2>Ingresso</opcao2>'                  +
                                               '<opcao3>Cadastro Cliente</opcao3>'          +
                                               '<opcao4>Config TA</opcao4>'                 +
                                               '<opcao5>Relatorio Acerto</opcao5>'          +
                                               '<opcao6>Encerrar</opcao6>'                  +
                                         '</menu>',81));

            Result := copy(vRet,1,1);

            if (copy(vRet,1,1) = '1') then // Atualizar Dados
            begin
               taAtualiza;
            end;

            if (copy(vRet,1,1) = '2') then // Ingresso
            begin
               taLimpaTela;
               Break;
            end;

            if (copy(vRet,1,1) = '3') then // Cadastro Cliente
            begin

            end;

            if (copy(vRet,1,1) = '4') then // Config TA
            begin

            end;

            if (copy(vRet,1,1) = '5') then // Relatorio Acerto
            begin

            end;

            if (copy(vRet,1,1) = '6') then // Encerrar
            begin
               taLimpaTela;
               taEnviaComando('<encerrar>1</encerrar>',81);  // 1-Desliga o TA2000
                                                             // 2-Reinicia o TA2000
                                                             // 3-Realiza Logoff no TA2000
               Break;
            end;
        end;    
      except
         // Tratar Erro
      end;
   end;
end;

procedure TFRM_TA2000.taTelaIngresso(fTela:Integer);
begin
   try
      taEnviaComando('<imprimir><texto>Eve:</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);
      taEnviaComando('<imprimir><texto>CPF:</texto><linha>1</linha><coluna>11</coluna></imprimir>',81);
      taEnviaComando('<imprimir><texto>S:</texto><linha>1</linha><coluna>36</coluna></imprimir>',81);
      taEnviaComando('<imprimir><texto>QTD:</texto><linha>2</linha><coluna>22</coluna></imprimir>',81);
   except
      // Tratar Erro
   end;
end;

function TFRM_TA2000.taGetEvento(fTexto:String):String;
begin
   try
      Result := Pchar(taEnviaComando('<edicao><enter></enter><esc>-27</esc><tipo>3</tipo><tamanho>5</tamanho><linha>1</linha><coluna>5</coluna></edicao>',5));
   except
      Result := '';
   end;
end;

function TFRM_TA2000.taGetCPF(fTexto:String):String;
begin
   try
      Result := Pchar(taEnviaComando('<edicao><enter></enter><esc>-27</esc><tipo>1</tipo><tamanho>11</tamanho><linha>1</linha><coluna>15</coluna></edicao>',11));
   except
      Result := '';
   end;
end;

function TFRM_TA2000.taGetSexo(fTexto:String):String;
begin
   try
      Result := Pchar(taEnviaComando('<edicao><enter></enter><esc>-27</esc><tipo>2</tipo><tamanho>1</tamanho><linha>1</linha><coluna>38</coluna></edicao>',1));
   except
      Result := '';
   end;
end;

function TFRM_TA2000.taGetQTD(fTexto:String):String;
begin
   try
      //Result := Pchar(taEnviaComando('<edicao><enter></enter><esc>-27</esc><tipo>3</tipo><tamanho>5</tamanho><linha>2</linha><coluna>26</coluna></edicao>',9));
      Result := Pchar(taEnviaComando('<edicao><mascara>##</mascara><enter></enter><esc>-27</esc><tipo>3</tipo><tamanho>2</tamanho><linha>2</linha><coluna>26</coluna></edicao>',9));
   except
      Result := '';
   end;
end;

function TFRM_TA2000.taValEvento(fRet:String):Boolean;
begin
   // Abrir Menu................................................................
   if ((Copy(fRet,1,1) = 'x') or (Copy(fRet,1,1) = 'X')) then
   begin
      if (taMenu = '6') then
         Application.Terminate;
      Result := False;
   end
   else
   if ((Copy(fRet,1,1) = 'd') or (Copy(fRet,1,1) = 'D')) then
   begin
      taAtualiza;
      taLimpaTela;
      taEnviaComando('<limpar>1</limpar>',81);
      taEnviaComando('<imprimir><texto>Aguarde '+cTempo+'seg. para tirar da energia...</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);

      taEnviaComando('<encerrar>1</encerrar>',81);  // 1-Desliga o TA2000
                                                    // 2-Reinicia o TA2000
                                                    // 3-Realiza Logoff no TA2000
      Application.Terminate;
      Sleep(StrToInt(cTempo)*1000);
      Abort;
   end
   else
   begin
      try
         // Verifica Evento...
         IBQ_Evento.Close;
         IBQ_Evento.SQL.Clear;
         IBQ_Evento.SQL.Add('Select *');
         IBQ_Evento.SQL.Add('From Evento');
         IBQ_Evento.SQL.Add('where (CODIGO = :PCODIGO)');
         IBQ_Evento.ParamByName('PCODIGO').Value := fRet;
         IBQ_Evento.Open;

         IBQ_Evento.Last;
         IBQ_Evento.First;

         fRet := IntToStr(IBQ_EventoCIDMASTER.AsInteger);

         // Atualizar os lotes .................................................
         taAtualizaLote(fRet);



         if (IBQ_Evento.RecordCount <= 0)  then
         begin
            taMensagem('1','Evento n encontrado ');
            Result := False;
         end
         else
         begin
         //antigo
            //IBQ_Lote.Close;
            //IBQ_Lote.SQL.Clear;
            //IBQ_Lote.SQL.Add('Select *');
            //IBQ_Lote.SQL.Add('from LOTE');
            //IBQ_Lote.SQL.Add('Where (EVENTO = :PCIDMASTER)');
            //IBQ_Lote.ParamByName('PCIDMASTER').Value := StrToInt(fRet);
            //IBQ_Lote.SQL.Add('and ((PONTOVENDA = :PPONTOVENDA)');
            //IBQ_Lote.ParamByName('PPONTOVENDA').Value  := vPontoVenda;
            //IBQ_Lote.SQL.Add('or (ALLPDV = :PALLPDV))');
            //IBQ_Lote.ParamByName('PALLPDV').Value  := 'S';
            //IBQ_Lote.SQL.Add('and ((DT_INICIO <= :PDATAI) and (DT_FIM >= :PDATAF))');
            //IBQ_Lote.ParamByName('PDATAI').AsDate := Date;
            //IBQ_Lote.ParamByName('PDATAF').AsDate := Date;
            //IBQ_Lote.SQL.Add('and (((NUM_ING_F-VEN_ING_F) > 0) or ((NUM_ING_M-VEN_ING_M) > 0))');
            //IBQ_Lote.SQL.Add('Order by codigo_id');
            //IBQ_Lote.Open;
         //---------------------------------------------------------------------

            IBQ_SumLote.Close;
            IBQ_SumLote.SQL.Clear;
            IBQ_SumLote.SQL.Add('Select sum(NUM_ING_F-VEN_ING_F) tot_F,sum(NUM_ING_M-VEN_ING_M) tot_M');
            IBQ_SumLote.SQL.Add('from LOTE');
            IBQ_SumLote.SQL.Add('Where (EVENTO = :PCIDMASTER)');
            IBQ_SumLote.ParamByName('PCIDMASTER').Value := StrToInt(fRet);
            IBQ_SumLote.SQL.Add('and ((PONTOVENDA = :PPONTOVENDA)');
            IBQ_SumLote.ParamByName('PPONTOVENDA').Value  := vPontoVenda;
            IBQ_SumLote.SQL.Add('or (ALLPDV = :PALLPDV))');
            IBQ_SumLote.ParamByName('PALLPDV').Value  := 'S';
            //IBQ_SumLote.SQL.Add('and ((DT_INICIO <= :PDATAI) and (DT_FIM >= :PDATAF))');
            //IBQ_SumLote.ParamByName('PDATAI').AsDate := Date;
            //IBQ_SumLote.ParamByName('PDATAF').AsDate := Date;
            IBQ_SumLote.SQL.Add('and (((NUM_ING_F-VEN_ING_F) > 0) and ((NUM_ING_M-VEN_ING_M) > 0))');
            IBQ_SumLote.Open;


            if (IBQ_SumLote.RecordCount <= 0)  then
            begin
               taMensagem('1','Não existe lote Ing.');
               Result := False;
            end
            else
            begin
               taMensagem('1',Copy(IBQ_EventoDESCRICAO.Value,1,20));
               Sleep(1000);
               taMensagem('1','T:'+FormatFloat('####',(IBQ_SumLoteTOT_F.Value)+(IBQ_SumLoteTOT_M.Value)));
               //taMensagem('1','F: '+FormatFloat('####',IBQ_LoteNUM_ING_F.Value-IBQ_LoteVEN_ING_F.Value)+'    M: '+FormatFloat('####',IBQ_LoteNUM_ING_M.Value-IBQ_LoteVEN_ING_M.Value));

               // .................................................................
               //CDS_Ingresso.Edit;
               //CDS_IngressoEvento.Value:= IBQ_LoteEVENTO.Value;
               //CDS_IngressoLote.Value  := IBQ_LoteCDIMESTRE.Value;
               //CDS_IngressocLote.Value := IBQ_LoteCLOTE.Value;
               //CDS_Ingresso.Post;

               vIEvento := fRet;
               //..................................................................

               Result := True;
            end;
         end;
      except
         taMensagem('1','Evento Invalido ');
         Result := False;
      end;
   end;
end;

function TFRM_TA2000.taValCPF(fRet:String):Boolean;
var
count,R : integer;
vRet : String;
begin
   try
      begin
         vICPF := Pchar(fRet);

         if ((vICPF <> '') and (vICPF <> '0')) then
         begin
            if cpf(vICPF) then
            begin
               IBQ_Clientes.Close;
               IBQ_Clientes.SQL.Clear;
               IBQ_Clientes.SQL.Add('Select *');
               IBQ_Clientes.SQL.Add('from VCLIENTES');
               IBQ_Clientes.SQL.Add('where (CPF = :PCPF)');
               IBQ_Clientes.ParamByName('PCPF').AsString := vICPF;
               IBQ_Clientes.Open;

               IBQ_Clientes.Last;
               IBQ_Clientes.first;

               if (IBQ_Clientes.RecordCount > 0) then
               begin
                  taMensagem('1',copy(IBQ_ClientesRAZAOSOCIAL.AsString,1,20));
                  Sleep(1000);

               end
               else
                  taMensagem('1','   ');

               vISexo   := IBQ_ClientesSEXO.AsString;



               CDS_Ingresso.Edit;
               CDS_IngressoCPF.Value := vICPF;
               CDS_Ingresso.Post;

               Result := True;

               //VERIFICAR A QTD JA COMPRADA NA WEB
               //R := uSocketPing.Ping(10000, '186.202.13.3', 3306);

               if uSocketPing.Ping(10000, '186.202.13.3', 3306) = 0 then
               begin
                  if vcpf = 'S' then
                  begin

                     ZConnection.Disconnect;
                     ZConnection.Connect;

                     //Contador de ingresso para o cpf................................
                     ZQL_CountIng.Close;
                     ZQL_CountIng.SQL.Clear;
                     ZQL_CountIng.SQL.Add('select count(*) from INGRESSO');
                     ZQL_CountIng.SQL.Add('where 1=1');
                     ZQL_CountIng.SQL.Add('and evento = :pevento');
                     ZQL_CountIng.SQL.Add('and cpf = :pcpf');
                     ZQL_CountIng.ParamByName('pevento').Value := vIEvento;
                     ZQL_CountIng.ParamByName('pcpf').Value := vICPF;
                     ZQL_CountIng.Open;

                     count := ZQL_CountIngcount.AsInteger;

                     ZConnection.Disconnect;

                     taMensagem('1','Já comprou '+IntToStr(count)+' Ingr.');
                     Sleep(1000);


                     if (count+StrToInt(vIQTD)) > cQtdIng then
                     begin
                        while ( (vRet <> 'N') or (vRet <> 'n') ) or ( (vRet <> 'S') or (vRet <> 's') ) do
                        begin
                           taMensagem('1','Deseja continuar.?');
                           vRet := Pchar(taEnviaComando('<edicao><enter></enter><esc>-27</esc><tipo>3</tipo><tamanho>1</tamanho><linha>2</linha><coluna>20</coluna></edicao>',9));

                           //Cancela
                           if (vRet = 'N') or (vRet = 'n') then
                           begin
                              taMensagem('1','Venda cancelada...');
                              vCancela := 'S';
                              vcpf := 'N';
                              Result := True;
                              exit;
                           end;

                           //Continua
                           if (vRet = 'S') or (vRet = 's') then
                           begin
                              exit;
                           end;
                        end;
                     end;
                  end;
               end;
               //.....................................
            end
            else
            begin
               taMensagem('1','CPF Invalido ');
               Result := False;
            end;
         end
         else
         begin
            if vcpf = 'S' then
            begin
               taMensagem('1','CPF não pode ser Nulo');
               Result := False;
             end
             else
             begin
               taMensagem('1','CPF Nulo');
               Result := True;
             end;
         end;
      end;
   except
      taMensagem('1','Problemas com o CPF');
      Result := False;
   end;
end;

function TFRM_TA2000.taValSexo(fRet:String):Boolean;
begin
   try
      if ((Copy(fRet,1,1) = 'F') or
          (Copy(fRet,1,1) = 'f') or
          (Copy(fRet,1,1) = 'M') or
          (Copy(fRet,1,1) = 'm')) then
      begin
         //VERIFICA LOTE......................................................
         IBQ_Lote.Close;
         IBQ_Lote.SQL.Clear;
         IBQ_Lote.SQL.Add('Select *');
         IBQ_Lote.SQL.Add('from LOTE');
         IBQ_Lote.SQL.Add('Where (EVENTO = :PCIDMASTER)');
         IBQ_Lote.ParamByName('PCIDMASTER').Value := StrToInt(vIEvento);
         IBQ_Lote.SQL.Add('and ((PONTOVENDA = :PPONTOVENDA)');
         IBQ_Lote.ParamByName('PPONTOVENDA').Value  := vPontoVenda;
         IBQ_Lote.SQL.Add('or (ALLPDV = :PALLPDV))');
         IBQ_Lote.ParamByName('PALLPDV').Value  := 'S';
         //IBQ_Lote.SQL.Add('and ((DT_INICIO <= :PDATAI) and (DT_FIM >= :PDATAF))');
         //IBQ_Lote.ParamByName('PDATAI').AsDate := Date;
         //IBQ_Lote.ParamByName('PDATAF').AsDate := Date;
         IBQ_Lote.SQL.Add('and (((NUM_ING_F-VEN_ING_F) > 0) and ((NUM_ING_M-VEN_ING_M) > 0))');
         IBQ_Lote.SQL.Add('Order by codigo_id');
         IBQ_Lote.Open;

         IBQ_Lote.Last;
         IBQ_Lote.First;

         IF IBQ_LoteUNIFICADO.Value = 'S' then
            taMensagem('1','T: '+FormatFloat('####',(IBQ_LoteNUM_ING_F.Value-IBQ_LoteVEN_ING_F.Value)+(IBQ_LoteNUM_ING_M.Value-IBQ_LoteVEN_ING_M.Value)))
         else
            taMensagem('1','F: '+FormatFloat('####',IBQ_LoteNUM_ING_F.Value-IBQ_LoteVEN_ING_F.Value)+'    M: '+FormatFloat('####',IBQ_LoteNUM_ING_M.Value-IBQ_LoteVEN_ING_M.Value));
         Sleep(1000);

         // .................................................................
         CDS_Ingresso.Edit;
         CDS_IngressoEvento.Value:= IBQ_LoteEVENTO.Value;
         CDS_IngressoLote.Value  := IBQ_LoteCDIMESTRE.Value;
         CDS_IngressocLote.Value := IBQ_LoteCLOTE.Value;
         CDS_IngressoSexo.Value := Copy(fRet,1,1);
         CDS_Ingresso.Post;

         vIEvento := IBQ_LoteEVENTO.AsString;
         vISexo := copy(fRet,1,1);
         //........................................................................

         Result := True;
      end
      else
      begin
         taMensagem('1','Favor escolher F/M. ');
         Result := False;
      end
   except
      taMensagem('1','Sexo Invalido ');
      Result := False;
   end;
end;

function TFRM_TA2000.taValQTD(fRet:String):Boolean;
var
   vQTD,count,R : Integer;
         vTotal : Double;
         vRet   : String;

begin
   try
      //R := uSocketPing.Ping(10000, '186.202.13.3', 3306);

      vQTD := StrToInt(Trim(fRet));

      if vQTD < 1 then
      begin
         taMensagem('1','QTD menor que 1     ');
         Result := False;
      end
      else
      if vQTD > 3 then
      begin
         taMensagem('1','QTD maior que 3     ');
         Result := False;
      end
      else
      begin
         vTotal  := 0.00;
         if ((vISexo = 'F') or (vISexo = 'f')) then
         begin
            if (vQTD > (IBQ_LoteNUM_ING_F.Value-IBQ_LoteVEN_ING_F.Value)) then
            begin
               taMensagem('1','Sem Saldo F: '+FormatFloat('####',IBQ_LoteNUM_ING_F.Value-IBQ_LoteVEN_ING_F.Value));
               Result := False;
               Exit;
            end;

            vTotal := (IBQ_LoteVAL_ING_F.Value);
         end
         else if ((vISexo = 'M') or (vISexo = 'm')) then
         begin
            if (vQTD > (IBQ_LoteNUM_ING_M.Value-IBQ_LoteVEN_ING_M.Value)) then
            begin
               taMensagem('1','Sem Saldo M: '+FormatFloat('####',IBQ_LoteNUM_ING_M.Value-IBQ_LoteVEN_ING_M.Value));
               Result := False;
               Exit;
            end;

            vTotal := (IBQ_LoteVAL_ING_M.Value);
         end;

         //.....................................................................
         CDS_Ingresso.Edit;
         CDS_IngressoQTD.Value   := vQTD;
         CDS_IngressoTotal.Value := vTotal;
         CDS_Ingresso.Post;

         vIQTD  := IntToStr(vQTD);
         //.....................................................................
         if ( (vQTD > 1) and (vQTD < 4) ) and not((vICPF <> '') and (vICPF <> '0')) then
         begin
            //taMensagem('1','QTD maior que 3     ');
            //taMensagem('1','QTD  3     ');
            taMensagem('1','Digite um cpf       ');
            vcpf := 'S';
            Result := False;
         end
         else
            Result := True;

         if uSocketPing.Ping(10000, '186.202.13.3', 3306) = 0 then
         begin
            if ((vICPF <> '') and (vICPF <> '0')) then
            begin

               ZConnection.Disconnect;
               ZConnection.Connect;

               //Contador de ingresso para o cpf................................
               ZQL_CountIng.Close;
               ZQL_CountIng.SQL.Clear;
               ZQL_CountIng.SQL.Add('select count(*) from INGRESSO');
               ZQL_CountIng.SQL.Add('where 1=1');
               ZQL_CountIng.SQL.Add('and evento = :pevento');
               ZQL_CountIng.SQL.Add('and cpf = :pcpf');
               ZQL_CountIng.ParamByName('pevento').Value := vIEvento;
               ZQL_CountIng.ParamByName('pcpf').Value := vICPF;
               ZQL_CountIng.Open;

               count := ZQL_CountIngcount.AsInteger;

               ZConnection.Disconnect;

               taMensagem('1','Já comprou '+IntToStr(count)+' Ingr.');
               Sleep(1000);


               if (count+StrToInt(vIQTD)) > cQtdIng then
               begin
                  //while ( (vRet <> 'N') or (vRet <> 'n') ) or ( (vRet <> 'S') or (vRet <> 's') ) do
                  //begin
                  //   taMensagem('1','Deseja continuar.?');
                  //   vRet := Pchar(taEnviaComando('<edicao><enter></enter><esc>-27</esc><tipo>3</tipo><tamanho>1</tamanho><linha>2</linha><coluna>20</coluna></edicao>',9));
                  //
                  //Cancela
                  //   if (vRet = 'N') or (vRet = 'n') then
                  //   begin
                  taMensagem('1','Limite Ing exedido');
                  Sleep(1000);
                  taMensagem('1','Venda cancelada...');
                  vCancela := 'S';
                  vcpf := 'N';
                  Result := True;
                  exit;
                  //   end;
               end
               else
               begin
                  //Continua
                  //   if (vRet = 'S') or (vRet = 's') then

                  exit;
               end;
                  //end;
               //end;
            end;
         end
         else
         if uSocketPing.Ping(10000, '186.202.13.3', 3306) <> 0 then
         begin
            if ((vICPF <> '') and (vICPF <> '0')) then
            begin

               //Contador de ingresso para o cpf................................
               IBQ_CountIngCPF.Close;
               IBQ_CountIngCPF.SQL.Clear;
               IBQ_CountIngCPF.SQL.Add('select count(*) from INGRESSO');
               IBQ_CountIngCPF.SQL.Add('where 1=1');
               IBQ_CountIngCPF.SQL.Add('and evento = :pevento');
               IBQ_CountIngCPF.SQL.Add('and cpf = :pcpf');
               IBQ_CountIngCPF.ParamByName('pevento').Value := vIEvento;
               IBQ_CountIngCPF.ParamByName('pcpf').Value := vICPF;
               IBQ_CountIngCPF.Open;

               count := IBQ_CountIngCPFCOUNT.AsInteger;


               taMensagem('1','Já comprou '+IntToStr(count)+' Ingr.');
               Sleep(1000);

               if (count+StrToInt(vIQTD)) > cQtdIng then
               begin
                  taMensagem('1','Limite Ing exedido');
                  Sleep(1000);
                  taMensagem('1','Venda cancelada...');
                  vCancela := 'S';
                  vcpf := 'N';
                  Result := True;
                  exit;
               end
               else
               begin
                  exit;
               end;
            end;
         end
         else

            taMensagem('1',' ');
      end;
   except
      taMensagem('1','QTD Invalida        ');
      Result := False;
   end;
end;


function TFRM_TA2000.RelAcerto(fDia : String;fEvento : String): String;
var

         vQtd,vValor, vTotal1,
         vTotal,vEvento,vLote : String;
                         vLst : TextFile;
                         vDia : TDate;
                  lote,Evento : Integer;
begin
   //verifica evento............................................................
   if fEvento <> '' then
   begin
      IBQ_Evento.Close;
      IBQ_Evento.SQL.Clear;
      IBQ_Evento.SQL.Add('select * from evento');
      IBQ_Evento.SQL.Add('where CODIGO = :pcodigo');
      IBQ_Evento.ParamByName('pcodigo').AsInteger := StrToInt(fEvento);
      IBQ_Evento.Open;

      fEvento := IntToStr(IBQ_EventoCODIGO_ID.AsInteger);

      if IBQ_Evento.RecordCount < 1 then
      begin
         taMensagem('1','Evento n encontrado...');

         Abort;

      end;
   end;
   //...........................................................................


   //Ingressos..................................................................
   IBQ_Ingressos.Close;
   IBQ_Ingressos.SQL.Clear;
   IBQ_Ingressos.SQL.Add('select evento,lote,sexo,count(qtd) QTD,valor from ingresso');
   IBQ_Ingressos.SQL.Add('where 1=1');
   //IBQ_Ingressos.SQL.Add('group by evento,lote,sexo,Valor');
   //IBQ_IngressoM.ParamByName('pSexo').Value := 'm';
   //IBQ_Ingressos.Open;


   if fDia <> '' then
   begin

      //fDia := copy(fDia,1,2)+'/'+copy(fDia,3,2)+'/'+copy(fDia,5,2);

      vDia := StrToDate(fDia);

      IBQ_Ingressos.SQL.Add('and data between :PDataI and :PDataF ');
      IBQ_Ingressos.ParamByName('PDataI').AsDate  := vDia;
      IBQ_Ingressos.ParamByName('PDataF').AsDate  := vDia+1;

   end;

   if fEvento <> '' then
   begin
      IBQ_Ingressos.SQL.Add('and Evento = :PEvento');
      IBQ_Ingressos.ParamByName('PEvento').Value := fEvento;
   end;

   IBQ_Ingressos.SQL.Add('group by evento,lote,sexo,Valor');
   IBQ_Ingressos.Open;


   AssignFile(vLst,cPORTA);
   Rewrite(vLst);


   WriteLn(vLst,#27+'l'+#13+#27+#69+#14+'MARINELLI HALL'+#20+#27+#70+#27+'l'+#1);

   if fDia <> '' then
   begin
      WriteLn(vLst,#27+'l'+#7+#27+#69+#14+'Relatorio Fecha Dia'+#20+#27+#70+#27+'l'+#1);
      Writeln(vLst,Repl('-',48));
      Writeln(vLst,#27+#69+'Data......:  '+copy(fDia+Repl(' ',30),1,27)+#27+#70);
   end;
   if fEvento <> '' then
   begin
      WriteLn(vLst,#27+'l'+#4+#27+#69+#14+'Relatorio Fecha Evento'+#20+#27+#70+#27+'l'+#1);
      Writeln(vLst,Repl('-',48));
      vEvento := IBQ_EventoDESCRICAO.AsString;
      vLote   := IntToStr(IBQ_IngressosLOTE.AsInteger);
      Writeln(vLst,#27+#69+'Evento....:  '+copy(vEvento+Repl(' ',30),1,27)+#27+#70);
      Writeln(vLst,#27+#69+'Lote......:  '+copy(vLote+Repl(' ',30),1,27)+#27+#70);

   end;

   Writeln(vLst,Repl('=',48));
   Writeln(vLst,#27+#69+'Ingressos   QTD    Valor         Total         '+#27+#70);
   if fDia <> '' then
      //Writeln(vLst,Repl('-',48));
   else
      Writeln(vLst,Repl('-',48));

   IBQ_Ingressos.First;

   Evento := 0;


   vTotal := '0';

   while not(IBQ_Ingressos.Eof) do
   begin


      if not IBQ_Ingressos.Eof then
      begin
         vQtd    := IntToStr(IBQ_IngressosQTD.AsInteger);
         vValor  := FormatFloat('###,###,#00.00',IBQ_IngressosVALOR.AsFloat);
         vTotal1  := FormatFloat('###,###,#00.00',((IBQ_IngressosVALOR.AsFloat) * IBQ_IngressosQTD.AsInteger));
      end
      else
      begin
         vQtd    := '0';
         vValor  := '0';
         vTotal1  := '0';
      end;

      if fDia <> '' then
      begin
         if IBQ_IngressosEVENTO.AsInteger <> Evento then
         begin

            vEvento := IBQ_IngressosdesEvento.AsString;
            Writeln(vLst,Repl('-',48));
            Writeln(vLst,#27+#69+'Evento....:  '+copy(vEvento+Repl(' ',30),1,27)+#27+#70);

         end;
      end;
      
      if UpperCase(IBQ_IngressosSEXO.AsString) = UpperCase('m') then
         Writeln(vLst,#27+#69+'Masculino.: '+#27+#70+copy(vQtd+Repl(' ',7),1,7)+copy(vValor+Repl(' ',14),1,14)+copy(vTotal1+Repl(' ',15),1,15));

      if UpperCase(IBQ_IngressosSEXO.AsString) = UpperCase('f') then
         Writeln(vLst,#27+#69+'Feminino..: '+#27+#70+copy(vQtd+Repl(' ',7),1,7)+copy(vValor+Repl(' ',14),1,14)+copy(vTotal1+Repl(' ',15),1,15));


      vTotal := FormatFloat('###,###,#00.00',( StrToFloat(StringReplace(vTotal,'.','',  [rfReplaceAll] ))) +
                                             ( StrToFloat(StringReplace(vTotal1,'.','', [rfReplaceAll] ))) );

      Evento := IBQ_IngressosEVENTO.AsInteger;

      IBQ_Ingressos.Next;

   end;

   Writeln(vLst,'                         ______________________'  );
   Writeln(vLst,#27+#69+'                         Total : '+copy(vTotal+Repl(' ',11),1,11)+#27+#70);
   //WriteLn(vLst,#10+#13);//salto
   Writeln(vLst,'----------------------------------www.mbd.com.br');
   WriteLn(vLst,#10+#13);//salto
   WriteLn(vLst,#10+#13);//salto
   WriteLn(vLst,#10+#13);//salto
   WriteLn(vLst,#10+#13);//salto
   WriteLn(vLst,#27+#109);//guilhotina


   CloseFile(vLst);


end;


//procedure TFRM_TA2000.TrayMessage(var Msg: TMessage);
//var
//  Pt : TPoint;
//begin
//   case Msg.lParam of
//      WM_LBUTTONDOWN:
//      begin
//         FRM_TA2000.Show;
//      end;
//      WM_MBUTTONDOWN:
//      begin
//         FRM_TA2000.Hide;
//      end;
//      WM_RBUTTONDOWN:
//      begin
//         GetCursorPos(Pt);
//         PPP_Principal.Popup(Pt.X,Pt.Y);
//      end;
//   end;
//end;

procedure TFRM_TA2000.FormDestroy(Sender: TObject);
begin
   // Bandeja
   //Shell_NotifyIcon(NIM_DELETE,@TrayIconData);
end;

procedure TFRM_TA2000.FormCreate(Sender: TObject);
var
                               Ini : TIniFile;
         VarUser_Name, VarPassword : string;
  _Local,_Server,_Path,_Base, _app : String;
begin
   //// Colocar na Bandeja........................................................
   //with TrayIconData do
   //begin
   //  cbSize           := sizeof(TrayIconData);
   //  Wnd              := Self.Handle;
   //  uId              := 0;
   //  uCallBackMessage := WM_TRAYICON;
   //  uFlags           := NIF_ICON or NIF_TIP or NIF_MESSAGE;
   //  hIcon            := Application.Icon.Handle;
   //  szTip            := 'Ponto de Venda';
   //end;
   //
   //Shell_NotifyIcon(NIM_ADD,@TrayIconData);
   //...........................................................................

   // Abrir Base................................................................
   {Senha IB}
   VarUser_Name := 'sysdba';
   VarPassword  := 'sysdbambd';

   Try
      if DataBaseIB.Connected = True then
         DataBaseIB.Connected := False;

      if DataBaseIB.Connected = False then
         _app    := GetCurrentDir;

      Ini     := TIniFile.Create( _app+'\CONFIG.INI' );

      { ALIAS 1}
      _Local   := Ini.ReadString( 'CONFBASE', 'LOCAL' , '' );
      _Server  := Ini.ReadString( 'CONFBASE', 'SERVER', '' );
      _Path    := Ini.ReadString( 'CONFBASE', 'PATH'  , '' );
      _Base    := Ini.ReadString( 'CONFBASE', 'BASE'  , '' );

      cPV         := Ini.ReadString( 'TA','PV','P');
      cTPMENU     := Ini.ReadString( 'TA','TPMENU','1');
      cQtdIng     := Ini.ReadInteger('TA','QTDING',1);
      cIP         := Ini.ReadString('TA','IP','');
      cPORTA_IP   := Ini.ReadInteger('TA','PORTA_IP',0);
      cTempo      := Ini.ReadString( 'TA','TEMPO','');
      cTempoFB    := Ini.ReadInteger('TA','TEMPO_FB',0);

      cMOD_IMP  := Ini.ReadString( 'IMPRESSORA','MOD_IMP','T');
      cPORTA    := Ini.ReadString( 'IMPRESSORA','PORTA','COM1');


      cCLIENTES := Ini.ReadString( 'ATUALIZACAO','CLIENTES','S');
      cPONTOV   := Ini.ReadString( 'ATUALIZACAO','PONTOV','S');
      cEVENTO   := Ini.ReadString( 'ATUALIZACAO','EVENTO','S');
      cLOTE     := Ini.ReadString( 'ATUALIZACAO','LOTE','S');
      cVERSAO   := Ini.ReadString( 'ATUALIZACAO','VERSAO','S');
      cENVIA    := Ini.ReadString( 'ATUALIZACAO','ENVIO','S');

      { ALIAS 1}
      if UpperCase(_Local) = 'FALSE' then
         DataBaseIB.DatabaseName := _Server+':'+_Path+_Base
      else
         DataBaseIB.DatabaseName := _Path+_Base;

      Sleep(cTempoFB*1000);

      DataBaseIB.Params.Clear;
      DataBaseIB.Params.Add('user_name='+VarUser_Name);
      DataBaseIB.Params.Add('password='+VarPassword);
      DataBaseIB.Connected;
      DataBaseIB.Open;
      IBTransaction1.Active := true;

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
   //...........................................................................

   // Abrindo tabelas...........................................................
   IBT_Parametros.Close;
   IBT_Parametros.Open;

   try
      if (cPV = 'P') then
         vPontoVenda := IBT_ParametrosPONTOVENDA.Value
      else
         vPontoVenda := StrToInt(cPV);
   except
      vPontoVenda := IBT_ParametrosPONTOVENDA.Value;
   end;
   //...........................................................................

   ZConnection.Disconnect;

   //Verifica o Emulador........................................................
   if FileExists('C:\Program Files\Daruma\DisplayGuiProject.exe') then
      WinExec('C:\Program Files\Daruma\DisplayGuiProject.exe',0)

   else

   if FileExists('C:\Arquivos de programas\Daruma\DisplayGuiProject.exe') then
      WinExec('C:\Arquivos de programas\Daruma\DisplayGuiProject.exe',0)

   else

   if FileExists('C:\Program Files (x86)\Daruma\DisplayGuiProject.exe') then
      WinExec('C:\Program Files (x86)\Daruma\DisplayGuiProject.exe',0)


   else
   begin
      taEnviaComando('<limpar>0</limpar>',81);
      taEnviaComando('<imprimir><texto>Emulador não encontrado</texto><linha>1</linha><coluna>1</coluna></imprimir>',81);
      taEnviaComando('<imprimir><texto>Seu sistema será fechado!!!</texto><linha>2</linha><coluna>1</coluna></imprimir>',81);

      Sleep(2000);

      Application.Terminate;
      Exit;
   end;
   //...........................................................................

   FRM_TA2000.Show;

   //INICIA TA .................................................................
   while True do
   begin
      // Atualizar dados na inicialização ......................................
      if (taAtualiza = '0') then
      begin
         Continue;
      end;

      // TA - Lançamento .......................................................
      try
         TA;
      except
         // Tratar Erro
         Continue;
      end;
   end;
   //...........................................................................
end;

procedure TFRM_TA2000.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   // Bandeja
   //Action := caNone;
   //Hide;

   Action := caFree;
   Action := caFree;
   FRM_TA2000 := nil;
   KillTask_('DisplayGuiProject.exe');
   KillTask_('TA2000.exe');


end;

procedure TFRM_TA2000.FormShow(Sender: TObject);
begin
   FRM_TA2000.Caption := 'Ponto de Venda ' + VarVersao;
end;

procedure TFRM_TA2000.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = 113) then
   begin
      if FRM_TesteComunicacao = nil then
         FRM_TesteComunicacao := TFRM_TesteComunicacao.Create(Application);

      FRM_TesteComunicacao.Show;
   end;
end;

procedure TFRM_TA2000.TRM_FocarTimer(Sender: TObject);
begin
   if not SetForegroundWindow(Application.Handle) then
      ForceForegroundWindow(Application.Handle);
end;

initialization

VarVersao := 'Ver: 08.02.15 CT';
//                  |  |  |__ dia..{12-07-2002}
//                  |  |_____ mes..{12-07-2002}
//                  |________ ano..{12-07-2002}

end.
