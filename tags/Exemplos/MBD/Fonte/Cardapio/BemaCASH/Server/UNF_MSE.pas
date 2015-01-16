unit UNF_MSE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, IBDatabase, DB, ShellAPI, IniFileS, IBCustomDataSet,
  IBQuery, ExtCtrls, StdCtrls, ComCtrls, Grids, DBGrids, jpeg;

Const
   WM_TRAYICON = WM_USER+1;

type
    TFRM_MSE = class(TForm)
    PPP_Principal: TPopupMenu;
    Sair1: TMenuItem;
    TRM_EscutarPedido: TTimer;
    StatusBar1: TStatusBar;
    DataBaseIB: TIBDatabase;
    IBTransaction1: TIBTransaction;
    MNM_Lista: TMemo;
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
    IBQ_Mesaitem: TIBQuery;
    IBQ_MesaitemCODIGO_ID: TIntegerField;
    IBQ_MesaitemMESA: TIntegerField;
    IBQ_MesaitemSEQUENCIA: TIntegerField;
    IBQ_MesaitemGARCOM: TIntegerField;
    IBQ_MesaitemPRODUTO: TIntegerField;
    IBQ_MesaitemQUANTIDADE: TFloatField;
    IBQ_MesaitemCANCELADA: TIBStringField;
    IBQ_MesaitemIMP_REMOTA: TIBStringField;
    IBQ_MesaitemPONTOVENDA: TIntegerField;
    IBQ_MesaitemHORA: TIBStringField;
    IBQ_MesaitemDATE: TDateField;
    IBQ_MesaitemMESAFECHA: TIntegerField;
    IBQ_MesaitemSEQFECHA: TIntegerField;
    IBQ_MesaitemGRUPO: TIntegerField;
    IBQ_MesaitemPRC_UNITARIO: TFloatField;
    IBQ_MesaitemBALANCA: TIBStringField;
    IBQ_MesaitemHO: TIBStringField;
    IBQ_MesaitemTEMPO: TDateTimeField;
    IBQ_MesaitemOPCANCEL: TIntegerField;
    IBQ_MesaitemALIQUOTA: TIntegerField;
    IBQ_MesaitemDATA_INICIO: TDateField;
    IBQ_MesaitemDATA_FINAL: TDateField;
    IBQ_MesaitemHORA_INICIO: TIBStringField;
    IBQ_MesaitemHORA_FINAL: TIBStringField;
    IBQ_MesaitemTEMPO_INICIAL: TDateTimeField;
    IBQ_MesaitemTEMPO_FINAL: TDateTimeField;
    IBQ_MesaitemDESCONTO: TFloatField;
    IBQ_MesaitemFINALIZADA: TIBStringField;
    IBQ_MesaitemOBS: TIBStringField;
    IBQ_MesaitemIMP_DIARIA: TIBStringField;
    IBQ_MesaitemIMP_CONTINT: TIBStringField;
    IBQ_MesaitemIMP_CANCELINT: TIBStringField;
    IBQ_MesaitemCLIENTEDIARIA: TIntegerField;
    IBQ_MesaitemACRESCIMO: TFloatField;
    IBQ_MesaitemTAXA: TFloatField;
    IBQ_MesaitemVAL_TAXA: TFloatField;
    IBQ_MesaitemVAL_DESCONTO: TFloatField;
    IBQ_MesaitemVAL_ACRESCIMO: TFloatField;
    IBQ_MesaitemVAL_PRODUTO: TFloatField;
    IBQ_MesaitemALIQUO: TIBStringField;
    IBQ_MesaitemPIS: TFloatField;
    IBQ_MesaitemCOFINS: TFloatField;
    IBQ_MesaitemICMS: TFloatField;
    IBQ_MesaitemCOMISSAOPR: TFloatField;
    IBQ_MesaitemCOMISSAOFU: TFloatField;
    IBQ_MesaitemCOMISPRSN: TIBStringField;
    IBQ_MesaitemCORTESIA: TIBStringField;
    IBQ_MesaitemTURNO: TIntegerField;
    IBQ_MesaitemSTATUSCONT: TIBStringField;
    IBQ_MesaitemREDUCAO: TFloatField;
    IBQ_MesaitemOBSERVACAO: TMemoField;
    IBQ_MesaitemCOMPLEMENTO: TIBStringField;
    IBQ_MesaitemPOSICAO: TIBStringField;
    IBQ_MesaitemLIGACOMP: TIntegerField;
    IBQ_MesaitemNIVEL_ISENTO: TIntegerField;
    IBQ_MesaitemIMPRESSO: TIBStringField;
    IBQ_MesaitemPESSOAS: TIntegerField;
    IBQ_MesaitemTAXA_MEM: TFloatField;
    IBQ_Bemacash: TIBQuery;
    IBQ_BemacashCODIGO_ID: TIntegerField;
    IBQ_BemacashDESCRICAO: TIBStringField;
    IBQ_BemacashORIGEM: TIBStringField;
    IBQ_BemacashID_ORIGEM: TIntegerField;
    IBQ_BemacashREF1: TIBStringField;
    IBQ_BemacashREF2: TIBStringField;
    IBQ_ExBemacash: TIBQuery;
    DTS_Mesaitem: TDataSource;
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
    IBQ_ProdutosCBEMA: TLargeintField;
    IBQ_SFicha: TIBQuery;
    IBQ_SFichaCODIGO_ID: TIntegerField;
    IBQ_SFichaFICHA: TIntegerField;
    IBQ_SFichaSEQUENCIA: TIntegerField;
    IBQ_SFichaSTATUS: TIBStringField;
    IBQ_SFichaATIVO: TIBStringField;
    IBQ_SFichaCONSULTA: TIBStringField;
    IBQ_SFichaTRAVA: TIBStringField;
    IBQ_SFichaDIGITO: TSmallintField;
    IBQ_SFichaTP_FICHA: TIBStringField;
    IBQ_SFichaOPERADOR: TIntegerField;
    IBQ_SFichaPRODUCAO: TIBStringField;
    IBQ_SFichaQUARTO: TIBStringField;
    IBQ_SFichaTAXA: TIBStringField;
    IBQ_SFichaMOVEL: TIBStringField;
    IBQ_SFichaFINALIZADA: TIBStringField;
    IBQ_SFichaXFICHA: TIBStringField;
    IBQ_SFichaIDFICHA: TIBStringField;
    IBQ_SFichaGARCOM: TIntegerField;
    IBQ_SFichaFECHANDO: TIBStringField;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure TRM_EscutarPedidoTimer(Sender: TObject);
  private
    { Private declarations }
    TrayIconData : TNotifyIconData;
  public
    { Public declarations }
    procedure TrayMessage(var Msg : TMessage); message WM_TRAYICON;
  end;

