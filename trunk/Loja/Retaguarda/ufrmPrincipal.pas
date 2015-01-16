unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ImgList, Vcl.Imaging.jpeg, DateUtils, Data.DB,
  IBCustomDataSet, IBQuery, Soap.InvokeRegistry, Soap.Rio, Soap.SOAPHTTPClient;

type
  TfrmPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    MNMPrincipal: TMainMenu;
    MNM_Cadastro: TMenuItem;
    N44: TMenuItem;
    MNM_CGeral: TMenuItem;
    N45: TMenuItem;
    MNM_Produtos: TMenuItem;
    Produtos2: TMenuItem;
    MNM_SitTributaria: TMenuItem;
    MNM_UnidadedeMedida: TMenuItem;
    MNM_Grupo: TMenuItem;
    CdigoSituaoTributria1: TMenuItem;
    ClienteFornecedor1: TMenuItem;
    MNM_Funcionario: TMenuItem;
    MNM_CNota: TMenuItem;
    N51: TMenuItem;
    Municipio1: TMenuItem;
    NaturezadaOperao1: TMenuItem;
    ransportadora1: TMenuItem;
    MNM_Lancamento: TMenuItem;
    N54: TMenuItem;
    MNM_LFinanceiro: TMenuItem;
    N55: TMenuItem;
    Financeiro1: TMenuItem;
    N60: TMenuItem;
    N56: TMenuItem;
    MNM_LEstoque: TMenuItem;
    N57: TMenuItem;
    Estoque1: TMenuItem;
    MovimentodeEstoque1: TMenuItem;
    LanamentodeEstoque1: TMenuItem;
    N8: TMenuItem;
    MNM_LNota: TMenuItem;
    N10: TMenuItem;
    NFe1: TMenuItem;
    MNM_Relatorio: TMenuItem;
    MNM_Geral: TMenuItem;
    MNM_Sair: TMenuItem;
    MNM_Ajuda: TMenuItem;
    MNM_Sobre: TMenuItem;
    N1: TMenuItem;
    TMRPrincipal: TTimer;
    ilListaImage: TImageList;
    ImageLogo: TImage;
    HTTPRIO: THTTPRIO;
    urno1: TMenuItem;
    Usurios1: TMenuItem;
    procedure TMRPrincipalTimer(Sender: TObject);
    procedure MNM_SairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Municipio1Click(Sender: TObject);
    procedure MNM_FuncionarioClick(Sender: TObject);
    procedure urno1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ClienteFornecedor1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const
   NomeEmpresa = 'Hightech Informática';
   NomeSistema = 'Hightech System';

{ Função da DLL Hightech_DLL }
function fInformaExpirar : String; StdCall; External 'Hightech_DLL.Dll';
function fDtExpirar : String; StdCall; External 'Hightech_DLL.Dll';

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses ufrmEntrada, uModule, ufrmCadCidade, UfrmFuncionario,
  ufrmCadTurno, ufrmCadUsuario, ufrmcadClifor, uFuncoes;

procedure TfrmPrincipal.ClienteFornecedor1Click(Sender: TObject);
begin
   if frmcadClifor = nil then
      frmcadClifor := TfrmcadClifor.Create(Application);

   frmcadClifor.ShowModal;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
var
   vPergunta : Integer;
begin
   vPergunta := MessageBox(Handle, pchar('Confirma Sair do Projeto ?') , pchar(NomeSistema), 292);

   if vPergunta = 6 then
   begin
      Action := caFree;  {sai do projeto}
      Application.Terminate;
   end
   else
      Action := caNone;  {não sai do projeto};
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
   ImageLogo.left := trunc((frmPrincipal.width - ImageLogo.width) / 2);
   ImageLogo.top := trunc((frmPrincipal.height - ImageLogo.height) / 2);
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
end;

procedure TfrmPrincipal.FormResize(Sender: TObject);
begin
   ImageLogo.left := trunc((frmPrincipal.width - ImageLogo.width) / 2);
   ImageLogo.top  := trunc((frmPrincipal.height - ImageLogo.height) / 2);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
   vExpiraS : String;
    vExpira : TDate;
begin
   frmEntrada.Free;
   frmEntrada := nil;

   // Verifica e cria o diretorio
   if not DirectoryExists(fGetWindowsDrive + 'Hightech System') then
      ForceDirectories(fGetWindowsDrive + 'Hightech System');

   if not FileExists(fGetWindowsDrive + 'Hightech System\Hightech_DLL.DLL') then
   begin
      MessageBox(Handle, pchar('Entre em contato com a '+ NomeEmpresa) , pchar(NomeSistema), 48);
      Application.Terminate;
   end;

   vExpiraS := fDtExpirar;
   vExpira  := Date;

   if vExpira >= StrToDate(vExpiraS) then
   begin
      ShowMessage(fInformaExpirar);
      Application.Terminate;
   end;
end;

procedure TfrmPrincipal.MNM_FuncionarioClick(Sender: TObject);
begin
   if frmCadFuncionario = nil then
      frmCadFuncionario := TfrmCadFuncionario.Create(Application);

   frmCadFuncionario.ShowModal;
end;

procedure TfrmPrincipal.MNM_SairClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmPrincipal.Municipio1Click(Sender: TObject);
begin
   if frmCadCidade = nil then
      frmCadCidade := TfrmCadCidade.Create(Application);

   frmCadCidade.ShowModal;
end;

procedure TfrmPrincipal.TMRPrincipalTimer(Sender: TObject);
Var
  KeyState : TKeyboardState;
begin
   GetKeyboardState(KeyState);
   if (KeyState[VK_NUMLOCK] = 1) then
      StatusBar1.Panels[0].Text := 'NUM'
   else
      StatusBar1.Panels[0].Text := '';

   if (KeyState[VK_CAPITAL] = 1) then
      StatusBar1.Panels[1].Text := 'CAPS'
   else
      StatusBar1.Panels[1].Text := '';

   if (KeyState[VK_SCROLL]  = 1) then
      StatusBar1.Panels[2].Text := 'SCROLL'
   else
      StatusBar1.Panels[2].Text := '';

      StatusBar1.Panels[3].Text := FormatDateTime('dddd, d "de" mmmm "de" yyyy ' +
                                                  '"-" hh:mm:ss ', date+time);

   StatusBar1.Panels[4].Text := fInformaExpirar;
   StatusBar1.Panels[5].Text := 'Copyright © 2013 - '+FormatDateTime('yyyy',Date)+ ' - ' + NomeEmpresa;
end;

procedure TfrmPrincipal.urno1Click(Sender: TObject);
begin
   if frmCadturno = nil then
      frmCadturno := TfrmCadturno.Create(Application);

   frmCadTurno.ShowModal;
end;

procedure TfrmPrincipal.Usurios1Click(Sender: TObject);
begin
   if frmCadUsuario = nil then
     frmCadUsuario := TfrmCadUsuario.Create(Application);
   frmCadUsuario.ShowModal;
end;

end.

{FAZER
   * TELA DE LOGIN,
   * FAZER NOVO MENU DA TELA PRINCIPAL - ICONE MOVEL
   * TELA DE TRANSPORTADORA
   * TELA DE CONTADOR
   * TELA DE GRUPO
   * TELA DE UNIDADE DE MEDIDA
   * TELA DE CADASTRO DE EMPRESA * FAZER MULTI EMPRESA
   * TELA CST E OUTROS IMPOSTO
   * TELA DE PRODUTO
}
