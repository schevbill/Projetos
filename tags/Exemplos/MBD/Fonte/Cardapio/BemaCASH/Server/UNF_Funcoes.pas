unit UNF_Funcoes;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DB,
   StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, DBTables, Grids, DBGrids, ADODB,
   Menus, Winsock, Tlhelp32, ShellApi;

  function KillTask_(ExeFileName: string): Integer;
  function ApenasNumerosStr(pStr:String): String;
  function MesExt( Data: TDateTime ): string;
  function Stuff(Text,Busca,Troca : string) : string;
  function crypt(texto : string):string;
  function Pergunta( Texto: string ): string;
  procedure Mensagem( Texto: string );
  function Valida_Ano(data: String): Boolean;
  function AllTrim( Dados: string ): string;
  function Empty( Dados: string ): boolean;
  function NotEmpty( Dados: string ): boolean;
  function StrZero(N: integer; Tamanho: integer): string;
  function Mes( Data: TDateTime ): string;
  function Repl(C: string; Tamanho: integer): string;
  function Tel_Mas( Dados: string ): string;
  function cgc(num: string): boolean;
  function cpf(num: string): boolean;
  function SetNewDate(Ano, Mes, Dia: word): Boolean;
  function GetIP:string;
  procedure SetDTHR;

var
                   xAngulo : Integer;
       VarFirma, VarVersao : TCaption;
  VarUser_Name,VarPassword : string;
                    vPorta : integer;
                cDescricao : string;

   dnome, dcnpj, dendereco : String;
     dadicional, dtelefone : String;

                     senh_ : string;
       User_Name, Password : string;
     _User_Name, _Password : string;
                    xOBSMT : string;
                    vSGERE : String;
                   xDigito : String;
                 vTPIMPCOZ : Integer;
   xQTDTrava, xQTDMensagem : Double;

                    vSenOk : Integer;
               vARQUIVOOFF : String;
                      _app : String;
               
implementation

uses UNF_Pergunta, UNF_Mensagem, UNF_Modulo;

{ Mata qq processo do windows funciona em 98/ME/NT/00 e XP }
function KillTask_(ExeFileName: string): Integer;
const
   PROCESS_TERMINATE = $0001;
var
   ContinueLoop: BOOL;
   FSnapshotHandle: THandle;
   FProcessEntry32: TProcessEntry32;
begin
   Result := 0;
   FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
   FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
   ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

   while Integer(ContinueLoop) <> 0 do
   begin
      if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName))) then
         Result := Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0), FProcessEntry32.th32ProcessID), 0));

      ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
end;
   CloseHandle(FSnapshotHandle);
end;

function ApenasNumerosStr(pStr:String): String;
Var
   I: Integer;
begin
  Result := '';

  For I := 1 To Length(pStr) do
     If pStr[I] In ['1','2','3','4','5','6','7','8','9','0'] Then
        Result := Result + pStr[I];
end;

function GetIP:string;//--> Declare a Winsock na clausula uses da unit
var
   WSAData : TWSAData;
   HostEnt : PHostEnt;
      Name : string;
begin
   WSAStartup(2, WSAData);
   SetLength(Name, 255);
   Gethostname(PChar(Name), 255);
   SetLength(Name, StrLen(PChar(Name)));
   HostEnt := gethostbyname(PChar(Name));

   with HostEnt^ do
     Result:=Format('%d.%d.%d.%d',[Byte(h_addr^[0]),
               Byte(h_addr^[1]),Byte(h_addr^[2]),Byte(h_addr^[3])]);
   WSACleanup;
end;

function MesExt( Data: TDateTime ): string;
var
   sAno, sMes, sDia: Word;
begin
   DecodeDate( Data, sAno, sMes, sDia );

   if sMes = 1 then
      MesExt := 'Janeiro';
   if sMes = 2 then
      MesExt := 'Fevereiro';
   if sMes = 3 then
      MesExt := 'Março';
   if sMes = 4 then
      MesExt := 'Abril';
   if sMes = 5 then
      MesExt := 'Maio';
   if sMes = 6 then
      MesExt := 'Junho';
   if sMes = 7 then
      MesExt := 'Julho';
   if sMes = 8 then
      MesExt := 'Agosto';
   if sMes = 9 then
      MesExt := 'Setembro';
   if sMes = 10 then
      MesExt := 'Outubro';
   if sMes = 11 then
      MesExt := 'Novembro';
   if sMes = 12 then
      MesExt := 'Dezembro';
end;

function Stuff(Text,Busca,Troca : string) : string;
var
   n : integer;
begin
   for n := 1 to length(Text) do
   begin
      if Copy(Text,n,1) = Busca then
      begin
         Delete(Text,n,1);
         Insert(Troca,Text,n);
      end;
   end;

   Result := Text;
end;

