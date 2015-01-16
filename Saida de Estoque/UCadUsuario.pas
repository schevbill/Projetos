unit UCadUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls;

type
  TFUsuario = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnApagar: TBitBtn;
    btnGravar: TBitBtn;
    BtnCancelar: TBitBtn;
    dbnnavi: TDBNavigator;
    DBEusuario: TDBEdit;
    DBEnome: TDBEdit;
    DBEsenha: TDBEdit;
    DBEconfsenha: TEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
   // procedure dbnTabelaClick(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUsuario: TFUsuario;
  Alterar : Boolean;

implementation

uses UCadCliente, UDMCAD, ULogin, Unit2, UPrincipal;

{$R *.dfm}



procedure TFUsuario.btnNovoClick(Sender: TObject);
begin
 DBEusuario.Enabled   := true;
 DBEnome.Enabled      := true;
 DBEsenha.Enabled     := true;
 DBEconfsenha.Enabled := true;
 dbnnavi.BtnClick(nbInsert);
 btnGravar.Enabled    := true;
 BtnCancelar.Enabled  := true;
 Alterar              := false;
 DBEusuario.SetFocus;

end;

procedure TFUsuario.btnAlterarClick(Sender: TObject);
begin
 dbnnavi.BtnClick(nbEdit);
 DBEusuario.Enabled   := true;
 DBEnome.Enabled      := true;
 DBEsenha.Enabled     := true;
 DBEconfsenha.Enabled := true;
 btnGravar.Enabled    := true;
 BtnCancelar.Enabled  := true;
 Alterar              := true;
 DBEusuario.SetFocus;
end;

procedure TFUsuario.btnApagarClick(Sender: TObject);
begin
 dbnnavi.BtnClick(nbDelete);
end;

procedure TFUsuario.btnGravarClick(Sender: TObject);
var
max :integer;
begin
 if (DBEsenha.text) = (DBEconfsenha.text) then
 begin

  if  alterar then
  begin
   DMCAD.USUARIOS.Post;
   DMCAD.IBTransaction1.CommitRetaining;
   btnGravar.Enabled := false;

   DBEusuario.Enabled   := false;
   DBEnome.Enabled      := false;
   DBEsenha.Enabled     := false;
   DBEconfsenha.Enabled := false;
   DBEconfsenha.Clear;
  end
  else
  begin
   DMCAD.USUARIOS.Post;
   DMCAD.IBTransaction1.CommitRetaining;
   btnGravar.Enabled := false;

   DBEusuario.Enabled   := false;
   DBEnome.Enabled      := false;
   DBEsenha.Enabled     := false;
   DBEconfsenha.Enabled := false;
   DBEconfsenha.Clear;
  end;
 end
 else
 begin
   MessageDlg('Confirmação de senha não confere.',mtInformation,[mbYes],0);
   DBEsenha.SetFocus;
   DBEsenha.Clear;
   DBEconfsenha.Clear;
 end;
end;

procedure TFUsuario.BtnCancelarClick(Sender: TObject);
begin
 dbnnavi.BtnClick(nbCancel);
 DBEusuario.Enabled   := false;
 DBEnome.Enabled      := false;
 DBEsenha.Enabled     := false;
 DBEconfsenha.Enabled := false;
 btnGravar.Enabled    := false;
end;

procedure TFUsuario.FormCreate(Sender: TObject);
begin
  DMCAD.USUARIOS.Close;
  DMCAD.USUARIOS.Open;

;

end;

end.
