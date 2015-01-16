unit UNF_Entrega2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, IBCustomDataSet, IBQuery, Buttons, MaskUtils,
  Grids, DBGrids, QuickRpt, QRCtrls, DBCtrls, WinSkinData, DBClient, Mask,
  IBTable, ComCtrls;

type
  TFRM_Entrega2 = class(TForm)
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
    DBLC_Telefone: TDBLookupComboBox;
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
    BTN_Atualizar: TBitBtn;
    Label18: TLabel;
    EDT_Total: TEdit;
    CDS_ProdutosTotalProd: TFloatField;
    Panel1: TPanel;
    LBL_SubTotal: TLabel;
    BTN_Item: TButton;
    CDS_ProdutosDescricao: TStringField;
    DBGrid1: TDBGrid;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SPB_SairClick(Sender: TObject);
    procedure BTN_BuscaDadosClick(Sender: TObject);
    procedure DBLC_TelefoneExit(Sender: TObject);
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
    procedure BTN_AtualizarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBLC_ProdutoEnter(Sender: TObject);
    procedure EDT_QuantidadeChange(Sender: TObject);
    procedure CDS_ProdutosCalcFields(DataSet: TDataSet);
    procedure BTN_ItemClick(Sender: TObject);
    procedure BTN_BuscaCEPClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SubTotalE: Double;
    Id : integer;
  end;

var
  FRM_Entrega2: TFRM_Entrega2;

implementation

uses UNF_Funcoes, UNF_Mensagem, UNF_MensagemDeErro, UNF_Modulo,
     UNF_Pergunta, UNF_EntregaMa, UNF_EntreBaixa, UNF_Cliente,
  UNF_AgruparItens;

{$R *.dfm}

procedure TFRM_Entrega2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   //SkinData1.Active := False;
   Action       := caFree;
   Action       := caFree;
   FRM_Entrega2 := nil;
end;

procedure TFRM_Entrega2.FormShow(Sender: TObject);
var
   xPedido : Integer;
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

   { Num Pedido.... }
   IBQ_NumPedido.Close;
   IBQ_NumPedido.Open;

   xPedido := IBQ_NumPedidoXCOD_ID.Value;

   EDT_Pedido.Text := IntToStr(xPedido);

   DTP_DTEntrega.Date := Date;
   EDT_HREntrega.Text := FormatDateTime('hh:mm', now);

   Id := 1;
end;

procedure TFRM_Entrega2.SPB_SairClick(Sender: TObject);
begin
   Close;
end;

procedure TFRM_Entrega2.BTN_BuscaDadosClick(Sender: TObject);
begin
   EDT_Nome.Text       := IBQ_ClienteNOMEFANTASIA.Value;
   EDT_Telefone.Text   := IBQ_ClienteTELEFONE.Value;
   EDT_Endereco.Text   := IBQ_ClienteENDERECO.Value;
   EDT_Bairro.Text     := IBQ_ClienteBAIRRO.Value;
   EDT_Cidade.Text     := IBQ_ClienteCIDADE.Value;

   CHK_Cliente.Checked := True;

   //DBLC_Produto.SetFocus;

   EDT_Codigo.SetFocus;
end;

procedure TFRM_Entrega2.DBLC_TelefoneExit(Sender: TObject);
begin
   DBLC_Cliente.KeyValue := DBLC_Telefone.KeyValue;
end;

procedure TFRM_Entrega2.DBLC_ClienteExit(Sender: TObject);
begin
   DBLC_Telefone.KeyValue := DBLC_Cliente.KeyValue;
end;

procedure TFRM_Entrega2.DBLC_ClienteEnter(Sender: TObject);
begin
   IBQ_Cliente.IndexName  := 'IDX_CLIFOR_NOMEFANTASIA';
end;

procedure TFRM_Entrega2.DBLC_ProdutoExit(Sender: TObject);
begin
   EDT_Quantidade.Text := '1';
   EDT_Preco.Text      := IBT_Produtos1PRECO.Text;
   EDT_Total.Text      := IBT_Produtos1PRECO.Text;
end;

procedure TFRM_Entrega2.BTN_IncluirClick(Sender: TObject);
begin
   if (Trim(EDT_Quantidade.Text) = '') then
      Exit;

   if (Trim(EDT_Preco.Text) = '') then
      Exit;

   CDS_Produtos.Append;
   CDS_ProdutosProduto.Value    := DBLC_Produto.KeyValue;
   CDS_ProdutosDescricao.Value  := DBLC_Produto.Text;
   CDS_ProdutosQuantidade.Value := StrToFloat(EDT_Quantidade.Text);
   CDS_ProdutosPreco.Value      := StrToFloat(EDT_Preco.Text);
   CDS_ProdutosOBS.Value        := MMO_OBS.Text;
   CDS_ProdutosOBS1.Value       := MMO_OBS.Text;
   CDS_Produtos.Post;

   SubTotalE              := SubTotalE + StrToFloat(EDT_Total.Text);
   LBL_SubTotal.Caption   := FormatFloat('"Sub-Total.: R$ "###,###,###0.00', SubTotalE);

   EDT_Codigo.Text        := '';
   DBLC_Produto.KeyValue  := Null;
   EDT_Quantidade.Text    := '';
   EDT_Preco.Text         := '';
   EDT_Total.Text         := '';

   MMO_OBS.Lines.Clear;

   EDT_Codigo.SetFocus;
