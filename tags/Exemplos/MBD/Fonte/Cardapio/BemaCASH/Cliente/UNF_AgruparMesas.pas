unit UNF_AgruparMesas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, DBClient, IBTable, IBCustomDataSet,
  IBQuery;

type
  TFRM_AgruparMesas = class(TForm)
    PNL_Topo: TPanel;
    PNL_Lista: TPanel;
    Label1: TLabel;
    EDT_Mesa: TEdit;
    MNM_Mesas: TMemo;
    Panel1: TPanel;
    BTN_Agrupar: TButton;
    BTN_Sair: TButton;
    CDS_Mesa: TClientDataSet;
    CDS_MesaFicha: TIntegerField;
    CDS_MesaSequencia: TIntegerField;
    IBQ_FichaTransf: TIBQuery;
    IBQ_FichaTransfCODIGO_ID: TIntegerField;
    IBQ_FichaTransfFICHA: TIntegerField;
    IBQ_FichaTransfSEQUENCIA: TIntegerField;
    IBQ_FichaTransfSTATUS: TIBStringField;
    IBQ_FichaTransfATIVO: TIBStringField;
    IBQ_FichaTransfCONSULTA: TIBStringField;
    IBQ_FichaTransfTRAVA: TIBStringField;
    IBQ_FichaTransfDIGITO: TSmallintField;
    IBQ_FichaTransfTP_FICHA: TIBStringField;
    IBQ_FichaTransfOPERADOR: TIntegerField;
    IBQ_FichaTransfPRODUCAO: TIBStringField;
    IBQ_FichaTransf_: TIBQuery;
    IBQ_FichaTransf_CODIGO_ID: TIntegerField;
    IBQ_FichaTransf_FICHA: TIntegerField;
    IBQ_FichaTransf_SEQUENCIA: TIntegerField;
    IBQ_FichaTransf_STATUS: TIBStringField;
    IBQ_FichaTransf_ATIVO: TIBStringField;
    IBQ_FichaTransf_CONSULTA: TIBStringField;
    IBQ_FichaTransf_TRAVA: TIBStringField;
    IBQ_FichaTransf_DIGITO: TSmallintField;
    IBQ_FichaTransf_TP_FICHA: TIBStringField;
    IBQ_FichaTransf_OPERADOR: TIntegerField;
    IBQ_FichaTransf_PRODUCAO: TIBStringField;
    IBQ_FichaTransf_QUARTO: TIBStringField;
    IBQ_FichaTransf_TAXA: TIBStringField;
    IBQ_BFichaDestino: TIBQuery;
    IBQ_BFichaDestinoCODIGO_ID: TIntegerField;
    IBQ_BFichaDestinoMESA: TIntegerField;
    IBQ_BFichaDestinoSEQUENCIA: TIntegerField;
    IBQ_BFichaDestinoGARCOM: TIntegerField;
    IBQ_BFichaDestinoPRODUTO: TIntegerField;
    IBQ_BFichaDestinoQUANTIDADE: TFloatField;
    IBQ_BFichaDestinoCANCELADA: TIBStringField;
    IBQ_BFichaDestinoIMP_REMOTA: TIBStringField;
    IBQ_BFichaDestinoPONTOVENDA: TIntegerField;
    IBQ_BFichaDestinoHORA: TIBStringField;
    IBQ_BFichaDestinoDATE: TDateField;
    IBQ_BFichaDestinoMESAFECHA: TIntegerField;
    IBQ_BFichaDestinoSEQFECHA: TIntegerField;
    IBQ_BFichaDestinoGRUPO: TIntegerField;
    IBQ_BFichaDestinoPRC_UNITARIO: TFloatField;
    IBQ_BFichaDestinoBALANCA: TIBStringField;
    IBQ_BFichaDestinoHO: TIBStringField;
    IBQ_BFichaDestinoTEMPO: TDateTimeField;
    IBQ_BFichaDestinoOPCANCEL: TIntegerField;
    IBQ_BFichaDestinoALIQUOTA: TIntegerField;
    IBQ_BFichaDestinoDATA_INICIO: TDateField;
    IBQ_BFichaDestinoDATA_FINAL: TDateField;
    IBQ_BFichaDestinoHORA_INICIO: TIBStringField;
    IBQ_BFichaDestinoHORA_FINAL: TIBStringField;
    IBQ_BFichaDestinoTEMPO_INICIAL: TDateTimeField;
    IBQ_BFichaDestinoTEMPO_FINAL: TDateTimeField;
    IBQ_BFichaDestinoDESCONTO: TFloatField;
    IBQ_BFichaDestinoFINALIZADA: TIBStringField;
    IBQ_BFichaDestinoOBS: TIBStringField;
    IBQ_BFichaDestinoIMP_DIARIA: TIBStringField;
    IBQ_BFichaDestinoIMP_CONTINT: TIBStringField;
    IBQ_BFichaDestinoIMP_CANCELINT: TIBStringField;
    IBQ_BFichaDestinoCLIENTEDIARIA: TIntegerField;
    IBQ_BFichaDestinoACRESCIMO: TFloatField;
    IBQ_BFichaDestinoTAXA: TFloatField;
    IBQ_BFichaDestinoVAL_TAXA: TFloatField;
    IBQ_BFichaDestinoVAL_DESCONTO: TFloatField;
    IBQ_BFichaDestinoVAL_ACRESCIMO: TFloatField;
    IBQ_BFichaDestinoVAL_PRODUTO: TFloatField;
    IBQ_ItensDiariaTrans: TIBQuery;
    IBQ_ItensDiariaTransCODIGO_ID: TIntegerField;
    IBQ_ItensDiariaTransMESA: TIntegerField;
    IBQ_ItensDiariaTransSEQUENCIA: TIntegerField;
    IBQ_ItensDiariaTransGARCOM: TIntegerField;
    IBQ_ItensDiariaTransPRODUTO: TIntegerField;
    IBQ_ItensDiariaTransQUANTIDADE: TFloatField;
    IBQ_ItensDiariaTransCANCELADA: TIBStringField;
    IBQ_ItensDiariaTransIMP_REMOTA: TIBStringField;
    IBQ_ItensDiariaTransPONTOVENDA: TIntegerField;
    IBQ_ItensDiariaTransHORA: TIBStringField;
    IBQ_ItensDiariaTransDATE: TDateField;
    IBQ_ItensDiariaTransMESAFECHA: TIntegerField;
    IBQ_ItensDiariaTransSEQFECHA: TIntegerField;
    IBQ_ItensDiariaTransGRUPO: TIntegerField;
    IBQ_ItensDiariaTransPRC_UNITARIO: TFloatField;
    IBQ_ItensDiariaTransBALANCA: TIBStringField;
    IBQ_ItensDiariaTransHO: TIBStringField;
    IBQ_ItensDiariaTransTEMPO: TDateTimeField;
    IBQ_ItensDiariaTransOPCANCEL: TIntegerField;
    IBQ_ItensDiariaTransALIQUOTA: TIntegerField;
    IBQ_ItensDiariaTransDATA_INICIO: TDateField;
    IBQ_ItensDiariaTransDATA_FINAL: TDateField;
    IBQ_ItensDiariaTransHORA_INICIO: TIBStringField;
    IBQ_ItensDiariaTransHORA_FINAL: TIBStringField;
    IBQ_ItensDiariaTransTEMPO_INICIAL: TDateTimeField;
    IBQ_ItensDiariaTransTEMPO_FINAL: TDateTimeField;
    IBQ_ItensDiariaTransDESCONTO: TFloatField;
    IBQ_ItensDiariaTransFINALIZADA: TIBStringField;
    IBQ_ItensDiariaTransOBS: TIBStringField;
    IBQ_ItensDiariaTransIMP_DIARIA: TIBStringField;
    IBQ_ItensDiariaTransIMP_CONTINT: TIBStringField;
    IBQ_ItensDiariaTransIMP_CANCELINT: TIBStringField;
    IBQ_ItensDiariaTransCLIENTEDIARIA: TIntegerField;
    IBQ_ItensDiariaTransACRESCIMO: TFloatField;
    IBQ_ItensDiariaTransTAXA: TFloatField;
    IBQ_ItensDiariaTransVAL_TAXA: TFloatField;
    IBQ_ItensDiariaTransVAL_DESCONTO: TFloatField;
    IBQ_ItensDiariaTransVAL_ACRESCIMO: TFloatField;
    IBQ_ItensDiariaTransVAL_PRODUTO: TFloatField;
    IBQ_BFichaOrigem: TIBQuery;
    IBQ_BFichaOrigemCODIGO_ID: TIntegerField;
    IBQ_BFichaOrigemMESA: TIntegerField;
    IBQ_BFichaOrigemSEQUENCIA: TIntegerField;
    IBQ_BFichaOrigemGARCOM: TIntegerField;
    IBQ_BFichaOrigemPRODUTO: TIntegerField;
    IBQ_BFichaOrigemQUANTIDADE: TFloatField;
    IBQ_BFichaOrigemCANCELADA: TIBStringField;
    IBQ_BFichaOrigemIMP_REMOTA: TIBStringField;
    IBQ_BFichaOrigemPONTOVENDA: TIntegerField;
    IBQ_BFichaOrigemHORA: TIBStringField;
    IBQ_BFichaOrigemDATE: TDateField;
    IBQ_BFichaOrigemMESAFECHA: TIntegerField;
    IBQ_BFichaOrigemSEQFECHA: TIntegerField;
    IBQ_BFichaOrigemGRUPO: TIntegerField;
    IBQ_BFichaOrigemPRC_UNITARIO: TFloatField;
    IBQ_BFichaOrigemBALANCA: TIBStringField;
    IBQ_BFichaOrigemHO: TIBStringField;
    IBQ_BFichaOrigemTEMPO: TDateTimeField;
    IBQ_BFichaOrigemOPCANCEL: TIntegerField;
    IBQ_BFichaOrigemALIQUOTA: TIntegerField;
    IBQ_BFichaOrigemDATA_INICIO: TDateField;
    IBQ_BFichaOrigemDATA_FINAL: TDateField;
    IBQ_BFichaOrigemHORA_INICIO: TIBStringField;
    IBQ_BFichaOrigemHORA_FINAL: TIBStringField;
    IBQ_BFichaOrigemTEMPO_INICIAL: TDateTimeField;
    IBQ_BFichaOrigemTEMPO_FINAL: TDateTimeField;
    IBQ_BFichaOrigemDESCONTO: TFloatField;
    IBQ_BFichaOrigemFINALIZADA: TIBStringField;
    IBQ_BFichaOrigemOBS: TIBStringField;
    IBQ_BFichaOrigemIMP_DIARIA: TIBStringField;
    IBQ_BFichaOrigemIMP_CONTINT: TIBStringField;
    IBQ_BFichaOrigemIMP_CANCELINT: TIBStringField;
    IBQ_BFichaOrigemCLIENTEDIARIA: TIntegerField;
    IBQ_BFichaOrigemACRESCIMO: TFloatField;
    IBQ_BFichaOrigemTAXA: TFloatField;
    IBQ_BFichaOrigemVAL_TAXA: TFloatField;
    IBQ_BFichaOrigemVAL_DESCONTO: TFloatField;
    IBQ_BFichaOrigemVAL_ACRESCIMO: TFloatField;
    IBQ_BFichaOrigemVAL_PRODUTO: TFloatField;
    IBQ_MesaItem: TIBQuery;
    IBQ_MesaItemCODIGO_ID: TIntegerField;
    IBQ_MesaItemMESA: TIntegerField;
    IBQ_MesaItemSEQUENCIA: TIntegerField;
    IBQ_MesaItemGARCOM: TIntegerField;
    IBQ_MesaItemPRODUTO: TIntegerField;
    IBQ_MesaItemQUANTIDADE: TFloatField;
    IBQ_MesaItemCANCELADA: TIBStringField;
    IBQ_MesaItemIMP_REMOTA: TIBStringField;
    IBQ_MesaItemPONTOVENDA: TIntegerField;
    IBQ_MesaItemHORA: TIBStringField;
    IBQ_MesaItemDATE: TDateField;
    IBQ_MesaItemMESAFECHA: TIntegerField;
    IBQ_MesaItemSEQFECHA: TIntegerField;
    IBQ_MesaItemGRUPO: TIntegerField;
    IBQ_MesaItemPRC_UNITARIO: TFloatField;
    IBQ_MesaItemBALANCA: TIBStringField;
    IBQ_MesaItemHO: TIBStringField;
    IBQ_MesaItemTEMPO: TDateTimeField;
    IBQ_MesaItemOPCANCEL: TIntegerField;
    IBQ_MesaItemALIQUOTA: TIntegerField;
    IBQ_MesaItemDATA_INICIO: TDateField;
    IBQ_MesaItemDATA_FINAL: TDateField;
    IBQ_MesaItemHORA_INICIO: TIBStringField;
    IBQ_MesaItemHORA_FINAL: TIBStringField;
    IBQ_MesaItemTEMPO_INICIAL: TDateTimeField;
    IBQ_MesaItemTEMPO_FINAL: TDateTimeField;
    IBQ_MesaItemDESCONTO: TFloatField;
    IBQ_MesaItemFINALIZADA: TIBStringField;
    IBQ_MesaItemCODIGO_ID1: TIntegerField;
    IBQ_MesaItemPRODUTO1: TIBStringField;
    IBQ_MesaItemDESCRICAO: TIBStringField;
    IBQ_MesaItemPRECO: TFloatField;
    IBQ_MesaItemPRECOCUSTO: TFloatField;
    IBQ_MesaItemGRUPO1: TIntegerField;
    IBQ_MesaItemICMS_SN: TIBStringField;
    IBQ_MesaItemTRIBUTAR: TIntegerField;
    IBQ_MesaItemBALANCA1: TIBStringField;
    IBQ_MesaItemTARA: TFloatField;
    IBQ_MesaItemUNIDADE: TIntegerField;
    IBQ_MesaItemATIVO: TIBStringField;
    IBQ_MesaItemCOMANDA: TIBStringField;
    IBQ_MesaItemLOCAL_IMP: TIntegerField;
    IBQ_MesaItemDESCONTO1: TFloatField;
    IBQ_MesaItemACRESCIMO: TFloatField;
    IBQ_MesaItemPROD_MTN: TIntegerField;
    IBQ_MesaItemESTOQUE: TIBStringField;
    IBQ_MesaItemESTNEGATIVO: TIBStringField;
    IBQ_MesaItemESTOQUE_FISICO: TFloatField;
    IBQ_MesaItemESTOQUE_VIRTUAL: TFloatField;
    IBQ_MesaItemESTOQUEMIN: TFloatField;
    IBQ_MesaItemESTOQUEMAX: TFloatField;
    IBQ_MesaItemTEMPO1: TIBStringField;
    IBQ_MesaItemDIA_PROD: TIBStringField;
    IBQ_MesaItemTotal: TFloatField;
    IBQ_MesaItemDescGarcom: TStringField;
    IBQ_MesaItemOBS: TIBStringField;
    IBQ_MesaItemIMP_DIARIA: TIBStringField;
    IBQ_MesaItemIMP_CONTINT: TIBStringField;
    IBQ_MesaItemIMP_CANCELINT: TIBStringField;
    IBQ_MesaItemCLIENTEDIARIA: TIntegerField;
    IBQ_MesaItemTAXA: TFloatField;
    IBQ_MesaItemVAL_DESCONTO: TFloatField;
    IBQ_MesaItemVAL_ACRESCIMO: TFloatField;
    IBQ_MesaItemVAL_TAXA: TFloatField;
    IBQ_MesaItemVAL_PRODUTO: TFloatField;
    IBQ_MesaItemACRESCIMO1: TFloatField;
    IBQ_MesaItemIMP_PERS: TIBStringField;
    IBQ_MesaItemVALSALDOENT: TFloatField;
    IBQ_MesaItemQTDSALDOENT: TFloatField;
    IBQ_MesaItemTAXA1: TFloatField;
    IBQ_MesaItemTAXA_SN: TIBStringField;
    DTQ_MesaItem: TDataSource;
    IBT_Ficha: TIBTable;
    IBT_FichaCODIGO_ID: TIntegerField;
    IBT_FichaFICHA: TIntegerField;
    IBT_FichaSEQUENCIA: TIntegerField;
    IBT_FichaSTATUS: TIBStringField;
    IBT_FichaATIVO: TIBStringField;
    IBT_FichaCONSULTA: TIBStringField;
    IBT_FichaTRAVA: TIBStringField;
    IBT_FichaDIGITO: TSmallintField;
    IBT_FichaTP_FICHA: TIBStringField;
    IBT_FichaOPERADOR: TIntegerField;
    IBT_FichaPRODUCAO: TIBStringField;
    IBT_FichaQUARTO: TIBStringField;
    IBT_FichaTAXA: TIBStringField;
    IBT_FichaMOVEL: TIBStringField;
    IBT_FichaFINALIZADA: TIBStringField;
    IBT_FichaXFICHA: TIBStringField;
    DTS_Ficha: TDataSource;
    IBQ_VerERROFichas: TIBQuery;
    function StatusMesa:Boolean;
    procedure BTN_SairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BTN_AgruparClick(Sender: TObject);
    procedure EDT_MesaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_AgruparMesas : TFRM_AgruparMesas;
               vDV : Integer;

