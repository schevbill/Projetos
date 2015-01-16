unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    procedure ComboBox1Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure AjustarLargura(ComboBox: TComboBox);
var
I: Integer;
TextLen: LongInt;
lf: LOGFONT;
f: HFONT;
w: Integer;
begin
   FillChar(lf, SizeOf(lf), 0);

   StrPCopy(lf.lfFaceName, ComboBox.Font.Name);
   lf.lfHeight := ComboBox.Font.Height;
   lf.lfWeight := FW_NORMAL;

   if fsBold in ComboBox.Font.Style then begin
   lf.lfWeight := lf.lfWeight or FW_BOLD;
   end;

   f := CreateFontIndirect(lf);
   if f <> 0 then begin
   try
   ComboBox.Canvas.Handle := GetDC(ComboBox.Handle);
   SelectObject(ComboBox.Canvas.Handle, f);
try
   w := 0;
   for I := 0 to Pred(ComboBox.Items.Count) do begin
   TextLen := ComboBox.Canvas.TextWidth(ComboBox.Items[I]);
   if TextLen > w then begin
   w := TextLen;
   end;
   end;
   Inc(w, GetSystemMetrics(SM_CYVTHUMB) + GetSystemMetrics(SM_CXVSCROLL));

   SendMessage(ComboBox.Handle, CB_SETDROPPEDWIDTH, w, 0);
   finally
   ReleaseDC(ComboBox.Handle, ComboBox.Canvas.Handle);
   end;
   finally
   DeleteObject(f);
end;
end;


end;procedure TForm1.ComboBox1Enter(Sender: TObject);
begin
//AjustarLargura(ComboBox1);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   AjustarLargura(ComboBox1);
end;
{var  i,vTamanho : integer;
         TextLen: LongInt;

begin
   vTamanho:= 0;

   for I := 0 to ComboBox1.Items.Count - 1 do
      begin
         TextLen := ComboBox1.Canvas.TextWidth(ComboBox1.Items[I]);

         if TextLen > vTamanho then
           vTamanho:= TextLen;
      end;

   Inc(vTamanho, GetSystemMetrics(SM_CYVTHUMB) + GetSystemMetrics(SM_CXVSCROLL));
   SendMessage(ComboBox1.Handle,CB_SETDROPPEDWIDTH,vTamanho,0);

end;}

end.