end;

procedure TFRM_Entrega2.BTN_LimparClick(Sender: TObject);
begin
   CDS_Produtos.First;
   while not CDS_Produtos.Eof do
      CDS_Produtos.Delete;

   CDS_ProdutosMeio.First;
   while not CDS_ProdutosMeio.Eof do
      CDS_ProdutosMeio.Delete;

   //Limpar
   EDT_Codigo.Text        := '';
   DBLC_Produto.KeyValue  := Null;
   EDT_Quantidade.Text    := '';
   EDT_Preco.Text         := '';
   EDT_Total.Text         := '';

   SubTotalE              := 0;
   LBL_SubTotal.Caption   := FormatFloat('"Sub-Total.: R$ "###,###,###0.00', SubTotalE);

   MMO_OBS.Lines.Clear;
end;

procedure TFRM_Entrega2.SPB_ConfirmaClick(Sender: TObject);
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
begin
   qOperador := 0;
   NomeCaixa := '';

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

   xPedido := StrToInt(EDT_Pedido.Text);

   //EDT_Pedido.Text := IntToStr(xPedido);

   { Entrega..... }
   IBQ_gravar.Close;
   IBQ_gravar.SQL.Clear;
   IBQ_gravar.SQL.Add('Insert into entrega (CODIGO_ID, NOME, TELEFONE, ENDERECO, BAIRRO, PONTO_REF, DT_PEDIDO, HR_PEDIDO, FECHA_SN, CLIENTE, entregador, dt_entrega, hr_entrega, CIDADE, OPCAIXA)');
   IBQ_gravar.SQL.Add('values (:PCODIGO_ID, :PNOME, :PTELEFONE, :PENDERECO, :PBAIRRO, :PPONTO_REF, :PDT_PEDIDO, :PHR_PEDIDO, :PFECHA_SN, :PCLIENTE, :Pentregador, :Pdt_entrega, :Phr_entrega, :PCIDADE, :POPCAIXA)');
   IBQ_gravar.ParamByName('PCODIGO_ID').Value  := xPedido;
   IBQ_gravar.ParamByName('PNOME').Value       := EDT_Nome.Text;
   IBQ_gravar.ParamByName('PTELEFONE').Value   := EDT_Telefone.Text;
   IBQ_gravar.ParamByName('PENDERECO').Value   := EDT_Endereco.Text;
   IBQ_gravar.ParamByName('PPONTO_REF').Value  := EDT_Ponto.Text;
   IBQ_gravar.ParamByName('PDT_PEDIDO').Value  := Date;
   IBQ_gravar.ParamByName('PHR_PEDIDO').Value  := Time;
   IBQ_gravar.ParamByName('PFECHA_SN').Value   := 'N';

   if CHK_Cliente.Checked then
      IBQ_gravar.ParamByName('PCLIENTE').Value    := DBLC_Cliente.KeyValue
   else
      IBQ_gravar.ParamByName('PCLIENTE').AsString := '';

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

   {Entrega....................................................................}
   for y := 1 to 2 do
   begin
      try
         AssignFile(Lst_,xPorta);
         ReWrite(Lst_);
      except
         Exit;
      end;

      WriteLn(Lst_,Repl('=',39));
      WriteLn(Lst_,'Pedido..: ' + copy(EDT_Pedido.Text,1,29));
      WriteLn(Lst_,'Nome....: ' + copy(EDT_Nome.Text,1,29));
      WriteLn(Lst_,'Endereço: ' + copy(EDT_Endereco.Text,1,29));
      WriteLn(Lst_,'Bairro..: ' + copy(EDT_Bairro.Text,1,29));
      WriteLn(Lst_,'Cidade..: ' + copy(EDT_Cidade.Text,1,29));
      WriteLn(Lst_,'Ponto...: ' + copy(EDT_Ponto.Text,1,29));
      WriteLn(Lst_,'Telefone: ' + copy(EDT_Telefone.Text,1,29));
      WriteLn(Lst_,'DT Entre: ' + copy(DateToStr(DTP_DTEntrega.Date),1,29));
      WriteLn(Lst_,'HR Entre: ' + copy(EDT_HREntrega.Text,1,29));
      WriteLn(Lst_,'Entregad: ' + copy(DBLC_Entregador.Text,1,29));
      WriteLn(Lst_,Repl('=',39));
      WriteLn(Lst_);

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
      WriteLn(Lst_);
      WriteLn(Lst_,'    -------------------------------    ');
      WriteLn(Lst_,'              Assinatura               ');

      WriteLn(Lst_,Repl('=',39));

      { Ejetar Linhas }
       for i_ := 1 to 7 do
       begin
          WriteLn(Lst_);
       end;

       CloseFile(Lst_);
   end;
   {...........................................................................}


   {Cozinha....................................................................}
   try
      AssignFile(Lst_,xPorta);
      ReWrite(Lst_);
   except
      Exit;
   end;

   WriteLn(Lst_,Repl('=',39));
   WriteLn(Lst_,'Pedido..: ' + copy(EDT_Pedido.Text,1,29));
   WriteLn(Lst_,'Nome....: ' + copy(EDT_Nome.Text,1,29));
   WriteLn(Lst_,'DT Entre: ' + copy(DateToStr(DTP_DTEntrega.Date),1,29));
   WriteLn(Lst_,'HR Entre: ' + copy(EDT_HREntrega.Text,1,29));
   //WriteLn(Lst_,#14+'DT Entre: ' + copy(DateToStr(DTP_DTEntrega.Date),1,29));
   //WriteLn(Lst_,#14+'HR Entre: ' + copy(EDT_HREntrega.Text,1,29));
   WriteLn(Lst_,Repl('=',39));
   WriteLn(Lst_);

   CDS_Produtos.First;
   while not CDS_Produtos.Eof do
   begin
      //WriteLn(Lst_);
      if CDS_ProdutosID.IsNull then
      begin
         WriteLn(Lst_,FormatFloat('###,##0.000',CDS_ProdutosQuantidade.Value)+ ' - '+copy(CDS_ProdutosDescricao.AsString,1,29));
         WriteLn(Lst_,copy(CDS_ProdutosOBS1.AsString,1,40));
         WriteLn(Lst_,' ');
      end;

      CDS_Produtos.Next;
   end;

   CDS_ProdutosMeio.First;
   Conf := CDS_ProdutosMeioID.Value;
   WriteLn(Lst_,'...');
   while not CDS_ProdutosMeio.Eof do
   begin
      WriteLn(Lst_,FormatFloat('###,##0.000',CDS_ProdutosMeioQuantidade.Value)+ ' - '+copy(CDS_ProdutosMeioDescricao.AsString,1,29));

      if CDS_Produtos.Locate('id',CDS_ProdutosMeioID.Value,[]) then
         arm := CDS_ProdutosOBS1.AsString;

      CDS_ProdutosMeio.Next;

      if Conf <> CDS_ProdutosMeioID.Value then
      begin
         Conf := CDS_ProdutosMeioID.Value;
         WriteLn(Lst_,copy(arm,1,40));
         WriteLn(Lst_,'...');
         arm := '';
      end;
   end;

   if arm <> '' then
   begin
      WriteLn(Lst_,copy(arm,1,40));
      WriteLn(Lst_,'...');
   end;

   WriteLn(Lst_,Repl('=',39));

   { Ejetar Linhas }
   for i_ := 1 to 7 do
   begin
      WriteLn(Lst_);
   end;

   CloseFile(Lst_);
   {...........................................................................}


   {Controle...................................................................}
   try
      AssignFile(Lst_,xPorta);
      ReWrite(Lst_);
   except
      Exit;
   end;

   WriteLn(Lst_,Repl('=',39));
   WriteLn(Lst_,'Pedido..: ' + copy(EDT_Pedido.Text,1,29));
   WriteLn(Lst_,'Nome....: ' + copy(EDT_Nome.Text,1,29));
   WriteLn(Lst_,'DT Entre: ' + copy(DateToStr(DTP_DTEntrega.Date),1,29));
   WriteLn(Lst_,'HR Entre: ' + copy(EDT_HREntrega.Text,1,29));
   WriteLn(Lst_,'Entregad: ' + copy(DBLC_Entregador.Text,1,29));
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
   for i_ := 1 to 7 do
   begin
      WriteLn(Lst_);
   end;

   CloseFile(Lst_);
   {...........................................................................}

   if CHK_Baixa.Checked then
   begin
      xEntregaPD := StrToInt(EDT_Pedido.Text);

      if FRM_EntreBaixa = nil then
        FRM_EntreBaixa := TFRM_EntreBaixa.Create(Application);

      FRM_EntreBaixa.ShowModal;

      xEntregaPD := 0;
   end;

   //Limpar
   { Limpar a tela }
   DBLC_Telefone.KeyValue   := Null;
   DBLC_Cliente.KeyValue    := Null;
   EDT_Nome.Text            := '';
   EDT_Telefone.Text        := '';
   EDT_Endereco.Text        := '';
   EDT_Bairro.Text          := '';
   EDT_Cidade.Text          := '';
   EDT_Ponto.Text           := '';
   EDT_HREntrega.Text       := '';
   CHK_Cliente.Checked      := False;
   //--------------------------------
   DBLC_Entregador.KeyValue := Null;
   CHK_Baixa.Checked        := False;
   //--------------------------------
   EDT_Codigo.Text          := '';
   DBLC_Produto.KeyValue    := Null;
   EDT_Quantidade.Text      := '';
   EDT_Preco.Text           := '';
   EDT_Total.Text           := '';

   SubTotalE                := 0;
   LBL_SubTotal.Caption     := FormatFloat('"Sub-Total.: R$ "###,###,###0.00', SubTotalE);

   MMO_OBS.Lines.Clear;

   BTN_LimparClick(Self);

   { Num Pedido.... }
   IBQ_NumPedido.Close;
   IBQ_NumPedido.Open;

   xPedido := IBQ_NumPedidoXCOD_ID.Value;

   EDT_Pedido.Text := IntToStr(xPedido);

   DTP_DTEntrega.Date := Date;
   EDT_HREntrega.Text := FormatDateTime('hh:mm', now);
   DBLC_Telefone.SetFocus;

   //Close;