implementation

uses UNF_Modulo, UNF_Frente, UNF_Funcoes, UNF_Mensagem, UNF_MensagemDeErro,
     UNF_Pergunta, UNF_PesLookUp;

{$R *.dfm}

function TFRM_AgruparMesas.StatusMesa:Boolean;
begin
   with FRM_Modulo do
   begin
      FRM_Frente.IBQ_Pesquisa.Close;
      FRM_Frente.IBQ_Pesquisa.SQL.Clear;
      FRM_Frente.IBQ_Pesquisa.SQL.Add('select *');
      FRM_Frente.IBQ_Pesquisa.SQL.Add('from Ficha');
      FRM_Frente.IBQ_Pesquisa.SQL.Add('where ficha = :p_ficha');
      FRM_Frente.IBQ_Pesquisa.ParamByName('p_ficha').Value := StrToInt(EDT_Mesa.Text);

      // Validar DV
      if (xDigito = 'S') then
      begin
         FRM_Frente.IBQ_Pesquisa.SQL.Add('and DIGITO = :p_digito');
         FRM_Frente.IBQ_Pesquisa.ParamByName('p_digito').Value := vDV;
      end;

      FRM_Frente.IBQ_Pesquisa.Open;

      if FRM_Frente.IBQ_Pesquisa.RecordCount <> 0 then
      begin
         if xDigito = 'S' then
         begin
            if FRM_Frente.IBQ_Pesquisa.FieldByName('Digito').Value <> vDV then
            begin
               Mensagem('O DV não confere!!!');
               EDT_Mesa.Text := '';
               Result := False;
               Exit;
            end;
         end;

         if FRM_Frente.IBQ_Pesquisa.FieldByName('ATIVO').AsString <> 'S' then
         begin
            Mensagem('Ficha Bloqueada!!!');
            EDT_Mesa.Text := '';
            Result := False;
            Exit;
         end;

         if FRM_Frente.IBQ_Pesquisa.FieldByName('STATUS').AsString <> 'A' then
         begin
            if Pergunta('Abrir Ficha') = 'S' then
            begin
               FMesa       := StrToInt64(EDT_Mesa.Text);
               FSetor      := '0';
               FGarcon     := '0';
               FOperador   := vLogin;
               FPontoVenda := '0';
               FMaquina    := '0';

               {Abre Ficha}
               if IBT_Ficha.Locate('Ficha',IntToStr(FMesa),[]) then
               begin
                  FRM_Frente.IBQ_Sequencia.Close;
                  FRM_Frente.IBQ_Sequencia.Open;

                  FSequencia := FRM_Frente.IBQ_SequenciaXCOD_ID.Value;

                  FRM_Frente.IBQ_Grava.Close;
                  FRM_Frente.IBQ_Grava.SQL.Clear;
                  FRM_Frente.IBQ_Grava.SQL.Add('update ficha');
                  FRM_Frente.IBQ_Grava.SQL.Add('set sequencia =:p_sequencia, status =:p_status ');
                  FRM_Frente.IBQ_Grava.ParamByName('p_sequencia').Value := FSequencia;
                  FRM_Frente.IBQ_Grava.ParamByName('p_status').Value    := 'A';
                  FRM_Frente.IBQ_Grava.SQL.Add('where (ficha =:p_ficha) ');
                  FRM_Frente.IBQ_Grava.ParamByName('p_ficha').Value     := FMesa;
                  FRM_Frente.IBQ_Grava.ExecSQL;

                  FRM_Frente.Commit_Work_;

                  // Lança a mesa...............................................
                  CDS_Mesa.Append;
                  CDS_MesaFicha.Value     := FMesa;
                  CDS_MesaSequencia.Value := FSequencia;
                  CDS_Mesa.Post;
                  //vmesas[1,FMesa] := IntToStr(FSequencia);
               end;

               Result := True;
            end
            else
            begin
               EDT_Mesa.Text := '';
               Result := False;
            end;
            Exit;
         end
         else
         begin
            // Lança a mesa...............................................
            CDS_Mesa.Append;
            CDS_MesaFicha.Value     := strtoint64(EDT_Mesa.Text);
            CDS_MesaSequencia.Value := FRM_Frente.IBQ_Pesquisa.FieldByName('sequencia').Value;
            CDS_Mesa.Post;
            //vmesas[1,strtoint64(EDT_Mesa.Text)] := FRM_Frente.IBQ_Pesquisa.FieldByName('sequencia').AsString;
         end;

         if FRM_Frente.IBQ_Pesquisa.FieldByName('sequencia').Value = 0 then
         begin
            Mensagem('Ficha sem sequencia!!!');
            EDT_Mesa.Text := '';
            Result := False;
            Exit;
         end;
      end
      else
      begin
         Mensagem('Ficha não encontrada!!!');
         EDT_Mesa.Text := '';
         Result := False;
         Exit;
      end;

      Result := True;
   end;