function crypt(texto : string):string;
var
   i, e, cri, sen, sen1, let : Integer;
                         ret : String;
begin
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

function Pergunta( Texto: string ): string;
var
   Largura: integer;
begin
   FRM_Pergunta.LBL_Resposta.Caption := 'N';
   FRM_Pergunta.LBL_Frase.Caption := Texto;
   Largura := 70 + FRM_Pergunta.LBL_Frase.Width;
   if Largura < 250 then Largura := 250;
   FRM_Pergunta.Width := Largura;
   FRM_Pergunta.SPB_Sim.Left := ( FRM_Pergunta.Width - 170 ) div 2;
   FRM_Pergunta.SPB_Nao.Left :=
   FRM_Pergunta.SPB_Sim.Left + 90;
   FRM_Pergunta.ShowModal;
   Pergunta := FRM_Pergunta.LBL_Resposta.Caption;
end;

procedure Mensagem( Texto: string );
var
   Largura: integer;
begin
   FRM_Mensagem.LBL_Frase.Caption := Texto;
   Largura := 70 + FRM_Mensagem.LBL_Frase.Width;
   if Largura < 250 then Largura := 250;
      FRM_Mensagem.Width := Largura;
   FRM_Mensagem.SPB_Ok.Left := ( FRM_Mensagem.Width - 80 ) div 2;
   MessageBeep(0);
   FRM_Mensagem.ShowModal;
end;

function Valida_Ano(data: String): Boolean;
var
   Valdata: Integer;
begin
   if NotEmpty(data) then
   begin
      Valdata := StrToInt( Copy( data, 7, 4) );
      if Valdata < 1920 then  {1920 = ano básico para cálculo}
         begin
         Mensagem('Obrigatório digitar o Ano com 4 dígitos de 1920 em diante !!!');
         Valida_Ano := False;
         end
      else
          Valida_Ano := True;
   end
   else
      Valida_Ano := True;
end;

function AllTrim( Dados: string ): string;
var
   Contar: integer;
begin
   Dados := Trim( Dados );
   for Contar := 1 to Length( Dados ) do
   begin
      if Copy( Dados, Contar, 1 ) <> ' ' then
         Break;

      Dados := Copy( Dados, Contar + 1, Length( Dados ) - 1 );
      Application.ProcessMessages;
   end;

   AllTrim := Dados;
end;

function Empty( Dados: string ): boolean;
begin
   if Length( Trim( Dados ) ) = 0 then
      Empty := True
   else
      Empty := False;
end;

function NotEmpty( Dados: string ): boolean;
begin
   if Empty( Dados ) then
      NotEmpty := False
   else
      NotEmpty := True;
end;

function StrZero(N: integer; Tamanho: integer): string;
var
   Conteudo: string;
   Diferenca: Integer;
begin
   Conteudo := IntToStr( N );
   Diferenca := Tamanho - Length( Conteudo );

   if Diferenca > 0 then
      Conteudo := Repl( '0', Diferenca ) + Conteudo;

   StrZero := Conteudo;
end;

function Mes( Data: TDateTime ): string;
var
   sAno, sMes, sDia: Word;
begin
   DecodeDate( Data, sAno, sMes, sDia );
   Mes := StrZero( sMes, 2 );
end;

function Repl(C: string; Tamanho: integer): string;
var
   Conteudo: string;
   Contar: integer;
begin
   Conteudo := '';

  for Contar := 1 to Tamanho do
  begin
     Conteudo := Conteudo + C;
     Application.ProcessMessages;
  end;

  Repl := Conteudo;
end;

function Tel_Mas( Dados: string ): string;
Var
   Frase  : string;
   Xfor_I : integer;
   XCont  : integer;