end;

procedure TFRM_Entrega2.SPB_ManutencaoClick(Sender: TObject);
begin
   if FRM_EntregaMa = nil then
      FRM_EntregaMa := TFRM_EntregaMa.Create(Application);

   FRM_EntregaMa.ShowModal;
end;

procedure TFRM_Entrega2.BTN_ExcluirClick(Sender: TObject);
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

procedure TFRM_Entrega2.EDT_CodigoChange(Sender: TObject);
begin
   DBLC_Produto.KeyValue := Null;

   if EDT_Codigo.Text <> '' then
      //if IBT_Produtos1.Locate('produto',IntToStr(StrToInt(EDT_Codigo.Text)),[]) then
      if IBT_Produtos1.Locate('produto',EDT_Codigo.Text,[]) then
         DBLC_Produto.KeyValue := IBT_Produtos1CODIGO_ID.Value;
end;

procedure TFRM_Entrega2.SPB_ClientesClick(Sender: TObject);
begin
   if FRM_Cliente = nil then
      FRM_Cliente := TFRM_Cliente.Create(Application);

   FRM_Cliente.Show;
   //FRM_Cliente.ShowModal;

   //IBQ_Cliente.Close;
   //IBQ_Cliente.Open;
end;

procedure TFRM_Entrega2.BTN_AtualizarClick(Sender: TObject);
begin
   IBQ_Cliente.Close;
   IBQ_Cliente.Open;
