unit UNF_Entrega;

interface

uses
  Windows, DB, Menus, IBQuery, IBCustomDataSet, IBTable, DBClient,
  WinSkinData, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, ComCtrls,
  DBCtrls, QuickRpt, QRCtrls, Controls, Classes, Forms, SysUtils, Variants, Dialogs,
  MaskUtils, Messages;

{  Graphics, DBCtrls, DBClient, Mask, Menus; }

type
  TFRM_Entrega = class(TForm)
    PNL_Entrega: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EDT_Nome: TEdit;
    Label3: TLabel;
    EDT_Endereco: TEdit;
    Label4: TLabel;
    EDT_Bairro: TEdit;
    Label6: TLabel;
    EDT_Cidade: TEdit;
    Label5: TLabel;
    EDT_Ponto: TEdit;
    Label7: TLabel;
    EDT_Pedido: TEdit;
    GroupBox2: TGroupBox;
    SPB_Sair: TSpeedButton;
    SPB_Confirma: TSpeedButton;
    QRShape1: TQRShape;
    DBLC_Produto: TDBLookupComboBox;
    Label8: TLabel;
    Label9: TLabel;
    EDT_Quantidade: TEdit;
    EDT_Preco: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    MMO_OBS: TMemo;
    BTN_Incluir: TButton;
    SkinData1: TSkinData;
    CDS_Produtos: TClientDataSet;
    DTS_Produtos: TDataSource;
    EDT_Telefone: TEdit;
    Label12: TLabel;
    QRShape2: TQRShape;
    DTS_Cliente: TDataSource;
    DBLC_Cliente: TDBLookupComboBox;
    Label13: TLabel;
    BTN_BuscaDados: TButton;
    IBQ_Cliente: TIBTable;
    IBQ_ClienteCODIGO_ID: TIntegerField;
    IBQ_ClienteNOMEFANTASIA: TIBStringField;
    IBQ_ClienteRAZAOSOCIAL: TIBStringField;
    IBQ_ClienteCNPJ: TIBStringField;
    IBQ_ClienteCPF: TIBStringField;
    IBQ_ClienteIE: TIBStringField;
    IBQ_ClienteRG: TIBStringField;
    IBQ_ClienteENDERECO: TIBStringField;
    IBQ_ClienteBAIRRO: TIBStringField;
    IBQ_ClienteCIDADE: TIBStringField;
    IBQ_ClienteTELEFONE: TIBStringField;
    IBQ_ClienteFAX: TIBStringField;
    IBQ_ClienteCONTATO: TIBStringField;
    IBQ_ClienteEMAIL: TIBStringField;
    IBQ_ClienteSITE: TIBStringField;
    IBQ_ClienteATIVO: TIBStringField;
    IBQ_ClienteCEP: TIBStringField;
    IBQ_ClienteUF: TIBStringField;
    IBQ_ClienteTIPOCLIFOR: TIBStringField;
    IBQ_ClienteMATRICULA: TIBStringField;
    IBT_Produtos1: TIBTable;
    DTS_Produtos1: TDataSource;
    IBT_Produtos1CODIGO_ID: TIntegerField;
    IBT_Produtos1PRODUTO: TIBStringField;
    IBT_Produtos1DESCRICAO: TIBStringField;
    IBT_Produtos1PRECO: TFloatField;
    IBT_Produtos1PRECOCUSTO: TFloatField;
    IBT_Produtos1GRUPO: TIntegerField;
    IBT_Produtos1ICMS_SN: TIBStringField;
    IBT_Produtos1TRIBUTAR: TIntegerField;
    IBT_Produtos1BALANCA: TIBStringField;
    IBT_Produtos1TARA: TFloatField;
    IBT_Produtos1UNIDADE: TIntegerField;
    IBT_Produtos1ATIVO: TIBStringField;
    IBT_Produtos1COMANDA: TIBStringField;
    IBT_Produtos1LOCAL_IMP: TIntegerField;
    IBT_Produtos1DESCONTO: TFloatField;
    IBT_Produtos1ACRESCIMO: TFloatField;
    IBT_Produtos1PROD_MTN: TIntegerField;
    IBT_Produtos1ESTOQUE: TIBStringField;
    IBT_Produtos1ESTNEGATIVO: TIBStringField;
    IBT_Produtos1ESTOQUE_FISICO: TFloatField;
    IBT_Produtos1ESTOQUE_VIRTUAL: TFloatField;
    IBT_Produtos1ESTOQUEMIN: TFloatField;
    IBT_Produtos1ESTOQUEMAX: TFloatField;
    IBT_Produtos1TEMPO: TIBStringField;
    IBT_Produtos1DIA_PROD: TIBStringField;
    CDS_ProdutosProduto: TIntegerField;
    CDS_ProdutosQuantidade: TFloatField;
    CDS_ProdutosPreco: TFloatField;
    CDS_ProdutosOBS: TMemoField;
    CDS_ProdutosOBS1: TStringField;
    BTN_Limpar: TButton;
    IBQ_Gravar: TIBQuery;
    IBQ_NumPedido: TIBQuery;
    IBQ_NumPedidoXCOD_ID: TLargeintField;
    SPB_Manutencao: TSpeedButton;
    CHK_Cliente: TCheckBox;
    BTN_Excluir: TButton;
    EDT_Codigo: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    DBLC_Entregador: TDBLookupComboBox;
    CHK_Baixa: TCheckBox;
    Label16: TLabel;
    Label17: TLabel;
    EDT_HREntrega: TEdit;
    DTP_DTEntrega: TDateTimePicker;
    SPB_Clientes: TSpeedButton;
    Label18: TLabel;
    EDT_Total: TEdit;
    CDS_ProdutosTotalProd: TFloatField;
    Panel1: TPanel;
    LBL_SubTotal: TLabel;
    BTN_Item: TButton;
    CDS_ProdutosDescricao: TStringField;
    DBG_Itens: TDBGrid;
    CDS_ProdutosMeio: TClientDataSet;
    CDS_ProdutosMeioProduto: TIntegerField;
    CDS_ProdutosMeioDescricao: TStringField;
    CDS_ProdutosMeioQuantidade: TFloatField;
    CDS_ProdutosMeioPreco: TFloatField;
    CDS_ProdutosMeioPrecoTotal: TCurrencyField;
    CDS_ProdutosMeioID: TIntegerField;
    CDS_ProdutosID: TIntegerField;
    EDT_CEP: TEdit;
    Label19: TLabel;
    BTN_BuscaCEP: TBitBtn;
    SPB_AtualizarClientes: TSpeedButton;
    DBG_Temp: TDBGrid;
    RDG_Montar: TRadioGroup;
    QRShape3: TQRShape;
    BTN_Montar: TButton;
    CDS_ProdutosMontar: TClientDataSet;
    DTS_ProdutosMontar: TDataSource;
    CDS_ProdutosMontarProduto: TIntegerField;
    CDS_ProdutosMontarDescricao: TStringField;
    CDS_ProdutosMontarQuantidade: TFloatField;
    CDS_ProdutosMontarPreco: TFloatField;
    CDS_ProdutosMontarOBS: TMemoField;
    CDS_ProdutosMontarOBS1: TStringField;
    CDS_ProdutosMontarID: TIntegerField;
    PPP_MPizza: TPopupMenu;
    Deletar1: TMenuItem;
    Limpar1: TMenuItem;
    EDT_Pedacos: TEdit;
    Label20: TLabel;
    IBQ_ClienteOBSERVACAO: TBlobField;
    IBT_Produtos1MONTAR: TIBStringField;
    DBLC_End: TDBLookupComboBox;
    IBQ_Aniver: TIBQuery;
    IBQ_AniverCODIGO_ID: TIntegerField;
    IBQ_AniverNOMEFANTASIA: TIBStringField;
    IBQ_AniverRAZAOSOCIAL: TIBStringField;
    IBQ_AniverCNPJ: TIBStringField;
    IBQ_AniverCPF: TIBStringField;
    IBQ_AniverIE: TIBStringField;
    IBQ_AniverRG: TIBStringField;
    IBQ_AniverENDERECO: TIBStringField;
    IBQ_AniverBAIRRO: TIBStringField;
    IBQ_AniverCIDADE: TIBStringField;
    IBQ_AniverTELEFONE: TIBStringField;
    IBQ_AniverFAX: TIBStringField;
    IBQ_AniverCONTATO: TIBStringField;
    IBQ_AniverEMAIL: TIBStringField;
    IBQ_AniverSITE: TIBStringField;
    IBQ_AniverATIVO: TIBStringField;
    IBQ_AniverCEP: TIBStringField;
    IBQ_AniverUF: TIBStringField;
    IBQ_AniverTIPOCLIFOR: TIBStringField;
    IBQ_AniverMATRICULA: TIBStringField;
    IBQ_AniverTP_PESSOAL: TIBStringField;
    IBQ_AniverCELULAR: TIBStringField;
    IBQ_AniverDATA_NASC: TDateField;
    IBQ_GravaCond: TIBQuery;
    DTS_CondPagto: TDataSource;
    IBQ_DelCondPagto: TIBQuery;
    IBQ_VoltaNumPedido: TIBQuery;
    IBQ_VoltaNumPedidoXVOLTA_ID: TLargeintField;
    CDS_Entrega: TClientDataSet;
    CDS_Item: TClientDataSet;
    CDS_ItemID_Entrega: TIntegerField;
    CDS_ItemID_Prod: TIntegerField;
    CDS_ItemQtd: TFloatField;
    CDS_ItemPreco: TFloatField;
    CDS_ItemDesconto: TFloatField;
    CDS_ItemDescricao: TStringField;
    CDS_EntregaNome: TStringField;
    CDS_EntregaID_Cliente: TIntegerField;
    CDS_EntregaID_Pedido: TIntegerField;
    CDS_EntregaCOK: TStringField;
    CDS_EntregaSeq_Fiscal: TIntegerField;
    EDT_Telefone1: TEdit;
    IBQ_AniverTEL_DELIVERY: TIBStringField;
    CDS_CondPagto: TClientDataSet;
    CDS_CondPagtoID_ENTREGA: TIntegerField;
    CDS_CondPagtoTIPO_PAGTO: TIntegerField;
    CDS_CondPagtoTOTAL: TCurrencyField;
    CDS_CondPagtoHORA_PAGTO: TStringField;
    CDS_CondPagtoDATA_PAGTO: TDateField;
    CDS_CondPagtoDEVEDOR: TCurrencyField;
    CDS_ProdutosMeioOBS1: TStringField;
    CDS_ProdutosMeioOBS: TStringField;
    Label21: TLabel;
    EDT_Numero: TEdit;
    IBQ_AniverNUMEROCASA: TIBStringField;
    IBQ_ClienteNUMEROCASA: TIBStringField;
    IBQ_ClienteTEL_DELIVERY: TIBStringField;
    IBQ_ClienteMENSALISTAS_N: TIBStringField;
    IBQ_AniverMENSALISTAS_N: TIBStringField;
    IBQ_GeraCodi: TIBQuery;
    IBQ_GeraCodiXCOD_ID: TLargeintField;
    IBQ_Convenio: TIBQuery;
    DTS_Convenio: TDataSource;
    Label22: TLabel;
    IBQ_ClienteCONVENIO: TIntegerField;
    DBLC_Convenio: TDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SPB_SairClick(Sender: TObject);
    procedure BTN_BuscaDadosClick(Sender: TObject);
