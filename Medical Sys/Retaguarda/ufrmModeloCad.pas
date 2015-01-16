unit ufrmModeloCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.Imaging.pngimage, Mask, IBCustomDataSet, Vcl.DBLookup, IBQuery, ACBrBase,
  ACBrValidador;

type
  TfrmModeloCad = class(TForm)
    pFundo: TPanel;
    pcGuia: TPageControl;
    tsGrid: TTabSheet;
    tsInformacao: TTabSheet;
    pPesquisa: TPanel;
    gGridPesquisa: TDBGrid;
    PNL_Botoes: TPanel;
    SPB_Sair: TSpeedButton;
    btnNovo: TImage;
    btnEditar: TImage;
    btnGravar: TImage;
    btnExcluir: TImage;
    btnImprimir: TImage;
    btnAnterior: TImage;
    btnProximo: TImage;
    btnUltimo: TImage;
    btnPrimeiro: TImage;
    StatusBar1: TStatusBar;
    BalloonHint: TBalloonHint;
    pSair: TPanel;
    btnSair: TImage;
    btnFiltrar: TImage;
    qryGravar: TIBQuery;
    qrySelect: TIBQuery;
    dtsSelect: TDataSource;
    ValidadorDoc: TACBrValidador;
    procedure pLimpar;
    procedure pBarStatus(vStatus : String);
    procedure pControle_Botoes;
    procedure ControleCor(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CompAnt : TEdit;
  public
    { Public declarations }
  end;

var
  frmModeloCad: TfrmModeloCad;

implementation

{$R *.dfm}

uses ufrmPrincipal, uModule;

procedure TfrmModeloCad.btnAnteriorClick(Sender: TObject);
begin
   qrySelect.Prior;
end;

procedure TfrmModeloCad.btnEditarClick(Sender: TObject);
begin
   if qrySelect.RecordCount = 0 then
   begin
      MessageBox(Handle, pchar('Não existe registro a ser editado!') , pchar(NomeSistema), 64);
      Abort;
   end;
   pControle_Botoes;
   pBarStatus('Alterando ...');
   pcGuia.TabIndex := 1;
end;

procedure TfrmModeloCad.btnExcluirClick(Sender: TObject);
begin
   {colocar em cada formulário por causa da deleção em cascata}
   if qrySelect.RecordCount = 0 then
   begin
      MessageBox(Handle, pchar('Não há registros no Banco de Dados' + #10 +
                               'para Exclusão !!!') , pchar(NomeSistema), 64);
      Exit;
   end;
end;

procedure TfrmModeloCad.btnGravarClick(Sender: TObject);
begin
   pControle_Botoes;
   pBarStatus('Navegando...');
   pcguia.TabIndex := 0;
end;

procedure TfrmModeloCad.btnNovoClick(Sender: TObject);
begin
   pBarStatus('Cadastrando ...');
   pControle_Botoes;
   pLimpar;
   pcGuia.TabIndex := 1;
end;

procedure TfrmModeloCad.btnPrimeiroClick(Sender: TObject);
begin
   qrySelect.First;
end;

procedure TfrmModeloCad.btnProximoClick(Sender: TObject);
begin
   qrySelect.Next;
end;

procedure TfrmModeloCad.btnSairClick(Sender: TObject);
var
   vPergunta : Integer;
begin
   vPergunta := MessageBox(Handle, pchar('Deseja sair ?') , pchar(NomeSistema), 292);

   if vPergunta = 6 then
      Close;
end;

procedure TfrmModeloCad.btnUltimoClick(Sender: TObject);
begin
   qrySelect.Last;
end;

procedure TfrmModeloCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;  { sai }
end;

procedure TfrmModeloCad.FormCreate(Sender: TObject);
begin
   DeleteMenu(GetSystemMenu(Handle,False),SC_MOVE,MF_BYCOMMAND);
   DeleteMenu(GetSystemMenu(Handle,False),SC_MAXIMIZE,MF_BYCOMMAND);

   // Cor dos edits.............................................................
   Screen.OnActiveControlChange := ControleCor;

   {Botoes}
   btnNovo.Enabled      := True;
   btnEditar.Enabled    := True;
   btnGravar.Enabled    := False;
   btnExcluir.Enabled   := True;
   btnImprimir.Enabled  := True;
   btnSair.Enabled      := True;
   btnFiltrar.Enabled   := True;

   {Navegador}
   btnPrimeiro.Enabled  := True;
   btnAnterior.Enabled  := True;
   btnProximo.Enabled   := True;
   btnUltimo.Enabled    := True;

   {Visual}
   pcGuia.TabIndex      := 0;
   tsInformacao.Enabled := False;
   tsGrid.Enabled       := True;
end;

procedure TfrmModeloCad.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   {* mudar de um edit para outro com <ENTER> *}
   if Key = VK_RETURN then
   begin
      key := word(#0);
      Perform(WM_NEXTDLGCTL,0,0);
   end;

   if key = VK_ESCAPE then
      btnSair.OnClick(self);
end;

procedure TfrmModeloCad.FormShow(Sender: TObject);
begin
   qrySelect.Close;
   qrySelect.Open;

   pBarStatus('Navegando...');
   pcGuia.TabIndex := 0;
end;

procedure TfrmModeloCad.pBarStatus(vStatus: String);
begin
   StatusBar1.Panels[0].Text := vStatus;
   StatusBar1.Panels[1].Text := NomeEmpresa;
end;

procedure TfrmModeloCad.pControle_Botoes;
begin
   {Botoes}
   btnNovo.Enabled      := Not btnNovo.Enabled;
   btnNovo.Visible      := Not btnNovo.Visible;
   btnEditar.Enabled    := Not btnEditar.Enabled;
   btnEditar.Visible    := Not btnEditar.Visible;
   btnGravar.Enabled    := Not btnGravar.Enabled;
   btnGravar.Visible    := Not btnGravar.Visible;
   btnExcluir.Enabled   := Not btnExcluir.Enabled;
   btnExcluir.Visible   := Not btnExcluir.Visible;
   btnImprimir.Enabled  := Not btnImprimir.Enabled;
   btnImprimir.Visible  := Not btnImprimir.Visible;
   btnSair.Enabled      := Not btnSair.Enabled;
   btnSair.Visible      := Not btnSair.Visible;
   btnFiltrar.Enabled   := Not btnFiltrar.Enabled;
   btnFiltrar.Visible   := Not btnFiltrar.Visible;

   {Navegador}
   btnPrimeiro.Enabled  := Not btnPrimeiro.Enabled;
   btnAnterior.Enabled  := Not btnAnterior.Enabled;
   btnProximo.Enabled   := Not btnProximo.Enabled;
   btnUltimo.Enabled    := Not btnUltimo.Enabled;

   tsInformacao.Enabled := Not tsInformacao.Enabled;
   tsGrid.Enabled       := Not tsGrid.Enabled;
end;

procedure TfrmModeloCad.pLimpar;
var
  Component: TComponent;
begin
   try
      for Component in Self do
      begin
         if Component is TEdit then
            TEdit(Component).Text := '';

//         if Component is TDBLookupCombo then
//            TDBLookupCombo(Component).Text := '';

         if Component is TMemo then
            TMemo(Component).Lines.Clear;

         if Component is TDateTimePicker then
            TDateTimePicker(Component).DateTime := Now;
      end;
   except
   end;
end;

procedure TfrmModeloCad.ControleCor(Sender: TObject);
begin
   if Assigned(CompAnt) then
   begin
      CompAnt.Color      := clWindow;
      CompAnt.Font.Color := clWindowText;
   end;

   if (ActiveControl is TEdit) or
      (ActiveControl is TMemo) or
      (ActiveControl is TMaskEdit) or
      (ActiveControl is TDBEdit) or
      (ActiveControl is TDBMemo) or
      (ActiveControl is TDateTimePicker) then
   begin
      TEdit(ActiveControl).Color      := $00D2FFFF;
      TEdit(ActiveControl).Font.Color := $006C4900;
      CompAnt := TEdit(ActiveControl);
   end
   else
      CompAnt := nil;

   if (ActiveControl is TDBLookupComboBox) then
      TDBLookupComboBox(ActiveControl).DropDown;
end;

end.

