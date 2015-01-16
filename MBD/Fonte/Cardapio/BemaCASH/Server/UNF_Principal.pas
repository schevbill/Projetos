unit UNF_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, IBDatabase, DB, ShellAPI, IniFileS, IBCustomDataSet,
  IBQuery, ExtCtrls, StdCtrls, ComCtrls, Grids, DBGrids, jpeg;

Const
   WM_TRAYICON = WM_USER+1;

type
  TFRM_Principal = class(TForm)
    PPP_Principal: TPopupMenu;
    AbrirSistema1: TMenuItem;
    Sair1: TMenuItem;
    TRM_Lista: TTimer;
    MNM_Principal: TMainMenu;
    Ativao1: TMenuItem;
    Exportao1: TMenuItem;
    Server1: TMenuItem;
    Sobre1: TMenuItem;
    EscutarPedidos1: TMenuItem;
    FinalizarPedidos1: TMenuItem;
    IMG_LogoMBD: TImage;
    DiretoSQLServer1: TMenuItem;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure AbrirSistema1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Exportao1Click(Sender: TObject);
    procedure EscutarPedidos1Click(Sender: TObject);
    procedure FinalizarPedidos1Click(Sender: TObject);
  private
    { Private declarations }
    TrayIconData : TNotifyIconData;
  public
    { Public declarations }
    procedure TrayMessage(var Msg : TMessage); message WM_TRAYICON;
  end;

var
  FRM_Principal : TFRM_Principal;

implementation

uses UNF_Exportacao, UNF_Funcoes, UNF_Entrada;

{$R *.dfm}

procedure TFRM_Principal.TrayMessage(var Msg: TMessage);
var
  Pt : TPoint;
begin
   case Msg.lParam of
      WM_LBUTTONDOWN:
      begin
         FRM_Principal.Show;
      end;
      WM_MBUTTONDOWN:
      begin
         FRM_Principal.Hide;
      end;
      WM_RBUTTONDOWN:
      begin
         GetCursorPos(Pt);
         PPP_Principal.Popup(Pt.X,Pt.Y);
      end;
   end;
end;


procedure TFRM_Principal.FormDestroy(Sender: TObject);
begin
   Shell_NotifyIcon(NIM_DELETE,@TrayIconData);
end;

procedure TFRM_Principal.FormCreate(Sender: TObject);
begin
   Application.ShowMainForm := False;

   // Colocar na Bandeja........................................................
   with TrayIconData do
   begin
      cbSize           := sizeof(TrayIconData);
      Wnd              := Self.Handle;
      uId              := 0;
      uCallBackMessage := WM_TRAYICON;
      uFlags           := NIF_ICON or NIF_TIP or NIF_MESSAGE;
      hIcon            := Application.Icon.Handle;
      szTip            := 'BemaServer';
   end;

   Shell_NotifyIcon(NIM_ADD,@TrayIconData);
   //...........................................................................

   //---------------------------------------------------------------------------
   KillTask_('MSE.exe');
   KillTask_('MSP.exe');

   winexec(pchar(GetCurrentDir+'\MSE.exe'),SW_HIDE);
   winexec(pchar(GetCurrentDir+'\MSP.exe'),SW_HIDE);
   //---------------------------------------------------------------------------
end;

procedure TFRM_Principal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caNone;
   Hide;
end;

procedure TFRM_Principal.Sair1Click(Sender: TObject);
begin
   KillTask_('MSE.exe');
   KillTask_('MSP.exe');

   Close;
   Application.Terminate;
end;

procedure TFRM_Principal.AbrirSistema1Click(Sender: TObject);
begin
   FRM_Principal.Show;
end;

procedure TFRM_Principal.FormShow(Sender: TObject);
begin
   FRM_Entrada.Free;
   FRM_Entrada:= nil;

   TRM_Lista.Enabled := True;
   FRM_Principal.Caption := 'BemaCash - MBD ' + VarVersao;
end;

procedure TFRM_Principal.Exportao1Click(Sender: TObject);
begin
   if FRM_Exportacao = nil then
      FRM_Exportacao := TFRM_Exportacao.Create(Application);

   FRM_Exportacao.ShowModal;
end;

procedure TFRM_Principal.EscutarPedidos1Click(Sender: TObject);
begin
   KillTask_('MSE.exe');
   winexec(pchar(GetCurrentDir+'\MSE.exe'),SW_HIDE);
end;

procedure TFRM_Principal.FinalizarPedidos1Click(Sender: TObject);
begin
   KillTask_('MSP.exe');
   winexec(pchar(GetCurrentDir+'\MSP.exe'),SW_HIDE);
end;

end.
