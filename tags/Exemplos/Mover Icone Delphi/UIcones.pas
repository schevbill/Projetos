unit UIcones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pngimage, IniFiles, Vcl.Imaging.jpeg;

type
  TForm1 = class(TForm)
    IcoMail: TImage;
    IcoNet: TImage;
    IcoNote: TImage;
    IcoCalc: TImage;
    procedure IcoMailMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure IcoMailMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure IcoMailMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
  private
        posicao : TPoint;
        Capturando : boolean;
        F : TIniFile;    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
var
   i : integer;
Begin
     DoubleBuffered := true;

     if FileExists('F:\icones.ini') then
       begin
         for i:=0 to Self.ComponentCount - 1 do
            Begin
               F := Tinifile.Create('F:\icones.ini');
               If self.Components[i] is Timage then
                  Begin
                     if ( (F.ReadInteger((self.Components[i] as Timage).Name,'Left', Left)) and (F.ReadInteger((self.Components[i] as Timage).Name,'Top', Top)) )  <> 0 then
                       begin
                          TForm(self.Components[i] as Timage).Left:= F.ReadInteger((self.Components[i] as Timage).Name,'Left', Left);
                          Tform(self.Components[i] as Timage).top := F.ReadInteger((self.Components[i] as Timage).Name,'Top', Top);
                       end;
                  end;
               F.Free;
            end;
       end;
end;

procedure TForm1.IcoMailMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Capturando := true;
  Posicao.X := x;
  Posicao.Y := Y;
  
end;

procedure TForm1.IcoMailMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   if Capturando then
       begin
          If ((Sender as  Timage).Left -(Posicao.x-x) < (Self.ClientWidth - (Sender as TImage).Width)) and ((Sender as  Timage).Left -( Posicao.x-x) > 0) then
              (Sender as  Timage).Left := (Sender as  Timage).Left -( Posicao.x-x);

          If ((Sender as Timage).top -( Posicao.y-y) < (Self.Clientheight)-(Sender as TImage).Height ) and ((Sender as  Timage).top -(Posicao.y-y) > 0) then
              (Sender as Timage).Top := (Sender as  Timage).Top - (Posicao.Y-y);
        end;
end;

procedure TForm1.IcoMailMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  left, top : integer;
begin
    if Capturando then
      begin
          Capturando :=  false;

          If ((Sender as  Timage).Left -(Posicao.x-x) < (Self.ClientWidth - (Sender as TImage).Width)) and ((Sender as  Timage).Left -(Posicao.x-x) > 0) then
             (Sender as  Timage).Left := (Sender as  Timage).Left - (Posicao.x -x);

          If ((Sender as  Timage).top -(Posicao.y-y) < (Self.Clientheight - (Sender as TImage).height) ) and ((Sender as  Timage).top -(Posicao.y-y) > 0) then
             (Sender as  Timage).Top := (Sender as  Timage).Top - (Posicao.y - y);

          left := (Sender as  Timage).Left;
          top := (Sender as  Timage).Top;

          F := Tinifile.Create('F:\icones.ini');
          F.Writeinteger((Sender as  Timage).Name,'Left',Left);
          F.WriteInteger((Sender as  Timage).Name,'Top',top);
          F.Free;
      end;
end;

end.
