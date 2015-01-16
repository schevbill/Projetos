unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Soap.InvokeRegistry, Soap.Rio, Soap.SOAPHTTPClient, Vcl.Imaging.pngimage,
  Vcl.ImgList, IniFiles, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPrincipal = class(TForm)
    pcMenus: TPageControl;
    tsCadastro: TTabSheet;
    tsLancamento: TTabSheet;
    StatusBar1: TStatusBar;
    TMRPrincipal: TTimer;
    HTTPRIO: THTTPRIO;
    BalloonHint: TBalloonHint;
    ilListaImage: TImageList;
    btnFuncionario: TSpeedButton;
    btnCliente: TSpeedButton;
    btnCargo: TSpeedButton;
    tsAgenda: TTabSheet;
    pFundoGrid: TPanel;
    grdAgenda: TDBGrid;
    pFundoFiltro: TPanel;
    tsRelatorios: TTabSheet;

    procedure TMRPrincipalTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnFuncionarioMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnFuncionarioMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnFuncionarioMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnClienteMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnClienteMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnClienteMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnCargoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCargoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnCargoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCargoClick(Sender: TObject);
  private
    { Private declarations }
      posicao : TPoint;
      Capturando : boolean;
      F : TIniFile;    { Private declarations }
  public
    { Public declarations }
  end;

Const
   NomeEmpresa = 'Hightech Informática';
   NomeSistema = 'HS - Medical Sys';

{ Função da DLL Hightech_DLL }
function fInformaExpirar : String; StdCall; External 'Hightech_DLL.Dll';
function fDtExpirar : String; StdCall; External 'Hightech_DLL.Dll';

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses ufrmEntrada, uFuncoes, ufrmCadCargo;

procedure TfrmPrincipal.btnCargoClick(Sender: TObject);
begin
   if frmCadCargo = nil then
      frmCadCargo := TfrmCadCargo.Create(Application);

   frmCadCargo.ShowModal;
end;

procedure TfrmPrincipal.btnCargoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   Capturando := true;
   Posicao.X  := x;
   Posicao.Y  := Y;
end;

procedure TfrmPrincipal.btnCargoMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   if Capturando then
   begin
      If ((Sender as  TSpeedButton).Left -(Posicao.x-x) < (Self.ClientWidth - (Sender as TSpeedButton).Width)) and ((Sender as  TSpeedButton).Left -( Posicao.x-x) > 0) then
         (Sender as  TSpeedButton).Left := (Sender as  TSpeedButton).Left -( Posicao.x-x);

      If ((Sender as TSpeedButton).top -( Posicao.y-y) < (Self.Clientheight)-(Sender as TSpeedButton).Height ) and ((Sender as  TSpeedButton).top -(Posicao.y-y) > 0) then
         (Sender as TSpeedButton).Top := (Sender as  TSpeedButton).Top - (Posicao.Y-y);
   end;
end;

procedure TfrmPrincipal.btnCargoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  left, top : integer;
begin
   if Capturando then
   begin
      Capturando :=  false;

      If ((Sender as  TSpeedButton).Left -(Posicao.x-x) < (Self.ClientWidth - (Sender as TSpeedButton).Width)) and ((Sender as  TSpeedButton).Left -(Posicao.x-x) > 0) then
         (Sender as  TSpeedButton).Left := (Sender as  TSpeedButton).Left - (Posicao.x -x);

      If ((Sender as  TSpeedButton).top -(Posicao.y-y) < (Self.Clientheight - (Sender as TSpeedButton).height) ) and ((Sender as  TSpeedButton).top -(Posicao.y-y) > 0) then
         (Sender as  TSpeedButton).Top := (Sender as  TSpeedButton).Top - (Posicao.y - y);

      left := (Sender as  TSpeedButton).Left;
      top := (Sender as  TSpeedButton).Top;

      F := Tinifile.Create(fGetWindowsDrive + 'Hightech System\icones.ini');
      F.Writeinteger((Sender as  TSpeedButton).Name,'Left',Left);
      F.WriteInteger((Sender as  TSpeedButton).Name,'Top',top);
      F.Free;
   end;
end;

procedure TfrmPrincipal.btnClienteMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   Capturando := true;
   Posicao.X  := x;
   Posicao.Y  := Y;
end;

procedure TfrmPrincipal.btnClienteMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   if Capturando then
   begin
      If ((Sender as  TSpeedButton).Left -(Posicao.x-x) < (Self.ClientWidth - (Sender as TSpeedButton).Width)) and ((Sender as  TSpeedButton).Left -( Posicao.x-x) > 0) then
         (Sender as  TSpeedButton).Left := (Sender as  TSpeedButton).Left -( Posicao.x-x);

      If ((Sender as TSpeedButton).top -( Posicao.y-y) < (Self.Clientheight)-(Sender as TSpeedButton).Height ) and ((Sender as  TSpeedButton).top -(Posicao.y-y) > 0) then
         (Sender as TSpeedButton).Top := (Sender as  TSpeedButton).Top - (Posicao.Y-y);
   end;
