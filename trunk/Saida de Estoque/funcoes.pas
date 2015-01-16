unit funcoes;

interface

uses
forms, db, DBCtrls, graphics, sysutils, classes,  Shellapi, filectrl, dbgrids,
dialogs, controls, math, windows, Mask, Masks;

function extenso(valor: real): string;
function strtonumbers(s : string) : string;
function cpf(num: string): boolean;
function cgc(num: string): boolean;
procedure desabilitaedicao();
procedure habilitaedicao();
function senhanovaempresa(num: integer): string;
function fm(valor: currency):string;
function fq(valor: currency):string;
function pd(quant: integer; texto: string): string;
function pa(quant: integer; texto: string): string;
function pazero(quant: integer; texto: string): string;
function preenche(quant: integer; texto: string): string;
function virgulaponto(num: string): string;
function strtolist(texto: string; clinha, linhas: integer; resultado: tstringlist): tstringlist;
function RemoveChar(Const Texto:String):String;
function primaiuscula(texto: string): string;
function acentua( str: String ): String;
function clocal(local: string): string;
function anomesdia(data: tdate):string;
function diamesano(AnoMesDia: string):string;
function anocurto(diamesano: string):string;
function maskcnpj(cnpj: string):string;
Function Enviaparalixeira(sFileName : string ) : boolean;
function mesdiaano(data: tdate):string;
function pdzero(quant: integer; texto: string): string;
function pdzeron(quant: integer; texto: string): string;
function arredonda(Value: Extended; Decimals: integer): Extended;
function pdline(quant: integer; texto: string): string;
function Removespace(Const Texto:String):String;
function pontovirgula(num: string): string;
function panove(quant: integer; texto: string): string;
Function wordcount(str : string) : integer;
function contacaractere(texto: string; caractere: char): integer;
function contatree(texto: string): string;
function ReplaceStr (Text,oldstring,newstring:string):string;
Function Occurs(T, S : ShortString) : Byte;
function DataValida(StrD: string): Boolean;
function UltimoDiaMes(Mdt: TDateTime) : TDateTime;
Function AbrirPrograma(Cmd: string; AguardaFinalizacao:Boolean): Boolean;
function Rep(Texto:String;Quantidade:Integer):String;
function ContaCaracter(Caracter,texto:String):Integer;
function AnoBiSexto(Ayear: Integer): Boolean;
function DiasPorMes(Ayear, AMonth: Integer): Integer;

implementation

function AnoBiSexto(Ayear: Integer): Boolean;
begin
   Result := (AYear mod 4 = 0) and ((AYear mod 100 <> 0) or (AYear mod 400 = 0));
end;

function DiasPorMes(Ayear, AMonth: Integer): Integer;
const DaysInMonth: array[1..12] of Integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
   Result := DaysInMonth[AMonth];

   if (AMonth = 2) and AnoBiSexto(AYear) then
      Inc(Result);
end;


function ContaCaracter(Caracter,texto:String):Integer;
var
   i, c : Integer;
begin
   c := 0;
   for i := 1 to length(texto) do
      if copy(texto,i,1) = Caracter then
         Inc(c,1);

   Result := c;

end;


function Rep(Texto:String;Quantidade:Integer):String;
var
   i : integer;
begin
   for i := 1 to Quantidade do
       Result := Result + Texto;
end;

Function AbrirPrograma(Cmd: string; AguardaFinalizacao:Boolean): Boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
begin
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  SUInfo.cb      := SizeOf(SUInfo);
  SUInfo.dwFlags := STARTF_USESHOWWINDOW;
  SUInfo.wShowWindow := SW_HIDE;

  Result := CreateProcess(nil,
                          PChar(cmd),
                          nil,
                          nil,
                          false,
                          CREATE_NEW_CONSOLE or
                          NORMAL_PRIORITY_CLASS,
                          nil,
                          nil,
                          SUInfo,
                          ProcInfo);

  if (Result) then
  begin
    if AguardaFinalizacao then
       WaitForSingleObject(ProcInfo.hProcess, INFINITE);

    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end;
end;

function UltimoDiaMes(Mdt: TDateTime) : TDateTime;
{ retorna o ultimo dia o mes, de uma data fornecida}
var
  ano, mes, dia : word;
  mDtTemp : TDateTime;
