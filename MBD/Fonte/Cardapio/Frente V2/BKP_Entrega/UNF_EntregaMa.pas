unit UNF_EntregaMa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, Grids, DBGrids, DB, IBCustomDataSet, IBQuery,
  StdCtrls, Mask, ToolEdit, MaskUtils, ComCtrls, DBCtrls, IBTable;

type
  TFRM_EntregaMa = class(TForm)
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
    DTS_Entrega: TDataSource;
    IBQ_Gravar: TIBQuery;
    IBQ_EntregaFORMAPAGTO: TIntegerField;
    IBQ_EntregaVALOR_PAGO: TFloatField;
    IBQ_EntregaCLIENTE: TIntegerField;
    IBQ_EntregaDT_RECEBIMENTO: TDateField;
    IBQ_EntregaHR_RECEBIMENTO: TTimeField;
    IBQ_EntregaCANCEL: TIBStringField;
    IBQ_EntregaProd: TIBQuery;
    IBQ_EntregaProdCODIGO_ID: TIntegerField;
    IBQ_EntregaProdENTRAGA: TIntegerField;
    IBQ_EntregaProdPRODUTO: TIntegerField;
    IBQ_EntregaProdQUANTIDADE: TFloatField;
    IBQ_EntregaProdPRECO: TFloatField;
    IBQ_EntregaProdDESCONTO: TFloatField;
    IBQ_EntregaProdOBS: TMemoField;
    IBQ_EntregaENTREGADOR: TIntegerField;
    IBQ_EntregaDT_ENTREGA: TDateField;
    IBQ_EntregaHR_ENTREGA: TTimeField;
    IBQ_EntregaCIDADE: TIBStringField;
    IBQ_EntregaDesEntregador: TStringField;
    IBQ_EntregaProdDesCodProduto: TStringField;
    IBQ_EntregaProdDesProduto: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    Panel2: TPanel;
    SPB_Sair: TSpeedButton;
    SPB_Refreshx: TSpeedButton;
    SPB_Baixar: TSpeedButton;
    SPB_Cancelarx: TSpeedButton;
    SPB_Reimprimir: TSpeedButton;
    SPB_Primeiro: TSpeedButton;
    SPB_Anterior: TSpeedButton;
    SPB_Proximo: TSpeedButton;
    SPB_Ultimo: TSpeedButton;
    Panel3: TPanel;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    LBL_Periodo: TLabel;
    LBL_Ate: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DTA_DATA1: TDateEdit;
    DTA_DATA2: TDateEdit;
    CBX_Todos1: TCheckBox;
    EDT_Pedido1: TEdit;
    EDT_Pedido2: TEdit;
    CBX_Todos2: TCheckBox;
    RDG_Entrega: TRadioGroup;
    RDG_Cancelados: TRadioGroup;
    Panel5: TPanel;
    DBG_Entrega: TDBGrid;
    TabSheet3: TTabSheet;
    PNL_Botoes: TPanel;
    LBL_Status: TLabel;
    SpeedButton1: TSpeedButton;
    SPB_Novo: TSpeedButton;
    SPB_Editar: TSpeedButton;
    SPB_Cancelar: TSpeedButton;
    SPB_Gravar: TSpeedButton;
    SPB_Excluir: TSpeedButton;
    SPB_Primeiro1: TSpeedButton;
    SPB_Anterior1: TSpeedButton;
    SPB_Proximo1: TSpeedButton;
    SPB_Ultimo1: TSpeedButton;
    SPB_Refresh: TSpeedButton;
    DBN_Navegador: TDBNavigator;
    PNL_Cadastro: TPanel;
    SCB_CadastroScroll: TScrollBox;
    DBGrid1: TDBGrid;
    IBT_EntregaProd: TIBTable;
    DTS_EntregaProd: TDataSource;
    IBT_EntregaProdCODIGO_ID: TIntegerField;
    IBT_EntregaProdENTRAGA: TIntegerField;
    IBT_EntregaProdPRODUTO: TIntegerField;
    IBT_EntregaProdQUANTIDADE: TFloatField;
    IBT_EntregaProdPRECO: TFloatField;
    IBT_EntregaProdDESCONTO: TFloatField;
    IBT_EntregaProdOBS: TMemoField;
    IBT_EntregaProdDesProduto: TStringField;
    Label3: TLabel;
    DBE_Quantidade: TDBEdit;
    Label6: TLabel;
    DBE_Preco: TDBEdit;
    Label7: TLabel;
    DBM_Obs: TDBMemo;
    IBT_Produtos1: TIBTable;
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
    DTS_Produtos1: TDataSource;
    IBT_EntregaProdTotalProd: TFloatField;
    Panel6: TPanel;
    DBT_Total: TDBText;
    IBQ_TotalProdutos: TIBQuery;
    DTQ_TotalProdutos: TDataSource;
    IBQ_TotalProdutosTOTAL: TFloatField;
    IBQ_TotalProdutosDescTotal: TStringField;
    IBT_EntregaProdDESCRICAO: TIBStringField;
    GroupBox2: TGroupBox;
    EDT_Codigo: TEdit;
    DBLC_Produto: TDBLookupComboBox;
    DBE_Produto: TDBEdit;
    Label2: TLabel;
    IBQ_EntregaProdDESCRICAO: TIBStringField;
    SPB_BaixarGrupo: TSpeedButton;
    DBLC_FormaPagamento: TDBLookupComboBox;
    Label8: TLabel;
    CBX_Todos3: TCheckBox;
    Label9: TLabel;
    DBLC_Cliente: TDBLookupComboBox;
    CBX_Todos4: TCheckBox;
    procedure Controle_botoes;
    procedure AtualizaDB;
    procedure SPB_SairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SPB_RefreshxClick(Sender: TObject);
    procedure CBX_Todos1Click(Sender: TObject);
    procedure CBX_Todos2Click(Sender: TObject);
    procedure SPB_BaixarClick(Sender: TObject);
    procedure DBG_EntregaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SPB_CancelarxClick(Sender: TObject);
    procedure SPB_ReimprimirClick(Sender: TObject);
    procedure SPB_Primeiro1Click(Sender: TObject);
    procedure SPB_Anterior1Click(Sender: TObject);
    procedure SPB_Proximo1Click(Sender: TObject);
    procedure SPB_Ultimo1Click(Sender: TObject);
    procedure SPB_PrimeiroClick(Sender: TObject);
    procedure SPB_AnteriorClick(Sender: TObject);
    procedure SPB_ProximoClick(Sender: TObject);
    procedure SPB_UltimoClick(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure SPB_NovoClick(Sender: TObject);
    procedure SPB_EditarClick(Sender: TObject);
    procedure SPB_ExcluirClick(Sender: TObject);
    procedure SPB_GravarClick(Sender: TObject);
    procedure SPB_CancelarClick(Sender: TObject);
    procedure SPB_RefreshClick(Sender: TObject);
    procedure IBT_EntregaProdAfterDelete(DataSet: TDataSet);
    procedure IBT_EntregaProdAfterPost(DataSet: TDataSet);
    procedure IBT_EntregaProdAfterInsert(DataSet: TDataSet);
    procedure EDT_CodigoChange(Sender: TObject);
    procedure DBLC_ProdutoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLC_ProdutoEnter(Sender: TObject);
    procedure IBT_EntregaProdCalcFields(DataSet: TDataSet);
    procedure IBQ_TotalProdutosCalcFields(DataSet: TDataSet);
    procedure SPB_BaixarGrupoClick(Sender: TObject);
    procedure DBLC_FormaPagamentoEnter(Sender: TObject);
    procedure CBX_Todos3Click(Sender: TObject);
    procedure CBX_Todos4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_EntregaMa: TFRM_EntregaMa;

implementation

uses UNF_Funcoes, UNF_Mensagem, UNF_MensagemDeErro, UNF_Modulo,
  UNF_Pergunta, UNF_EntreBaixa, UNF_Entrega, UNF_FuncoesECF,
  UNF_MiniImpresora;

{$R *.dfm}

procedure TFRM_EntregaMa.Controle_botoes;
begin
  SPB_novo.Enabled           := not SPB_novo.Enabled;
  SPB_editar.Enabled         := not SPB_editar.Enabled;
  SPB_excluir.Enabled        := not SPB_excluir.Enabled;

  SPB_cancelar.Enabled       := not SPB_cancelar.Enabled;
  SPB_gravar.Enabled         := not SPB_gravar.Enabled;

  SPB_sair.Enabled           := not SPB_sair.Enabled;

  DBN_Navegador.Enabled      := not DBN_Navegador.Enabled;
  SCB_CadastroScroll.Enabled := not SCB_CadastroScroll.Enabled;

  SPB_Refresh.Enabled        := not SPB_Refresh.Enabled;

  {navegador}
  SPB_Primeiro1.Enabled      := not SPB_Primeiro1.Enabled;
  SPB_Proximo1.Enabled       := not SPB_Proximo1.Enabled;
  SPB_Anterior1.Enabled      := not SPB_Anterior1.Enabled;
  SPB_Ultimo1.Enabled        := not SPB_Ultimo1.Enabled;
end;

procedure TFRM_EntregaMa.AtualizaDB;
begin
   IBQ_Entrega.Close;
   IBQ_Entrega.SQL.Clear;
   IBQ_Entrega.SQL.Add('select *');
   IBQ_Entrega.SQL.Add('from ENTREGA');
   IBQ_Entrega.SQL.Add('where (1=1)');

   if not CBX_Todos1.Checked then
   begin
      IBQ_Entrega.SQL.Add('and (DT_PEDIDO between :P_Data1 and :P_Data2)');
      IBQ_Entrega.ParamByName('P_Data1').Value := DTA_DATA1.Date;
      IBQ_Entrega.ParamByName('P_Data2').Value := DTA_DATA2.Date;
   end;

   if not CBX_Todos2.Checked then
   begin
      IBQ_Entrega.SQL.Add('and (CODIGO_ID between :P_Pedido1 and :P_Pedido2)');
      IBQ_Entrega.ParamByName('P_Pedido1').Value := EDT_Pedido1.Text;
      IBQ_Entrega.ParamByName('P_Pedido2').Value := EDT_Pedido2.Text;
   end;

   if not CBX_Todos3.Checked then
   begin
      IBQ_Entrega.SQL.Add('and FORMAPAGTO = :pFormaPagto ');
      IBQ_Entrega.ParamByName('pFormaPagto').Value := FRM_Modulo.IBT_FormaPagtoCODIGO_ID.Value;
   end;

   if not CBX_Todos4.Checked then
   begin
      IBQ_Entrega.SQL.Add('and cliente = :pcliente ');
      IBQ_Entrega.ParamByName('pcliente').Value := FRM_Modulo.IBT_ClienteCODIGO_ID.Value;
   end;

   if RDG_Entrega.ItemIndex = 0 then
   begin
      IBQ_Entrega.SQL.Add('and ((FECHA_SN <> :PFECHA_SN) or (FECHA_SN  is null))');
      IBQ_Entrega.ParamByName('PFECHA_SN').Value := 'S';
   end;

   if RDG_Entrega.ItemIndex = 1 then
   begin
      IBQ_Entrega.SQL.Add('and (FECHA_SN = :PFECHA_SN)');
      IBQ_Entrega.ParamByName('PFECHA_SN').Value := 'S';
   end;

   if RDG_Cancelados.ItemIndex = 0 then
   begin
      IBQ_Entrega.SQL.Add('and (CANCEL = :PCANCEL)');
      IBQ_Entrega.ParamByName('PCANCEL').Value := 'S';
   end;

   if RDG_Cancelados.ItemIndex = 1 then
   begin
      IBQ_Entrega.SQL.Add('and ((CANCEL <> :PCANCEL) or (CANCEL  is null))');
      IBQ_Entrega.ParamByName('PCANCEL').Value := 'S';
   end;

   IBQ_Entrega.SQL.Add('order by codigo_id desc');

   IBQ_Entrega.Open;

   IBQ_EntregaProd.Close;
   IBQ_EntregaProd.Open;

   {totaliza}
   IBQ_TotalProdutos.Close;
   IBQ_TotalProdutos.Open;
end;

procedure TFRM_EntregaMa.SPB_SairClick(Sender: TObject);
begin
   Close;
end;

procedure TFRM_EntregaMa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action        := caFree;
   Action        := caFree;
   FRM_EntregaMa := nil;
end;

procedure TFRM_EntregaMa.FormShow(Sender: TObject);
begin
   AtualizaDB;

   IBT_Produtos1.Close;
   IBT_Produtos1.Open;

   DTA_DATA1.Enabled    := False;
   DTA_DATA2.Enabled    := False;
   EDT_Pedido1.Enabled  := False;
   EDT_Pedido2.Enabled  := False;
   DBLC_Produto.Enabled := False;
   DBLC_Cliente.Enabled := False;
end;

procedure TFRM_EntregaMa.SPB_RefreshxClick(Sender: TObject);
begin
   AtualizaDB;
end;

procedure TFRM_EntregaMa.CBX_Todos1Click(Sender: TObject);
begin
   if CBX_Todos1.Checked = True then
   begin
      DTA_DATA1.Enabled := False;
      DTA_DATA2.Enabled := False;
   end;
   if CBX_Todos1.Checked = False then
   begin
      DTA_DATA1.Enabled := True;
      DTA_DATA2.Enabled := True;
      DTA_DATA1.SetFocus;
   end;
end;

procedure TFRM_EntregaMa.CBX_Todos2Click(Sender: TObject);
begin
   if CBX_Todos2.Checked = True then
   begin
      EDT_Pedido1.Enabled := False;
      EDT_Pedido2.Enabled := False;
   end;

   if CBX_Todos2.Checked = False then
   begin
      EDT_Pedido1.Enabled := True;
      EDT_Pedido2.Enabled := True;
      EDT_Pedido1.SetFocus;
   end;
end;

procedure TFRM_EntregaMa.SPB_BaixarClick(Sender: TObject);
begin
   vBaixaGrupo := False;
   xEntregaPD  := FRM_EntregaMa.IBQ_EntregaCODIGO_ID.Value;

   if FRM_EntreBaixa = nil then
      FRM_EntreBaixa := TFRM_EntreBaixa.Create(Application);

   FRM_EntreBaixa.ShowModal;

   xEntregaPD := 0;

   AtualizaDB;
end;

procedure TFRM_EntregaMa.DBG_EntregaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   If IBQ_EntregaFECHA_SN.Value = 'S' then
      DBG_Entrega.Canvas.Font.Color := clGreen;

   If IBQ_EntregaFECHA_SN.Value <> 'S' then
      DBG_Entrega.Canvas.Font.Color := clMaroon;

   DBG_Entrega.DefaultDrawDataCell(Rect, DBG_Entrega.Columns[Datacol].Field,State);
end;

procedure TFRM_EntregaMa.SPB_CancelarxClick(Sender: TObject);
begin
   if Pergunta('Confirma o cancelamento?') = 'S' then
   begin
      { Limpar CX }
      IBQ_Gravar.Close;
      IBQ_Gravar.SQL.Clear;
      IBQ_Gravar.SQL.Add('delete from CXMOVTOTEMP');
      IBQ_Gravar.SQL.Add('where (tipo_ori = :Ptipo_ori)');
      IBQ_Gravar.SQL.Add('and (code_ori = :Pcode_ori)');
      IBQ_Gravar.ParamByName('Ptipo_ori').Value := 'ENT';
      IBQ_Gravar.ParamByName('Pcode_ori').Value := FRM_EntregaMa.IBQ_EntregaCODIGO_ID.Value;
      IBQ_Gravar.ExecSQL;

      FRM_Modulo.IBTransaction1.CommitRetaining;

      { Limpar Financeiro }
      IBQ_Gravar.Close;
      IBQ_Gravar.SQL.Clear;
      IBQ_Gravar.SQL.Add('delete from Financeiro');
      IBQ_Gravar.SQL.Add('where (tipo_ori = :Ptipo_ori)');
      IBQ_Gravar.SQL.Add('and (codi_ori = :Pcodi_ori)');
      IBQ_Gravar.ParamByName('Ptipo_ori').Value := 'ENT';
      IBQ_Gravar.ParamByName('Pcodi_ori').Value := FRM_EntregaMa.IBQ_EntregaCODIGO_ID.Value;
      IBQ_Gravar.ExecSQL;

      FRM_Modulo.IBTransaction1.CommitRetaining;

      { Cancela }
      IBQ_Gravar.Close;
      IBQ_Gravar.SQL.Clear;
      IBQ_Gravar.SQL.Add('update entrega set CANCEL = :PCANCEL');
      IBQ_Gravar.ParamByName('PCANCEL').Value       := 'S';
      IBQ_Gravar.SQL.Add('where (codigo_id = :Pcodigo_id)');
      IBQ_Gravar.ParamByName('Pcodigo_id').Value      := FRM_EntregaMa.IBQ_EntregaCODIGO_ID.Value;
      IBQ_Gravar.ExecSQL;

      FRM_Modulo.IBTransaction1.CommitRetaining;
   end;
end;

procedure TFRM_EntregaMa.SPB_ReimprimirClick(Sender: TObject);
var
    i_, y : Integer;
     Lst_ : TextFile;
   xTotal : Double;
  va, vax : Integer;
Descricao : String;
Impressora : String;
begin
   if Pergunta('Confirma Reimpressão?') = 'S' then
   begin
      {Entrega....................................................................}
      for y := 1 to 1 do
      begin
         try
            with FRM_Modulo do
            begin
               if IBT_Config.Locate('CODIGO_ID',IBT_ParametrosENTREGA_PACOTE.AsInteger,[]) then
                   Impressora := IBT_ConfigPORT_IMPRI.AsString
               else
                   Impressora := xPorta;
            end;

            AssignFile(Lst_,Impressora);
            ReWrite(Lst_);
            if (xTpImpPorta = 'EP') or (xTpImpPorta = 'IB4200') then
               WriteLn(Lst_,CHR(27) + '!' + CHR(01));
         except
            Exit;
         end;

         WriteLn(Lst_,Repl('=',39));
         WriteLn(Lst_,'Pedido..: ' + copy(IBQ_EntregaCODIGO_ID.AsString,1,29));
         WriteLn(Lst_,'Nome....: ' + copy(IBQ_EntregaNOME.AsString,1,29));
         WriteLn(Lst_,'Endereço: ' + copy(IBQ_EntregaENDERECO.AsString,1,29));
         WriteLn(Lst_,copy(IBQ_EntregaENDERECO.AsString,30,60));
         WriteLn(Lst_,'Bairro..: ' + copy(IBQ_EntregaBAIRRO.AsString,1,29));
         WriteLn(Lst_,'Cidade..: ' + copy(IBQ_EntregaCIDADE.AsString,1,29));
         WriteLn(Lst_,'Ponto...: ' + copy(IBQ_EntregaPONTO_REF.AsString,1,29));
         WriteLn(Lst_,'Telefone: ' + copy(IBQ_EntregaTELEFONE.AsString,1,29));
         WriteLn(Lst_,'DT Entre: ' + copy(IBQ_EntregaDT_ENTREGA.AsString,1,29));
         WriteLn(Lst_,'HR Entre: ' + copy(IBQ_EntregaHR_ENTREGA.Text,1,29));
         WriteLn(Lst_,'Entregad: ' + copy(IBQ_EntregaDesEntregador.AsString,1,29));
         WriteLn(Lst_,Repl('=',39));
         WriteLn(Lst_);

         xTotal := 0;

         IBQ_EntregaProd.First;
         while not IBQ_EntregaProd.Eof do
         begin
            vax       := 0;
            Descricao := '';

            if Length(IBQ_EntregaProdDESCRICAO.AsString) < 40 then
               WriteLn(Lst_,copy(IBQ_EntregaProdDESCRICAO.AsString+Repl(' ',40),1,40))
            else
            begin
               vax       := 0;
               Descricao := '';

               for va := 1 to Length(IBQ_EntregaProdDESCRICAO.AsString) do
               begin
                  Inc(vax,1);

                  if vax = 39 then
                  begin
                     WriteLn(Lst_,copy(Descricao+Repl(' ',40),1,40));

                     vax       := 0;
                     Descricao := copy(IBQ_EntregaProdDESCRICAO.AsString,va,1);
                  end
                  else
                     Descricao := Descricao + copy(IBQ_EntregaProdDESCRICAO.AsString,va,1);
               end;

               if Descricao <> '' then
                  WriteLn(Lst_,copy(Descricao+Repl(' ',40),1,40));
            end;


         //   WriteLn(Lst_,copy(IBQ_EntregaProdDesProduto.AsString+Repl(' ',40),1,40));

            WriteLn(Lst_,FormatMaskText('!aaaaaaaaa;0; ',FormatFloat('#,##0.000',IBQ_EntregaProdQUANTIDADE.Value))                                  + ' * ' +
                         FormatMaskText('!aaaaaaaaaaaaa;0; ',FormatCurr('##,###,##0.00',IBQ_EntregaProdPRECO.Value))                                + ' ' +
                         FormatMaskText('!aaaaaaaaaaaaa;0; ',FormatCurr('##,###,##0.00',(IBQ_EntregaProdQUANTIDADE.Value*IBQ_EntregaProdPRECO.Value))));

            xTotal :=  xTotal + (IBQ_EntregaProdQUANTIDADE.Value*IBQ_EntregaProdPRECO.Value);

            IBQ_EntregaProd.Next;
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
                   Impressora := IBT_ConfigPORT_IMPRI.AsString
               else
                   Impressora := xPorta;
            end;

            AssignFile(Lst_,Impressora);
         ReWrite(Lst_);
         if (xTpImpPorta = 'EP') or (xTpImpPorta = 'IB4200') then
               WriteLn(Lst_,CHR(27) + '!' + CHR(01));
      except
         Exit;
      end;

      WriteLn(Lst_,Repl('=',39));
      WriteLn(Lst_,'Pedido..: ' + copy(IBQ_EntregaCODIGO_ID.AsString,1,29));
      WriteLn(Lst_,'Nome....: ' + copy(IBQ_EntregaNOME.AsString,1,29));
      WriteLn(Lst_,'DT Entre: ' + copy(IBQ_EntregaDT_ENTREGA.AsString,1,29));
      WriteLn(Lst_,'HR Entre: ' + copy(IBQ_EntregaHR_ENTREGA.Text,1,29));
      //WriteLn(Lst_,#14+'Nome....: ' + copy(IBQ_EntregaNOME.AsString,1,29));
      //WriteLn(Lst_,#14+'DT Entre: ' + copy(IBQ_EntregaDT_ENTREGA.AsString,1,29));
      //WriteLn(Lst_,#14+'HR Entre: ' + copy(IBQ_EntregaHR_ENTREGA.Text,1,29));
      WriteLn(Lst_,Repl('=',39));
      WriteLn(Lst_);

      IBQ_EntregaProd.First;
      while not IBQ_EntregaProd.Eof do
      begin
            vax       := 0;
            Descricao := '';

            if Length(FormatFloat('###,##0.000',IBQ_EntregaProdQUANTIDADE.Value)+ ' - '+ IBQ_EntregaProdDESCRICAO.AsString) < 40 then
               WriteLn(Lst_,copy(FormatFloat('###,##0.000',IBQ_EntregaProdQUANTIDADE.Value)+ ' - '+ IBQ_EntregaProdDESCRICAO.AsString+Repl(' ',40),1,40))
            else
            begin
               vax       := 0;
               Descricao := '';

               for va := 1 to Length(FormatFloat('###,##0.000',IBQ_EntregaProdQUANTIDADE.Value)+ ' - '+ IBQ_EntregaProdDESCRICAO.AsString) do
               begin
                  Inc(vax,1);

                  if vax = 39 then
                  begin
                     WriteLn(Lst_,copy(Descricao+Repl(' ',40),1,40));

                     vax       := 0;
                     Descricao := copy(FormatFloat('###,##0.000',IBQ_EntregaProdQUANTIDADE.Value)+ ' - '+ IBQ_EntregaProdDESCRICAO.AsString,va,1);
                  end
                  else
                     Descricao := Descricao + copy(FormatFloat('###,##0.000',IBQ_EntregaProdQUANTIDADE.Value)+ ' - '+ IBQ_EntregaProdDESCRICAO.AsString,va,1);
               end;

               if Descricao <> '' then
                  WriteLn(Lst_,copy(Descricao+Repl(' ',40),1,40));
            end;

//         WriteLn(Lst_,FormatFloat('###,##0.000',IBQ_EntregaProdQUANTIDADE.Value)+ ' - '+copy(IBQ_EntregaProdDesProduto.AsString,1,29));

//         WriteLn(Lst_,FormatFloat('###,##0.000',IBQ_EntregaProdQUANTIDADE.Value)+ ' - '+copy(IBQ_EntregaProdDesProduto.AsString,1,29));
         WriteLn(Lst_,copy(IBQ_EntregaProdOBS.AsString,1,40));

         IBQ_EntregaProd.Next;
      end;

      WriteLn(Lst_,Repl('=',39));

      { Ejetar Linhas }
      for i_ := 1 to 7 do
      begin
         WriteLn(Lst_);
      end;
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
      {...........................................................................}


      {Controle...................................................................}
      try
            with FRM_Modulo do
            begin
               if IBT_Config.Locate('CODIGO_ID',IBT_ParametrosENTREGA_PACOTE.AsInteger,[]) then
                   Impressora := IBT_ConfigPORT_IMPRI.AsString
               else
                   Impressora := xPorta;
            end;

            AssignFile(Lst_,Impressora);
         ReWrite(Lst_);
         if (xTpImpPorta = 'EP') or (xTpImpPorta = 'IB4200') then
               WriteLn(Lst_,CHR(27) + '!' + CHR(01));
      except
         Exit;
      end;

      WriteLn(Lst_,Repl('=',39));
      WriteLn(Lst_,'Pedido..: ' + copy(IBQ_EntregaCODIGO_ID.AsString,1,29));
      WriteLn(Lst_,'Nome....: ' + copy(IBQ_EntregaNOME.AsString,1,29));
      WriteLn(Lst_,'DT Entre: ' + copy(IBQ_EntregaDT_ENTREGA.AsString,1,29));
      WriteLn(Lst_,'HR Entre: ' + copy(IBQ_EntregaHR_ENTREGA.Text,1,29));
      WriteLn(Lst_,'Entregad: ' + copy(IBQ_EntregaDesEntregador.Text,1,29));
      WriteLn(Lst_,Repl('=',39));

      xTotal := 0;
      IBQ_EntregaProd.First;
      while not IBQ_EntregaProd.Eof do
      begin
         xTotal :=  xTotal + (IBQ_EntregaProdQUANTIDADE.Value*IBQ_EntregaProdPRECO.Value);
         IBQ_EntregaProd.Next;
      end;

      WriteLn(Lst_,'                   TOTAL->'+FormatMaskText('!aaaaaaaaaaaaa;0; ',FormatCurr('##,###,##0.00',xTotal)));

      WriteLn(Lst_,Repl('=',39));

      { Ejetar Linhas }
      for i_ := 1 to 7 do
      begin
         WriteLn(Lst_);
      end;
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
   {...........................................................................}
   end;
end;

procedure TFRM_EntregaMa.SPB_Primeiro1Click(Sender: TObject);
begin
   IBT_EntregaProd.First;
end;

procedure TFRM_EntregaMa.SPB_Anterior1Click(Sender: TObject);
begin
   IBT_EntregaProd.Prior;
end;

procedure TFRM_EntregaMa.SPB_Proximo1Click(Sender: TObject);
begin
   IBT_EntregaProd.Next;
end;

procedure TFRM_EntregaMa.SPB_Ultimo1Click(Sender: TObject);
begin
  IBT_EntregaProd.Last;
end;

procedure TFRM_EntregaMa.SPB_PrimeiroClick(Sender: TObject);
begin
   IBQ_Entrega.First;
end;

procedure TFRM_EntregaMa.SPB_AnteriorClick(Sender: TObject);
begin
   IBQ_Entrega.Prior;
end;

procedure TFRM_EntregaMa.SPB_ProximoClick(Sender: TObject);
begin
   IBQ_Entrega.Next;
end;

procedure TFRM_EntregaMa.SPB_UltimoClick(Sender: TObject);
begin
  IBQ_Entrega.Last;
end;

procedure TFRM_EntregaMa.TabSheet3Show(Sender: TObject);
begin
   SPB_Novo.Enabled            := True;
   SPB_Editar.Enabled          := True;
   SPB_Excluir.Enabled         := True;

   SPB_Cancelar.Enabled        := False;
   SPB_Gravar.Enabled          := False;

   SPB_Sair.Enabled            := True;

   DBN_Navegador.Enabled       := True;
   SCB_CadastroScroll.Enabled  := False;

   SPB_Refresh.Enabled         := True;

   {navegador}
   SPB_Primeiro.Enabled        := True;
   SPB_Proximo.Enabled         := True;
   SPB_Anterior.Enabled        := True;
   SPB_Ultimo.Enabled          := True;

   IBT_EntregaProd.Close;
   IBT_EntregaProd.Open;
end;

procedure TFRM_EntregaMa.SPB_NovoClick(Sender: TObject);
begin
  IBT_EntregaProd.Append;
  Controle_Botoes;

  EDT_Codigo.SetFocus;
end;

procedure TFRM_EntregaMa.SPB_EditarClick(Sender: TObject);
begin
   if IBT_EntregaProd.RecordCount = 0 then
   begin
      Mensagem('Permitido apenas Incluir, ' + #10 +
               'pressione botão "novo" !!!');
      Abort;
   end;

   IBT_EntregaProd.Edit;
   Controle_Botoes;
   DBLC_Produto.SetFocus;   
end;

procedure TFRM_EntregaMa.SPB_ExcluirClick(Sender: TObject);
begin
   {colocar em cada formulário por causa da deleção em cascata}
   if IBT_EntregaProd.RecordCount = 0 then
   begin
      Mensagem('Não há registros no Banco de Dados' + #10 +
               'para Exclusão !!!');
      Exit;
   end;

  if Pergunta('Confirma a Exclusão do Registro atual ?') = 'S' then
  begin
     //deleção do banco principal
     if IBT_EntregaProd.RecordCount > 0 then
        IBT_EntregaProd.Delete;
  end;
end;

procedure TFRM_EntregaMa.SPB_GravarClick(Sender: TObject);
begin
   IBT_EntregaProd.Post;
   controle_botoes;

   EDT_Codigo.Text := '';
end;

procedure TFRM_EntregaMa.SPB_CancelarClick(Sender: TObject);
begin
   IBT_EntregaProd.Cancel;
   Controle_Botoes;

   EDT_Codigo.Text := '';
end;

procedure TFRM_EntregaMa.SPB_RefreshClick(Sender: TObject);
var
   xPos: Pointer;
begin
   Screen.Cursor := crSQLWait;

   xpos := IBT_EntregaProd.GetBookmark;

   IBT_EntregaProd.close;
   IBT_EntregaProd.Open;

   IBT_EntregaProd.GotoBookmark(xPos);
   IBT_EntregaProd.FreeBookmark(xPos);

   Screen.Cursor := crDefault;
end;

procedure TFRM_EntregaMa.IBT_EntregaProdAfterDelete(DataSet: TDataSet);
begin
   FRM_Modulo._IBCommit(DataSet);
end;

procedure TFRM_EntregaMa.IBT_EntregaProdAfterPost(DataSet: TDataSet);
begin
   FRM_Modulo._IBCommit(DataSet);
end;

procedure TFRM_EntregaMa.IBT_EntregaProdAfterInsert(DataSet: TDataSet);
begin
   DataSet.FieldByName('codigo_id').Value := 0;
end;

procedure TFRM_EntregaMa.EDT_CodigoChange(Sender: TObject);
begin
   if IBT_EntregaProd.State = dsinsert then
   begin
      DBLC_Produto.KeyValue := Null;

      if EDT_Codigo.Text <> '' then
         if IBT_Produtos1.Locate('produto',EDT_Codigo.Text,[]) then
            DBLC_Produto.Field.Value := IBT_Produtos1CODIGO_ID.Value;
   end;
end;

procedure TFRM_EntregaMa.DBLC_ProdutoExit(Sender: TObject);
begin
   if IBT_EntregaProd.State in [dsInsert] then
   if DBLC_Produto.KeyValue <> null then
   begin
      DBE_Quantidade.Field.Value := '1';
      DBE_Preco.Field.Value      := IBT_Produtos1PRECO.Text;
      DBE_Produto.Field.Value    := DBLC_Produto.Text;
   end;
end;

procedure TFRM_EntregaMa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   {* mudar de um edit para outro com <ENTER> *}
   if Key = VK_RETURN then
   begin
      key := word(#0);
      Perform(WM_NEXTDLGCTL,0,0);
   end;
end;

procedure TFRM_EntregaMa.DBLC_ProdutoEnter(Sender: TObject);
begin
  IBT_Produtos1.IndexFieldNames := 'DESCRICAO';
end;

procedure TFRM_EntregaMa.IBT_EntregaProdCalcFields(DataSet: TDataSet);
begin
   IBT_EntregaProdTotalProd.AsFloat := IBT_EntregaProdQuantidade.AsFloat*IBT_EntregaProdPRECO.AsFloat;
end;

procedure TFRM_EntregaMa.IBQ_TotalProdutosCalcFields(DataSet: TDataSet);
begin
   IBQ_TotalProdutosDescTotal.AsString := FormatFloat('"Total.: R$ "###,###,###0.00', IBQ_TotalProdutosTOTAL.AsFloat);
end;

procedure TFRM_EntregaMa.SPB_BaixarGrupoClick(Sender: TObject);
begin
   vBaixaGrupo := True;

   if FRM_EntreBaixa = nil then
      FRM_EntreBaixa := TFRM_EntreBaixa.Create(Application);

   FRM_EntreBaixa.ShowModal;

   xEntregaPD := 0;

   AtualizaDB;
end;

procedure TFRM_EntregaMa.DBLC_FormaPagamentoEnter(Sender: TObject);
begin
   FRM_Modulo.IBT_FormaPagto.IndexFieldNames := 'DESCRICAO';
end;

procedure TFRM_EntregaMa.CBX_Todos3Click(Sender: TObject);
begin
   if CBX_Todos3.Checked = True then
   begin
      DBLC_FormaPagamento.Enabled := False;
      DBLC_FormaPagamento.Enabled := False;
   end;

   if CBX_Todos3.Checked = False then
   begin
      DBLC_FormaPagamento.Enabled := True;
      DBLC_FormaPagamento.Enabled := True;
      DBLC_FormaPagamento.SetFocus;
   end;
end;

procedure TFRM_EntregaMa.CBX_Todos4Click(Sender: TObject);
begin
   if CBX_Todos4.Checked = True then
      DBLC_Cliente.Enabled := False;

   if CBX_Todos4.Checked = False then
   begin
      DBLC_Cliente.Enabled := True;
      DBLC_Cliente.SetFocus;
   end;
end;

end.