end;

procedure TfrmPrincipal.btnClienteMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  left, top : integer;
begin
   if Capturando then
   begin
      Capturando :=  false;

      If ((Sender as  TSpeedButton).Left -(Posicao.x-x) < (Self.ClientWidth - (Sender as TSpeedButton).Width)) and ((Sender as  TSpeedButton).Left -(Posicao.x-x) > 0) then
         (Sender as  TSpeedButton).Left := (Sender as  TSpeedButton).Left - (Posicao.x -x);

      If ((Sender as  TSpeedButton).top -(Posicao.y-y) < (Self.Clientheight - (Sender as TSpeedButton).height) ) and ((Sender as  TSpeedButton).top -(Posicao.y-y) > 0) then
         (Sender as  TSpeedButton).Top := (Sender as  TSpeedButton).Top - (Posicao.y - y);

      left := (Sender as  TSpeedButton).Left;
      top := (Sender as  TSpeedButton).Top;

      F := Tinifile.Create(fGetWindowsDrive + 'Hightech System\icones.ini');
      F.Writeinteger((Sender as  TSpeedButton).Name,'Left',Left);
      F.WriteInteger((Sender as  TSpeedButton).Name,'Top',top);
      F.Free;
   end;
end;

procedure TfrmPrincipal.btnFuncionarioMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   Capturando := true;
   Posicao.X  := x;
   Posicao.Y  := Y;
end;

procedure TfrmPrincipal.btnFuncionarioMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   if Capturando then
   begin
      If ((Sender as  TSpeedButton).Left -(Posicao.x-x) < (Self.ClientWidth - (Sender as TSpeedButton).Width)) and ((Sender as  TSpeedButton).Left -( Posicao.x-x) > 0) then
         (Sender as  TSpeedButton).Left := (Sender as  TSpeedButton).Left -( Posicao.x-x);

      If ((Sender as TSpeedButton).top -( Posicao.y-y) < (Self.Clientheight)-(Sender as TSpeedButton).Height ) and ((Sender as  TSpeedButton).top -(Posicao.y-y) > 0) then
         (Sender as TSpeedButton).Top := (Sender as  TSpeedButton).Top - (Posicao.Y-y);
   end;
end;

procedure TfrmPrincipal.btnFuncionarioMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  left, top : integer;
begin
   if Capturando then
   begin
      Capturando :=  false;

      If ((Sender as  TSpeedButton).Left -(Posicao.x-x) < (Self.ClientWidth - (Sender as TSpeedButton).Width)) and ((Sender as  TSpeedButton).Left -(Posicao.x-x) > 0) then
         (Sender as  TSpeedButton).Left := (Sender as  TSpeedButton).Left - (Posicao.x -x);

      If ((Sender as  TSpeedButton).top -(Posicao.y-y) < (Self.Clientheight - (Sender as TSpeedButton).height) ) and ((Sender as  TSpeedButton).top -(Posicao.y-y) > 0) then
         (Sender as  TSpeedButton).Top := (Sender as  TSpeedButton).Top - (Posicao.y - y);

      left := (Sender as  TSpeedButton).Left;
      top := (Sender as  TSpeedButton).Top;

      F := Tinifile.Create(fGetWindowsDrive + 'Hightech System\icones.ini');
      F.Writeinteger((Sender as  TSpeedButton).Name,'Left',Left);
      F.WriteInteger((Sender as  TSpeedButton).Name,'Top',top);
      F.Free;
   end;
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

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;

   if key = VK_F1 then // F1 - Agenda
      pcMenus.TabIndex := 0;

   if key = VK_F2 then // F2 - Cadastro
      pcMenus.TabIndex := 1;

   if key = VK_F3 then // F3 - Lançamento
      pcMenus.TabIndex := 2;

   if key = VK_F4 then // F4 - Relatorios
      pcMenus.TabIndex := 3;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
   vExpiraS : String;
    vExpira : TDate;
          i : integer;
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

   //...Mover icone.............................................................
   DoubleBuffered := true;

   if FileExists(fGetWindowsDrive + 'Hightech System\icones.ini') then
   begin
      for i:=0 to Self.ComponentCount - 1 do
      Begin
         F := Tinifile.Create(fGetWindowsDrive + 'Hightech System\icones.ini');
         If self.Components[i] is TSpeedButton then
         Begin
            if ( (F.ReadInteger((self.Components[i] as TSpeedButton).Name,'Left', Left)) and (F.ReadInteger((self.Components[i] as TSpeedButton).Name,'Top', Top)) )  <> 0 then
            begin
               TForm(self.Components[i] as TSpeedButton).Left:= F.ReadInteger((self.Components[i] as TSpeedButton).Name,'Left', Left);
               Tform(self.Components[i] as TSpeedButton).top := F.ReadInteger((self.Components[i] as TSpeedButton).Name,'Top', Top);
            end;
         end;
         F.Free;
      end;
    end;
   //...........................................................................
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

end.