begin
  Decodedate(mDt, ano, mes, dia);
  mDtTemp := (mDt - dia) + 33;
  Decodedate(mDtTemp, ano, mes, dia);
  Result := mDtTemp - dia;
end;


function DataValida(StrD: string): Boolean;
var
vdata: tdate;
{Testa se uma data é valida}
begin
 Result := true;
 vdata:=strtodate(strd);
 try
  StrToDate(StrD);
 except
  Result:=False;
 end;
 if (vdata<strtodate('01/01/1800')) or (vdata>strtodate('01/01/3000')) then result:=false;
 if result=false then
  application.messagebox('Data Inválida!', 'Data', MB_ICONEXCLAMATION);
end;

Function Occurs(T, S : ShortString) : Byte;
//Obtendo o nº de ocorrências de uma string 'T' dentro de outra 'S'
Var
P : Byte;
Begin
Result := 0;
P := Pos (T, S);
while P > 0 do
begin
Inc (Result);
S := Copy (S, P + Length (T), 255);
P := Pos (T, S);
end;
End;

function ReplaceStr (Text,oldstring,newstring:string):string;
var atual, strtofind, originalstr:pchar;
NewText:string;
lenoldstring,lennewstring,m,index:integer;
begin //ReplaceStr
  NewText:=Text;
  originalstr:=pchar(Text);
  strtofind:=pchar(oldstring);
  lenoldstring:=length(oldstring);
  lennewstring:=length(newstring);
  Atual:=StrPos(OriginalStr,StrtoFind);
  index:=0;
  while Atual<>nil do
  begin //Atual<>nil
   m:=Atual - OriginalStr - index + 1;
   Delete(NewText,m,lenoldstring);
   Insert(newstring,NewText,m);
   inc(index,lenoldstring-lennewstring);
   Atual:=StrPos(Atual+lenoldstring,StrtoFind);
  end; //Atual<>nil

  Result:=NewText;
end; //ReplaceStr

function contatree(texto: string): string;
var
i, r, p: integer;
begin
 r:=0;
 p:=0;

 for I := length(texto) downto 1 do
 begin
  p:=p+1;
  if (Texto[I]='.') then
  begin
   try
    if (strtofloat(removechar(copy(texto, i+1, p)))=0) then
    begin
     r := length(copy(texto, i+1, length(texto)-i))+1;
    end
    else
     break;
   except
   end;
   p:=0;
  end;
 end;
 result := copy(texto, 1, length(texto)-r);
end;

function contacaractere(texto: string; caractere: char): integer;
var
i, r: integer;
begin
 r:=0;
 for I := 1 To Length(Texto) Do
 begin
  if (Texto[I])=caractere then
  begin
   r := r + 1;
  end;
 end;
 result := r;
end;


