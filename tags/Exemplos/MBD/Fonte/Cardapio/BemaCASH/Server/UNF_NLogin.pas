unit UNF_NLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, jpeg, ComCtrls;

type
  TFRM_NLogin = class(TForm)
    PNL_Fundo: TPanel;
    ScrollBox1: TScrollBox;
    PNL_Botoes: TPanel;
    SPB_Ok: TSpeedButton;
    SPB_Cancelar: TSpeedButton;
    IMG_BITMAP: TImage;
    LBL_Titulo: TLabel;
    LBL_Login: TLabel;
    EDT_Login: TEdit;
    LBL_Senha: TLabel;
    EDT_Senha: TEdit;
    StatusBar1: TStatusBar;
    TMR_Principal: TTimer;
    procedure SPB_CancelarClick(Sender: TObject);
    procedure SPB_OkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TMR_PrincipalTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_NLogin: TFRM_NLogin;

implementation

uses UNF_Funcoes, UNF_Mensagem, UNF_MensagemDeErro, UNF_Modulo,
  UNF_Pergunta, UNF_PesLookUp;

{$R *.dfm}

procedure TFRM_NLogin.SPB_CancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TFRM_NLogin.SPB_OkClick(Sender: TObject);
var
  User1, Pass1 : String;
begin
   User1 := EDT_Login.Text;
   Pass1 := EDT_Senha.Text;

   FRM_Modulo.IBT_Usuario.Close;
   FRM_Modulo.IBT_Usuario.Open;

   if (User1 = _User_Name) and (Pass1  = _Password) then
   begin
      User_Name := User1;
      Password  := Pass1;

      vSenOk := 1;
      Close;
      Exit;
   end;

   if not FRM_Modulo.IBT_Usuario.Locate('LOGIN',crypt(User1),[]) then
   begin
      Mensagem('Senha invalida  ou usuario não cadastrado!!!');
      EDT_Login.Text := '';
      EDT_Senha.Text := '';
      EDT_Login.SetFocus;
      Exit;
   end;

   if FRM_Modulo.IBT_UsuarioSENHA.Value <> crypt(Pass1) then
   begin
      Mensagem('Senha invalida  ou usuario não cadastrado!!!');
      EDT_Login.Text := '';
      EDT_Senha.Text := '';
      EDT_Login.SetFocus;
      Exit;
   end;

   User_Name := User1;
   Password  := Pass1;

   vSenOk := 1;
   Close;
end;

procedure TFRM_NLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {* mudar de um edit para outro com <ENTER> *}
  if Key = VK_RETURN then
  begin
     if EDT_Senha.Focused then
       SPB_OkClick(Self)
     else
     begin
        key := word(#0);
        Perform(WM_NEXTDLGCTL,0,0);
     end;
  end;
end;

procedure TFRM_NLogin.TMR_PrincipalTimer(Sender: TObject);
Var
  KeyState : TKeyboardState;
begin
   GetKeyboardState(KeyState);

   if (KeyState[VK_CAPITAL] = 1) then
      StatusBar1.Panels[0].Text := 'CAPS'
   else
      StatusBar1.Panels[0].Text := '';

      StatusBar1.Panels[1].Text := FormatDateTime('dddd, d "de" mmmm "de" yyyy ' +
                                                  '"-" hh:mm:ss ', date+time);
end;

procedure TFRM_NLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if vSenOk = 2 then
      Application.Terminate;
end;

procedure TFRM_NLogin.FormShow(Sender: TObject);
begin
   EDT_Login.Text := '';
   EDT_Senha.Text := '';
   EDT_Login.SetFocus;
end;

end.