var
      FRM_MSE : TFRM_MSE;
  vARQUIVOOFF : String;
       vADDDV : String;

implementation

{$R *.dfm}

procedure TFRM_MSE.TrayMessage(var Msg: TMessage);
var
  Pt : TPoint;
begin
   case Msg.lParam of
      WM_LBUTTONDOWN:
      begin
         FRM_MSE.Show;
      end;
      WM_MBUTTONDOWN:
      begin
         FRM_MSE.Hide;
      end;
      WM_RBUTTONDOWN:
      begin
         GetCursorPos(Pt);
         FRM_MSE.PPP_Principal.Popup(Pt.X,Pt.Y);
      end;
   end;
end;

procedure TFRM_MSE.FormDestroy(Sender: TObject);
begin
   Shell_NotifyIcon(NIM_DELETE,@TrayIconData);
end;

procedure TFRM_MSE.FormCreate(Sender: TObject);
var
                              Ini : TIniFile;
                             _app : String;
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
      szTip            := 'MSE';
   end;

   Shell_NotifyIcon(NIM_ADD,@TrayIconData);
   //...........................................................................

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
      _Local         := Ini.ReadString( 'CONFBASE', 'LOCAL' , '' );
      _Server        := Ini.ReadString( 'CONFBASE', 'SERVER', '' );
      _Path          := Ini.ReadString( 'CONFBASE', 'PATH'  , '' );
      _Base          := Ini.ReadString( 'CONFBASE', 'BASE'  , '' );

      // Arquivos bemacash
      vARQUIVOOFF    := Ini.ReadString( 'BEMACASH','ARQUIVOOFF','C:\MBD\');
      vADDDV         := Ini.ReadString( 'BEMACASH','ADDDV','N');

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

   FRM_MSE.Caption := 'MSE';

   //TRM_EscutarPedido.Enabled := True;   
end;

procedure TFRM_MSE.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caNone;
   Hide;
end;

procedure TFRM_MSE.Sair1Click(Sender: TObject);
begin
   Close;
   Application.Terminate;
end;

procedure TFRM_MSE.TRM_EscutarPedidoTimer(Sender: TObject);
var
            Ini : TIniFile;

  vLer, vGravar : Textfile;
         vlinha : String;
         vCount : Integer;

             SR : TSearchRec;
        IsFound : Integer;

        vPedido : Integer;
      vPedidoDV : String;
begin
   // Escutar pedidos do Bemacash
   TRM_EscutarPedido.Enabled := False;

   try
      Ini         := TIniFile.Create(GetCurrentDir+'\CONFIG.INI');
      vARQUIVOOFF := Ini.ReadString('BEMACASH','ARQUIVOOFF','C:\MBD\');
      Ini.Free;

      // Gerar Pedido sem o PP..................................................
      IBQ_Bemacash.Close;
      IBQ_Bemacash.Open;

      while not IBQ_Bemacash.Eof do
      begin
         // Verifica se a ficha esta aberta ------------------------------------
         IBQ_SFicha.Close;
         IBQ_SFicha.SQL.Clear;
         IBQ_SFicha.SQL.Add('Select *');
         IBQ_SFicha.SQL.Add('From ficha');
         IBQ_SFicha.SQL.Add('where ficha = :P_ficha');
         IBQ_SFicha.ParamByName('P_ficha').Value  := StrToInt(IBQ_BemacashREF1.Value);
         IBQ_SFicha.Open;
         // --------------------------------------------------------------------

         if (UpperCase(IBQ_SFichaSTATUS.Value) = 'A') then
         begin
            //// Não é a ultima mesa usada .......................................
            //if (IBQ_SFichaSEQUENCIA.Value <> StrToInt(IBQ_BemacashREF2.Value)) then
            //begin
            //
            //end;

            // Usar DV
            if (vADDDV = 'S') then
               vPedidoDV := (FormatFloat('0000',IBQ_BemacashREF1.AsInteger) + FormatFloat('0',IBQ_SFichaDIGITO.AsInteger))
            else
               vPedidoDV := IBQ_BemacashREF1.Value;

            // Apagar o arquivo para gerar o novo...............................
            if FileExists(vARQUIVOOFF+'9'+FormatFloat('000000',StrToInt(vPedidoDV))+'.lst') then
               DeleteFile(vARQUIVOOFF+'9'+FormatFloat('000000',StrToInt(vPedidoDV))+'.lst');

            Sleep(100);
            //..................................................................

            IBQ_Mesaitem.Close;
            IBQ_Mesaitem.SQL.Clear;
            IBQ_Mesaitem.SQL.Add('Select *');
            IBQ_Mesaitem.SQL.Add('from mesaitem');
            IBQ_Mesaitem.SQL.Add('where (MESA = :PMESA)');
            IBQ_Mesaitem.ParamByName('PMESA').AsInteger        := StrToInt(IBQ_BemacashREF1.Value);
            IBQ_Mesaitem.SQL.Add('and (SEQUENCIA = :PSEQUENCIA)');
            IBQ_Mesaitem.ParamByName('PSEQUENCIA').AsInteger   := StrToInt(IBQ_BemacashREF2.Value);
            IBQ_Mesaitem.SQL.Add('and ((CANCELADA <> ''S'') or (CANCELADA is null))');
            IBQ_Mesaitem.Open;

            IBQ_Mesaitem.Last;
            IBQ_Mesaitem.First;

            IBQ_Produtos.Close;
            IBQ_Produtos.Open;

            if (IBQ_Mesaitem.RecordCount > 0) then
            begin
               // Gerar o arquivo 9 de retorno a esse pedido ......................
               AssignFile(vGravar,vARQUIVOOFF+'9'+FormatFloat('000000',StrToInt(vPedidoDV))+'.lst');
               Rewrite(vGravar,vARQUIVOOFF+'9'+FormatFloat('000000',StrToInt(vPedidoDV))+'.lst');
               Append(vGravar);

               Writeln(vGravar,'PEDIDO'                              +','+
                               FormatFloat('0',StrToInt(vPedidoDV))  +','+
                               '0'                                   +','+
                               '0'                                   +','+
                               '2'                                   +','+
                               FormatFloat('0',StrToInt(vPedidoDV))  +','+
                               '0');

               while not IBQ_Mesaitem.Eof do
               begin
                  Write  (vGravar,'ITEM'                                                       +',');
                  Write  (vGravar,FormatFloat('0',StrToInt(vPedidoDV))                         +',');

                  //------------------------------------------------------------
                  Write(vGravar,(IBQ_ProdutosCBEMA.AsString)+'0,');
                  //------------------------------------------------------------

                  Write  (vGravar,FormatFloat('0000',Round(IBQ_MesaitemQUANTIDADE.Value*1000)) +',');
                  Write  (vGravar,IBQ_MesaitemGARCOM.AsString                                  +',');
                  Write  (vGravar,FormatFloat('000',Round(IBQ_MesaitemPRC_UNITARIO.Value*100)) +',');
                  Write  (vGravar,FormatFloat('0',1)                                           +',');
                  Writeln(vGravar,FormatFloat('0',0));

                  IBQ_Mesaitem.Next;
               end;

               CloseFile(vGravar);
               //...............................................................
            end;
         end;

         // Excluir pedido de geração...........................................
         IBQ_ExBemacash.Close;
         IBQ_ExBemacash.SQL.Clear;
         IBQ_ExBemacash.SQL.Add('delete from bemacash');
         IBQ_ExBemacash.SQL.Add('where codigo_id = :PCodigo_id');
         IBQ_ExBemacash.ParamByName('PCodigo_id').AsInteger := IBQ_BemacashCODIGO_ID.AsInteger;
         IBQ_ExBemacash.ExecSQL;

         IBTransaction1.CommitRetaining;
         //.....................................................................

         IBQ_Bemacash.Next;
      end;
      // .......................................................................
   except
      CloseFile(vLer);
      CloseFile(vGravar);
      Ini.Free;
   end;

   Sleep(500);
   TRM_EscutarPedido.Enabled := True;
end;

initialization
   vADDDV := 'N';

end.