Function wordcount(str : string) : integer;
// Retorna o número de palavras que contem em uma string
var
count : integer;
i : integer;
len : integer;
begin
len := length(str);
count := 0;
i := 1;
while i <= len do
  begin
  while ((i <= len) and ((str[i] = #32) or (str[i] = #9) or (Str[i] = ';'))) do
  inc(i);
  if i <= len then
  inc(count);
  while ((i <= len) and ((str[i] <> #32) and (str[i] <> #9) and (Str[i] <> ';'))) do
  inc(i);
  end;
  wordcount := count;
end;


function Arredonda{TBRound}(Value: Extended; Decimals: integer): Extended;
var
  Factor, Fraction: Extended;
begin
  Factor := IntPower(10, Decimals);
  (* A conversão para string e depois para float evita
    erros de arredondamentos indesejáveis.*)
  Value := StrToFloat(FloatToStr(Value * Factor));
  Result := Int(Value);
  Fraction := Frac(Value);
  if Fraction > 0.5 then

    Result := Result + 1
  else if Fraction < -0.5 then
    Result := Result - 1;
  Result := Result / Factor;
end;

function pdzero(quant: integer; texto: string): string;
var
i,q: integer;
textopreenchido: string;
begin
 textopreenchido:=texto;
 q:=quant-length(texto);
 if q>0 then
 begin
  for i:=1 to q do
   textopreenchido := textopreenchido + ' ';
 end;
 Result:=textopreenchido;
end;

function pdzeron(quant: integer; texto: string): string;
var
i,q: integer;
textopreenchido: string;
begin
 textopreenchido:=texto;
 q:=quant-length(texto);
 if q>0 then
 begin
  for i:=1 to q do
   textopreenchido := textopreenchido + '0';
 end;
 Result:=textopreenchido;
end;


function pdline(quant: integer; texto: string): string;
var
i,q: integer;
textopreenchido: string;
begin
 textopreenchido:=texto;
 q:=quant-length(texto);
 if q>0 then
 begin
  for i:=1 to q do
   textopreenchido := textopreenchido + '_';
 end;
 Result:=textopreenchido;
end;

function mesdiaano(data: tdate):string;
var
dataaux:tdate;
year, month, day: word;
begin
 dataaux:=data;
 DecodeDate(dataaux, Year, Month, Day);
 mesdiaano:=inttostr(Month)+'/'+inttostr(day)+'/'+inttostr(year);
end;

Function Enviaparalixeira(sFileName : string ) : boolean;
var
fos : TSHFileOpStruct;
Begin
FillChar( fos, SizeOf( fos ), 0 );
With fos do
  begin
  wFunc := FO_DELETE;
  pFrom := PChar( sFileName );
  fFlags := FOF_ALLOWUNDO
  or FOF_NOCONFIRMATION
  or FOF_SILENT;
  end;
Result := ( 0 = ShFileOperation( fos ) );
end;

function maskcnpj(cnpj: string):string;
begin
 cnpj:=pazero(14,cnpj);
 cnpj:=copy(cnpj,1,2)+'.'+copy(cnpj,3,3)+'.'+copy(cnpj,6,3)+'/'+copy(cnpj,9,4)+'-'+copy(cnpj,13,2);
 result:=cnpj;
end;

function anocurto(diamesano: string):string;
begin
 result:=pazero(2,copy(diamesano,1,2))+pazero(2,copy(diamesano,4,2))+pazero(2,copy(diamesano,10,2));
end;

function anomesdia(data: tdate):string;
var
dataaux:tdate;
year, month, day: word;
begin
 dataaux:= data;
 DecodeDate(dataaux, Year, Month, Day);
 anomesdia:=pazero(2,copy(inttostr(year),3,2))+pazero(2,inttostr(Month))+pazero(2,inttostr(day));
end;

function diamesano(AnoMesDia: string):string;
begin
 result:=pazero(2,copy(anomesdia,5,2))+'/'+pazero(2,copy(anomesdia,3,2))+'/'+pazero(2,copy(anomesdia,1,2));
end;


function clocal(local: string): string;
begin
 if copy(local, length(local),1)='\' then result:=local;
 if copy(local, length(local),1)<>'\' then result:=local+'\';
end;

function primaiuscula(texto: string): string;
begin
 result:=ansiuppercase(copy(texto, 1,1))+copy(texto, 2,length(texto)-1);
end;

function RemoveChar(Const Texto:String):String;
//
// Remove caracteres de uma string deixando apenas numeros
//
var
I: integer;
S: string;
begin
S := '';
for I := 1 To Length(Texto) Do
begin
if (Texto[I] in ['0'..'9']) then
begin
S := S + Copy(Texto, I, 1);
end;
end;
result := S;
end;

function Removespace(Const Texto:String):String;
//
// Remove caracteres de uma string deixando apenas numeros
//
var
I: integer;
S: string;
begin
S := '';
for I := 1 To Length(Texto) Do
begin
if (Texto[I]<>' ') then
begin
S := S + Copy(Texto, I, 1);
end;
end;
result := S;
end;

function virgulaponto(num: string): string;
var
i: integer;
begin
 for i:=1 to length (num) do
  if num[i]=',' then num[i]:='.';
 result:=num;
end;

function pontovirgula(num: string): string;
var
i: integer;
begin
 for i:=1 to length (num) do
  if num[i]='.' then num[i]:=',';
 result:=num;
end;

function extenso(valor: real): string;
var
 Centavos, Centena, Milhar, Milhao, Texto, msg: string;
const
 Unidades: array[1..9] of string = ('um', 'dois', 'três', 'quatro', 'cinco',
                                    'seis', 'sete', 'oito', 'nove');
 Dez: array[1..9] of string = ('onze', 'doze', 'treze', 'quatorze', 'quinze',
                               'dezesseis', 'dezessete', 'dezoito', 'dezenove');
 Dezenas: array[1..9] of string = ('dez', 'vinte', 'trinta', 'quarenta',
                                   'cinquenta', 'sessenta', 'setenta',
                                   'oitenta', 'noventa');
 Centenas: array[1..9] of string = ('cento', 'duzentos', 'trezentos',
                                    'quatrocentos', 'quinhentos', 'seiscentos',
                                    'setecentos', 'oitocentos', 'novecentos');



function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: String): String;
begin
 if Expressao
  then Result:=CasoVerdadeiro
  else Result:=CasoFalso;
end;

function MiniExtenso (trio: string): string;
var
Unidade, Dezena, Centena: string;
begin
 Unidade:='';
 Dezena:='';
 Centena:='';
 if (trio[2]='1') and (trio[3]<>'0') then
 begin
  Unidade:=Dez[strtoint(trio[3])];
  Dezena:='';
 end
 else
 begin
  if trio[2]<>'0' then Dezena:=Dezenas[strtoint(trio[2])];
  if trio[3]<>'0' then Unidade:=Unidades[strtoint(trio[3])];
 end;
 if (trio[1]='1') and (Unidade='') and (Dezena='')
 then Centena:='cem'
 else
 if trio[1]<>'0'
 then Centena:=Centenas[strtoint(trio[1])]
 else Centena:='';
 Result:= Centena + ifs((Centena<>'') and ((Dezena<>'') or (Unidade<>'')), ' e ', '')
          + Dezena + ifs((Dezena<>'') and (Unidade<>''),' e ', '') + Unidade;
end;

begin
if (valor>999999.99) or (valor<0) then
 begin
  msg:='O valor está fora do intervalo permitido.';
  msg:=msg+'O número deve ser maior ou igual a zero e menor que 999.999,99.';
  msg:=msg+' Se não for corrigido o número não será escrito por extenso.';
  showmessage(msg);
  Result:='';
  exit;
 end;
 if valor=0 then
 begin
  Result:='';
  Exit;
 end;

 Texto:=formatfloat('000000.00',valor);
 Milhar:=MiniExtenso(Copy(Texto,1,3));
 Centena:=MiniExtenso(Copy(Texto,4,3));
 Centavos:=MiniExtenso('0'+Copy(Texto,8,2));
 Result:=Milhar;
 if Milhar<>'' then
 begin
  if (copy(texto,4,3)='000') and (copy(texto,8,2)='00') then
   Result:=Result+' mil reais';
  if (copy(texto,4,3)='000') and (copy(texto,8,2)<>'00') then
   Result:=Result+' mil reais';
  if (copy(texto,4,3)<>'000') and (copy(texto,8,2)='00') then
   Result:=Result+' mil e ';
  if (copy(texto,4,3)<>'000') and (copy(texto,8,2)<>'00') then
   Result:=Result+' mil, ';
 end;

  if (((copy(texto,4,2)='00') and (Milhar<>'')
   and (copy(texto,6,1)<>'0')) or (centavos=''))
    and (Centena<>'') then Result:=Result+'';
  if (Milhar+Centena <>'') then Result:=Result+Centena;
  if (Milhar='') and (copy(texto,4,3)='001') then
   Result:=Result+' real'
  else
   if (copy(texto,4,3)<>'000') then Result:=Result+' reais';
  if Centavos='' then
  begin
   Result:=Result+'.';
   Exit;
  end
  else
  begin
   if Milhar+Centena='' then
    Result:=Centavos
   else
    Result:=Result+' e '+Centavos;
  if (copy(texto,8,2)='01') and (Centavos<>'') then
   Result:=Result+' centavo.'
  else
   Result:=Result+' centavos.';
end;
end;

function DeleteFolder(FolderName: String; LeaveFolder: Boolean): Boolean;
var
   r: TshFileOpStruct;
begin
   Result := False;
   if not DirectoryExists(FolderName) then
     Exit;
   if LeaveFolder then
    FolderName := FolderName + ' *.* '
   else
  if FolderName[Length(FolderName)] = ' \ ' then
     Delete(FolderName,Length(FolderName), 1);
   FillChar(r, SizeOf(r), 0);
   r.wFunc := FO_DELETE;
   r.pFrom := PChar(FolderName);
   r.fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION;
   Result := ((ShFileOperation(r) = 0) and (not r.fAnyOperationsAborted));
end;

function strtonumbers(s : string) : string;
var
  i :Integer;
  t : string;
begin
  t := '';
  for i := 1 to Length(s) do
    if (s[i] in ['0'..'9']) then
     t:=t+s[i];
  Result := t;
end;

function senhanovaempresa(num: integer): string;
var
ano, mes, dia: word;
senha: string;
begin
 decodedate(date(),ano, mes, dia);
 senha:=inttostr(num*7)+inttostr(dia*3+num)+copy(inttostr(ano),4,1)+copy(inttostr(ano),3,1);
 result:=senha;
end;


function cpf(num: string): boolean;
var
n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
d1,d2: integer;
digitado, calculado: string;
begin
n1:=StrToInt(num[1]);
n2:=StrToInt(num[2]);
n3:=StrToInt(num[3]);
n4:=StrToInt(num[4]);
n5:=StrToInt(num[5]);
n6:=StrToInt(num[6]);
n7:=StrToInt(num[7]);
n8:=StrToInt(num[8]);
n9:=StrToInt(num[9]);
d1:=n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
d1:=11-(d1 mod 11);
if d1>=10 then d1:=0;
d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
d2:=11-(d2 mod 11);
if d2>=10 then d2:=0;
calculado:=inttostr(d1)+inttostr(d2);
digitado:=num[10]+num[11];
if calculado=digitado then
  cpf:=true
  else
  cpf:=false;
end;


function cgc(num: string): boolean;
var
n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12: integer;
d1,d2: integer;
digitado, calculado: string;
begin
n1:=StrToInt(num[1]);
n2:=StrToInt(num[2]);
n3:=StrToInt(num[3]);
n4:=StrToInt(num[4]);
n5:=StrToInt(num[5]);
n6:=StrToInt(num[6]);
n7:=StrToInt(num[7]);
n8:=StrToInt(num[8]);
n9:=StrToInt(num[9]);
n10:=StrToInt(num[10]);
n11:=StrToInt(num[11]);
n12:=StrToInt(num[12]);
d1:=n12*2+n11*3+n10*4+n9*5+n8*6+n7*7+n6*8+n5*9+n4*2+n3*3+n2*4+n1*5;
d1:=11-(d1 mod 11);
if d1>=10 then d1:=0;
d2:=d1*2+n12*3+n11*4+n10*5+n9*6+n8*7+n7*8+n6*9+n5*2+n4*3+n3*4+n2*5+n1*6;
d2:=11-(d2 mod 11);
if d2>=10 then d2:=0;
calculado:=inttostr(d1)+inttostr(d2);
digitado:=num[13]+num[14];
if calculado=digitado then
  cgc:=true
  else
  cgc:=false;
end;

procedure habilitaedicao();
var
i : integer;
formulario: tform;
begin
{ FORMULARIO:=Screen.ActiveForm;
 for i:=FORMULARIO.ComponentCount-1 downto 0 do
 begin
  if (FORMULARIO.Components[i] is tdbedit) then
    if (FORMULARIO.components[i] as tdbedit).color=clbtnface then
     (FORMULARIO.Components[i] as tdbedit).Color:=clwindow;

  if (FORMULARIO.Components[i] is tdbdateedit) then
    if (FORMULARIO.components[i] as tdbdateedit).color=clbtnface then
     (FORMULARIO.Components[i] as tdbdateedit).Color:=clwindow;

  if (FORMULARIO.Components[i] is TMaskEdit) then
    if (FORMULARIO.components[i] as TMaskEdit).color=clbtnface then
     (FORMULARIO.Components[i] as TMaskEdit).Color:=clwindow;

  if (FORMULARIO.Components[i] is tdbcombobox) then
    if (FORMULARIO.components[i] as tdbcombobox).color=clbtnface then
     (FORMULARIO.Components[i] as tdbcombobox).Color:=clwindow;

  if (FORMULARIO.Components[i] is tdbmemo) then
    if (FORMULARIO.components[i] as tdbmemo).color=clbtnface then
     (FORMULARIO.Components[i] as tdbmemo).Color:=clwindow;
  if (FORMULARIO.Components[i] is tdbimage) then
    if (FORMULARIO.components[i] as tdbimage).color=clbtnface then
     (FORMULARIO.Components[i] as tdbimage).Color:=clwindow;
  if (FORMULARIO.Components[i] is tdblookupcombobox) then
    if (FORMULARIO.components[i] as tdblookupcombobox).color=clbtnface then
     (FORMULARIO.Components[i] as tdblookupcombobox).Color:=clwindow;
  if (FORMULARIO.Components[i] is tdbgrid) then
    if (FORMULARIO.components[i] as tdbgrid).color=clbtnface then
     (FORMULARIO.Components[i] as tdbgrid).Color:=clwindow;
  if (FORMULARIO.Components[i] is trxdbcombobox) then
    if (FORMULARIO.components[i] as trxdbcombobox).color=clbtnface then
     (FORMULARIO.Components[i] as trxdbcombobox).Color:=clwindow;
  if (FORMULARIO.Components[i] is trxdblookupcombo) then
    if (FORMULARIO.components[i] as trxdblookupcombo).color=clbtnface then
     (FORMULARIO.Components[i] as trxdblookupcombo).Color:=clwindow;
  if (FORMULARIO.Components[i] is trxdbcomboedit) then
    if (FORMULARIO.components[i] as trxdbcomboedit).color=clbtnface then
     (FORMULARIO.Components[i] as trxdbcomboedit).Color:=clwindow;
  end;                                                              }
end;

procedure desabilitaedicao();
var
i : integer;
formulario: tform;
begin
{ FORMULARIO:=Screen.ActiveForm;
 for i:=FORMULARIO.ComponentCount-1 downto 0 do
 begin
  if (FORMULARIO.Components[i] is tdbedit) then
    if (FORMULARIO.components[i] as tdbedit).color=clwindow then
     (FORMULARIO.Components[i] as tdbedit).Color:=clbtnface;

  if (FORMULARIO.Components[i] is TMaskEdit) then
    if (FORMULARIO.components[i] as TMaskEdit).color=clwindow then
     (FORMULARIO.Components[i] as TMaskEdit).Color:=clbtnface;


  if (FORMULARIO.Components[i] is tdbdateedit) then
    if (FORMULARIO.components[i] as tdbdateedit).color=clwindow then
     (FORMULARIO.Components[i] as tdbdateedit).Color:=clbtnface;
  if (FORMULARIO.Components[i] is tdbcombobox) then
    if (FORMULARIO.components[i] as tdbcombobox).color=clwindow then
     (FORMULARIO.Components[i] as tdbcombobox).Color:=clbtnface;
  if (FORMULARIO.Components[i] is tdbmemo) then
    if (FORMULARIO.components[i] as tdbmemo).color=clwindow then
     (FORMULARIO.Components[i] as tdbmemo).Color:=clbtnface;
  if (FORMULARIO.Components[i] is tdbimage) then
    if (FORMULARIO.components[i] as tdbimage).color=clwindow then
     (FORMULARIO.Components[i] as tdbimage).Color:=clbtnface;
  if (FORMULARIO.Components[i] is tdblookupcombobox) then
    if (FORMULARIO.components[i] as tdblookupcombobox).color=clwindow then
     (FORMULARIO.Components[i] as tdblookupcombobox).Color:=clbtnface;
  if (FORMULARIO.Components[i] is tdbgrid) then
    if (FORMULARIO.components[i] as tdbgrid).color=clwindow then
     (FORMULARIO.Components[i] as tdbgrid).Color:=clbtnface;
  if (FORMULARIO.Components[i] is trxdbcombobox) then
    if (FORMULARIO.components[i] as trxdbcombobox).color=clwindow then
     (FORMULARIO.Components[i] as trxdbcombobox).Color:=clbtnface;
  if (FORMULARIO.Components[i] is trxdblookupcombo) then
    if (FORMULARIO.components[i] as trxdblookupcombo).color=clwindow then
     (FORMULARIO.Components[i] as trxdblookupcombo).Color:=clbtnface;
  if (FORMULARIO.Components[i] is trxdbcomboedit) then
    if (FORMULARIO.components[i] as trxdbcomboedit).color=clwindow then
     (FORMULARIO.Components[i] as trxdbcomboedit).Color:=clbtnface;

 end;       }
end;

function fm(valor: currency):string;
begin
result:=formatfloat('###,###,###0.00',  valor);
end;

function fq(valor: currency):string;
begin
result:=formatfloat('###,###,###0.000', valor);
end;

function preenche(quant: integer; texto: string): string;
var
i,q: integer;
textopreenchido: string;
begin
 textopreenchido:=texto;
 q:=quant-length(texto);
 if q>0 then
 begin
  for i:=1 to q do
   textopreenchido:=textopreenchido+' *';
 end;
 Result:=textopreenchido;
end;

function pd(quant: integer; texto: string): string;
var
i,q: integer;
textopreenchido: string;
begin
 textopreenchido:=copy(texto,1,quant);
 q:=quant-length(textopreenchido);
 if q>0 then
 begin
  for i:=1 to q do
   textopreenchido:=textopreenchido+' ';
 end;
 Result:=textopreenchido;
end;

function pa(quant: integer; texto: string): string;
var
i,q: integer;
textopreenchido: string;
begin
 textopreenchido:=copy(texto,1,quant);
 q:=quant-length(textopreenchido);
 if q>0 then
 begin
  for i:=1 to q do
   textopreenchido:=' '+textopreenchido;
 end;
 Result:=textopreenchido;
end;

function pazero(quant: integer; texto: string): string;
var
i,q: integer;
textopreenchido: string;
begin
 textopreenchido:=copy(texto,1,quant);
 q:=quant-length(texto);
 if q>0 then
 begin
  for i:=1 to q do
   textopreenchido:='0'+textopreenchido;
 end;
 Result:=textopreenchido;
end;

function panove(quant: integer; texto: string): string;
var
i,q: integer;
textopreenchido: string;
begin
 textopreenchido:=texto;
 q:=quant-length(texto);
 if q>0 then
 begin
  for i:=1 to q do
   textopreenchido:='9'+textopreenchido;
 end;
 Result:=textopreenchido;
end;

function acentua( str: String ): String;
var
i: Integer;
begin
for i := 1 to Length ( str ) do
case str[i] of
'á': str[i] := 'a';
'é': str[i] := 'e';
'í': str[i] := 'i';
'ó': str[i] := 'o';
'ú': str[i] := 'u';
'à': str[i] := 'a';
'è': str[i] := 'e';
'ì': str[i] := 'i';
'ò': str[i] := 'o';
'ù': str[i] := 'u';
'â': str[i] := 'a';
'ê': str[i] := 'e';
'î': str[i] := 'i';
'ô': str[i] := 'o';
'û': str[i] := 'u';
'ä': str[i] := 'a';
'ë': str[i] := 'e';
'ï': str[i] := 'i';
'ö': str[i] := 'o';
'ü': str[i] := 'u';
'ã': str[i] := 'a';
'õ': str[i] := 'o';
'ñ': str[i] := 'n';
'ç': str[i] := 'c';
'Á': str[i] := 'A';
'É': str[i] := 'E';
'Í': str[i] := 'I';
'Ó': str[i] := 'O';
'Ú': str[i] := 'U';
'À': str[i] := 'A';
'È': str[i] := 'E';
'Ì': str[i] := 'I';
'Ò': str[i] := 'O';
'Ù': str[i] := 'U';
'Â': str[i] := 'A';
'Ê': str[i] := 'E';
'Î': str[i] := 'I';
'Ô': str[i] := 'O';
'Û': str[i] := 'U';
'Ä': str[i] := 'A';
'Ë': str[i] := 'E';
'Ï': str[i] := 'I';
'Ö': str[i] := 'O';
'Ü': str[i] := 'U';
'Ã': str[i] := 'A';
'Õ': str[i] := 'O';
'Ñ': str[i] := 'N';
'Ç': str[i] := 'C';
'º': str[i] := 'o';
'ª': str[i] := 'a';
'ø': str[i] := 'D';
end;
Result := str;
end;

function strtolist(texto: string; clinha, linhas: integer; resultado: tstringlist): tstringlist;
var
listadestrings: string;
i, col, linha, posicao: integer;
begin
 posicao:=0;
 col:=0;
 linha:=0;
 listadestrings:='';
 for i:=1 to (linhas*clinha) do
 begin
  col:=col+1;
  if (pchar(copy(texto, col,1))<>CHR(13)) and (posicao<clinha) then
  begin
   listadestrings:=(listadestrings+copy(texto, col, 1));
   posicao:=posicao+1
  end;

  if (posicao=clinha) and (pchar(copy(texto, col+1,1))=CHR(13)) then
  begin
   resultado.Add (listadestrings);
   listadestrings:='';
   posicao:=0;
   col:=col+2;
  end;

  if (posicao>clinha-1) or (pchar(copy(texto, col,1))=CHR(13)) then
  begin
   resultado.Add (listadestrings);
   listadestrings:='';
   posicao:=0;
  end;

  if pchar(copy(texto, col,1))=CHR(13) then
   col:=col+1;
 end;
 Result:=resultado;
end;

end.

