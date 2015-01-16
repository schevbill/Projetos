unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery;

type
  TFLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnSair: TBitBtn;
    PUSUARIO: TIBQuery;
    edtUsuario: TEdit;
    edtNome: TEdit;
    edtSenha: TEdit;
    btnEntrar: TBitBtn;
    Label4: TLabel;
    PUSUARIOID_USUARIO: TIntegerField;
    PUSUARIONOME: TIBStringField;
    PUSUARIOSENHA: TIBStringField;
    PUSUARIOUSUARIO: TIBStringField;
    procedure edtusuarioExit(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;
   Fechar : Boolean;


implementation

uses uFuncoesProj,UDMCAD, UPrincipal;

{$R *.dfm}

procedure TFLogin.edtusuarioExit(Sender: TObject);
begin

   if edtUsuario.Text = '' then
    Exit;

      PUSUARIO.Close;
      PUSUARIO.Open;

      if PUSUARIO.Locate('USUARIO',edtUsuario.Text,[loCaseInsensitive]) then
      begin
         edtNome.Text := PUSUARIONOME.AsString;
         edtSenha.SetFocus;
      end
      else
      begin
         MessageBox(Handle,'Usuário não encontrado!','Aviso',MB_OK+MB_ICONWARNING);
         edtNome.Clear;
         edtUsuario.clear;
         edtUsuario.SetFocus;
      end;
end;

procedure TFLogin.btnSairClick(Sender: TObject);
begin

  Application.Terminate;
end;

procedure TFLogin.btnEntrarClick(Sender: TObject);
begin
    if not PUSUARIO.Active then
      Exit;

   if PUSUARIOSENHA.Text <> edtSenha.Text then
   begin
      MessageBox(Handle,'Senha incorreta!','Aviso',MB_OK+MB_ICONWARNING);
      edtSenha.Clear;
      edtSenha.SetFocus;
      Exit;
   end
   else
   begin
    ID_Usuario := PUSUARIOID_USUARIO.AsInteger;
    if FPrincipal = nil then
     FPrincipal := TFPrincipal.Create(Application);

    FPrincipal.ShowModal;
    Fechar := False;
     //Close;
    FLogin.Visible := false;
   end;
end;

procedure TFLogin.FormCreate(Sender: TObject);
begin
  PUSUARIO.Active := true;

   if FileExists('D:\Projetos K2\Projetos Delphi\Projetos Hightech\branches\Saida de Estoque\SaidaEstoque.exe') then
   begin
      edtUsuario.Text := 'makuko';
      edtSenha.Text   := '123';
   end;

end;



procedure TFLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FLogin := nil;
  Action    := caFree;

   if Fechar then
      Application.Terminate
end;

procedure TFLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
   begin
     if not PUSUARIO.Active then
      Exit;

     if PUSUARIOSENHA.Text <> edtSenha.Text then
     begin
       MessageBox(Handle,'Senha incorreta!','Aviso',MB_OK+MB_ICONWARNING);
       edtSenha.Clear;
       edtSenha.SetFocus;
       Exit;
     end
     else
     begin
      ID_Usuario := PUSUARIOID_USUARIO.AsInteger;
      if FPrincipal = nil then
       FPrincipal := TFPrincipal.Create(Application);

      FPrincipal.Show;
      Fechar := False;
       //Close;
      FLogin.Visible := false;
     end;
   end;
end;

end.