//    procedure DBLC_TelefoneExit(Sender: TObject);
    procedure DBLC_ClienteExit(Sender: TObject);
    procedure DBLC_ClienteEnter(Sender: TObject);
    procedure DBLC_ProdutoExit(Sender: TObject);
    procedure BTN_IncluirClick(Sender: TObject);
    procedure BTN_LimparClick(Sender: TObject);
    procedure SPB_ConfirmaClick(Sender: TObject);
    procedure SPB_ManutencaoClick(Sender: TObject);
    procedure BTN_ExcluirClick(Sender: TObject);
    procedure EDT_CodigoChange(Sender: TObject);
    procedure SPB_ClientesClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBLC_ProdutoEnter(Sender: TObject);
    procedure EDT_QuantidadeChange(Sender: TObject);
    procedure CDS_ProdutosCalcFields(DataSet: TDataSet);
    procedure BTN_ItemClick(Sender: TObject);
    procedure BTN_BuscaCEPClick(Sender: TObject);
    procedure SPB_AtualizarClientesClick(Sender: TObject);
    procedure BTN_MontarClick(Sender: TObject);
    procedure Deletar1Click(Sender: TObject);
    procedure Limpar1Click(Sender: TObject);
    procedure DBLC_EndExit(Sender: TObject);
    procedure RDG_MontarExit(Sender: TObject);
    procedure EDT_CodigoExit(Sender: TObject);
    procedure EDT_QuantidadeExit(Sender: TObject);
    procedure MMO_OBSExit(Sender: TObject);
    procedure EDT_PrecoExit(Sender: TObject);
    procedure ClienteAniversario(ID_Cli: Integer);
    procedure Limpar;
    procedure FormCreate(Sender: TObject);
    procedure EDT_Telefone1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SubTotalE : Double;
           Id : integer;
  end;

var
                   FRM_Entrega : TFRM_Entrega;
   xModImp, xModGui, AtivaModo : String;
                   vBaixaGrupo : Boolean;

implementation

uses UNF_Funcoes, UNF_Mensagem, UNF_MensagemDeErro, UNF_Modulo, UNF_Pergunta,
     UNF_EntregaMa, UNF_EntreBaixa, UNF_Cliente, UNF_AgruparItens, UNF_Entrega3,
     UNF_MiniImpresora;

{$R *.dfm}

procedure TFRM_Entrega.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   //SkinData1.Active := False;
   Action      := caFree;
   Action      := caFree;
   FRM_Entrega := nil;
end;

procedure TFRM_Entrega.FormShow(Sender: TObject);
var
   xPedido : Integer;
begin
   //SkinData1.Active := True;
//   IBQ_Cliente.Close;
//   IBQ_Cliente.Open;
//
//   IBT_Produtos1.Close;
//   IBT_Produtos1.Open;
//
//   CDS_Produtos.Close;
//   CDS_Produtos.Open;
//
//   CDS_ProdutosMeio.Close;
//   CDS_ProdutosMeio.Open;
//
   { Num Pedido.... }
//n   IBQ_NumPedido.Close;
//n   IBQ_NumPedido.Open;

   IBQ_VoltaNumPedido.Close;
   IBQ_VoltaNumPedido.Open;

   xPedido := IBQ_VoltaNumPedidoXVOLTA_ID.Value;
   EDT_Pedido.Text := IntToStr(xPedido);

   DTP_DTEntrega.Date := Date;
   EDT_HREntrega.Text := FormatDateTime('hh:mm', now);

   DBLC_Entregador.KeyValue := FRM_Modulo.IBT_ParametrosFRENTEFUNC.Value;

   Id := 1;
end;

procedure TFRM_Entrega.SPB_SairClick(Sender: TObject);
begin
   Close;
end;

procedure TFRM_Entrega.BTN_BuscaDadosClick(Sender: TObject);
begin
   EDT_Nome.Text       := IBQ_ClienteNOMEFANTASIA.Value;
   EDT_Telefone.Text   := IBQ_ClienteTELEFONE.Value;
   EDT_Endereco.Text   := IBQ_ClienteENDERECO.Value;
   EDT_Numero.Text     := IBQ_ClienteNUMEROCASA.Value;
   EDT_Bairro.Text     := IBQ_ClienteBAIRRO.Value;
   EDT_Cidade.Text     := IBQ_ClienteCIDADE.Value;
   EDT_CEP.Text        := IBQ_ClienteCEP.Value;
//..............................................................................
   EDT_Ponto.Text      := IBQ_ClienteOBSERVACAO.Value;
//..............................................................................

   CHK_Cliente.Checked := True;

   //DBLC_Produto.SetFocus;

   if FRM_Modulo.IBT_ParametrosCLIENTEPERSO.Value = 'S' then
      EDT_Codigo.SetFocus
   else
      EDT_Nome.SetFocus;
end;

{// antigo busca por telefone
procedure TFRM_Entrega.DBLC_TelefoneExit(Sender: TObject);
begin
   //DBLC_Cliente.KeyValue := DBLC_Telefone.KeyValue;
   DBLC_End.KeyValue     := DBLC_Cliente.KeyValue;

   if FRM_Modulo.IBT_ParametrosCLIENTEPERSO.Value = 'S' then
      BTN_BuscaDadosClick(self);

   if DBLC_Cliente.KeyValue <> Null then
      ClienteAniversario(DBLC_Cliente.KeyValue);
end;}

procedure TFRM_Entrega.DBLC_ClienteExit(Sender: TObject);
begin
  IBQ_Cliente.Close;
  IBQ_Cliente.Open;

  // DBLC_Telefone.KeyValue := DBLC_Cliente.KeyValue;

   if DBLC_Cliente.KeyValue <> Null then
      ClienteAniversario(DBLC_Cliente.KeyValue);

   IBQ_Aniver.Close;
   IBQ_Aniver.SQL.Clear;
   IBQ_Aniver.SQL.Add('select * from CLIFOR');
   IBQ_Aniver.SQL.Add('where CODIGO_ID = :P_xxx');
   IBQ_Aniver.ParamByName('P_xxx').value   := DBLC_Cliente.KeyValue;
   IBQ_Aniver.Open;

   DBLC_Cliente.KeyValue  := IBQ_AniverCODIGO_ID.Value;
   DBLC_Convenio.KeyValue := IBQ_ClienteCONVENIO.Value;
   DBLC_End.KeyValue      := DBLC_Cliente.KeyValue;
   EDT_Telefone1.Text     := IBQ_AniverTEL_DELIVERY.AsString;

   if FRM_Modulo.IBT_ParametrosCLIENTEPERSO.Value = 'S' then
      BTN_BuscaDadosClick(self);
