unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, XPMan, ExtCtrls, ComCtrls;

type
  TFPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    CadastroClientes1: TMenuItem;
    Clientes1: TMenuItem;
    Produtos1: TMenuItem;
    Usurios1: TMenuItem;
    Sair1: TMenuItem;
    XPManifest1: TXPManifest;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    OF1: TMenuItem;
    BuscarOF1: TMenuItem;
    Relatrios1: TMenuItem;
    otalMensal1: TMenuItem;
    procedure Clientes1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure BuscarOF1Click(Sender: TObject);
    procedure otalMensal1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses funcoes,UCadCliente, UDMCAD, UCadUsuario, UCadProduto, ULogin,
  StdCtrls, ULancMaterial;

{$R *.dfm}

procedure TFPrincipal.Clientes1Click(Sender: TObject);
begin
 if FCadPaciente = nil then
  FCadPaciente := TFCadpaciente.Create(Application);
  FCadPaciente.ShowModal;
  FCadPaciente.PageControl1.TabIndex :=1;
end;

procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Application.Terminate;
end;

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
  if FLogin = nil then
     FLogin := TFLogin.Create(Application);

    FLogin.ShowModal;
end;

procedure TFPrincipal.otalMensal1Click(Sender: TObject);
var
caminho :string;
begin
  caminho := ExtractFilePath(Application.ExeName);

  DMCAD.frxReport.LoadFromFile(caminho+'Reports\gerencial_mensal.fr3');
  DMCAD.frxReport.PrintOptions.ShowDialog := True;
  DMCAD.frxReport.ShowReport(true);
end;

procedure TFPrincipal.Sair1Click(Sender: TObject);
begin
   if MessageBox(Handle,'Deseja sair','Aviso',MB_YESNO+MB_ICONQUESTION) = idyes    then
    Application.terminate;
end;



procedure TFPrincipal.Usurios1Click(Sender: TObject);
begin
  if FUsuario = nil then
  FUsuario := TFUsuario.Create(Application);
  FUsuario.ShowModal;
end;

procedure TFPrincipal.Timer1Timer(Sender: TObject);
begin
 Statusbar1.Panels [0].Text := 'Usuário: '+FLogin.edtUsuario.Text;//Usuário
 Statusbar1.Panels [1].Text := ' '+datetostr(date);// para data
 statusbar1.Panels [2].Text := ' '+timetostr(now);//para hora
 statusbar1.Panels [3].Text := 'Versão 1.0';// Versão

end;

procedure TFPrincipal.Produtos1Click(Sender: TObject);
begin
  if FCadProduto = nil then
  FCadProduto := TFCadProduto.Create(Application);
  FCadProduto.ShowModal;
  FCadProduto.PageControl1.TabIndex :=1;
end;

procedure TFPrincipal.BuscarOF1Click(Sender: TObject);
begin
  if FLancMaterial  = nil then
   FLancMaterial := TFLancMaterial.Create(Application);

  FLancMaterial.ShowModal;
  FLancMaterial.PageControl1.TabIndex :=1;
  DMCAD.PesquisaPaciente.close;
  DMCAD.PesquisaPaciente.open;
  DMCAD.PesquisaPaciente.First;
end;

end.
