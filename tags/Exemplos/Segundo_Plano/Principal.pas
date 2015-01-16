unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, uThreadPosto, ShellAPI, Menus,
  Grids, DBGrids, StdCtrls, jpeg, DBClient;

const
  wm_IconMessage = wm_User;

type
  TfrmPrincipal = class(TForm)
    Timer: TTimer;
    cLedCommerce: TADOConnection;
    PopupMenu1: TPopupMenu;
    Close1: TMenuItem;
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
     procedure IconTray (var Msg: TMessage);
     message wm_IconMessage;
  public
    { Public declarations }
    nid: TNotifyIconData;
  end;

//.Função da LedPosto.DLL.......................................................
   function fLEDConecta(Concentrador : Integer; Opcao_Serial_Socket : string; Numero_Porta_IP : String) : boolean; StdCall; external 'LedPosto.DLL';
   function fLEDFechaSocket(Concentrador : Integer) : boolean; StdCall; external 'LedPosto.DLL';

var
  frmPrincipal: TfrmPrincipal;
  TArmazena : TConcentrador;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Close1Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if fLEDFechaSocket(0) then
      ShowMessage('Desconectado!!');

   action := cafree;
   frmPrincipal := nil;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
   Icon.Handle          := LoadIcon(HInstance, 'MAINICON');
   nid.cbSize           := sizeof(nid);
   nid.wnd              := Handle;
   nid.uID              := 1;                     // Identificador do ícone
   nid.uCallBAckMessage := wm_IconMessage;
   nid.hIcon            := Icon.Handle;
   nid.szTip            := 'Titulo da Aplicação'; //Titulo da Aplicação
   nid.uFlags           := nif_Message or
   nif_Icon or nif_Tip;
   Shell_NotifyIcon (NIM_ADD, @nid);

   if fLEDConecta(0,'SOCKET','127.0.0.1') = True then
      ShowMessage('Conectado!!');
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
   nid.uFlags := 0;
   Shell_NotifyIcon (NIM_DELETE, @nid);
end;

procedure TfrmPrincipal.IconTray (var Msg: TMessage);
var
  Pt: TPoint;
begin
   if Msg.lParam = wm_rbuttondown then
   begin
      GetCursorPos(Pt);
      PopupMenu1.Popup(Pt.x, Pt.y);
   end;
end;

procedure TfrmPrincipal.TimerTimer(Sender: TObject);
begin
   Try
      TArmazena := TConcentrador.Create(true);
      TArmazena.FreeOnTerminate := true;
      TArmazena.Priority := tpNormal;
      TArmazena.Resume;
   Except
   End;
end;

end.