end;

procedure TFRM_Entrega.DBLC_ClienteEnter(Sender: TObject);
begin
   IBQ_Cliente.IndexName  := 'IDX_CLIFOR_NOMEFANTASIA';
end;

procedure TFRM_Entrega.DBLC_ProdutoExit(Sender: TObject);
begin
   EDT_Quantidade.Text  := '1';
   EDT_Preco.Text       := IBT_Produtos1PRECO.Text;
   EDT_Total.Text       := IBT_Produtos1PRECO.Text;

//..............................................................................
   if IBT_Produtos1MONTAR.Value = 'N' then
      RDG_Montar.ItemIndex := 1
   else
      RDG_Montar.ItemIndex := 0;
//..............................................................................
//   RDG_Montar.ItemIndex := 1;
end;

procedure TFRM_Entrega.BTN_IncluirClick(Sender: TObject);
begin
   if (Trim(EDT_Quantidade.Text) = '') then
      Exit;

   if (Trim(EDT_Preco.Text) = '') then
      Exit;

   if RDG_Montar.ItemIndex = 1 then
   begin
      CDS_Produtos.Append;

      CDS_ProdutosProduto.Value            := DBLC_Produto.KeyValue;
      CDS_ProdutosDescricao.Value          := DBLC_Produto.Text;
      CDS_ProdutosQuantidade.Value         := StrToFloat(EDT_Quantidade.Text);
      CDS_ProdutosPreco.Value              := StrToFloat(EDT_Preco.Text);
      CDS_ProdutosOBS.Value                := MMO_OBS.Text;
      CDS_ProdutosOBS1.Value               := MMO_OBS.Text;
      CDS_Produtos.Post;

      SubTotalE                            := SubTotalE + StrToFloat(EDT_Total.Text);
      LBL_SubTotal.Caption                 := FormatFloat('"Sub-Total.: R$ "###,###,###0.00', SubTotalE);

   end
   else if RDG_Montar.ItemIndex = 0 then
   begin
      CDS_ProdutosMontar.Append;

      CDS_ProdutosMontarProduto.Value      := DBLC_Produto.KeyValue;
      CDS_ProdutosMontarDescricao.Value    := DBLC_Produto.Text;
      CDS_ProdutosMontarQuantidade.Value   := StrToFloat(EDT_Quantidade.Text);
      CDS_ProdutosMontarPreco.Value        := StrToFloat(EDT_Preco.Text);
      CDS_ProdutosMontarOBS.Value          := MMO_OBS.Text;
      CDS_ProdutosMontarOBS1.Value         := MMO_OBS.Text;
      CDS_ProdutosMontar.Post;

   end
   else //if RDG_Montar.ItemIndex = 0 then
   begin
      CDS_ProdutosMontar.Append;

      CDS_ProdutosMontarProduto.Value      := DBLC_Produto.KeyValue;
      CDS_ProdutosMontarDescricao.Value    := DBLC_Produto.Text;
      CDS_ProdutosMontarQuantidade.Value   := StrToFloat(EDT_Quantidade.Text);
      CDS_ProdutosMontarPreco.Value        := 0;
      CDS_ProdutosMontarOBS.Value          := MMO_OBS.Text;
      CDS_ProdutosMontarOBS1.Value         := MMO_OBS.Text;
      CDS_ProdutosMontar.Post;

      EDT_Preco.Text                       := IntToStr(0);

   end;


//   SubTotalE                  := SubTotalE + StrToFloat(EDT_Total.Text);
//   LBL_SubTotal.Caption       := FormatFloat('"Sub-Total.: R$ "###,###,###0.00', SubTotalE);
//   XvalorSUB                  := SubTotalE;


   EDT_Codigo.Text            := '';
   DBLC_Produto.KeyValue      := Null;
   EDT_Quantidade.Text        := '';
   EDT_Preco.Text             := '';
   EDT_Total.Text             := '';
   RDG_Montar.ItemIndex       := 1;

   MMO_OBS.Lines.Clear;

   EDT_Codigo.SetFocus;
end;

procedure TFRM_Entrega.BTN_LimparClick(Sender: TObject);
begin
   CDS_Produtos.First;
   while not CDS_Produtos.Eof do
      CDS_Produtos.Delete;

   CDS_ProdutosMontar.First;
   while not CDS_ProdutosMontar.Eof do
      CDS_ProdutosMontar.Delete;

   CDS_ProdutosMeio.First;
   while not CDS_ProdutosMeio.Eof do
      CDS_ProdutosMeio.Delete;

   //Limpar
   EDT_Codigo.Text        := '';
   DBLC_Produto.KeyValue  := Null;
   EDT_Quantidade.Text    := '';
   EDT_Preco.Text         := '';
   EDT_Total.Text         := '';
   RDG_Montar.ItemIndex   := 1;

   SubTotalE              := 0;
   LBL_SubTotal.Caption   := FormatFloat('"Sub-Total.: R$ "###,###,###0.00', SubTotalE);

   MMO_OBS.Lines.Clear;
end;

procedure TFRM_Entrega.SPB_ConfirmaClick(Sender: TObject);
var
                xPedido : Integer;
                   Lst_ : TextFile;
         i_, y, va, vax : Integer;
                 xTotal : Double;
              qOperador : Integer;
   NomeCaixa, PeriodoCx : String;
              Descricao : String;
                   Conf : Integer;
                    arm : String;
             Impressora : String;
             Xtotal_P   : Double;
             promocao   : string;
             endereco   : string;
             _de,_ate   : Integer;

