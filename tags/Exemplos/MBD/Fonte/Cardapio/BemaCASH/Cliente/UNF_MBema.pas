unit UNF_MBema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, IBDatabase, DB, ShellAPI, IniFileS, IBCustomDataSet,
  IBQuery, ExtCtrls, StdCtrls, ComCtrls, Grids, DBGrids, jpeg, IBTable;

Const
   WM_TRAYICON = WM_USER+1;

type
    TFRM_MBema = class(TForm)
    PPP_Principal: TPopupMenu;
    Sair1: TMenuItem;
    StatusBar1: TStatusBar;
    MNM_Principal: TMainMenu;
    Mesa1: TMenuItem;
    SAir2: TMenuItem;
    Comandos1: TMenuItem;
    MapaMensas1: TMenuItem;
    IMG_LogoMBD: TImage;
    N1: TMenuItem;
    N2: TMenuItem;
    MapadeMesas1: TMenuItem;
    FechaDia1: TMenuItem;
    FechaDia2: TMenuItem;
    AgruparMesas1: TMenuItem;
    AgruparMesas2: TMenuItem;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure MapaMensas1Click(Sender: TObject);
    procedure SAir2Click(Sender: TObject);
    procedure MapadeMesas1Click(Sender: TObject);
    procedure FechaDia1Click(Sender: TObject);
    procedure FechaDia2Click(Sender: TObject);
    procedure AgruparMesas1Click(Sender: TObject);
    procedure AgruparMesas2Click(Sender: TObject);
  private
    { Private declarations }
    TrayIconData : TNotifyIconData;
  public
    { Public declarations }
    procedure TrayMessage(var Msg : TMessage); message WM_TRAYICON;
  end;

var
   FRM_MBema : TFRM_MBema;

implementation

uses UNF_LanMesas, UNF_Funcoes, UNF_Modulo, UNF_FechaDia, UNF_AgruparMesas;

{$R *.dfm}

procedure TFRM_MBema.TrayMessage(var Msg: TMessage);
var
  Pt : TPoint;
begin
   case Msg.lParam of
      WM_LBUTTONDOWN:
      begin
         FRM_MBema.Show;
      end;
      WM_MBUTTONDOWN:
      begin
         FRM_MBema.Hide;
      end;
      WM_RBUTTONDOWN:
      begin
         GetCursorPos(Pt);
         FRM_MBema.PPP_Principal.Popup(Pt.X,Pt.Y);
      end;
   end;
end;

procedure TFRM_MBema.FormDestroy(Sender: TObject);
begin
   Shell_NotifyIcon(NIM_DELETE,@TrayIconData);
end;

procedure TFRM_MBema.FormCreate(Sender: TObject);
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
      szTip            := 'MBema';
   end;

   Shell_NotifyIcon(NIM_ADD,@TrayIconData);
   //...........................................................................
end;

procedure TFRM_MBema.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caNone;
   Hide;
end;

procedure TFRM_MBema.Sair1Click(Sender: TObject);
begin
   Close;
   Application.Terminate;
end;

procedure TFRM_MBema.MapaMensas1Click(Sender: TObject);
var
   vUsuarioL : Integer;
begin
   if (vLogin = '') then
   begin
      vUsuarioL := Peslookup(FRM_Modulo.DTS_FunUse,'DESCRICAO','CODIGO_ID');
      FRM_Modulo.IBT_Usuario.Locate('CODIGO_ID',vUsuarioL,[]);

      vLogin := FRM_Modulo.IBT_UsuarioLOGIN.Value;
   end;

   if FRM_LanMesas = nil then
      FRM_LanMesas := TFRM_LanMesas.Create(Application);

   FRM_LanMesas.ShowModal;
end;

procedure TFRM_MBema.SAir2Click(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TFRM_MBema.MapadeMesas1Click(Sender: TObject);
begin
    MapaMensas1.Click;
end;

procedure TFRM_MBema.FechaDia1Click(Sender: TObject);
begin
   if FRM_FechaDia = nil then
      FRM_FechaDia := TFRM_FechaDia.Create(Application);

   FRM_FechaDia.ShowModal;
end;

procedure TFRM_MBema.FechaDia2Click(Sender: TObject);
begin
   FechaDia1.Click;
end;

procedure TFRM_MBema.AgruparMesas1Click(Sender: TObject);
begin
   if FRM_AgruparMesas = nil then
      FRM_AgruparMesas := TFRM_AgruparMesas.Create(Application);

   FRM_AgruparMesas.ShowModal;
end;

procedure TFRM_MBema.AgruparMesas2Click(Sender: TObject);
begin
   AgruparMesas1.Click;
end;

end.