begin
   XCont  := 0;

   for Xfor_I := 1 to Length(Dados)  do
   begin
      if Dados[Xfor_I] in ['0'..'9',#8] then
      begin
         Frase := Frase + Dados[Xfor_I];
         Inc(XCont,1);
      end;
    end;

    if XCont = 8 then
       Result := Copy(Frase,1,4) + '-' + Copy(Frase,5,4)
    else if XCont = 7 then
       Result := Copy(Frase,1,3) + '-' + Copy(Frase,4,4)
    else
       Result := Frase;
end;

function cgc(num: string): boolean;
var
   n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12 : integer;
   d1,d2                                  : integer;
   digitado, calculado                    : string;
begin
   n1  := StrToInt64(num[1]);
   n2  := StrToInt64(num[2]);
   n3  := StrToInt64(num[3]);
   n4  := StrToInt64(num[4]);
   n5  := StrToInt64(num[5]);
   n6  := StrToInt64(num[6]);
   n7  := StrToInt64(num[7]);
   n8  := StrToInt64(num[8]);
   n9  := StrToInt64(num[9]);
   n10 := StrToInt64(num[10]);
   n11 := StrToInt64(num[11]);
   n12 := StrToInt64(num[12]);
   d1  := n12 * 2 + n11 * 3 + n10 * 4 + n9 * 5 + n8 * 6 +
          n7  * 7 + n6  * 8 + n5  * 9 + n4 * 2 + n3 * 3 +
          n2  * 4 + n1  * 5;
   d1 := 11 - (d1 mod 11);
   if d1 >= 10 then
      d1 := 0;

   d2 := d1 * 2 + n12 * 3 + n11 * 4 + n10 * 5 + n9 * 6 +
         n8 * 7 + n7  * 8 + n6  * 9 + n5  * 2 + n4 * 3 +
         n3 * 4 + n2  * 5 + n1  * 6;

   d2 := 11 - (d2 mod 11);
   if d2 >= 10 then
      d2 := 0;

   calculado := inttostr(d1) + inttostr(d2);
   digitado  := num[13]      + num[14];
   if calculado = digitado then
      cgc := true
   else
      cgc := false;
end;

function cpf(num: string): boolean;
var
   n1,n2,n3,n4,n5,n6,n7,n8,n9 : integer;
   d1,d2                      : integer;
   digitado, calculado        : string;
begin
   n1 := StrToInt64(num[1]);
   n2 := StrToInt64(num[2]);
   n3 := StrToInt64(num[3]);
   n4 := StrToInt64(num[4]);
   n5 := StrToInt64(num[5]);
   n6 := StrToInt64(num[6]);
   n7 := StrToInt64(num[7]);
   n8 := StrToInt64(num[8]);
   n9 := StrToInt64(num[9]);
   d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 +
         n3 * 8 + n2 * 9 + n1 * 10;
   d1 := 11 - (d1 mod 11);

   if d1 >= 10 then
      d1 := 0;

   d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5  + n6 * 6  +
         n5 * 7 + n4 * 8 + n3 * 9 + n2 * 10 + n1 * 11 ;
   d2 := 11 - (d2 mod 11);

   if d2 >= 10 then
      d2 := 0;

   calculado := inttostr(d1) + inttostr(d2);
   digitado  := num[10]      + num[11];

   if calculado = digitado then
      cpf := true
   else
      cpf := false;
end;

function SetNewDate(Ano, Mes, Dia: word): Boolean;
var
  st:TSYSTEMTIME;
begin
  Result := True;
  GetLocalTime(st);
  st.wYear := Ano;
  st.wMonth := Mes;
  st.wDay := Dia;
  if not SetLocalTime(st) then
     Result := False;
end;

procedure SetDTHR;
var
                 SystemTime : TSystemTime;
           vAno, vMes, vDia : Word;
   vHora, vMin, vSeg, vMseg : Word;
begin
   FRM_Modulo.IBQ_DTSystem.Close;
   FRM_Modulo.IBQ_DTSystem.Open;

  GetLocalTime(SystemTime);

   with SystemTime do
   begin
      //Definindo o dia do sistema
      DecodeDate(FRM_Modulo.IBQ_DTSystemDATA_SER.Value,vAno,vMes,vDia);

      wYear   := vAno;
      wMonth  := vMes;
      wDay    := vDia;

      //Definindo a hora do sistema
      DecodeTime(FRM_Modulo.IBQ_DTSystemHORA_SER.Value,vHora,vMin,vSeg,vMseg);

      wHour         := vHora;
      wMinute       := vMin;
      wSecond       := vSeg;
      wMilliseconds := vMseg;
   end;

   //Colocar a hora e data do sistema
   SetLocalTime(SystemTime);

   //Mensagem('Data sincronizada com o servidor!!! Data = ' + FRM_Modulo.IBQ_DTSystemDATA_SER.AsString + ' Hora = ' + FRM_Modulo.IBQ_DTSystemHORA_SER.AsString + ' !!!');
end;


initialization
{Senha o Crypt}
senh_:= 'SmEoEaAn';

{Senha Sistema}
_User_Name   := 'sysmbd';
_Password    := 'mbdsys';
User_Name    := '';
Password     := '';
vSenOk       := 2;
vPorta       := 0;
cDescricao   := '';
vSGERE       := 'N';
vTPIMPCOZ    := 0;
xQTDTrava    := 1000;
xQTDMensagem := 6;

vARQUIVOOFF      := 'C:\MBD';

{formatação inicial}
ShortDateFormat  :='dd/mm/yyyy';
CurrencyDecimals := 2;
xOBSMT           := '';

//VarFirma  := 'Dani e Gabi';
VarVersao := 'Versão 07.07.14';
//                   |  |  |__ dia..{12-07-2002}
//                   |  |_____ mes..{12-07-2002}
//                   |________ ano..{12-07-2002}

end.