begin
   qOperador := 0;
   NomeCaixa := '';

   XvalorSUB   := SubTotalE;
   vBaixaGrupo := False;

   if FRM_EntreBaixa2 = nil then
      FRM_EntreBaixa2 := TFRM_EntreBaixa2.Create(Application);
   FRM_EntreBaixa2.ShowModal;

   if xCancel = 'N' then
   begin
      { Pesquisa }
      if FRM_Modulo.IBT_Usuario.Locate('login',vLogin,[]) then
          if FRM_Modulo.IBT_Funcionario.Locate('codigo_id',FRM_Modulo.IBT_UsuarioFUNCIONARIO.Value,[])then
          begin
             qOperador := FRM_Modulo.IBT_FuncionarioCODIGO_ID.Value;
             NomeCaixa := FRM_Modulo.IBT_FuncionarioDESCRICAO.Value;
             PeriodoCx := FRM_Modulo.IBT_FuncionarioDescPeriodo.Value;
          end;

      //{ Num Pedido.... }
      //IBQ_NumPedido.Close;
      //IBQ_NumPedido.Open;

      Acao := EDT_Pedido.Text;

      IBQ_GeraCodi.Close;
      IBQ_GeraCodi.Open;

      if Acao <> IBQ_GeraCodiXCOD_ID.AsString then
      begin
         Mensagem('Outra estação acabou de utilizar este número de pedido.'+#13+'O número desta foi alterado para: '+IBQ_GeraCodiXCOD_ID.AsString );
         //FRM_Entrega.EDT_Pedido.Text := IBQ_GeraCodiXCOD_ID.AsString;
         xPedido := StrToInt(IBQ_GeraCodiXCOD_ID.AsString);
      end
      else
         xPedido := StrToInt(EDT_Pedido.Text);

       //EDT_Pedido.Text := IntToStr(xPedido);

      { Entrega..... }
      IBQ_gravar.Close;
      IBQ_gravar.SQL.Clear;
      IBQ_gravar.SQL.Add('Insert into entrega                                   ');

      IBQ_gravar.SQL.Add('(                                                     ');
      IBQ_gravar.SQL.Add('CODIGO_ID,    NOME,        TELEFONE,     ENDERECO,    ');
      IBQ_gravar.SQL.Add('BAIRRO,       PONTO_REF,   DT_PEDIDO,    HR_PEDIDO,   ');
      IBQ_gravar.SQL.Add('FECHA_SN,     CLIENTE,     entregador,   dt_entrega,  ');
      IBQ_gravar.SQL.Add('hr_entrega,   CIDADE,      OPCAIXA,      FORMAPAGTO,  ');
      IBQ_gravar.SQL.Add('NUMEROCASA                                            ');
      IBQ_gravar.SQL.Add(')                                                     ');

      IBQ_gravar.SQL.Add('values                                                ');
      IBQ_gravar.SQL.Add('(                                                     ');
      IBQ_gravar.SQL.Add(':PCODIGO_ID,  :PNOME,      :PTELEFONE,   :PENDERECO,  ');
      IBQ_gravar.SQL.Add(':PBAIRRO,     :PPONTO_REF, :PDT_PEDIDO,  :PHR_PEDIDO, ');
      IBQ_gravar.SQL.Add(':PFECHA_SN,   :PCLIENTE,   :Pentregador, :Pdt_entrega,');
      IBQ_gravar.SQL.Add(':Phr_entrega, :PCIDADE,    :POPCAIXA,    :PFORMAPAGTO,');
      IBQ_gravar.SQL.Add(':PNUMEROCASA                                          ');
      IBQ_gravar.SQL.Add(')                                                     ');

      IBQ_GeraCodi.Close;
      IBQ_GeraCodi.Open;

      IBQ_gravar.ParamByName('PCODIGO_ID').Value  := xPedido;
      IBQ_gravar.ParamByName('PNOME').Value       := EDT_Nome.Text;
      IBQ_gravar.ParamByName('PTELEFONE').Value   := EDT_Telefone.Text;
      IBQ_gravar.ParamByName('PENDERECO').Value   := EDT_Endereco.Text;
      IBQ_gravar.ParamByName('PBAIRRO').Value     := EDT_Bairro.Text;
      IBQ_gravar.ParamByName('PNUMEROCASA').Value := EDT_Numero.Text;

      IBQ_gravar.ParamByName('PPONTO_REF').Value  := EDT_Ponto.Text;
      IBQ_gravar.ParamByName('PDT_PEDIDO').Value  := Date;
      IBQ_gravar.ParamByName('PHR_PEDIDO').Value  := Time;
      IBQ_gravar.ParamByName('PFECHA_SN').Value   := 'N';
      IBQ_gravar.ParamByName('PFORMAPAGTO').Value := CDS_CondPagtoTIPO_PAGTO.AsInteger;

      if CHK_Cliente.Checked then
         IBQ_gravar.ParamByName('PCLIENTE').Value    := DBLC_Cliente.KeyValue
      else
      begin
         if Pergunta('Confirma a Inclusão do cliente?') = 'S' then
         begin
            FRM_Modulo.IBT_Cliente.Append;
            FRM_Modulo.IBT_ClienteCODIGO_ID.Value     := 0;
            FRM_Modulo.IBT_ClienteNOMEFANTASIA.Value  := EDT_Nome.Text;
            FRM_Modulo.IBT_ClienteRAZAOSOCIAL.Value   := EDT_Nome.Text;
            FRM_Modulo.IBT_ClienteENDERECO.Value      := EDT_Endereco.Text;
            FRM_Modulo.IBT_ClienteNUMEROCASA.Value    := EDT_Numero.Text;
            FRM_Modulo.IBT_ClienteBAIRRO.Value        := EDT_Bairro.Text;
            FRM_Modulo.IBT_ClienteCIDADE.Value        := EDT_Cidade.Text;;
            FRM_Modulo.IBT_ClienteTELEFONE.Value      := EDT_Telefone.Text;;
            FRM_Modulo.IBT_ClienteATIVO.Value         := 'S';
            FRM_Modulo.IBT_ClienteCEP.Value           := EDT_CEP.Text;;
            FRM_Modulo.IBT_ClienteTIPOCLIFOR.Value    := 'C';
            FRM_Modulo.IBT_ClienteSALDO_CASTO.Value   := 0;
            FRM_Modulo.IBT_ClienteSALDO_LIMITE.Value  := 0;
            FRM_Modulo.IBT_ClienteTRAVAMENSAGEM.Value := 'N';
            FRM_Modulo.IBT_ClienteCONTRATO.Value      := 'S';
            FRM_Modulo.IBT_ClienteDTCADASTRO.Value    := Now;
            FRM_Modulo.IBT_Cliente.Post;

            FRM_Modulo.IBT_Cliente.Close;
            FRM_Modulo.IBT_Cliente.Open;

            IBQ_Cliente.Close;
            IBQ_Cliente.Open;

            IBQ_gravar.ParamByName('PCLIENTE').AsString := '';
         end
         else
            IBQ_gravar.ParamByName('PCLIENTE').AsString := '';
      end;

      IBQ_gravar.ParamByName('Pentregador').Value    := DBLC_Entregador.KeyValue;
      IBQ_gravar.ParamByName('Pdt_entrega').AsDate   := DTP_DTEntrega.Date;
      IBQ_gravar.ParamByName('Phr_entrega').AsTime   := StrToTime(EDT_HREntrega.Text);
      IBQ_gravar.ParamByName('PCIDADE').AsString     := EDT_Cidade.Text;
      IBQ_gravar.ParamByName('POPCAIXA').AsInteger   := qOperador;

      IBQ_gravar.ExecSQL;

      FRM_Modulo.IBTransaction1.CommitRetaining;

      { Entrega itens ..... }
      CDS_Produtos.First;
      while not CDS_Produtos.Eof do
      begin
         IBQ_gravar.Close;
         IBQ_gravar.SQL.Clear;
         IBQ_gravar.SQL.Add('Insert into ENTREGAPROD (CODIGO_ID, ENTRAGA, PRODUTO, QUANTIDADE, PRECO, DESCONTO, OBS, DESCRICAO)');
         IBQ_gravar.SQL.Add('values (:PCODIGO_ID, :PENTRAGA, :PPRODUTO, :PQUANTIDADE, :PPRECO, :PDESCONTO, :POBS, :PDESCRICAO)');
         IBQ_gravar.ParamByName('PCODIGO_ID').Value  := 0;
         IBQ_gravar.ParamByName('PENTRAGA').Value    := xPedido;
         IBQ_gravar.ParamByName('PPRODUTO').Value    := CDS_ProdutosProduto.Value;
         IBQ_gravar.ParamByName('PQUANTIDADE').Value := CDS_ProdutosQuantidade.Value;
         IBQ_gravar.ParamByName('PPRECO').Value      := CDS_ProdutosPreco.Value;
         IBQ_gravar.ParamByName('PDESCONTO').Value   := 0;
         IBQ_gravar.ParamByName('POBS').Value        := CDS_ProdutosOBS.Value;
         IBQ_gravar.ParamByName('PDESCRICAO').Value  := CDS_ProdutosDescricao.Value;
         IBQ_gravar.ExecSQL;

         FRM_Modulo.IBTransaction1.CommitRetaining;

         CDS_Produtos.Next;
      end;

      { Entrega Condição Pgto ..... }
      CDS_CondPagto.First;
      while not CDS_CondPagto.Eof do
      begin
         IBQ_GravaCond.Close;
         IBQ_GravaCond.SQL.Clear;
         IBQ_GravaCond.SQL.Add('Insert into ENTREGACOND                                ');
         IBQ_GravaCond.SQL.Add('(CODIGO_ID, ID_ENTREGA, TIPO_PAGTO, TOTAL, HORA_PAGTO, ');
         IBQ_GravaCond.SQL.Add(' DATA_PAGTO, DEVEDOR)                                  ');
         IBQ_GravaCond.SQL.Add('values                                                 ');
         IBQ_GravaCond.SQL.Add('(:P_CODIGO_ID, :P_ID_ENTREGA, :P_TIPO_PAGTO, :P_TOTAL, ');
         IBQ_GravaCond.SQL.Add(' :P_HORA_PAGTO, :P_DATA_PAGTO, :P_DEVEDOR)             ');
         IBQ_GravaCond.ParamByName('P_CODIGO_ID').AsInteger  := 0;
         IBQ_GravaCond.ParamByName('P_ID_ENTREGA').AsInteger := CDS_CondPagtoID_ENTREGA.AsInteger;
         IBQ_GravaCond.ParamByName('P_TIPO_PAGTO').AsInteger := CDS_CondPagtoTIPO_PAGTO.AsInteger;
         IBQ_GravaCond.ParamByName('P_TOTAL').AsFloat        := CDS_CondPagtoTOTAL.AsFloat;
         IBQ_GravaCond.ParamByName('P_HORA_PAGTO').AsString  := CDS_CondPagtoHORA_PAGTO.AsString;
         IBQ_GravaCond.ParamByName('P_DATA_PAGTO').AsDate    := CDS_CondPagtoDATA_PAGTO.AsDateTime;
         IBQ_GravaCond.ParamByName('P_DEVEDOR').AsFloat      := CDS_CondPagtoDEVEDOR.AsFloat;
         IBQ_GravaCond.ExecSQL;

         FRM_Modulo.IBTransaction1.CommitRetaining;

         CDS_CondPagto.Next;
      end;

      {Numero da Entrega}
      IBQ_NumPedido.Close;
      IBQ_NumPedido.Open;

      {Entrega....................................................................}
//      for y := 1 to 2 do
      for y := 1 to FRM_Modulo.IBT_ParametrosVIAS.Value do
      begin
         try
            //AssignFile(Lst_,xPorta);
            with FRM_Modulo do
            begin
               if IBT_Config.Locate('CODIGO_ID',IBT_ParametrosENTREGA_PACOTE.AsInteger,[]) then
               begin
                  Impressora  := IBT_ConfigPORT_IMPRI.AsString;
                  xModImp     := IBT_ConfigMODELO.AsString;
                  xModGui     := IBT_ConfigGUILHOTINA.AsString;
                  AtivaModo   := 'S';
               end
               else
               begin
                  Impressora  := xPorta;
                  AtivaModo   := 'N';
               end;

               if not (IBT_ParametrosPROMOCAO.IsNull) or ( trim(IBT_ParametrosPROMOCAO.AsString) = '') then
                  promocao := IBT_ParametrosPROMOCAO.AsString;

            end;

            AssignFile(Lst_,Impressora);

            ReWrite(Lst_);

            if FRM_Modulo.IBT_Parametrosimp_condencado_sn.AsString = 'S' then
               if (xTpImpPorta = 'EP') or (xTpImpPorta = 'IB4200') then
                  WriteLn(Lst_,CHR(27) + '!' + CHR(01));
         except
            Mensagem('Erro no caminho da Impressora! ' + Impressora + #13 + #10 +
                     'Para reimprimir, botão Manutenção -> Reimprimir');
            Limpar;
            BTN_LimparClick(self);

            xPedido            := IBQ_NumPedidoXCOD_ID.Value;
            EDT_Pedido.Text    := IntToStr(xPedido);
            DTP_DTEntrega.Date := Date;
            EDT_HREntrega.Text := FormatDateTime('hh:mm', now);
            EDT_Telefone1.SetFocus;

            Exit;
         end;

         Xtotal_P := 0;
         CDS_Produtos.First;
         while not CDS_Produtos.Eof do
         begin
            Xtotal_P :=  Xtotal_P + (CDS_ProdutosQuantidade.Value*CDS_ProdutosPreco.Value);
            CDS_Produtos.Next;
         end;



         WriteLn(Lst_,Repl('=',39));
         WriteLn(Lst_,'Pedido......: '   + copy(EDT_Pedido.Text,1,25));
         WriteLn(Lst_,'Nome........: '   + copy(EDT_Nome.Text,1,25));

         if EDT_Endereco.Text <> '' then
         begin
            endereco := EDT_Endereco.Text + ' ' + EDT_Numero.Text;
            WriteLn(Lst_,'Endereço.....: '   + copy(endereco,1,24));
            WriteLn(Lst_,copy(endereco,25,60));
         end;
         if EDT_Bairro.Text <> '' then
            WriteLn(Lst_,'Bairro......: '   + copy(EDT_Bairro.Text,1,25));

         if EDT_Cidade.Text <> '' then
            WriteLn(Lst_,'Cidade......: '   + copy(EDT_Cidade.Text,1,25));

         if EDT_Ponto.Text <> '' then
         begin
            WriteLn(Lst_,'Ponto....: '   + copy(EDT_Ponto.Text,1,28));

            if Length(EDT_Ponto.Text) > 29 then
            begin
               WriteLn(Lst_, copy(EDT_Ponto.Text,29,39));
            end;

            _de := 68;

            while Length(EDT_Ponto.Text) > _de do
            begin
               WriteLn(Lst_, copy(EDT_Ponto.Text,_de,39));

               _de := _de + 39;
            end;
            {if Length(EDT_Ponto.Text) > 68 then
            begin
               WriteLn(Lst_, copy(EDT_Ponto.Text,68,39));
            end;

            if Length(EDT_Ponto.Text) > 108 then
            begin
               WriteLn(Lst_, copy(EDT_Ponto.Text,108,39));
            end;}
         end;

         WriteLn(Lst_,'Telefone....: ' + copy(EDT_Telefone.Text,1,25));
         WriteLn(Lst_,'DT Entre....: ' + copy(DateToStr(DTP_DTEntrega.Date),1,25));
         WriteLn(Lst_,'HR Entre....: ' + copy(EDT_HREntrega.Text,1,25));
         WriteLn(Lst_,'Entregad....: ' + copy(DBLC_Entregador.Text,1,25));
//         WriteLn(Lst_,'Cond.Pagto..: ' + copy(Xcond_Pagto,1,29));

         CDS_CondPagto.First;
         while not CDS_CondPagto.Eof do
         begin
            FRM_Modulo.IBT_FormaPagto.Locate('CODIGO_ID',CDS_CondPagtoTIPO_PAGTO.AsInteger,[]);

            WriteLn(Lst_,'Cond.Pagto..: ' + copy(FRM_Modulo.IBT_FormaPagtoDESCRICAO.AsString,1,25));
            WriteLn(Lst_,'Valor ......: ' + copy(FormatFloat('R$ ###,###,##0.00',CDS_CondPagtoTOTAL.AsFloat),1,25));

            CDS_CondPagto.Next;
         end;

         WriteLn(Lst_,'Troco.......: ' + copy(FormatFloat('R$ ###,###,##0.00',Xtroco),1,25));
         Writeln(lst_,'Total Venda.: ' + copy(FormatFloat('R$ ###,###,##0.00',Xtotal_P),1,25));
         //WriteLn(Lst_,Repl('=',39));
         //WriteLn(Lst_);

         //PROMOCAO

         if not ( (FRM_Modulo.IBT_ParametrosPROMOCAO.IsNull) or ( trim(FRM_Modulo.IBT_ParametrosPROMOCAO.AsString) = '') ) then
         begin
         // WriteLn(Lst_,'========================================'));
            //WriteLn(Lst_);
            WriteLn(Lst_,'=============== PROMOCAO ==============');
            Writeln(lst_,promocao);
            WriteLn(Lst_,Repl('=',39));
            //WriteLn(Lst_);
         end
         else
         begin
            WriteLn(Lst_,Repl('=',39));
            //WriteLn(Lst_);

         end;

         xTotal := 0;
         CDS_Produtos.First;
         while not CDS_Produtos.Eof do
         begin

            vax       := 0;
            Descricao := '';

            if Length(CDS_ProdutosDescricao.AsString) < 40 then
               WriteLn(Lst_,copy(CDS_ProdutosDescricao.AsString+Repl(' ',40),1,40))
            else
            begin
               vax       := 0;
               Descricao := '';

               for va := 1 to Length(CDS_ProdutosDescricao.AsString) do
               begin
                  Inc(vax,1);

                  if vax = 39 then
                  begin
                     WriteLn(Lst_,copy(Descricao+Repl(' ',40),1,40));

                     vax       := 0;
                     Descricao := copy(CDS_ProdutosDescricao.AsString,va,1);
                  end
                  else
                     Descricao := Descricao + copy(CDS_ProdutosDescricao.AsString,va,1);
               end;

               if Descricao <> '' then
                  WriteLn(Lst_,copy(Descricao+Repl(' ',40),1,40));
            end;

            WriteLn(Lst_,FormatMaskText('!aaaaaaaaa;0; ',FormatFloat('#,##0.000',CDS_ProdutosQuantidade.Value))                                  + ' * ' +
                         FormatMaskText('!aaaaaaaaaaaaa;0; ',FormatCurr('##,###,##0.00',CDS_ProdutosPreco.Value))                                + ' ' +
                         FormatMaskText('!aaaaaaaaaaaaa;0; ',FormatCurr('##,###,##0.00',(CDS_ProdutosQuantidade.Value*CDS_ProdutosPreco.Value))));
            WriteLn(Lst_,Repl(' ',40));

            xTotal :=  xTotal + (CDS_ProdutosQuantidade.Value*CDS_ProdutosPreco.Value);

            CDS_Produtos.Next;
         end;

         { Total }
         WriteLn(Lst_,'                          '+'-------------');
         WriteLn(Lst_,'                   TOTAL->'+FormatMaskText('!aaaaaaaaaaaaa;0; ',FormatCurr('##,###,##0.00',xTotal)));

         WriteLn(Lst_);

         if FRM_Modulo.IBT_ParametrosCLIENTEPERSO.Value = 'N' then
         begin
            WriteLn(Lst_);
            WriteLn(Lst_,'    -------------------------------    ');
            WriteLn(Lst_,'              Assinatura               ');
         end;

         WriteLn(Lst_,Repl('=',39));

         { Ejetar Linhas }
          for i_ := 1 to FRM_Modulo.IBT_ParametrosNUMLINHAS.Value do
          begin
             WriteLn(Lst_);
          end;

          if FRM_Modulo.IBT_Parametrosimp_condencado_sn.AsString = 'S' then
             if (xTpImpPorta = 'EP') or (xTpImpPorta = 'IB4200') then
               WriteLn(Lst_,CHR(27) + '!' + CHR(00));

         // ejata linhas ou guilhotina o papel.......
         if AtivaModo = 'S' then
            WriteLn(Lst_,Picote(xModImp,xModGui))
         else
         begin
            for i_ := 1 to FRM_Modulo.IBT_ParametrosNUMLINHAS.Value do
            begin
               WriteLn(Lst_);
            end;
         end;

         CloseFile(Lst_);
      end;
      {...........................................................................}


      {Cozinha....................................................................}
      try
         with FRM_Modulo do
         begin
            if IBT_Config.Locate('CODIGO_ID',IBT_ParametrosENTREGA_COZINHA.AsInteger,[]) then
            begin
               Impressora  := IBT_ConfigPORT_IMPRI.AsString;
               xModImp     := IBT_ConfigMODELO.AsString;
               xModGui     := IBT_ConfigGUILHOTINA.AsString;
               AtivaModo   := 'S';
            end
            else
            begin
               Impressora  := xPorta;
               AtivaModo   := 'N';
            end;
         end;

         AssignFile(Lst_,Impressora);

         ReWrite(Lst_);

         if FRM_Modulo.IBT_Parametrosimp_condencado_sn.AsString = 'S' then
            if (xTpImpPorta = 'EP') or (xTpImpPorta = 'IB4200') then
                  WriteLn(Lst_,CHR(27) + '!' + CHR(01));
      except
         Exit;
      end;

      WriteLn(Lst_,Repl('=',39));
      WriteLn(Lst_,'Pedido......: ' + copy(EDT_Pedido.Text,1,29));
      WriteLn(Lst_,'Nome........: ' + copy(EDT_Nome.Text,1,29));
      WriteLn(Lst_,'DT Entre....: ' + copy(DateToStr(DTP_DTEntrega.Date),1,29));
      WriteLn(Lst_,'HR Entre....: ' + copy(EDT_HREntrega.Text,1,29));
      //WriteLn(Lst_,#14+'DT Entre: ' + copy(DateToStr(DTP_DTEntrega.Date),1,29));
      //WriteLn(Lst_,#14+'HR Entre: ' + copy(EDT_HREntrega.Text,1,29));

      CDS_CondPagto.First;
      while not CDS_CondPagto.Eof do
      begin
         FRM_Modulo.IBT_FormaPagto.Locate('CODIGO_ID',CDS_CondPagtoTIPO_PAGTO.AsInteger,[]);

         WriteLn(Lst_,'Cond.Pagto..: ' + copy(FRM_Modulo.IBT_FormaPagtoDESCRICAO.AsString,1,29));
         WriteLn(Lst_,'Valor ......: ' + copy(FormatFloat('R$ ###,###,##0.00',CDS_CondPagtoTOTAL.AsFloat),1,29));
         CDS_CondPagto.Next;
      end;

//      WriteLn(Lst_,'Cond.Pagto..: ' + copy(Xcond_Pagto,1,29));
      WriteLn(Lst_,'Troco.......: ' + copy(FormatFloat('R$ ###,###,##0.00',Xtroco),1,29));
      Writeln(lst_,'Total Venda.: ' + copy(FormatFloat('R$ ###,###,##0.00',xTotal),1,29));
      WriteLn(Lst_,Repl('=',39));
//      WriteLn(Lst_);

      CDS_Produtos.First;
      while not CDS_Produtos.Eof do
      begin
         //WriteLn(Lst_);
         if CDS_ProdutosID.IsNull then
         begin
            WriteLn(Lst_,FormatFloat('###,##0.000',CDS_ProdutosQuantidade.Value)+ ' - '+copy(CDS_ProdutosDescricao.AsString,1,29));

            if  trim(CDS_ProdutosOBS1.AsString) <> '' then
               WriteLn(Lst_,'Obs: '+copy(Trim(CDS_ProdutosOBS1.AsString),1,43))
            //else if  trim(CDS_ProdutosOBS.AsString) <> '' then
             //  WriteLn(Lst_,'Obs: '+copy(Trim(CDS_ProdutosOBS.AsString),1,43))
            else
               WriteLn(Lst_,'');

            WriteLn(Lst_,'.......................................');
         end;

         CDS_Produtos.Next;
      end;

      {Imprimir Metade}
      CDS_ProdutosMeio.First;
      Conf := CDS_ProdutosMeioID.Value;

      while not CDS_ProdutosMeio.Eof do
      begin
         WriteLn(Lst_,FormatFloat('###,##0.000',CDS_ProdutosMeioQuantidade.Value)+ ' - '+copy(CDS_ProdutosMeioDescricao.AsString,1,29));

         if  trim(CDS_ProdutosMeioOBS.AsString) <> '' then
            WriteLn(Lst_,'Obs: '+ copy(CDS_ProdutosMeioOBS.AsString, 1, 43))
         else
            WriteLn(Lst_,'');

         if CDS_Produtos.Locate('id',CDS_ProdutosMeioID.Value,[]) then
            arm := CDS_ProdutosOBS1.AsString;

         CDS_ProdutosMeio.Next;

         if Conf <> CDS_ProdutosMeioID.Value then
         begin
            Conf := CDS_ProdutosMeioID.Value;
            //WriteLn(Lst_,copy(arm,1,40));
            WriteLn(Lst_,'.......................................');
            arm := '';
         end;
      end;

      if arm <> '' then
      begin
//         WriteLn(Lst_,copy(arm,1,40));
         WriteLn(Lst_,'.......................................');
      end;

      //WriteLn(Lst_,Repl('=',39));

      { Ejetar Linhas }
//      for i_ := 1 to 7 do

      if FRM_Modulo.IBT_Parametrosimp_condencado_sn.AsString = 'S' then
         if (xTpImpPorta = 'EP') or (xTpImpPorta = 'IB4200') then
               WriteLn(Lst_,CHR(27) + '!' + CHR(00));

      if AtivaModo = 'S' then
         WriteLn(Lst_,Picote(xModImp,xModGui))
      else
      begin
         for i_ := 1 to FRM_Modulo.IBT_ParametrosNUMLINHAS.Value do
         begin
            WriteLn(Lst_);
         end;
      end;

      CloseFile(Lst_);
      {...........................................................................}


      {Controle...................................................................}
      try
         with FRM_Modulo do
         begin
            if IBT_Config.Locate('CODIGO_ID',IBT_ParametrosENTREGA_PACOTE.AsInteger,[]) then
            begin
               Impressora  := IBT_ConfigPORT_IMPRI.AsString;
               xModImp     := IBT_ConfigMODELO.AsString;
               xModGui     := IBT_ConfigGUILHOTINA.AsString;
               AtivaModo   := 'S';
            end
            else
            begin
               Impressora  := xPorta;
               AtivaModo   := 'N';
            end;
         end;

         AssignFile(Lst_,Impressora);

         ReWrite(Lst_);

         if FRM_Modulo.IBT_Parametrosimp_condencado_sn.AsString = 'S' then
            if (xTpImpPorta = 'EP') or (xTpImpPorta = 'IB4200') then
               WriteLn(Lst_,CHR(27) + '!' + CHR(01));
               
      except
         Exit;
      end;

      WriteLn(Lst_,Repl('=',39));
      WriteLn(Lst_,'Pedido......: ' + copy(EDT_Pedido.Text,1,29));
      WriteLn(Lst_,'Nome........: ' + copy(EDT_Nome.Text,1,29));
      WriteLn(Lst_,'DT Entre....: ' + copy(DateToStr(DTP_DTEntrega.Date),1,29));
      WriteLn(Lst_,'HR Entre....: ' + copy(EDT_HREntrega.Text,1,29));
      WriteLn(Lst_,'Entregad....: ' + copy(DBLC_Entregador.Text,1,29));

      CDS_CondPagto.First;
      while not CDS_CondPagto.Eof do
      begin
         FRM_Modulo.IBT_FormaPagto.Locate('CODIGO_ID',CDS_CondPagtoTIPO_PAGTO.AsInteger,[]);

         WriteLn(Lst_,'Cond.Pagto..: ' + copy(FRM_Modulo.IBT_FormaPagtoDESCRICAO.AsString,1,29));
         WriteLn(Lst_,'Valor ......: ' + copy(FormatFloat('R$ ###,###,##0.00',CDS_CondPagtoTOTAL.AsFloat),1,29));
         CDS_CondPagto.Next;
      end;

//      WriteLn(Lst_,'Cond.Pagto..: ' + copy(Xcond_Pagto,1,29));
      WriteLn(Lst_,'Troco.......: ' + copy(FormatFloat('R$ ###,###,##0.00',Xtroco),1,29));
      Writeln(lst_,'Total Venda.: ' + copy(FormatFloat('R$ ###,###,##0.00',xTotal),1,29));
      WriteLn(Lst_,Repl('=',39));

      xTotal := 0;
      CDS_Produtos.First;
      while not CDS_Produtos.Eof do
      begin
         xTotal :=  xTotal + (CDS_ProdutosQuantidade.Value*CDS_ProdutosPreco.Value);

         CDS_Produtos.Next;
      end;

     { Total }
      WriteLn(Lst_,'                   TOTAL->'+FormatMaskText('!aaaaaaaaaaaaa;0; ',FormatCurr('##,###,##0.00',xTotal)));

      WriteLn(Lst_,Repl('=',39));

      { Ejetar Linhas }
//      for i_ := 1 to 7 do

      if FRM_Modulo.IBT_Parametrosimp_condencado_sn.AsString = 'S' then
         if (xTpImpPorta = 'EP') or (xTpImpPorta = 'IB4200') then
               WriteLn(Lst_,CHR(27) + '!' + CHR(00));

      if AtivaModo = 'S' then
         WriteLn(Lst_,Picote(xModImp,xModGui))
      else
      begin
         for i_ := 1 to FRM_Modulo.IBT_ParametrosNUMLINHAS.Value do
         begin
            WriteLn(Lst_);
         end;
      end;

      CloseFile(Lst_);
      {...........................................................................}

      if CHK_Baixa.Checked then
      begin
         vBaixaGrupo := False;
         xEntregaPD  := StrToInt(EDT_Pedido.Text);

         if FRM_EntreBaixa = nil then
            FRM_EntreBaixa := TFRM_EntreBaixa.Create(Application);

         FRM_EntreBaixa.ShowModal;

         xEntregaPD := 0;
      end;

      Limpar;
      BTN_LimparClick(Self);

      {Foi retirado daqui por causa da impressora nao fiscal
      motivo nao mudava a Generator por causa da impressora dava erro}
      { Num Pedido.... }
//      IBQ_NumPedido.Close;
//      IBQ_NumPedido.Open;

      xPedido            := IBQ_NumPedidoXCOD_ID.Value;
      EDT_Pedido.Text    := IntToStr(xPedido);
      DTP_DTEntrega.Date := Date;
      EDT_HREntrega.Text := FormatDateTime('hh:mm', now);
      EDT_Telefone1.SetFocus;
   end
   else
   begin
      abort;
      EDT_Codigo.SetFocus;
   end;
   //Close;
end;

procedure TFRM_Entrega.SPB_ManutencaoClick(Sender: TObject);
begin
   if FRM_EntregaMa = nil then
      FRM_EntregaMa := TFRM_EntregaMa.Create(Application);

   FRM_EntregaMa.ShowModal;
end;

procedure TFRM_Entrega.BTN_ExcluirClick(Sender: TObject);
begin
   if CDS_Produtos.RecordCount = 0 then
      Exit;

   if not CDS_ProdutosID.IsNull then
   begin
      CDS_ProdutosMeio.First;
      while not CDS_ProdutosMeio.Eof do
      begin
         if CDS_ProdutosMeioID.Value = CDS_ProdutosID.Value then
            CDS_ProdutosMeio.Delete
         else
         if CDS_ProdutosMeioID.Value <> CDS_ProdutosID.Value then
            CDS_ProdutosMeio.Next;
      end;
   end;

   SubTotalE              := SubTotalE - (CDS_ProdutosQuantidade.AsFloat*CDS_ProdutosPreco.AsFloat);
   LBL_SubTotal.Caption   := FormatFloat('"Sub-Total.: R$ "###,###,###0.00', SubTotalE);

   CDS_Produtos.Delete;
end;

procedure TFRM_Entrega.EDT_CodigoChange(Sender: TObject);
begin
   DBLC_Produto.KeyValue := Null;

   if EDT_Codigo.Text <> '' then
      //if IBT_Produtos1.Locate('produto',IntToStr(StrToInt(EDT_Codigo.Text)),[]) then
      if IBT_Produtos1.Locate('produto',EDT_Codigo.Text,[]) then
         DBLC_Produto.KeyValue := IBT_Produtos1CODIGO_ID.Value;
end;

procedure TFRM_Entrega.SPB_ClientesClick(Sender: TObject);
begin
   if FRM_Cliente = nil then
      FRM_Cliente := TFRM_Cliente.Create(Application);

   FRM_Cliente.Show;
end;

procedure TFRM_Entrega.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   {* mudar de um edit para outro com <ENTER> *}
   if Key = VK_RETURN then
   begin
      key := word(#0);
      Perform(WM_NEXTDLGCTL,0,0);
   end;
end;

procedure TFRM_Entrega.FormKeyPress(Sender: TObject; var Key: Char);
begin
//   if key = #43 then
//      BTN_IncluirClick(Self);
//
//   if key = #45 then
//      BTN_ExcluirClick(Self);
end;

procedure TFRM_Entrega.DBLC_ProdutoEnter(Sender: TObject);
begin
  IBT_Produtos1.IndexFieldNames := 'DESCRICAO';
end;

procedure TFRM_Entrega.EDT_QuantidadeChange(Sender: TObject);
begin
   try
      if (ApenasNumerosStr(EDT_Quantidade.Text) <> '') and
         (ApenasNumerosStr(EDT_Preco.Text) <> '') then
         EDT_Total.Text := FormatFloat('###,###,###0.00', (StrToFloat(EDT_Quantidade.Text)*StrToFloat(EDT_Preco.Text)));
   except
      EDT_Total.Text := '0,00';
   end;
End;

procedure TFRM_Entrega.CDS_ProdutosCalcFields(DataSet: TDataSet);
begin
   CDS_ProdutosTotalProd.AsFloat := CDS_ProdutosQuantidade.AsFloat*CDS_ProdutosPreco.AsFloat;
end;

procedure TFRM_Entrega.BTN_ItemClick(Sender: TObject);
begin
   if FRM_AgruparItens = nil then
      FRM_AgruparItens := TFRM_AgruparItens.Create(Application);
   FRM_AgruparItens.ShowModal;
end;

procedure TFRM_Entrega.BTN_BuscaCEPClick(Sender: TObject);
begin
   if ApenasNumerosStr(EDT_Cep.Text) = '' then
      Exit;

   if not BuscaCEPBRASIL(EDT_Cep.Text) then
   begin
      EDT_Endereco.Text  := '';
      EDT_Bairro.Text    := '';
      EDT_Cidade.Text    := '';
      //DBCB_UF.Text       := '';
   end
   else
   begin
      EDT_Endereco.Text  := EndBrasil;
      EDT_Bairro.Text    := BairroBrasil;
      EDT_Cidade.Text    := CidadeBrasil;
      //DBCB_UF.Text       := UFBrasil;
   end;

   EDT_Endereco.SetFocus;
end;

procedure TFRM_Entrega.SPB_AtualizarClientesClick(Sender: TObject);
begin
   IBQ_Cliente.Close;
   IBQ_Cliente.Open;
end;

procedure TFRM_Entrega.BTN_MontarClick(Sender: TObject);
var
   Descricao : String;
      xTotal : Double;
      vMemos : String;                 
begin
   if CDS_ProdutosMontar.RecordCount <= 0 then
   begin
      Mensagem('Não á produtos para montar !!!');
      Exit;
   end;

   Descricao := '';
   xTotal    := 0;
   vMemos    := '';

   CDS_ProdutosMontar.First;
   while not CDS_ProdutosMontar.Eof do
   begin
//...aqui..juntava..os..produto..na..mesma..linha...............................
      if CDS_ProdutosMontar.RecNo = 1 then                                                                                            
      begin                                                                                                                           
         Descricao :=  CDS_ProdutosMontarQuantidade.AsString + ' - ' + CDS_ProdutosMontarDescricao.Value;
         vMemos    := vMemos + CDS_ProdutosMontarOBS.AsString;
      end
      else if CDS_ProdutosMontar.RecNo > 1 then
      begin
         Descricao := Descricao + ' | ' + CDS_ProdutosMontarQuantidade.AsString + ' - ' + CDS_ProdutosMontarDescricao.Value;
         vMemos    := vMemos + #13 {+ #10} + CDS_ProdutosMontarOBS.AsString;
      end;

      if FRM_Modulo.IBT_ParametrosENTREGA_CALCULO.AsString = '1' then
      begin
         if xTotal < CDS_ProdutosMontarPreco.Value then
            xTotal := CDS_ProdutosMontarPreco.Value;
      end
      else
      if FRM_Modulo.IBT_ParametrosENTREGA_CALCULO.AsString = '2' then
      begin
         xTotal := xTotal + ((CDS_ProdutosMontarPreco.AsFloat/StrToFloat(EDT_Pedacos.Text))*(CDS_ProdutosMontarQuantidade.AsFloat));
      end;

      CDS_ProdutosMeio.Append;
      CDS_ProdutosMeioID.Value         := FRM_Entrega.Id;
      CDS_ProdutosMeioProduto.Value    := 0;
      CDS_ProdutosMeioDescricao.Value  := CDS_ProdutosMontarDescricao.Value;
      CDS_ProdutosMeioQuantidade.Value := StrToFloat(CDS_ProdutosMontarQuantidade.AsString);
      CDS_ProdutosMeioPreco.Value      := xTotal;
      CDS_ProdutosMeioOBS1.Value       := CDS_ProdutosMontarOBS1.AsString;
      CDS_ProdutosMeioOBS.Value        := CDS_ProdutosMontarOBS.AsString;
      CDS_ProdutosMeio.Post;

      CDS_ProdutosMontar.Next;

   end;

   CDS_Produtos.Append;
   CDS_ProdutosID.Value         := FRM_Entrega.Id;
   CDS_ProdutosProduto.Value    := 0;
   CDS_ProdutosDescricao.Value  := Descricao;
   CDS_ProdutosQuantidade.Value := 1;
   CDS_ProdutosPreco.Value      := xTotal;
   CDS_ProdutosOBS.Value        := vMemos;
   CDS_ProdutosOBS1.Value       := vMemos;
   CDS_Produtos.Post;

//   end;
//..............................................................................

   SubTotalE  := SubTotalE + xTotal;
   LBL_SubTotal.Caption := FormatFloat('"Sub-Total.: R$ "###,###,###0.00', SubTotalE);

//   XvalorSUB            := SubTotalE;

   inc(FRM_Entrega.Id,1);

   CDS_ProdutosMontar.First;
   while not CDS_ProdutosMontar.Eof do
      CDS_ProdutosMontar.Delete;   
end;

procedure TFRM_Entrega.Deletar1Click(Sender: TObject);
begin
   if CDS_ProdutosMontar.RecordCount = 0 then
      Exit;

   CDS_ProdutosMontar.Delete;
end;

procedure TFRM_Entrega.Limpar1Click(Sender: TObject);
begin
   Screen.Cursor := crSQLWait;

   CDS_ProdutosMontar.First;
   while not CDS_ProdutosMontar.Eof do
      CDS_ProdutosMontar.Delete;

   Screen.Cursor := crDefault;
end;

procedure TFRM_Entrega.DBLC_EndExit(Sender: TObject);
begin
    DBLC_Cliente.KeyValue  := DBLC_End.KeyValue;
    DBLC_End.KeyValue     := DBLC_Cliente.KeyValue;

    if FRM_Modulo.IBT_ParametrosCLIENTEPERSO.Value = 'S' then
      BTN_BuscaDadosClick(self);

    if DBLC_Cliente.KeyValue <> Null then
       ClienteAniversario(DBLC_Cliente.KeyValue);
end;

procedure TFRM_Entrega.RDG_MontarExit(Sender: TObject);
begin
    BTN_Incluir.SetFocus;
end;

procedure TFRM_Entrega.EDT_CodigoExit(Sender: TObject);
begin
   if FRM_Modulo.IBT_ParametrosCLIENTEPERSO.Value = 'S' then
      RDG_Montar.TabOrder := 3;

   EDT_Quantidade.Text  := '1';
   EDT_Preco.Text       := IBT_Produtos1PRECO.Text;
   EDT_Total.Text       := IBT_Produtos1PRECO.Text;

//..............................................................................
   if IBT_Produtos1MONTAR.Value = 'N' then
      RDG_Montar.ItemIndex := 1
   else
      RDG_Montar.ItemIndex := 0;
//..............................................................................
//   RDG_Montar.ItemIndex := 1;
end;

procedure TFRM_Entrega.EDT_QuantidadeExit(Sender: TObject);
begin
   BTN_Incluir.SetFocus;
end;

procedure TFRM_Entrega.MMO_OBSExit(Sender: TObject);
begin
   EDT_Preco.SetFocus;
end;

procedure TFRM_Entrega.EDT_PrecoExit(Sender: TObject);
begin
   RDG_Montar.SetFocus;
end;

procedure TFRM_Entrega.ClienteAniversario(ID_Cli : Integer);
begin
   IBQ_Aniver.Close;
   IBQ_Aniver.SQL.Clear;
   IBQ_Aniver.SQL.Add('select * from CLIFOR                                                     ');
   IBQ_Aniver.SQL.Add('Where Codigo_id = :P_Codigo                                              ');
   IBQ_Aniver.SQL.Add('    and EXTRACT(day FROM data_nasc)   = EXTRACT(day FROM Current_date)   ');
   IBQ_Aniver.SQL.Add('    and EXTRACT(month FROM data_nasc) = EXTRACT(month FROM Current_date) ');
   IBQ_Aniver.SQL.Add('order by NOMEFANTASIA                                                    ');
   IBQ_Aniver.ParamByName('P_Codigo').AsInteger    := ID_Cli;
   IBQ_Aniver.Open;

   if IBQ_AniverNOMEFANTASIA.AsString <> '' then
      Mensagem(' :.Aniversariante.: ' +#13+#10+
                                       #13+#10+
               IBQ_AniverRAZAOSOCIAL.AsString);

end;

procedure TFRM_Entrega.Limpar;
begin
   { Limpar a tela }
   CDS_CondPagto.EmptyDataSet;

//....UTILIZADO NO CUPOM FISCAL.................................................
   CDS_Entrega.EmptyDataSet;
   CDS_Item.EmptyDataSet;
   vCli         := '';
   vEnd         := '';
   vBairro      := '';
   vCidade      := '';
   vUf          := '';
   vCpf         := '';
//..............................................................................

   //DBLC_Telefone.KeyValue   := Null;
   EDT_Telefone1.Text       := '';
   DBLC_Cliente.KeyValue    := Null;
   DBLC_End.KeyValue        := Null;
   EDT_Nome.Text            := '';
   EDT_Telefone.Text        := '';
   EDT_Endereco.Text        := '';
   EDT_CEP.Text             := '';
   EDT_Bairro.Text          := '';
   EDT_Cidade.Text          := '';
   EDT_Ponto.Text           := '';
   EDT_HREntrega.Text       := '';
   EDT_Numero.Text          := '';
   CHK_Cliente.Checked      := False;

   //--------------------------------
// DBLC_Entregador.KeyValue := Null;
   CHK_Baixa.Checked        := False;
   //--------------------------------

   EDT_Codigo.Text          := '';
   DBLC_Produto.KeyValue    := Null;
   EDT_Quantidade.Text      := '';
   EDT_Preco.Text           := '';
   EDT_Total.Text           := '';
   RDG_Montar.ItemIndex     := 1;

   SubTotalE                := 0;
   LBL_SubTotal.Caption     := FormatFloat('"Sub-Total.: R$ "###,###,###0.00', SubTotalE);
   XvalorSUB                := 0;
   Xtroco                   := 0;

   MMO_OBS.Lines.Clear;

end;

procedure TFRM_Entrega.FormCreate(Sender: TObject);
begin
   //SkinData1.Active := True;
   IBQ_Cliente.Close;
   IBQ_Cliente.Open;

   IBT_Produtos1.Close;
   IBT_Produtos1.Open;

   CDS_Produtos.Close;
   CDS_Produtos.Open;

   CDS_ProdutosMeio.Close;
   CDS_ProdutosMeio.Open;
end;

{Novo modulo de busca por telefone}
procedure TFRM_Entrega.EDT_Telefone1Exit(Sender: TObject);
begin
  IBQ_Aniver.Close;
  IBQ_Aniver.SQL.Clear;
  IBQ_Aniver.SQL.Add('select * from CLIFOR');
  IBQ_Aniver.SQL.Add('where tel_delivery = :P_xxx');
  IBQ_Aniver.SQL.Add('or celular = :P_xxx');
  IBQ_Aniver.ParamByName('P_xxx').value   := EDT_Telefone1.Text;
  IBQ_Aniver.Open;

  DBLC_Cliente.KeyValue := IBQ_AniverCODIGO_ID.Value;
  DBLC_End.KeyValue     := DBLC_Cliente.KeyValue;

  if FRM_Modulo.IBT_ParametrosCLIENTEPERSO.Value = 'S' then
     BTN_BuscaDadosClick(self);

  if DBLC_Cliente.KeyValue <> Null then
     ClienteAniversario(DBLC_Cliente.KeyValue);


  BTN_BuscaDados.Click;


end;

initialization
  vBaixaGrupo := False;

end.