end;

procedure TFRM_Entrega2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   {* mudar de um edit para outro com <ENTER> *}
   if Key = VK_RETURN then
   begin
      key := word(#0);
      Perform(WM_NEXTDLGCTL,0,0);
   end;
end;

procedure TFRM_Entrega2.FormKeyPress(Sender: TObject; var Key: Char);
begin
//   if key = #43 then
//      BTN_IncluirClick(Self);
//
//   if key = #45 then
//      BTN_ExcluirClick(Self);
end;

procedure TFRM_Entrega2.DBLC_ProdutoEnter(Sender: TObject);
begin
  IBT_Produtos1.IndexFieldNames := 'DESCRICAO';
end;

procedure TFRM_Entrega2.EDT_QuantidadeChange(Sender: TObject);
begin
   try
      if (ApenasNumerosStr(EDT_Quantidade.Text) <> '') and
         (ApenasNumerosStr(EDT_Preco.Text) <> '') then
         EDT_Total.Text := FormatFloat('###,###,###0.00', (StrToFloat(EDT_Quantidade.Text)*StrToFloat(EDT_Preco.Text)));
   except
      EDT_Total.Text := '0,00';
   end;
End;

procedure TFRM_Entrega2.CDS_ProdutosCalcFields(DataSet: TDataSet);
begin
   CDS_ProdutosTotalProd.AsFloat := CDS_ProdutosQuantidade.AsFloat*CDS_ProdutosPreco.AsFloat;
end;

procedure TFRM_Entrega2.BTN_ItemClick(Sender: TObject);
begin
   if FRM_AgruparItens = nil then
      FRM_AgruparItens := TFRM_AgruparItens.Create(Application);
   FRM_AgruparItens.ShowModal;
end;

procedure TFRM_Entrega2.BTN_BuscaCEPClick(Sender: TObject);
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

end.