end;

procedure TFRM_AgruparMesas.BTN_SairClick(Sender: TObject);
begin
   Close;
end;

procedure TFRM_AgruparMesas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action           := caFree;
   Action           := caFree;
   FRM_AgruparMesas := nil;
end;

procedure TFRM_AgruparMesas.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #43) then
   begin
      BTN_Agrupar.Click;

      EDT_Mesa.Text       := '';
      EDT_Mesa.SetFocus;
      
      Key := #0;
   end;

   if (key = #45) then
   begin
      BTN_Sair.Click;
   end;
end;

procedure TFRM_AgruparMesas.BTN_AgruparClick(Sender: TObject);
var
   oMesa, oSeq : Integer;
     vPedidoDV : String;
begin
   CDS_Mesa.First;

   oMesa := CDS_MesaFicha.Value;
   oSeq  := CDS_MesaSequencia.Value;

   if (Pergunta('Confirmar agrupar todos a fichas selecionadas na ficha ' + strzero(oMesa,6) + ' ?') = 'S') then
   begin
      CDS_Mesa.Next;

      while not CDS_Mesa.Eof do
      begin
         try
            Screen.Cursor       := crSQLWait;
            BTN_Agrupar.Enabled := False;

            // Remover Taxa ----------------------------------------------------
            //if CHK_Taxa.Checked then
            //begin
            //   IBQ_ItensDiariaTrans.Close;
            //   IBQ_ItensDiariaTrans.SQL.Clear;
            //   IBQ_ItensDiariaTrans.SQL.Add('UPDATE MesaItem ');
            //   IBQ_ItensDiariaTrans.SQL.Add('set TAXA = 0');
            //   IBQ_ItensDiariaTrans.SQL.Add('Where (MESA = :P_Ficha_)');
            //   IBQ_ItensDiariaTrans.ParamByName('P_Ficha_').Value    := CDS_MesaFicha.Value;
            //   IBQ_ItensDiariaTrans.SQL.Add('and (Sequencia = :P_Sequencia)');
            //   IBQ_ItensDiariaTrans.ParamByName('P_Sequencia').Value :=  CDS_MesaFicha.Value;
            //
            //   IBQ_ItensDiariaTrans.ExecSQL;
            //   FRM_Modulo.IBTransaction1.CommitRetaining;
            //end;

            // Troca o cod da ficha e sua sequencia nos itens da mesa-----------
            IBQ_ItensDiariaTrans.Close;
            IBQ_ItensDiariaTrans.SQL.Clear;
            IBQ_ItensDiariaTrans.SQL.Add('Update Mesaitem');
            IBQ_ItensDiariaTrans.SQL.Add('Set MESA = :P_Ficha , SEQUENCIA = :P_SEQUENCIA');
            IBQ_ItensDiariaTrans.ParamByName('P_Ficha').Value     := oMesa;
            IBQ_ItensDiariaTrans.ParamByName('P_SEQUENCIA').Value := oSeq;
            IBQ_ItensDiariaTrans.SQL.Add('Where (MESA = :O_Ficha)');
            IBQ_ItensDiariaTrans.SQL.Add('and (Sequencia = :O_Sequencia)');
            IBQ_ItensDiariaTrans.ParamByName('O_Ficha').Value     := CDS_MesaFicha.Value;
            IBQ_ItensDiariaTrans.ParamByName('O_Sequencia').Value := CDS_MesaSequencia.Value;
            IBQ_ItensDiariaTrans.ExecSQL;
            FRM_Modulo.IBTransaction1.CommitRetaining;

            // ESTORNA A FINALIZACAO -------------------------------------------
            IBQ_ItensDiariaTrans.Close;
            IBQ_ItensDiariaTrans.SQL.Clear;
            IBQ_ItensDiariaTrans.SQL.Add('UPDATE MesaItem ');
            IBQ_ItensDiariaTrans.SQL.Add('set DATA_FINAL = null,');
            IBQ_ItensDiariaTrans.SQL.Add('HORA_FINAL = null,');
            IBQ_ItensDiariaTrans.SQL.Add('DESCONTO = 0,');
            IBQ_ItensDiariaTrans.SQL.Add('FINALIZADA = :X_Finalizada');
            IBQ_ItensDiariaTrans.ParamByName('X_Finalizada').AsString  := 'N';
            IBQ_ItensDiariaTrans.SQL.Add('Where (MESA = :P_Ficha)');
            IBQ_ItensDiariaTrans.SQL.Add('and (Sequencia = :P_Sequencia)');
            IBQ_ItensDiariaTrans.ParamByName('P_Ficha').Value     := oMesa;
            IBQ_ItensDiariaTrans.ParamByName('P_Sequencia').Value := oSeq;
            IBQ_ItensDiariaTrans.ExecSQL;
            FRM_Modulo.IBTransaction1.CommitRetaining;

            // Fecha a Ficha  Origem após a transferencia ----------------------
            IBQ_FichaTransf_.Close;
            IBQ_FichaTransf_.SQL.Clear;
            IBQ_FichaTransf_.SQL.Add('update ficha');
            IBQ_FichaTransf_.SQL.Add('set sequencia = :p_sequencia, status = :p_status, IDFicha = :p_IDFicha, Garcom = :P_Garcom, fechando = :P_fechando');
            IBQ_FichaTransf_.ParamByName('p_sequencia').Value := 0;
            IBQ_FichaTransf_.ParamByName('p_status').Value    := 'P';
            IBQ_FichaTransf_.ParamByName('p_IDFicha').Value   := '';
            IBQ_FichaTransf_.ParamByName('P_Garcom').Value    := null;
            IBQ_FichaTransf_.ParamByName('P_fechando').Value  := null;
            IBQ_FichaTransf_.SQL.Add('where (ficha = :p_ficha)');
            IBQ_FichaTransf_.ParamByName('p_ficha').Value     := CDS_MesaFicha.Value;
            IBQ_FichaTransf_.ExecSQL;
            FRM_Modulo.IBTransaction1.CommitRetaining;

            // Apagar aquivos do bemacash --------------------------------------
            if (vARQUIVOOFF <> '') then
            begin
               IBQ_VerERROFichas.Close;
               IBQ_VerERROFichas.SQL.Clear;
               IBQ_VerERROFichas.SQL.Add('select *');
               IBQ_VerERROFichas.SQL.Add('from ficha');
               IBQ_VerERROFichas.SQL.Add('where (ficha = :p_ficha)');
               IBQ_VerERROFichas.ParamByName('p_ficha').Value := CDS_MesaFicha.Value;
               IBQ_VerERROFichas.Open;

               if (vADDDV = 'S') then
                  vPedidoDV := FormatFloat('00000',CDS_MesaFicha.Value)+ FormatFloat('0',IBQ_VerERROFichas.FieldByName('DIGITO').AsInteger)
               else
                  vPedidoDV := FormatFloat('000000',CDS_MesaFicha.Value);

               //Mensagem('ARquivo ' + vARQUIVOOFF+'9'+vPedidoDV+'.lst');
               if FileExists(vARQUIVOOFF+'9'+vPedidoDV+'.lst') then
                  DeleteFile(vARQUIVOOFF+'9'+vPedidoDV+'.lst');
            end;
            // -----------------------------------------------------------------
            
         except
            Mensagem('Problemas com a transferencia!');
            Screen.Cursor       := crDefault;
            BTN_Agrupar.Enabled := True;
         end;

         CDS_Mesa.Next;
      end;
   end;

   //Novo modelo para de fechamento ............................................

   CDS_Mesa.EmptyDataSet;
   MNM_Mesas.Lines.Clear;

   //Aguardar gravação do arquivo após o agrupamento - Trocado por Sleep(3000) abaixo
   //if (vADDDV = 'S') then
   //begin
   //   IBQ_VerERROFichas.Close;
   //   IBQ_VerERROFichas.SQL.Clear;
   //   IBQ_VerERROFichas.SQL.Add('select *');
   //   IBQ_VerERROFichas.SQL.Add('from ficha');
   //   IBQ_VerERROFichas.SQL.Add('where (ficha = :p_ficha)');
   //   IBQ_VerERROFichas.ParamByName('p_ficha').Value := oMesa;
   //   IBQ_VerERROFichas.Open;

   //   vPedidoDV := FormatFloat('00000',oMesa)+ FormatFloat('0',IBQ_VerERROFichas.FieldByName('DIGITO').AsInteger);
   //end
   //else
   //begin
   //   vPedidoDV := FormatFloat('000000',oMesa);
   //end;

   //while not FileExists(vARQUIVOOFF+'9'+vPedidoDV+'.lst') do
   //begin
      {...}
   //end;
   Sleep(3000);
   Mensagem('Agrupamento realizado...');
   //...........................................................................

   Screen.Cursor       := crDefault;
   BTN_Agrupar.Enabled := True;

   EDT_Mesa.Text       := '';
   EDT_Mesa.SetFocus;
   //...........................................................................

   //Retirado para não fechar após o agrupamento ...............................
   //BTN_Sair.Click;
   //...........................................................................
end;

procedure TFRM_AgruparMesas.EDT_MesaKeyPress(Sender: TObject;
  var Key: Char);
var
   i, NFicha, vNDFicha : Integer;
begin
   { Verifica Teclas }
   if not (key in ['0'..'9',#43,#13,#8,#120]) then
   begin
      Key := #0;
      Exit;
   end;

   { Lançar mesa }
   if key = #13 then
   begin
      // Tamanho do campo ficha.................................................
      vNDFicha := FRM_Modulo.IBT_ParametrosNDFICHA.AsInteger;

      if xDigito = 'S' then
      begin
         if AllTrim(copy(EDT_Mesa.Text,vNDFicha,1)) = '' then
         begin
            Mensagem('Obrigatório entrar com o DV!');
            Key := #0;
            Exit;
         end;

         vDV := StrToInt(copy(EDT_Mesa.Text,vNDFicha,1));
      end
      else
      begin
         NFicha := StrToInt64(copy(EDT_Mesa.Text,1,vNDFicha-1));
         if FRM_Modulo.IBT_Ficha.Locate('FICHA',NFicha,[])then
            vDV := FRM_Modulo.IBT_FichaDIGITO.Value;
      end;

      ////VERIFICA QUARTO FINALIZADO////
      //if (xDiaria = 'S') and (_XTRAVAQUARTOFINA = 'S') then
      //begin
      //   FRM_Frente.IBQ_AbreFichaFinaliz.Close;
      //   FRM_Frente.IBQ_AbreFichaFinaliz.SQL.Clear;
      //   FRM_Frente.IBQ_AbreFichaFinaliz.SQL.Add('select *');
      //   FRM_Frente.IBQ_AbreFichaFinaliz.SQL.Add('from FICHA');
      //   FRM_Frente.IBQ_AbreFichaFinaliz.SQL.Add('Where (FICHA = :P_FICHA)');
      //   FRM_Frente.IBQ_AbreFichaFinaliz.ParamByName('P_FICHA').Value := copy(EDT_Mesa.Text,1,vNDFicha-1);
      //   FRM_Frente.IBQ_AbreFichaFinaliz.Open;
      //
      //   FRM_Frente.IBQ_VerFichaFinaliz.Close;
      //   FRM_Frente.IBQ_VerFichaFinaliz.SQL.Clear;
      //   FRM_Frente.IBQ_VerFichaFinaliz.SQL.Add('select max(tempo_final) as FINALIZADO, count(codigo_id) as contador');
      //   FRM_Frente.IBQ_VerFichaFinaliz.SQL.Add('from mesaitem');
      //   FRM_Frente.IBQ_VerFichaFinaliz.SQL.Add('where 1=1');
      //   FRM_Frente.IBQ_VerFichaFinaliz.SQL.Add('and (MESA = :P_FICHA)');
      //   FRM_Frente.IBQ_VerFichaFinaliz.ParamByName('P_FICHA').Value     := FRM_Frente.IBQ_AbreFichaFinalizFICHA.Value;
      //
      //   FRM_Frente.IBQ_VerFichaFinaliz.SQL.Add('and (SEQUENCIA = :P_SEQUENCIA)');
      //   FRM_Frente.IBQ_VerFichaFinaliz.ParamByName('P_SEQUENCIA').Value := FRM_Frente.IBQ_AbreFichaFinalizSEQUENCIA.Value;
      //
      //   FRM_Frente.IBQ_VerFichaFinaliz.SQL.Add('and ((cancelada = ''N'') or (cancelada is null))');
      //   FRM_Frente.IBQ_VerFichaFinaliz.SQL.Add('and (mesafecha is null)');
      //   FRM_Frente.IBQ_VerFichaFinaliz.Open;
      //
      //   if (FRM_Frente.IBQ_VerFichaFinalizFINALIZADO.IsNull) and (FRM_Frente.IBQ_VerFichaFinalizCONTADOR.Value > 0) then
      //   begin
      //      Mensagem('Quarto ainda não finalizado !!!');
      //      Exit;
      //   end;
      //end;

      EDT_Mesa.Text := copy(EDT_Mesa.Text,1,vNDFicha-1);
      EDT_Mesa.Refresh;

      { Estiver Vazio }
      if EDT_Mesa.Text = '' then
      begin
         key := #0;
         Exit;
      end;

      //if (xTPMesaTicket = 'M') and (TPDIAMES = 'M') then
      //begin
      //   FRM_Modulo.IBT_Ficha.Close;
      //   FRM_Modulo.IBT_Ficha.Open;
      //
      //   NFicha := StrToInt64(copy(EDT_Mesa.Text,1,vNDFicha-1));
      //   if FRM_Modulo.IBT_Ficha.Locate('FICHA',NFicha,[])then
      //      vDV := FRM_Modulo.IBT_FichaDIGITO.Value;
      //
      //   if (FRM_Modulo.IBT_FichaSTATUS.Value = 'A') then
      //   begin
      //      FRM_Modulo.IBQ_VerMesa.Close;
      //      FRM_Modulo.IBQ_VerMesa.SQL.Clear;
      //      FRM_Modulo.IBQ_VerMesa.SQL.Add('select *');
      //      FRM_Modulo.IBQ_VerMesa.SQL.Add('from MESAITEM');
      //      FRM_Modulo.IBQ_VerMesa.SQL.Add('where Mesa =:P_Mesa');
      //      FRM_Modulo.IBQ_VerMesa.SQL.Add('and SEQUENCIA =:P_sequencia');
      //      FRM_Modulo.IBQ_VerMesa.ParamByName('P_Mesa').Value := FRM_Modulo.IBT_FichaFICHA.Value;
      //      FRM_Modulo.IBQ_VerMesa.ParamByName('P_sequencia').Value := FRM_Modulo.IBT_FichaSEQUENCIA.Value;
      //      FRM_Modulo.IBQ_VerMesa.Open;
      //
      //      if FRM_Modulo.IBQ_VerMesaFINALIZADA.Value = 'N' then
      //      begin
      //         if Pergunta('Mesa Não Finalizada!! Deseja Continuar?') = 'N' then
      //         begin
      //            //if FRM_LanMesas = nil then
      //            //   FRM_LanMesas := TFRM_LanMesas.Create(Application);
      //            //
      //            //FRM_LanMesas.ShowModal;
      //            EDT_Mesa.Text := '';
      //            Abort;
      //         end;
      //      end;
      //   end;
      //end;

      if StatusMesa then
      begin
         { Deletar Linha }
         for i:= 0 to MNM_Mesas.Lines.Count - 1 do
         begin
            if MNM_Mesas.Lines[i] = 'Ficha '+strzero(strtoint64(EDT_Mesa.Text),6) then
            begin
               if Pergunta('Deletar ficha?') = 'S' then
               begin
                  MNM_Mesas.SetFocus;
                  MNM_Mesas.Lines.Delete(i);
                  EDT_Mesa.SetFocus;

                  if CDS_Mesa.Locate('Ficha',strtoint64(EDT_Mesa.Text),[]) then
                     CDS_Mesa.Delete;
                     
                  //vmesas[1,strtoint64(EDT_Mesa.Text)] := '';
               end;

               EDT_Mesa.Text := '';
               Exit;
            end;
         end;

         { Incluir Mesa }
         MNM_Mesas.SetFocus;
         MNM_Mesas.Lines.Add('Ficha ' + strzero(strtoint64(EDT_Mesa.Text),6));

         EDT_Mesa.Text := '';
         EDT_Mesa.SetFocus;
      end;
   end;
end;

procedure TFRM_AgruparMesas.FormShow(Sender: TObject);
begin
   CDS_Mesa.EmptyDataSet;
end;

end.
