unit CryptSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, frxClass, frxCrypt;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;


    Function Crypt(Action, Src: String): String;
    function Encrypt( Senha:String ): String;

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
   Edit1.text:= Crypt('C',Edit1.text);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   Edit1.text:= Crypt('D',Edit1.text);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   Edit1.text := Encrypt(Edit1.text);
end;

function TForm1.Encrypt( Senha:String ): String;
{Encripta uma String}
Const
    Chave : String = 'Hightech';
Var
    x,y : Integer;
    NovaSenha : String;
begin
   for x := 1 to Length( Chave ) do begin
      NovaSenha := '';
      for y := 1 to Length( Senha ) do
         NovaSenha := NovaSenha + chr( (Ord(Chave[x]) xor Ord(Senha[y])));
      Senha := NovaSenha;
   end;
   result := Senha;
end;

Function TForm1.Crypt(Action, Src: String): String;
Label Fim;
var
   KeyLen : Integer;
   KeyPos : Integer;
   OffSet : Integer;
   Dest, Key : String;
   SrcPos : Integer;
   SrcAsc : Integer;
   TmpSrcAsc : Integer;
   Range : Integer;
begin
   if (Src = '') Then
   begin
      Result:= '';
   Goto
      Fim;
   end;

   Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKLK3LAKDJSL9RTIKJ';
   Dest := '';
   KeyLen := Length(Key);
   KeyPos := 0;
   SrcPos := 0;
   SrcAsc := 0;
   Range := 256;

   if (Action = UpperCase('C')) then
   begin
      Randomize;
      OffSet := Random(Range);
      Dest := Format('%1.2x',[OffSet]);

      for SrcPos := 1 to Length(Src) do
      begin
         Application.ProcessMessages;
         SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;

         if KeyPos < KeyLen then
            KeyPos := KeyPos + 1
         else
            KeyPos := 1;

         SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
         Dest := Dest + Format('%1.2x',[SrcAsc]);
         OffSet := SrcAsc;
      end;
   end
   Else if (Action = UpperCase('D')) then
   begin
      OffSet := StrToInt('$'+ copy(Src,1,2));
      SrcPos := 3;
   repeat
      SrcAsc := StrToInt('$'+ copy(Src,SrcPos,2));

      if (KeyPos < KeyLen) Then
         KeyPos := KeyPos + 1
      else
         KeyPos := 1;

      TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);

      if TmpSrcAsc <= OffSet then
         TmpSrcAsc := 255 + TmpSrcAsc - OffSet
      else
         TmpSrcAsc := TmpSrcAsc - OffSet;

      Dest := Dest + Chr(TmpSrcAsc);
      OffSet := SrcAsc;
      SrcPos := SrcPos + 2;
   until
      (SrcPos >= Length(Src));
   end;

   Result:= Dest;
   Fim:
end;

end.
