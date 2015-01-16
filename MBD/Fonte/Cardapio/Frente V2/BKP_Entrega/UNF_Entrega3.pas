unit UNF_Entrega3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, DBCtrls, StdCtrls, Buttons,
  ExtCtrls, Mask;

type
  TFRM_EntreBaixa2 = class(TForm)
    PNL_Fundo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SPB_Confirma: TSpeedButton;
    EDT_Pedido: TEdit;
    DBLC_FormaPagto: TDBLookupComboBox;
    EDT_Valor: TEdit;
    IBQ_Gravar: TIBQuery;
    IBQ_ValorTotal: TIBQuery;
    IBQ_ValorTotalXTOTAL: TFloatField;
    IBQ_Entrega: TIBQuery;
    IBQ_EntregaCODIGO_ID: TIntegerField;
    IBQ_EntregaNOME: TIBStringField;
    IBQ_EntregaTELEFONE: TIBStringField;
    IBQ_EntregaENDERECO: TIBStringField;
    IBQ_EntregaBAIRRO: TIBStringField;
    IBQ_EntregaPONTO_REF: TIBStringField;
    IBQ_EntregaDT_PEDIDO: TDateField;
    IBQ_EntregaHR_PEDIDO: TTimeField;
    IBQ_EntregaFECHA_SN: TIBStringField;
    IBQ_EntregaFORMAPAGTO: TIntegerField;
    IBQ_EntregaVALOR_PAGO: TFloatField;
    IBQ_EntregaCLIENTE: TIntegerField;
    IBQ_EntregaDT_RECEBIMENTO: TDateField;
    IBQ_EntregaHR_RECEBIMENTO: TTimeField;
    IBQ_EntregaCANCEL: TIBStringField;
    IBQ_EntregaENTREGADOR: TIntegerField;
    IBQ_EntregaDT_ENTREGA: TDateField;
    IBQ_EntregaHR_ENTREGA: TTimeField;
    IBQ_EntregaCIDADE: TIBStringField;
    Label4: TLabel;
    EDT_Troco: TEdit;
    SPB_Cancelar: TSpeedButton;
    IBQ_PAG: TIBQuery;
    IBQ_PAGCODIGO_ID: TIntegerField;
    IBQ_PAGDESCONTO: TFloatField;
    IBQ_PAGTIPOPAGTO: TIntegerField;
    IBQ_PAGMULTFORM: TIBStringField;
    IBQ_PAGTEF: TIBStringField;
    IBQ_PAGTIPO: TIBStringField;
    IBQ_PAGDESCRICAO: TIBStringField;
    IBQ_PAGDIAS: TIntegerField;
    IBQ_PAGQTDTICKET: TIntegerField;
    IBQ_PAGATIVO: TIBStringField;
    IBQ_PAGACRESCIMO: TFloatField;
    IBQ_PAGCORTESIA: TIBStringField;
    IBQ_PAGDOCVINC: TIBStringField;
    IBQ_PAGTIPOES: TIBStringField;
    IBQ_PAGPERMISSAO: TIBStringField;
    IBQ_PAGMULTA: TFloatField;
    IBQ_PAGJUROSDIAS: TFloatField;
    IBQ_PAGCARENCIA: TIntegerField;
    IBQ_NumCodigo: TIBQuery;
    IBQ_NumCodigoXCOD_ID: TLargeintField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SPB_SairClick(Sender: TObject);
    procedure SPB_ConfirmaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EDT_TrocoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EDT_PedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EDT_ValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EDT_TrocoExit(Sender: TObject);
    procedure SPB_CancelarClick(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FRM_EntreBaixa2: TFRM_EntreBaixa2;

implementation

uses UNF_EntreBaixa, UNF_Funcoes, UNF_Entrega, UNF_Modulo;

{$R *.dfm}

procedure TFRM_EntreBaixa2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action          := caFree;
   Action          := caFree;
   FRM_EntreBaixa2 := nil;
end;

procedure TFRM_EntreBaixa2.FormShow(Sender: TObject);
begin

   EDT_Troco.SetFocus;
   EDT_Pedido.Text  := FRM_Entrega.EDT_Pedido.Text;

   EDT_Valor.Text   := FormatFloat('###,###,###0.00',(XvalorSUB));
   EDT_Troco.Text   := FormatFloat('###,###,###0.00',(XvalorSUB));

   DBLC_FormaPagto.KeyValue := FRM_Modulo.IBT_ParametrosFORMAPAGTO.Value;

   if FRM_Entrega.IBQ_ClienteMENSALISTAS_N.AsString = 'S' then
   begin
      IBQ_PAG.Close;
      IBQ_PAG.SQL.Clear;
      IBQ_PAG.SQL.Add('select first 1 * from FORMAPAGTO  ');
      IBQ_PAG.SQL.Add('WHERE TIPO = ''M''                ');
      IBQ_PAG.Open;

      DBLC_FormaPagto.KeyValue := IBQ_PAGCODIGO_ID.AsInteger;
   end;
end;

procedure TFRM_EntreBaixa2.SPB_SairClick(Sender: TObject);
begin
   Close;
end;

procedure TFRM_EntreBaixa2.SPB_ConfirmaClick(Sender: TObject);
begin

   //Acao := IntToStr(IBQ_NumCodigoXCOD_ID.AsInteger+1);

   Xresul      := StrToFloat(EDT_Troco.Text);
   Xtroco      := Xresul - XvalorSUB;
   Xcond_Pagto := DBLC_FormaPagto.Text;

   FRM_Modulo.IBT_FormaPagto.Locate('codigo_id', DBLC_FormaPagto.KeyValue,[]);

   // Bloquear Multiformas para baixa em grupo
   if (vBaixaGrupo and (FRM_Modulo.IBT_FormaPagtoMULTFORM.AsString = 'S')) then
   begin
      Mensagem('Impossivel usar Multiformas com baixa em grupo!!!');
      Exit;
   end;

   if FRM_Modulo.IBT_FormaPagtoMULTFORM.AsString = 'S' then
      MultiFormaEntrega(XvalorSUB,EDT_Pedido.Text)
   else
   begin
      with FRM_Entrega do
      begin
         CDS_CondPagto.Append;
         CDS_CondPagtoID_ENTREGA.AsInteger   := StrToInt(EDT_Pedido.Text);
         CDS_CondPagtoTIPO_PAGTO.AsInteger   := DBLC_FormaPagto.KeyValue;
         CDS_CondPagtoTOTAL.AsFloat          := StrToCurr(EDT_Valor.Text);
         CDS_CondPagtoHORA_PAGTO.AsString    := TimeToStr(Time);
         CDS_CondPagtoDATA_PAGTO.AsDateTime  := Now;
         CDS_CondPagtoDEVEDOR.AsFloat        := StrToCurr(EDT_Valor.Text);
         CDS_CondPagto.Post;
      end;
   end;


   xCancel     := 'N';                 
   Close;
end;

procedure TFRM_EntreBaixa2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {* mudar de um edit para outro com <ENTER> *}
   if Key = VK_RETURN then
   begin
      key := word(#0);
      Perform(WM_NEXTDLGCTL,0,0);
   end;
end;

procedure TFRM_EntreBaixa2.EDT_TrocoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    {* mudar de um edit para outro com <ENTER> *}
   if Key = VK_RETURN then
   begin
      key := word(#0);
      Perform(WM_NEXTDLGCTL,0,0);
   end;
end;

procedure TFRM_EntreBaixa2.EDT_PedidoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     {* mudar de um edit para outro com <ENTER> *}
   if Key = VK_RETURN then
   begin
      key := word(#0);
      Perform(WM_NEXTDLGCTL,0,0);
   end;
end;

procedure TFRM_EntreBaixa2.EDT_ValorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {* mudar de um edit para outro com <ENTER> *}
   if Key = VK_RETURN then
   begin
      key := word(#0);
      Perform(WM_NEXTDLGCTL,0,0);
   end;
end;

procedure TFRM_EntreBaixa2.EDT_TrocoExit(Sender: TObject);
begin
   EDT_Troco.Text  := FormatCurr('###,###,##0.00',StrToFloat(EDT_Troco.Text));
   DBLC_FormaPagto.SetFocus;
end;

procedure TFRM_EntreBaixa2.SPB_CancelarClick(Sender: TObject);
begin
   xCancel         := 'S';
   Close;
end;

end.
