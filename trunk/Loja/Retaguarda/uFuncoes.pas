unit uFuncoes;

interface

uses
   SysUtils, Windows, Messages, Graphics, StdCtrls, Classes;

const
   LoginCep    = 'hightech';
   SenhaCEP    = 'asdf1234';

  { crypt }
function crypt(texto : string):string;
function cryptNova(Opcao : String; Dados : String): String;
function fApenasNumerosStr(pStr:String): String;
procedure pAjustarLargura(ComboBox: TComboBox);
function fBuscarWS(vCep : string) : String;
function fGetWindowsDrive: String; //Char;
function fMaskCNPJ_CPF(CNPJ_CPF: string; Tipo_0J_1F : Integer; TirarSN : Char ) : string;
function fPazero(quant: integer; texto: string): string;

var
   senh_ : string;
    _app : string;

implementation

uses funCEP, ufrmPrincipal;

function fGetWindowsDrive : String; //Char;
var
   S: string;
begin
   SetLength(S, MAX_PATH);
   if GetWindowsDirectory(PChar(S), MAX_PATH) > 0 then
//      Result := string(S)[1]
      Result := copy(string(S),1,3)
   else
      Result := #0;
end;


function fMaskCNPJ_CPF(CNPJ_CPF: string; Tipo_0J_1F : Integer; TirarSN : Char ) : string;
begin
   if TirarSN = 'N' then
   begin
      case Tipo_0J_1F of
         0 : // Pessoa Juridica
         begin
            CNPJ_CPF := fPazero(14,CNPJ_CPF);
            CNPJ_CPF := copy(CNPJ_CPF,1,2)+'.'+copy(CNPJ_CPF,3,3)+'.'+copy(CNPJ_CPF,6,3)+'/'+copy(CNPJ_CPF,9,4)+'-'+copy(CNPJ_CPF,13,2);
         end;

         1 : // Pessoa Fisica
         begin
            CNPJ_CPF := fPazero(11,CNPJ_CPF);
            CNPJ_CPF := copy(CNPJ_CPF,1,3)+'.'+copy(CNPJ_CPF,4,3)+'.'+copy(CNPJ_CPF,7,3)+'-'+copy(CNPJ_CPF,10,2);
         end;

      end;

      Result := CNPJ_CPF;
   end
   else
   begin
      CNPJ_CPF := StringReplace(CNPJ_CPF,'.','',[rfReplaceAll]);
      CNPJ_CPF := StringReplace(CNPJ_CPF,'/','',[rfReplaceAll]);
      Result   := trim(StringReplace(CNPJ_CPF,'-','',[rfReplaceAll]));
   end;
end;

function fPazero(quant: integer; texto: string): string;
var
   i,q: integer;
   textopreenchido: string;
begin
   textopreenchido := copy(texto,1,quant);
   q := quant-length(texto);

   if q > 0 then
   begin
      for i := 1 to q do
         textopreenchido := '0' + textopreenchido;
   end;

   Result := textopreenchido;
end;

function crypt(texto : string):string;
var
  i, e, cri, sen, sen1, let : integer;
                        ret : string;
                      senh_ : string;
begin
   senh_ :=  'Hightech';

   e   := 1;
   ret := '';

   for i := 1 to length(trim(texto))  do
   begin
     sen1 := ord(senh_[e]);

      if sen1 < 167 then
         sen := sen1 + 167
      else
         sen := sen1;

      let := ord(texto[i]);
      cri := sen - let ;
      ret := ret + chr(cri);

      if e > length(senh_) then
         e := 1;
   end;

   Result := ret;
end;

function cryptNova(Opcao : String; Dados : String): String;
var
   I : Integer;
   Key : Word;
   Res : String;
const
   C1    = 33598;
   C2    = 24219;
   Chave = 16854;
begin
   Key := Chave;
   for I := 1 to length(Dados) do
   begin
      Res := Res + Char(Byte(Dados[I]) xor (Key shr 8));
      if Opcao = 'C' then
         Key := (Byte(Res[I]) + Chave) * C1 + C2;

      if Opcao = 'D' then
         Key := (Byte(Dados[I]) + Chave) * C1 + C2;
    end;
  Result := Res;
end;

function fApenasNumerosStr(pStr:String): String;
Var
   I: Integer;
begin
   Result := '';
   For I := 1 To Length(pStr) do
      If pStr[I] In ['1','2','3','4','5','6','7','8','9','0'] Then
         Result := Result + pStr[I];
end;

procedure pAjustarLargura(ComboBox: TComboBox);
var
   TextLen: LongInt;
   I  : Integer;
   lf : LOGFONT;
   f  : HFONT;
   w  : Integer;
begin
   FillChar(lf, SizeOf(lf), 0);

   StrPCopy(lf.lfFaceName, ComboBox.Font.Name);
   lf.lfHeight := ComboBox.Font.Height;
   lf.lfWeight := FW_NORMAL;

   if fsBold in ComboBox.Font.Style then
   begin
      lf.lfWeight := lf.lfWeight or FW_BOLD;
   end;

   f := CreateFontIndirect(lf);
   if f <> 0 then
   begin
      try
         ComboBox.Canvas.Handle := GetDC(ComboBox.Handle);
         SelectObject(ComboBox.Canvas.Handle, f);
         try
            w := 0;
            for I := 0 to Pred(ComboBox.Items.Count) do
            begin
               TextLen := ComboBox.Canvas.TextWidth(ComboBox.Items[I]);
               if TextLen > w then
               begin
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
end;

function fBuscarWS(vCep : string) : String;
var
   ser   : CEPServicePort;
//   lista : TStringList;
//   CEP   : String;
begin
   try
      ser  := GetCEPServicePorT(false,'', frmPrincipal.HTTPRIO);
      if vCep <> '' then
      begin
         Result := ser.obterLogradouroAuth(vCep,LoginCep,SenhaCEP);
//         CEP   := ser.obterLogradouroAuth(vCep,LoginCep,SenhaCEP);
//         lista := TStringList.Create;
//         ExtractStrings([','],[' '],pchar(CEP),lista);

//         Result.Completo   := CEP;
//         Result.Logradouro := TRIM(lista.Strings[0]);
//         Result.Bairro     := TRIM(lista.Strings[1]);
//         Result.Cidade     := TRIM(lista.Strings[2]);
//         Result.UF         := TRIM(lista.Strings[3]);
      end;
   except
   end;

//   FreeAndNil(lista);
end;

//initialization

{Senha o Crypt}
//senh_:= 'Hightech';

//finalization

end.
