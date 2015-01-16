unit UNF_Funcoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DB,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, DBTables, Grids, DBGrids, Menus,
  xmldom, XMLDoc, XMLIntf, IniFiles, TLHelp32;

  { Pesquisa lookup}
  function Peslookup( _listsource:TDataSource; _listfield:String; _keyfield:String ): Integer;

  { Gerar Relatorios Gerenciais }
  function Gerar(operador : Integer; data : TDate; hora : TTime; movref : TDate):Boolean;

  { verificar processo }
  function GetProcSpec(ProcEsp:String):Boolean;

  { Reproduz um string varias vezes }
  function Repl(C: string; Tamanho: integer): string;

  function CalculaCnpjCpf(Numero : String) : Boolean;

  function IIf(pCond:Boolean;pTrue,pFalse:Variant): Variant;

  { CEP }
  function BuscaCEPBRASIL(WebCEPBRASIL: String): Boolean;

  { Coloca zeros a esquerda }
  function StrZero(N: integer; Tamanho: integer): string;

  { LOG - tipo -> 0 = mensagens, 1 = mensagemerros, 2 = perguntas, 3 = sistema, 4 = ecf}
  procedure GeraLog(LogTipo: Integer; LogTexto: String; LogFicha:Integer; LogSequencia:Integer; LogFichaF:Integer; LogSequenciaF:Integer);

  { Arredondar }
  function Arredondar(Valor: Double; Dec: Integer): Double;

  {retorna apenas numeros}
  function ApenasNumerosStr(pStr:String): String;

  { Recalcular Caixa }
  procedure Recalcular_Cx(_Base:Integer; _tipo:string; _codigo:Integer);

  { Recalcular Caixa Temporario}
  procedure Recalcular_CxTemp(_Base:Integer; _tipo:string; _codigo:Integer);

  { Recalcular Produto }
  function RecProdVir(_TP:string;_matprima:Integer; _QTD:Double): Boolean;

  { Lança no Estoque }
  function lanestoque(_ES:string; _produto:Integer; _Data:TDateTime; _QTD:Double; _Total:Currency;
                       _cliente:Integer; _centrocusto:Integer; _Historico:string): Boolean;

  { Recalcular Estoque }
  function recestoque(_TP:string; _matprima:Integer; _tempo:TDateTime): Boolean;

  { crypt }
  function crypt(texto : string):string;

  { Stuff }
  function Stuff(Text,Busca,Troca : string) : string;

  { Janela para quetionamento }
  function Pergunta( Texto: string ): string;

  { Janela para mensagens }
  procedure Mensagem( Texto: string );

  { Janela de Senha }
  function SSenha: Boolean;

  { Retira os espacos em branco da direita }
  function AllTrim( Dados: string ): string;

  { Verifica se a string esta vazia }
  function Empty( Dados: string ): boolean;

  { Verifica se a string nao esta vazia }
  function NotEmpty( Dados: string ): boolean;

  { Mudar a Data }
  function SetNewDate(Ano, Mes, Dia: word): Boolean;

  { Mudar a Data e Hora}
  procedure SetDTHR(ExibeMensagem:Boolean);
  function Arred2(xValor:Double):Double;
  function Info: String;

  Function SerialNumHD(FDrive:String) :String;

  Function SerialNumHD1(FDrive:String) :String;

  procedure ChangeByteOrder( var Data; Size : Integer );

  function GetIdeDiskSerialNumber : String;

  {Verifica se uma data informada cai em um final de semana}
  function VerificaDataFDS(Data : TDateTime) : boolean;

  {verifica se a data cai no fds feriado}
  function VerificaFeriado(Hoje : String): Boolean;

  {acrescenta o valor ao clifor setado}
  procedure Acrescenta_Saldo_CliFor(Codigo_ID: Integer; Valor: Double);

  {verifica o saldo atual do clifor setado}
  function Saldo_CliFor(Codigo_ID: Integer) : String;

  { permissões }
  function funpermiFR:Boolean;

  {retira enter}
  function RetiraEnter(Texto:String):String;

  {Transfere Fecha Caixa Para Morto}
  procedure FechaCaixaTransfMorto(operador : integer; data : tdate; hora : ttime; movref : tdate);

  {Funçao da tecla}
  function GetStateK (Key: integer): boolean;


var
                          xAngulo : Integer;
              VarFirma, VarVersao : TCaption;
  vLogin, vSenha, vNivel, VNomeCX : String;
                            senh_ : string;
                       VerifSenha : Boolean;
                 VerifSenhaPASSOU : Boolean;
                      VerifSenhaC : Boolean;
                      VerifSenhaS : Boolean;
                       DT_Compila : TDate;
                          xVersao : String;
vECF_, VNumSerie_, VTrueFalseEcf_ : String;
                         NomeUser : String;
                   TotAtendimento : Double;
                          wfiltro : string[1];
                  TotDif, TotForm : Double;
                      xCONTRAVALE : String;
                       xTOLEDOCOM : Integer;
                       xEntregaPD : Integer;
                       Turno      : Integer;
                   xDividePesoPor : integer;
                          VELOTOL : integer;
                           xTPBAL : String;
                          BALANCA : String;

                         TPDIAMES : String;
                          xSAIRSN : String;
                          _RELWEB : String;
                      _BuscaVenda : String;
                          TPPreco : String;
                     xIDENTMESAF9 : String;
                        xBuscaECF : String;
                       xModImpCoz : String;
                    xAbriuSISTEMA : Boolean;                       


{ Variabeis do FRM_Frente *****************************************************}
                                        FMesa, FSequencia : LONGLONG;
        FSetor, FGarcon, FOperador, FPontoVenda, FMaquina : string;
                                              vQuantidade : Double;
                                   AbreMesa, Cab_, SFecha : Boolean;
vSubTotal, oSubTotal, vRecebido, oRecebido, vDifTef, oDifTef : Currency;
                                          vVALORCondValeM : Currency;
                               vSubTotalDia, oSubTotalDia : Currency;
                               vCancQTDDia, _XvCancQTDDia : Integer;
        vCondPagto, oCondPagto, vNumFicha, XClienteDiaria : integer;
                                     vDesconto, oDesconto : Double;
              vVal_TaxaI, vVal_DescontoI, vVal_AcrescimoI : Double;
              oVal_TaxaI, oVal_DescontoI, oVal_AcrescimoI : Double;
                   nucu, vCondDesc, vCondVale, vCondValeM : String;
                                                  AtivBot : Word;
                                           xcaixa, xlocal : string;
                                          vCupom, vCupImp : Boolean;
                          ocount, ccount, llinha, llinha2 : Integer;
                                        vPessoas, OpSenha : Integer;
                                              OpNomeSenha : string;
                                                 wBaseOld : Boolean;
                                                 cCaminho : String;
                                             xMult, oMult : String;

                                               xNumOrdECF : String;
                                                xPortaECF : String;
                                            xTPMesaTicket : String;
                                               xImpRecibo : String;
                                              xGuilhotina : String;
                                               xExpTicket : String;
                                                   xPorta : String;
                                                  xDiaria : String;
                                                  xDigito : String;
                                                 xLmpLixo : String;
                                                  xGaveta : String;
                                               xGavetaAUT : String;
                                               xGavetaMAN : String;
                                             xContraValeM : String;
xENTREGABAUT, XImpReciboMensa, _XTravaGavetaA, _XQTDTRAVA : String;
        _XRECALCPROD, _XVERIFICASALDOZERO, _XMODExpTicket : String;
                _XENTREGA, _XCUPOMISS, _XIMPCOMPROVDIARIA : String;
       _XESCCANCELTICKET, _XMENSDESAF8, _XTRAVAQUARTOFINA : String;
                  _XEMPRESANOTKT, _XTRAVAF7, _XLOGSISTEMA : String;
                                TagExpand, TagFechaExpand : String;
                                                xNUMFicha : String;
                                         _ComandaImpGrupo : String;
                                        _AgrupaItemDiaria : String;
                                     _TravaDiariaSemFicha : String;
                                      _CondPagtoDescAcres : String;
                                                   _CAT51 : String;
                                            _IMPCOMANDPEND: String;
                                            _IMPCOMANDHORA: String;
                                               _DESCANCDIA: String;
                                             _PERCANCUNICO: String;
                                            _APEGENCANCDIA: String;
                                            _APEGENTRANDIA: String;
                                        _MensagemGerencial: String;
                                          _AbasSangriaF2F6: String;

                                             xLinhaDelete : Integer;

                                   dnome, dcnpj, dendereco: String;
                                    dadicional, dtelefone : String;

                                                 vCliente : Integer;
                                                avCliente : Integer;
                                            vNumeroTKTCOO : Integer;

                                                 xProduto : String;
                                     xCliente, xCondPagto : Integer;
                                                vTPIMPCOZ : Integer;
                                                 vImpECFT : String;
                                                   cFundo : Boolean;
                                                DescDiria : Integer;
                                                     _app : String;
                                             NomeSpeedBTN : String;
                                              CodigoNivel : Integer;
          EndBrasil, BairroBrasil, UFBrasil, CidadeBrasil : String;
                                                      Ini : TIniFile;
                                                 OldValue : LongBool;
                                           ANALISACLIENTE : String;
                                                xCortesia : String;
                                               OpCortesia : Integer;
                                           xCORTESIAATIVO : String;
                                              xPathImagem : String;
                                                 xTPImpTK : Integer;
                                                xTKItemAg : String;
                                         xTOTALNORECEBIDO : String;

                                                  //NUMEROS DE VIA
                                                 xCONTVIAS : Integer;

                                               //Metodo de Treinamento\\
                                                 xMTREINA : String;

                                   //Variavel observação do produto no Frente
                                        xOBSERVACAOFRENTE : String;

                                                      //Mensagem
                                                      Obs : String;

                                                        {cat}
                                       vCli, vEnd, vBairro, vCidade, vUf, vCpf : String;
   CuAnt_vCli, CuAnt_vEnd, CuAnt_vBairro, CuAnt_vCidade, CuAnt_vUf, CuAnt_vCpf : String;

           ///////////////VARIAVES REIMPRIMIR TICKET //////////////////////
                 _TktImpresso, _TktCliente, _TktCondPagto : Integer;
                                            _TktSequencia : Int64;
                                               _TktNomeCX : String;
                                                _TktItens : array[1..12,1..10000] of string;
                                               _Tktccount : Integer;
                               _TktSubTotal, _TktRecebido : Currency;
                                             _TktDesconto : Double;
                                                _TktMesas : array[1..2,0..9999] of string;
                                              xZERASEQDIA : String;
                                         xATIVAVIASTIQUET : String;

      _Tkt_Val_Acrescimo, _Tkt_Val_Desconto, _Tkt_Val_Taxa,
          _Tkt_TotalDiaria, _Tkt_TotalProdutos, _Tkt_Troco,
                           _Tkt_Total, _Tkt_TotalDesconto: Double;

           ////////////////////////////////////////////////////////////////
                                              //Variavel do Entrega f4
                                              XvalorSUB : Double; //total
                                            Xcond_Pagto : String; // forma pagto
                                                 Xtroco : Double; // Troco
                                                 Xresul : Double; // Resultado
                                                xCancel : String; // Para Cancela quando ele fecha o confirma

           /////////////////////////////////////////////////////////////////

//                                 variavel sendo usada no Vinculado
                                             VvincMesa : Integer;

                                  // Variavel para pega o Nome do Cliente  MODO MESA
                                         VClienteCond  : String;
                                             VEndCond  : String;

                                  // Variavel para pega o Nome do Cliente  MODO TKT
                                      VClienteCondTKT  : String;
                                          VEndCondTKT  : String;

                                           vARQUIVOOFF : String;
                                                vADDDV : String;
                                           xTpImpPorta : String;



  vItens: array[1..12,1..10000] of string;
  oItens: array[1..12,1..10000] of string;

  vmesas: array[1..2,0..9999] of string;
  vverro: array[1..2,0..9999] of string; //variavel q guarda as mesas para depois verificar se a ficha foi fechada

{ Fim *************************************************************************}

_Numero_ID : Integer;

implementation

//uses UNF_Pergunta, UNF_Mensagem, UNF_Modulo, UNF_Senha, UNF_Frente,
//     UNF_Mesa, UNF_Fecha, UNF_VariasFormas, UNF_Entrada, UNF_Menu,
//     UNF_Manutencao, UNF_TEF, UNF_ModuloFechaCaixa, UNF_FechaDia,
//     UNF_GeraGerenciais;

uses UNF_Pergunta, UNF_Mensagem, UNF_Modulo, UNF_Senha, UNF_Entrada,
  UNF_PesLookUp;

type
  TFeriados = (frPascoa, frCarnaval, frQuartaCinzas, frSextaSanta, frCorpusChristi);


function Peslookup( _listsource:TDataSource; _listfield:String; _keyfield:String ): Integer;
begin
   FRM_PesLoockUP.DBLC_Pesquisa.ListSource := _listsource;
   FRM_PesLoockUP.DBLC_Pesquisa.ListField  := _listfield;
   FRM_PesLoockUP.DBLC_Pesquisa.KeyField   := _keyfield;
   FRM_PesLoockUP.ShowModal;

   Result := _Numero_ID;
end;

function Gerar(operador : Integer; data : TDate; hora : TTime; movref : TDate):Boolean;
begin
//   if (_RELWEB <> 'S') then
//   begin
//      Result := False;
//      Exit;
//   end;
//
//   if FRM_GeraGerenciais = nil then
//      FRM_GeraGerenciais  := TFRM_GeraGerenciais.Create(Application);
//
//   if _MensagemGerencial = 'S' then
//   begin
//      FRM_GeraGerenciais.Show;
//      FRM_GeraGerenciais.Ani_Status.Active := True;
//   end;
//
//   // Grava relatorio de formas ................................................
//   FRM_GeraGerenciais.GeraFormas(operador,data,hora,movref);
//
//   // Grava relatorio de Hora...................................................
//   FRM_GeraGerenciais.GeraHoras(operador,data,hora,movref);
//
//   // Grava relatorio de Grupos.................................................
//   FRM_GeraGerenciais.GeraGrupos(operador,data,hora,movref);
//
//   // Grava relatorio de Totais.................................................
//   FRM_GeraGerenciais.GeraTotais(operador,data,hora,movref);
//
//   // Limpar da memoria.........................................................
//   if _MensagemGerencial = 'S' then
//   begin
//      FRM_GeraGerenciais.Close;
//   end;
//
//   FRM_GeraGerenciais := nil;
//
//   Result := True;
end;

function GetStateK (Key: integer): boolean;
begin
  Result := Odd (GetKeyState (Key));
end;

function Arred2(xValor:Double):Double;
begin
   Result := StrToFloat(FormatFloat('###############0.00',xValor));
end;

function crypt(texto : string):string;
var
   i, e, cri, sen, sen1, let : integer;
                         ret : string;
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

function RetiraEnter(Texto:String):String;
var
   cont : Boolean;
begin
   cont := true;

   repeat
      if Pos(#13+#10,texto) <> 0 then
      begin
         Insert(' ',texto,Pos(#13+#10,texto));
         Delete(texto,Pos(#13+#10,texto),2);
      end
      else
         cont := false;
   until not cont;

   Result := Trim(texto);
end;

{ verificar processo }
function GetProcSpec(ProcEsp:String):Boolean;
var
         H: THandle;
        pe: TProcessEntry32;
         B: Boolean;
   ConvExe: String;
begin
   H := CreateToolhelp32Snapshot(TH32CS_SNAPALL, 0);
   try
      pe.dwSize := SizeOf(pe);
      B := Process32First(H, pe);
      Result := False;

      while B do
      begin
         ConvExe := StrPas(pe.szExeFile);
         if ConvExe = ProcEsp then
         begin
            Result := True;
            Break;
         end
         else if ConvExe = UpperCase(ProcEsp) then
         begin
            Result := True;
            Break;
         end
         else if ConvExe = LowerCase(ProcEsp) then
         begin
            Result := True;
            Break;
         end
         else
         begin
            Result := False;
            B := Process32Next(H, pe);
         end;
      end;
   finally
      CloseHandle(H);
   end;
end;

function Repl(C: string; Tamanho: integer): string;
var
  Conteudo : string;
    Contar : integer;
begin
   Conteudo := '';

   for Contar := 1 to Tamanho do
   begin
      Conteudo := Conteudo + C;
      Application.ProcessMessages;
   end;

   Repl := Conteudo;
end;

function CalculaCnpjCpf(Numero : String) : Boolean;
Var
   i,d,b,Digito : Byte;
           Soma : Integer;
           CNPJ : Boolean;
  DgPass,DgCalc : String;
begin
   Result := False;
   Numero := ApenasNumerosStr(Numero);

   // Caso o número não seja 11 (CPF) ou 14 (CNPJ), aborta
   Case Length(Numero) of
        11: CNPJ := False;
        14: CNPJ := True;
    else
        Exit;
   end;

   // Separa o número do digito
   DgCalc := '';
   DgPass := Copy(Numero,Length(Numero)-1,2);
   Numero := Copy(Numero,1,Length(Numero)-2);

   // Calcula o digito 1 e 2
   For d := 1 to 2 do begin
     B    := IIF(D=1,2,3); // BYTE
     SOMA := IIF(D=1,0,STRTOINTDEF(DGCALC,0)*2);

     for i := Length(Numero) downto 1 do begin
       Soma := Soma + (Ord(Numero[I])-Ord('0'))*b;

      Inc(b);

      If (b > 9) And CNPJ Then
        b := 2;

    end;

    Digito := 11 - Soma mod 11;

    If Digito >= 10 then
      Digito := 0;

    DgCalc := DgCalc + Chr(Digito + Ord('0'));
  end;

  Result := DgCalc = DgPass;
end;

function IIf(pCond:Boolean;pTrue,pFalse:Variant): Variant;
begin
  If pCond Then
     Result := pTrue
  else
     Result := pFalse;
end;

function BuscaCEPBRASIL(WebCEPBRASIL: String): Boolean;
//var
//          SS : TStringStream;
//         Doc : XMLIntf.IXMLDocument;
//           i : Integer;
//   resultado : String;
//   rua, tipo : String;
begin
//   Screen.Cursor := crSQLWait;
//
//   try
//      {limpa memo temporario}
//      FRM_Frente.memoBuscaLogradouroSource.Clear;
//
//      {limpa variaveis}
//      EndBrasil    := '';
//      BairroBrasil := '';
//      UFBrasil     := '';
//      CidadeBrasil := '';
//
//      {limpa variaveis locais}
//      resultado := '-1';
//      rua       := '';
//      tipo      := '';
//
//      {pesquisa no WS o cep}
//      SS := TStringStream.Create('');
//      FRM_Frente.HTTPReqResp_CEP.URL := 'http://cep.republicavirtual.com.br/web_cep.php?cep='+WebCEPBRASIL+'&formato=xml';
//      FRM_Frente.HTTPReqResp_CEP.Execute('http://cep.republicavirtual.com.br/web_cep.php?cep='+WebCEPBRASIL+'&formato=xml', SS);
//      Doc := LoadXMLData(SS.DataString);
//
//      //adiciona quebras de linha para divisão dos elementos por linha
//      Doc.XML.Text := StringReplace(Doc.XML.Text, '>', '>'+#13#10, [rfReplaceALL]);
//      Doc.XML.Text := StringReplace(Doc.XML.Text, '</', #13#10+'</', [rfReplaceALL]);
//      FRM_Frente.memoBuscaLogradouroSource.Text := Doc.XML.Text;
//
//      {le o retorno}
//      for i := 0 to FRM_Frente.memoBuscaLogradouroSource.Lines.Count-1 do
//      begin
//         if Pos(Trim(FRM_Frente.memoBuscaLogradouroSource.Lines[I]),'<resultado>') > 0 then
//            resultado := AnsiUpperCase(Trim(FRM_Frente.memoBuscaLogradouroSource.Lines[I+1]));
//
//         if Pos(Trim(FRM_Frente.memoBuscaLogradouroSource.Lines[I]),'<uf>') > 0 then
//            UFBrasil := AnsiUpperCase(Trim(FRM_Frente.memoBuscaLogradouroSource.Lines[I+1]));
//
//         if Pos(Trim(FRM_Frente.memoBuscaLogradouroSource.Lines[I]),'<cidade>') > 0 then
//            CidadeBrasil := AnsiUpperCase(Trim(FRM_Frente.memoBuscaLogradouroSource.Lines[I+1]));
//
//         if Pos(Trim(FRM_Frente.memoBuscaLogradouroSource.Lines[I]),'<bairro>') > 0 then
//            BairroBrasil := AnsiUpperCase(Trim(FRM_Frente.memoBuscaLogradouroSource.Lines[I+1]));
//
//         if Pos(Trim(FRM_Frente.memoBuscaLogradouroSource.Lines[I]),'<tipo_logradouro>') > 0 then
//            tipo := AnsiUpperCase(Trim(FRM_Frente.memoBuscaLogradouroSource.Lines[I+1]));
//
//         if Pos(Trim(FRM_Frente.memoBuscaLogradouroSource.Lines[I]),'<logradouro>') > 0 then
//            rua := AnsiUpperCase(Trim(FRM_Frente.memoBuscaLogradouroSource.Lines[I+1]));
//      end;
//
//      EndBrasil := tipo + ' ' + rua;
//
//      Screen.Cursor := crDefault;
//      Result := True;
//   except
//      ShowMessage('Erro ao buscar cep');
//
//      Screen.Cursor := crDefault;
//      Result := False;
//   end;
end;


function StrZero(N: integer; Tamanho: integer): string;
var
  Conteudo: string;
  Diferenca: Integer;
begin
   Conteudo  := IntToStr( N );
   Diferenca := Tamanho - Length( Conteudo );

   if Diferenca > 0 then
     Conteudo := Repl( '0', Diferenca ) + Conteudo;
     
   StrZero := Conteudo;
end;

{ LOG - tipo -> 0 = mensagens, 1 = mensagemerros, 2 = perguntas, 3 = sistema, 4 = ecf}
procedure GeraLog(LogTipo: Integer; LogTexto: String; LogFicha:Integer; LogSequencia:Integer; LogFichaF:Integer; LogSequenciaF:Integer);
var
                 xLog, xLogBKP: TextFile;
   xNomeArquivo, xNomeArquivo2: String;
begin
   if _XLOGSISTEMA = 'S' then
   begin
      try
         {gera primeira copia do log na pasta do sistema}
         if LogTipo = 0 then
            xNomeArquivo := _app+'\LogMensagensSISTEMA.Log';

         if LogTipo = 1 then
            xNomeArquivo := _app+'\LogMensagensERRO.Log';

         if LogTipo = 2 then
            xNomeArquivo := _app+'\LogMensagensPERGUNTAS.Log';

         if LogTipo = 3 then
            xNomeArquivo := _app+'\LogSISTEMA.Log';

         if LogTipo = 4 then
            xNomeArquivo := _app+'\LogECF.Log';

         AssignFile(xlog, xNomeArquivo);
         if not FileExists(xNomeArquivo) then
            Rewrite(xlog,xNomeArquivo);

         Append(xlog);
         WriteLn(xlog, FormatDateTime('dd/MM/yyyy|hh:mm:ss', Now) + ' ' +
                       copy(xcaixa+Repl(' ',3),1,3)               + ' ' +
                       copy(VNomeCX+Repl(' ',30),1,30)            + ' ' +
                       copy(StrZero(LogFicha,4),1,4)              + ' ' +
                       copy(StrZero(LogSequencia,4),1,4)          + ' ' +
                       copy(StrZero(LogFichaF,4),1,4)             + ' ' +
                       copy(StrZero(LogSequenciaF,4),1,4)         + ' ' +
                       copy(LogTexto+Repl(' ',948),1,948));

         CloseFile(xlog);

         {gera segunda copia do log na c:}
         if LogTipo = 0 then
            xNomeArquivo2 := 'c:\bot0';

         if LogTipo = 1 then
            xNomeArquivo2 := 'c:\boot0';

         if LogTipo = 2 then
            xNomeArquivo2 := 'c:\booot0';

         if LogTipo = 3 then
            xNomeArquivo2 := 'c:\boooot0';

         if LogTipo = 4 then
            xNomeArquivo2 := 'c:\booooot0';

         AssignFile(xLogBKP, xNomeArquivo2);
         
         if not FileExists(xNomeArquivo2) then
            Rewrite(xLogBKP,xNomeArquivo2);

         Append(xLogBKP);
         WriteLn(xLogBKP, FormatDateTime('dd/MM/yyyy|hh:mm:ss', Now) + ' ' +
                          copy(xcaixa+Repl(' ',3),1,3)               + ' ' +
                          copy(VNomeCX+Repl(' ',30),1,30)            + ' ' +
                          copy(StrZero(LogFicha,4),1,4)              + ' ' +
                          copy(StrZero(LogSequencia,4),1,4)          + ' ' +
                          copy(StrZero(LogFichaF,4),1,4)             + ' ' +
                          copy(StrZero(LogSequenciaF,4),1,4)         + ' ' +
                          copy(LogTexto+Repl(' ',948),1,948));

         CloseFile(xLogBKP);

      except
         //ShowMessage('ERRO ao gerar arquivo de LOG');
      end;
   end;
end;

{acrescenta o valor saldo do clifor setado}
procedure Acrescenta_Saldo_CliFor(Codigo_ID: Integer; Valor: Double);
begin
   with FRM_Modulo do
   begin
     if IBT_ParametrosFRENTECLIFOR.Value <> Codigo_id then
     begin
        FRM_Modulo.IBTransaction1.CommitRetaining;

        IBQ_FuncSaldo.Close;
        IBQ_FuncSaldo.SQL.Clear;
        IBQ_FuncSaldo.SQL.Add('UPDATE CLIFOR SET SALDO_CASTO = SALDO_CASTO + :P_VALOR');
        IBQ_FuncSaldo.SQL.Add('where CODIGO_ID=:P_COD');
        IBQ_FuncSaldo.ParamByName('P_COD').Value   := Codigo_ID;
        IBQ_FuncSaldo.ParamByName('P_VALOR').Value := Valor;
        IBQ_FuncSaldo.ExecSQL;

        FRM_Modulo.IBTransaction1.CommitRetaining;
     end;
   end;
end;

  {verifica o saldo atual do clifor setado}
function Saldo_CliFor(Codigo_ID: Integer) : String;
var
   resultado : string;
begin
   with FRM_Modulo do
   begin
     if IBT_ParametrosFRENTECLIFOR.Value <> Codigo_id then
     begin
        FRM_Modulo.IBTransaction1.CommitRetaining;

        IBQ_FuncSaldo.Close;
        IBQ_FuncSaldo.SQL.Clear;
        IBQ_FuncSaldo.SQL.Add('SELECT SALDO_CASTO, SALDO_LIMITE, TRAVAMENSAGEM FROM CLIFOR');
        IBQ_FuncSaldo.SQL.Add('where CODIGO_ID=:P_COD');
        IBQ_FuncSaldo.ParamByName('P_COD').Value   := Codigo_ID;
        IBQ_FuncSaldo.Open;

        if IBQ_FuncSaldo.FieldByName('SALDO_CASTO').AsCurrency > IBQ_FuncSaldo.FieldByName('SALDO_LIMITE').AsCurrency then
           Resultado := '>'
        else
           Resultado := '<';

        Result := IBQ_FuncSaldo.FieldByName('TRAVAMENSAGEM').AsString + Resultado;
     end;
   end;
end;

{ calcula a pascoa, data principal para a operação }
function CalculaPascoa(AAno: Word): TDate;
var
   R1, R2, R3, R4, R5 : Longint;
   FPascoa : TDate;
   VJ, VM, VD : Word;
begin
   R1 := AAno mod 19;
   R2 := AAno mod 4;
   R3 := AAno mod 7;
   R4 := (19 * R1 + 24) mod 30;
   R5 := (6 * R4 + 4 * R3 + 2 * R2 + 5) mod 7;
   FPascoa := EncodeDate(AAno, 3, 22);
   FPascoa := FPascoa + R4 + R5;
   DecodeDate(FPascoa, VJ, VM, VD);
   case VD of
      26 :
           FPascoa := EncodeDate(Aano, 4, 19);

      25 :
      if R1 > 10 then
           FPascoa := EncodeDate(AAno, 4, 18);
   end;
   Result:= FPascoa;
end;

{ calcula os feriados pricipais }
function CalculaFeriado(AAno: Word; ATipo: TFeriados): TDate;
var
   Aux: TDate;
begin
   Aux := CalculaPascoa(AAno);
   Case ATipo of
      frPascoa :
         Aux := CalculaPascoa(AAno);

      frCarnaval :
         Aux := Aux - 50;

      frQuartaCinzas :
         Aux := Aux - 46;

      frSextaSanta :
         Aux := Aux - 2;

      frCorpusChristi:
         Aux := Aux + 60;
   end;
   Result := Aux;
end;

{Verifica se uma data informada cai em um final de semana}
function VerificaDataFDS(Data : TDateTime) : boolean;
begin
   if DayOfWeek(Data) in [1,7] then
      Result := True
   else
      Result := False;
end;

{ verifica se o dia é feriado }
function VerificaFeriado(Hoje : String): Boolean;
var
   SystemTime : TSystemTime;
   Ano        : Integer;

   vsPascoa, vsCarnaval, vsQuartaCinzas, vsSextaSanta, vsCorpusChristi : String;
begin
   GetLocalTime(SystemTime);
   Ano := SystemTime.wYear;

   vsPascoa        := DateToStr(CalculaFeriado(ano, frPascoa       ));
   vsCarnaval      := DateToStr(CalculaFeriado(ano, frCarnaval     ));
   vsQuartaCinzas  := DateToStr(CalculaFeriado(ano, frQuartaCinzas ));
   vsSextaSanta    := DateToStr(CalculaFeriado(ano, frSextaSanta   ));
   vsCorpusChristi := DateToStr(CalculaFeriado(ano, frCorpusChristi));

   { feriados principais }
   if (Hoje = vsPascoa        )       //pascoa
   or (Hoje = vsCarnaval      )       //carnaval
   or (Hoje = vsQuartaCinzas  )       //quarta cinzas
   or (Hoje = vsSextaSanta    )       //sexta feira santa
   or (Hoje = vsCorpusChristi )       //Corpus Christi

   or (Hoje = '1/1/'  +IntToStr(Ano)) //confraternização universal
   or (Hoje = '14/4/' +IntToStr(Ano)) //sexta feira da paixao
   or (Hoje = '21/4/' +IntToStr(Ano)) //tiradentes
   or (Hoje = '1/5/'  +IntToStr(Ano)) //dia do trabalho
   or (Hoje = '7/9/'  +IntToStr(Ano)) //independencia do brasil
   or (Hoje = '12/10/'+IntToStr(Ano)) //nossa senhora de aparecida
   or (Hoje = '2/11/' +IntToStr(Ano)) //finados
   or (Hoje = '15/11/'+IntToStr(Ano)) //proclamação da republica
   or (Hoje = '25/12/'+IntToStr(Ano)) //natal

   or (Hoje = '01/01/'+IntToStr(Ano)) //confraternização universal
   or (Hoje = '14/04/'+IntToStr(Ano)) //sexta feira da paixao
   or (Hoje = '21/04/'+IntToStr(Ano)) //tiradentes
   or (Hoje = '01/05/'+IntToStr(Ano)) //dia do trabalho
   or (Hoje = '07/09/'+IntToStr(Ano)) //independencia do brasil
   or (Hoje = '12/10/'+IntToStr(Ano)) //nossa senhora de aparecida
   or (Hoje = '02/11/'+IntToStr(Ano)) //finados
   or (Hoje = '15/11/'+IntToStr(Ano)) //proclamação da republica
   or (Hoje = '25/12/'+IntToStr(Ano)) //natal
   then
   begin
      Result := True;
   end
   else
   begin
      if (VerificaDataFDS(strtodate(Hoje))) //verifica se é final de semana
      then
         Result := True
      else
         Result := False;
   end;
end;

function Arredondar(Valor: Double; Dec: Integer): Double;
var
  Valor1, Numero1, Numero2, Numero3: Double;
begin
  Valor1  := Exp(Ln(10) * (Dec + 1));
  Numero1 := Int(Valor * Valor1);
  Numero2 := (Numero1 / 10);
  Numero3 := Round(Numero2);
  Result  := (Numero3 / (Exp(Ln(10) * Dec)));
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

procedure Recalcular_Cx(_Base:Integer; _tipo:string; _codigo:Integer);
var
   saldo_, tot_ : Currency;
begin
  Screen.Cursor := crSQLWait;

  with FRM_Modulo do
  begin
     IBQ_CxList.Close;
     IBQ_CxList.SQL.Clear;
     IBQ_CxList.SQL.Add('Select *');
     IBQ_CxList.SQL.Add('From CxMovto');
     IBQ_CxList.SQL.Add('Where Caixa = :P_caixa');
     IBQ_CxList.ParamByName('P_caixa').Value := _Base;

     IBQ_CxList.SQL.Add('order by data, Numero_id');

     IBQ_CxList.Open;

     if _tipo = 'T' then
        begin
           IBQ_CxList.First;
           saldo_ := 0.0000;
        end
     else
        begin
           IBQ_CxList.Locate('Numero_ID',_codigo,[]);

           IBQ_CxList.Prior;
           if IBQ_CxList.Bof then
              begin
                IBQ_CxList.First;
                saldo_ := 0.0000;
              end
           else
              begin
                saldo_ := IBQ_CxListSALDO.Value;
                IBQ_CxList.Next;
              end;
        end;

     while not IBQ_CxList.Eof do
     begin
        tot_ := IBQ_CxListVALOR.Value;

        if IBQ_CxListDEBCRED.Value = 'D' then
           saldo_ := saldo_ - tot_
        else
           saldo_ := saldo_ + tot_ ;

        FRM_Modulo.IBQ_Grava.Close;
        FRM_Modulo.IBQ_Grava.SQL.Clear;
        FRM_Modulo.IBQ_Grava.SQL.Add('UPDATE CxMovto');
        FRM_Modulo.IBQ_Grava.SQL.Add('set SALDO = :p_saldo');
        FRM_Modulo.IBQ_Grava.ParamByName('p_saldo').Value := saldo_ ;

        FRM_Modulo.IBQ_Grava.SQL.Add('Where numero_id = :P_numero_id');
        FRM_Modulo.IBQ_Grava.ParamByName('P_numero_id').Value := IBQ_CxListNUMERO_ID.Value ;

        FRM_Modulo.IBQ_Grava.ExecSQL;

        _IBCommit(IBQ_CxList);

        IBQ_CxList.Next;
     end;
  end;

  Screen.Cursor := crDefault;
end;

procedure Recalcular_CxTemp(_Base:Integer; _tipo:string; _codigo:Integer);
var
   saldo_, tot_ : Currency;
begin
  Screen.Cursor := crSQLWait;

  with FRM_Modulo do
  begin
     IBQ_CxList.Close;
     IBQ_CxList.SQL.Clear;
     IBQ_CxList.SQL.Add('Select *');
     IBQ_CxList.SQL.Add('From CxMovtoTemp');
     IBQ_CxList.SQL.Add('Where Caixa = :P_caixa');
     IBQ_CxList.ParamByName('P_caixa').Value := _Base;

     IBQ_CxList.SQL.Add('order by data, Numero_id');

     IBQ_CxList.Open;

     if _tipo = 'T' then
        begin
           IBQ_CxList.First;
           saldo_ := 0.0000;
        end
     else
        begin
           IBQ_CxList.Locate('Numero_ID',_codigo,[]);

           IBQ_CxList.Prior;
           if IBQ_CxList.Bof then
              begin
                IBQ_CxList.First;
                saldo_ := 0.0000;
              end
           else
              begin
                saldo_ := IBQ_CxListSALDO.Value;
                IBQ_CxList.Next;
              end;
        end;

     while not IBQ_CxList.Eof do
     begin
        tot_ := IBQ_CxListVALOR.Value;

        if IBQ_CxListDEBCRED.Value = 'D' then
           saldo_ := saldo_ - tot_
        else
           saldo_ := saldo_ + tot_ ;

        IBQ_Grava.Close;
        IBQ_Grava.SQL.Clear;
        IBQ_Grava.SQL.Add('UPDATE CxMovtoTemp');
        IBQ_Grava.SQL.Add('set SALDO = :p_saldo');
        IBQ_Grava.ParamByName('p_saldo').Value := saldo_ ;

        IBQ_Grava.SQL.Add('Where numero_id = :P_numero_id');
        IBQ_Grava.ParamByName('P_numero_id').Value := IBQ_CxListNUMERO_ID.Value ;

        IBQ_Grava.ExecSQL;

        _IBCommit(IBQ_CxList);

        IBQ_CxList.Next;
     end;
  end;

  Screen.Cursor := crDefault;
end;

function RecProdVir(_TP:string; _matprima:Integer; _QTD:Double): Boolean;
begin
  try
     { Altera a quantidade virtual do produto }
     FRM_Modulo.IBQ_GravaProd.Close;
     FRM_Modulo.IBQ_GravaProd.SQL.Clear;
     FRM_Modulo.IBQ_GravaProd.SQL.Add('UPDATE PRODUTOS');
     FRM_Modulo.IBQ_GravaProd.SQL.Add('set ESTOQUE_VIRTUAL = ESTOQUE_VIRTUAL + :p_ESTOQUE_VIRTUAL');

     if _TP = 'E' then
        FRM_Modulo.IBQ_GravaProd.ParamByName('p_ESTOQUE_VIRTUAL').Value := _QTD
     else
        FRM_Modulo.IBQ_GravaProd.ParamByName('p_ESTOQUE_VIRTUAL').Value := _QTD*(-1);

     FRM_Modulo.IBQ_GravaProd.SQL.Add('Where codigo_id = :codigo_id');
     FRM_Modulo.IBQ_GravaProd.ParamByName('codigo_id').Value := _matprima ;
     FRM_Modulo.IBQ_GravaProd.ExecSQL;

     FRM_Modulo.IBTransaction1.CommitRetaining;

     Result := True;
  except
     Result := False;
  end;
end;

(*function lanestoque(_ES:string; _produto:Integer; _Data:TDateTime; _QTD:Double; _Total:Currency;
                    _cliente:Integer; _centrocusto:Integer; _Historico:string ): Boolean;
begin
   { Lanca no Estoque }
   try
      if _ES = 'E' then
      begin
        with FRM_Modulo do
        begin
           IBT_MovEstoque.Append;
           IBT_MovEstoquePRODUTOS.Value    := _produto;
           IBT_MovEstoqueDATA.value        := _Data;
           IBT_MovEstoqueQTDENTRADA.Value  := _QTD;
           IBT_MovEstoqueVALENTRADA.Value  := 0.00;
           IBT_MovEstoqueQTDSAIDA.Value    := 0.00;
           IBT_MovEstoqueVALSAIDA.Value    := 0.00;
           IBT_MovEstoqueVALSALDO.Value    := 0.00;
           IBT_MovEstoqueQTDSALDO.Value    := 0.00;

           if _cliente <> 0 then
              IBT_MovEstoqueCLIFOR.Value      := _cliente;

           //if _centrocusto <> 0 then
           //   IBT_MovEstoqueCENTROCUSTO.Value := _centrocusto;

           //IBT_MovEstoqueCLIFOR.Value      := _cliente;
           //IBT_MovEstoqueCENTROCUSTO.Value := _centrocusto;
           IBT_MovEstoqueHISTORICO.Value   := _Historico;
           IBT_MovEstoque.Post;
        end;
      end
      else if _ES = 'S' then
      begin
        with FRM_Modulo do
        begin
           IBT_MovEstoque.Append;
           IBT_MovEstoquePRODUTOS.Value    := _produto;
           IBT_MovEstoqueDATA.Value        := _Data;
           IBT_MovEstoqueQTDENTRADA.Value  := 0.00;
           IBT_MovEstoqueVALENTRADA.Value  := 0.00;
           IBT_MovEstoqueQTDSAIDA.Value    := _QTD;
           IBT_MovEstoqueVALSAIDA.Value    := 0.00;
           IBT_MovEstoqueVALSALDO.Value    := 0.00;
           IBT_MovEstoqueQTDSALDO.Value    := 0.00;

           if _cliente <> 0 then
              IBT_MovEstoqueCLIFOR.Value      := _cliente;

           //if _centrocusto <> 0 then
           //   IBT_MovEstoqueCENTROCUSTO.Value := _centrocusto;

           IBT_MovEstoqueHISTORICO.Value   := _Historico;
           IBT_MovEstoque.Post;
        end;
      end;

      { Recalcular estoque virtual }
      RecProdVir(_ES,_produto,_QTD);

      Result := True;
   except
      Result := False;
   end;
end;

function recestoque(_TP:string; _matprima:Integer; _tempo:TDateTime): Boolean;
var
                               _QtdSaldo : Double;
   _ValSaldo, _PrecoMedio, _PrecoEntrada : Currency;
    vAvalsaida, vAvalentra, _APrecoMedio : Currency;
begin
  Screen.Cursor := crSQLWait;

  { Burca Preco Custo do Produto}
  with FRM_Modulo do
  begin
     IBQ_GravaProd.Close;
     IBQ_GravaProd.SQL.Clear;
     IBQ_GravaProd.SQL.Add('SELECT *');
     IBQ_GravaProd.SQL.Add('FROM PRODUTOS');
     IBQ_GravaProd.SQL.Add('Where CODIGO_ID = :codigo_id');
     IBQ_GravaProd.ParamByName('codigo_id').Value := _matprima ;
     IBQ_GravaProd.Open;

     _PrecoEntrada := FRM_Modulo.IBQ_GravaProdPRECO.Value;
  end;

  with FRM_Modulo do
  begin
     IBQ_CalEstoque.Close;
     IBQ_CalEstoque.SQL.Clear;
     IBQ_CalEstoque.SQL.Add('Select *');
     IBQ_CalEstoque.SQL.Add('From MOVTOSTQ');
     IBQ_CalEstoque.SQL.Add('Where produtos = :P_produtos');
     IBQ_CalEstoque.ParamByName('P_produtos').Value := _matprima;

     IBQ_CalEstoque.SQL.Add('order by data');

     IBQ_CalEstoque.Open;

     if _TP = 'T' then
        begin
           IBQ_CalEstoque.First;
           _ValSaldo     := 0.00;
           _QtdSaldo     := 0.00;
           _PrecoMedio   := 0.00;
        end
     else
        begin
           IBQ_CalEstoque.Locate('Data',_tempo,[]);

           IBQ_CalEstoque.Prior;
           if IBQ_CalEstoque.Bof then
              begin
                IBQ_CalEstoque.First;
                _ValSaldo     := 0.00;
                _QtdSaldo     := 0.00;
                _PrecoMedio   := 0.00;
              end
           else
              begin
                _ValSaldo     := IBQ_CalEstoqueVALSALDO.Value;
                _QtdSaldo     := IBQ_CalEstoqueQTDSALDO.Value;
                _PrecoMedio   := IBQ_CalEstoquecPreMedio.AsFloat;
                IBQ_CalEstoque.Next;
              end;
        end;

     while not IBQ_CalEstoque.Eof do
     begin

       vAvalsaida := 0.00;
       vAvalentra := 0.00;

       { Valor saida em branco }
       if (IBQ_CalEstoqueQTDSAIDA.Value <> 0.00) then
       begin
          vAvalsaida := (_PrecoMedio * IBQ_CalEstoqueQTDSAIDA.AsFloat);

          if vAvalsaida < 0 then
             vAvalsaida := 0.00;

          IBQ_EstGravar.Close;
          IBQ_EstGravar.SQL.Clear;
          IBQ_EstGravar.SQL.Add('UPDATE MovtoSTQ');
          IBQ_EstGravar.SQL.Add('set VALSAIDA = :p_valsaida');
          IBQ_EstGravar.ParamByName('p_valsaida').Value := vAvalsaida;
          IBQ_EstGravar.SQL.Add('Where Codigo_id = :P_Codigo_id');
          IBQ_EstGravar.ParamByName('P_Codigo_id').Value := IBQ_CalEstoqueCODIGO_ID.Value ;

          IBQ_EstGravar.ExecSQL;

          FRM_Modulo.IBTransaction1.CommitRetaining;
          //_IBCommit(IBQ_EstGravar);
       end;

       { Valor Entrada em branco }
       if (IBQ_CalEstoqueQTDENTRADA.Value <> 0.00) then
       begin
          if (IBQ_CalEstoqueVALENTRADA.Value = 0) then
          begin
             vAvalentra := (_PrecoEntrada * IBQ_CalEstoqueQTDENTRADA.AsFloat);

             if vAvalentra < 0 then
                 vAvalentra := 0.00;

             IBQ_EstGravar.Close;
             IBQ_EstGravar.SQL.Clear;
             IBQ_EstGravar.SQL.Add('UPDATE MovtoSTQ');
             IBQ_EstGravar.SQL.Add('set VALENTRADA = :p_vAvalentra');
             IBQ_EstGravar.ParamByName('p_vAvalentra').Value := vAvalentra;
             IBQ_EstGravar.SQL.Add('Where codigo_id = :P_codigo_id');
             IBQ_EstGravar.ParamByName('P_codigo_id').Value := IBQ_CalEstoqueCODIGO_ID.Value ;

             IBQ_EstGravar.ExecSQL;
             FRM_Modulo.IBTransaction1.CommitRetaining;
             //_IBCommit(IBQ_EstGravar);
          end
          else
          begin
             vAvalentra := (IBQ_CalEstoqueVALENTRADA.AsFloat);
          end;
       end;

       { Saldo }
       _ValSaldo := _ValSaldo +  (vAvalentra - vAvalsaida);
       _QtdSaldo := _QtdSaldo + IBQ_CalEstoqueQTDENTRADA.AsFloat - IBQ_CalEstoqueQTDSAIDA.AsFloat;

       { Gravar  ValSaldo }
       IBQ_EstGravar.Close;
       IBQ_EstGravar.SQL.Clear;
       IBQ_EstGravar.SQL.Add('UPDATE MovtoSTQ');
       IBQ_EstGravar.SQL.Add('set VALSALDO = :p_VALSALDO');
       IBQ_EstGravar.ParamByName('p_VALSALDO').Value := _ValSaldo;
       IBQ_EstGravar.SQL.Add('Where codigo_id = :P_codigo_id');
       IBQ_EstGravar.ParamByName('P_codigo_id').Value := IBQ_CalEstoqueCODIGO_ID.Value ;

       IBQ_EstGravar.ExecSQL;

       FRM_Modulo.IBTransaction1.CommitRetaining;
       //_IBCommit(IBQ_EstGravar);

       { Gravar QTDSALDO }
       IBQ_EstGravar.Close;
       IBQ_EstGravar.SQL.Clear;
       IBQ_EstGravar.SQL.Add('UPDATE MovtoSTQ');
       IBQ_EstGravar.SQL.Add('set QTDSALDO = :p_QTDSALDO');
       IBQ_EstGravar.ParamByName('p_QTDSALDO').Value := _QtdSaldo;
       IBQ_EstGravar.SQL.Add('Where codigo_id = :P_codigo_id');
       IBQ_EstGravar.ParamByName('P_codigo_id').Value := IBQ_CalEstoqueCODIGO_ID.Value ;

       IBQ_EstGravar.ExecSQL;
       FRM_Modulo.IBTransaction1.CommitRetaining;
       //_IBCommit(IBQ_EstGravar);

       { Colocar estoque no Produtos }
       IBQ_GraEstProd.Close;
       IBQ_GraEstProd.SQL.Clear;
       IBQ_GraEstProd.SQL.Add('UPDATE PRODUTOS');
       IBQ_GraEstProd.SQL.Add('set ESTOQUE_FISICO = :P_ESTOQUE_FISICO ');
       IBQ_GraEstProd.ParamByName('P_ESTOQUE_FISICO').Value := _QtdSaldo;
       IBQ_GraEstProd.SQL.Add('Where (CODIGO_ID = :P_CODIGO_ID)');
       IBQ_GraEstProd.ParamByName('P_CODIGO_ID').Value := _matprima;
       IBQ_GraEstProd.ExecSQL;
       FRM_Modulo.IBTransaction1.CommitRetaining;

       _APrecoMedio := _PrecoMedio;

       if IBQ_CalEstoquecPreMedio.Value = 0 then
          if _QtdSaldo <> 0 then
             _PrecoMedio := _ValSaldo / _QtdSaldo
          else
             _PrecoMedio := 0
       else
          _PrecoMedio := IBQ_CalEstoquecPreMedio.Value;

        if _PrecoMedio <= 0 then
           _PrecoMedio :=  _APrecoMedio;

       IBQ_CalEstoque.Next;
     end;
  end;

  Screen.Cursor := crDefault;
  Result        := True;
end;*)

function lanestoque(_ES:string; _produto:Integer; _Data:TDateTime; _QTD:Double; _Total:Currency;
                    _cliente:Integer; _centrocusto:Integer; _Historico:string ): Boolean;
var
   _lproduto : Integer;
       _lQTD : Double;
begin
   { Lanca no Estoque }
   try
      //Pesquisar produto
      FRM_Modulo.IBQ_ProEst.Close;
      FRM_Modulo.IBQ_ProEst.SQL.Clear;
      FRM_Modulo.IBQ_ProEst.SQL.Add('select * from PRODUTOS');
      FRM_Modulo.IBQ_ProEst.SQL.Add('where (Codigo_id = :P_CodigoID)');
      FRM_Modulo.IBQ_ProEst.ParamByName('P_CodigoID').Value := _produto;
      FRM_Modulo.IBQ_ProEst.Open;

      if (FRM_Modulo.IBQ_ProEstESTLISTA_SN.Value = 'N') then
      begin
         if _ES = 'E' then
         begin
            with FRM_Modulo do
            begin
              IBQ_MovEstoque.Close;
              IBQ_MovEstoque.SQL.Clear;

              if _cliente <> 0 then
              begin
                 IBQ_MovEstoque.SQL.Add('INSERT INTO MOVTOSTQ (CODIGO_ID, PRODUTOS, CLIFOR, HISTORICO, VALENTRADA, QTDENTRADA, VALSAIDA, QTDSAIDA, VALSALDO, QTDSALDO, DATA)');
                 IBQ_MovEstoque.SQL.Add('              VALUES (0, :P_PRODUTOS, :P_CLIFOR, :P_HISTORICO, :P_VALENTRADA, :P_QTDENTRADA, :P_VALSAIDA, :P_QTDSAIDA, :P_VALSALDO, :P_QTDSALDO, :P_DATA)');
              end
              else
              begin
                 IBQ_MovEstoque.SQL.Add('INSERT INTO MOVTOSTQ (CODIGO_ID, PRODUTOS, HISTORICO, VALENTRADA, QTDENTRADA, VALSAIDA, QTDSAIDA, VALSALDO, QTDSALDO, DATA)');
                 IBQ_MovEstoque.SQL.Add('              VALUES (0, :P_PRODUTOS, :P_HISTORICO, :P_VALENTRADA, :P_QTDENTRADA, :P_VALSAIDA, :P_QTDSAIDA, :P_VALSALDO, :P_QTDSALDO, :P_DATA)');
              end;

              IBQ_MovEstoque.ParamByName('P_PRODUTOS').Value    := _produto;

              if _cliente <> 0 then
                 IBQ_MovEstoque.ParamByName('P_CLIFOR').Value   := _cliente;

              IBQ_MovEstoque.ParamByName('P_HISTORICO').Value   := _Historico;
              IBQ_MovEstoque.ParamByName('P_VALENTRADA').Value  := _Total;
              IBQ_MovEstoque.ParamByName('P_QTDENTRADA').Value  := _QTD;
              IBQ_MovEstoque.ParamByName('P_VALSAIDA').Value    := 0.00;
              IBQ_MovEstoque.ParamByName('P_QTDSAIDA').Value    := 0.00;
              IBQ_MovEstoque.ParamByName('P_VALSALDO').Value    := 0.00;
              IBQ_MovEstoque.ParamByName('P_QTDSALDO').Value    := 0.00;
              IBQ_MovEstoque.ParamByName('P_DATA').Value        := _Data;
              IBQ_MovEstoque.ExecSQL;
              FRM_Modulo.IBTransaction1.CommitRetaining;
           end;
         end
         else if _ES = 'S' then
         begin
            with FRM_Modulo do
            begin
               if _XVERIFICASALDOZERO = 'S' then
               begin
                  IBQ_CalEstoque.Close;
                  IBQ_CalEstoque.SQL.Clear;
                  IBQ_CalEstoque.SQL.Add('Select *');
                  IBQ_CalEstoque.SQL.Add('From MOVTOSTQ');
                  IBQ_CalEstoque.SQL.Add('Where produtos = :P_produtos');
                  IBQ_CalEstoque.ParamByName('P_produtos').Value := _produto;
                  IBQ_CalEstoque.Open;

                  if IBQ_CalEstoque.RecordCount = 0 then
                     ShowMessage('Não há nada lançado para este produto no estoque !!!');
               end;

               IBQ_MovEstoque.Close;
               IBQ_MovEstoque.SQL.Clear;

               if _cliente <> 0 then
               begin
                  IBQ_MovEstoque.SQL.Add('INSERT INTO MOVTOSTQ (CODIGO_ID, PRODUTOS, CLIFOR, HISTORICO, VALENTRADA, QTDENTRADA, VALSAIDA, QTDSAIDA, VALSALDO, QTDSALDO, DATA)');
                  IBQ_MovEstoque.SQL.Add('              VALUES (0, :P_PRODUTOS, :P_CLIFOR, :P_HISTORICO, :P_VALENTRADA, :P_QTDENTRADA, :P_VALSAIDA, :P_QTDSAIDA, :P_VALSALDO, :P_QTDSALDO, :P_DATA)');
               end
               else
               begin
                  IBQ_MovEstoque.SQL.Add('INSERT INTO MOVTOSTQ (CODIGO_ID, PRODUTOS, HISTORICO, VALENTRADA, QTDENTRADA, VALSAIDA, QTDSAIDA, VALSALDO, QTDSALDO, DATA)');
                  IBQ_MovEstoque.SQL.Add('              VALUES (0, :P_PRODUTOS, :P_HISTORICO, :P_VALENTRADA, :P_QTDENTRADA, :P_VALSAIDA, :P_QTDSAIDA, :P_VALSALDO, :P_QTDSALDO, :P_DATA)');
               end;

               IBQ_MovEstoque.ParamByName('P_PRODUTOS').Value    := _produto;

               if _cliente <> 0 then
                  IBQ_MovEstoque.ParamByName('P_CLIFOR').Value   := _cliente;

               IBQ_MovEstoque.ParamByName('P_HISTORICO').Value   := _Historico;
               IBQ_MovEstoque.ParamByName('P_VALENTRADA').Value  := 0.00;
               IBQ_MovEstoque.ParamByName('P_QTDENTRADA').Value  := 0.00;
               IBQ_MovEstoque.ParamByName('P_VALSAIDA').Value    := 0.00;
               IBQ_MovEstoque.ParamByName('P_QTDSAIDA').Value    := _QTD;
               IBQ_MovEstoque.ParamByName('P_VALSALDO').Value    := 0.00;
               IBQ_MovEstoque.ParamByName('P_QTDSALDO').Value    := 0.00;
               IBQ_MovEstoque.ParamByName('P_DATA').Value        := _Data;
               IBQ_MovEstoque.ExecSQL;

               FRM_Modulo.IBTransaction1.CommitRetaining;
            end;
         end;

         { Recalcular estoque virtual }
         RecProdVir(_ES,_produto,_QTD);
      end
      else
      begin
         FRM_Modulo.IBQ_LisEst.Close;
         FRM_Modulo.IBQ_LisEst.Open;

         FRM_Modulo.IBQ_LisEst.First;
         while not FRM_Modulo.IBQ_LisEst.EOF do
         begin
            _lproduto := FRM_Modulo.IBQ_LisEstMATERIAL.Value;
            _lQTD     := FRM_Modulo.IBQ_LisEstQTD.Value*_QTD;

            if _ES = 'E' then
            begin
               with FRM_Modulo do
               begin
                 IBQ_MovEstoque.Close;
                 IBQ_MovEstoque.SQL.Clear;

                 if _cliente <> 0 then
                 begin
                    IBQ_MovEstoque.SQL.Add('INSERT INTO MOVTOSTQ (CODIGO_ID, PRODUTOS, CLIFOR, HISTORICO, VALENTRADA, QTDENTRADA, VALSAIDA, QTDSAIDA, VALSALDO, QTDSALDO, DATA)');
                    IBQ_MovEstoque.SQL.Add('              VALUES (0, :P_PRODUTOS, :P_CLIFOR, :P_HISTORICO, :P_VALENTRADA, :P_QTDENTRADA, :P_VALSAIDA, :P_QTDSAIDA, :P_VALSALDO, :P_QTDSALDO, :P_DATA)');
                 end
                 else
                 begin
                    IBQ_MovEstoque.SQL.Add('INSERT INTO MOVTOSTQ (CODIGO_ID, PRODUTOS, HISTORICO, VALENTRADA, QTDENTRADA, VALSAIDA, QTDSAIDA, VALSALDO, QTDSALDO, DATA)');
                    IBQ_MovEstoque.SQL.Add('              VALUES (0, :P_PRODUTOS, :P_HISTORICO, :P_VALENTRADA, :P_QTDENTRADA, :P_VALSAIDA, :P_QTDSAIDA, :P_VALSALDO, :P_QTDSALDO, :P_DATA)');
                 end;

                 IBQ_MovEstoque.ParamByName('P_PRODUTOS').Value    := _lproduto;

                 if _cliente <> 0 then
                    IBQ_MovEstoque.ParamByName('P_CLIFOR').Value   := _cliente;

                 IBQ_MovEstoque.ParamByName('P_HISTORICO').Value   := _Historico;
                 IBQ_MovEstoque.ParamByName('P_VALENTRADA').Value  := FRM_Modulo.IBQ_LisEstPRECOCUSTO.Value*_lQTD;
                 IBQ_MovEstoque.ParamByName('P_QTDENTRADA').Value  := _lQTD;
                 IBQ_MovEstoque.ParamByName('P_VALSAIDA').Value    := 0.00;
                 IBQ_MovEstoque.ParamByName('P_QTDSAIDA').Value    := 0.00;
                 IBQ_MovEstoque.ParamByName('P_VALSALDO').Value    := 0.00;
                 IBQ_MovEstoque.ParamByName('P_QTDSALDO').Value    := 0.00;
                 IBQ_MovEstoque.ParamByName('P_DATA').Value        := _Data;
                 IBQ_MovEstoque.ExecSQL;

                 FRM_Modulo.IBTransaction1.CommitRetaining;
              end;
            end
            else if _ES = 'S' then
            begin
               with FRM_Modulo do
               begin
                  if _XVERIFICASALDOZERO = 'S' then
                  begin
                     IBQ_CalEstoque.Close;
                     IBQ_CalEstoque.SQL.Clear;
                     IBQ_CalEstoque.SQL.Add('Select *');
                     IBQ_CalEstoque.SQL.Add('From MOVTOSTQ');
                     IBQ_CalEstoque.SQL.Add('Where produtos = :P_produtos');
                     IBQ_CalEstoque.ParamByName('P_produtos').Value := _produto;
                     IBQ_CalEstoque.Open;

                     if IBQ_CalEstoque.RecordCount = 0 then
                        ShowMessage('Não há nada lançado para este produto no estoque !!!');
                  end;

                  IBQ_MovEstoque.Close;
                  IBQ_MovEstoque.SQL.Clear;

                  if _cliente <> 0 then
                  begin
                     IBQ_MovEstoque.SQL.Add('INSERT INTO MOVTOSTQ (CODIGO_ID, PRODUTOS, CLIFOR, HISTORICO, VALENTRADA, QTDENTRADA, VALSAIDA, QTDSAIDA, VALSALDO, QTDSALDO, DATA)');
                     IBQ_MovEstoque.SQL.Add('              VALUES (0, :P_PRODUTOS, :P_CLIFOR, :P_HISTORICO, :P_VALENTRADA, :P_QTDENTRADA, :P_VALSAIDA, :P_QTDSAIDA, :P_VALSALDO, :P_QTDSALDO, :P_DATA)');
                  end
                  else
                  begin
                     IBQ_MovEstoque.SQL.Add('INSERT INTO MOVTOSTQ (CODIGO_ID, PRODUTOS, HISTORICO, VALENTRADA, QTDENTRADA, VALSAIDA, QTDSAIDA, VALSALDO, QTDSALDO, DATA)');
                     IBQ_MovEstoque.SQL.Add('              VALUES (0, :P_PRODUTOS, :P_HISTORICO, :P_VALENTRADA, :P_QTDENTRADA, :P_VALSAIDA, :P_QTDSAIDA, :P_VALSALDO, :P_QTDSALDO, :P_DATA)');
                  end;

                  IBQ_MovEstoque.ParamByName('P_PRODUTOS').Value    := _lproduto;

                  if _cliente <> 0 then
                     IBQ_MovEstoque.ParamByName('P_CLIFOR').Value   := _cliente;

                  IBQ_MovEstoque.ParamByName('P_HISTORICO').Value   := _Historico;
                  IBQ_MovEstoque.ParamByName('P_VALENTRADA').Value  := 0.00;
                  IBQ_MovEstoque.ParamByName('P_QTDENTRADA').Value  := 0.00;
                  IBQ_MovEstoque.ParamByName('P_VALSAIDA').Value    := 0.00;
                  IBQ_MovEstoque.ParamByName('P_QTDSAIDA').Value    := _lQTD;
                  IBQ_MovEstoque.ParamByName('P_VALSALDO').Value    := 0.00;
                  IBQ_MovEstoque.ParamByName('P_QTDSALDO').Value    := 0.00;
                  IBQ_MovEstoque.ParamByName('P_DATA').Value        := _Data;
                  IBQ_MovEstoque.ExecSQL;

                  FRM_Modulo.IBTransaction1.CommitRetaining;
               end;
            end;

            { Recalcular estoque virtual }
            RecProdVir(_ES,_lproduto,_lQTD);

            FRM_Modulo.IBQ_LisEst.Next;
         end;
      end;

      Result := True;
   except
      Result := False;
   end;
end;
//function lanestoque(_ES:string; _produto:Integer; _Data:TDateTime; _QTD:Double; _Total:Currency;
//                    _cliente:Integer; _centrocusto:Integer; _Historico:string ): Boolean;
//begin
//   { Lanca no Estoque }
//   try
//      if _ES = 'E' then
//      begin
//        with FRM_Modulo do
//        begin
//        {   IBT_MovEstoque.Append;
//           IBT_MovEstoquePRODUTOS.Value    := _produto;
//           IBT_MovEstoqueDATA.value        := _Data;
//           IBT_MovEstoqueQTDENTRADA.Value  := _QTD;
//         //IBT_MovEstoqueVALENTRADA.Value  := 0.00;
//           IBT_MovEstoqueVALENTRADA.Value  := _Total;
//           IBT_MovEstoqueQTDSAIDA.Value    := 0.00;
//           IBT_MovEstoqueVALSAIDA.Value    := 0.00;
//           IBT_MovEstoqueVALSALDO.Value    := 0.00;
//           IBT_MovEstoqueQTDSALDO.Value    := 0.00;
//
//           if _cliente <> 0 then
//              IBT_MovEstoqueCLIFOR.Value      := _cliente;
//
//           //if _centrocusto <> 0 then
//           //   IBT_MovEstoqueCENTROCUSTO.Value := _centrocusto;
//
//           //IBT_MovEstoqueCLIFOR.Value      := _cliente;
//           //IBT_MovEstoqueCENTROCUSTO.Value := _centrocusto;
//           IBT_MovEstoqueHISTORICO.Value   := _Historico;
//           IBT_MovEstoque.Post;}
//
//           IBQ_MovEstoque.Close;
//           IBQ_MovEstoque.SQL.Clear;
//
//           if _cliente <> 0 then
//           begin
//              IBQ_MovEstoque.SQL.Add('INSERT INTO MOVTOSTQ (CODIGO_ID, PRODUTOS, CLIFOR, HISTORICO, VALENTRADA, QTDENTRADA, VALSAIDA, QTDSAIDA, VALSALDO, QTDSALDO, DATA)');
//              IBQ_MovEstoque.SQL.Add('              VALUES (0, :P_PRODUTOS, :P_CLIFOR, :P_HISTORICO, :P_VALENTRADA, :P_QTDENTRADA, :P_VALSAIDA, :P_QTDSAIDA, :P_VALSALDO, :P_QTDSALDO, :P_DATA)');
//           end
//           else
//           begin
//              IBQ_MovEstoque.SQL.Add('INSERT INTO MOVTOSTQ (CODIGO_ID, PRODUTOS, HISTORICO, VALENTRADA, QTDENTRADA, VALSAIDA, QTDSAIDA, VALSALDO, QTDSALDO, DATA)');
//              IBQ_MovEstoque.SQL.Add('              VALUES (0, :P_PRODUTOS, :P_HISTORICO, :P_VALENTRADA, :P_QTDENTRADA, :P_VALSAIDA, :P_QTDSAIDA, :P_VALSALDO, :P_QTDSALDO, :P_DATA)');
//           end;
//
//           IBQ_MovEstoque.ParamByName('P_PRODUTOS').Value    := _produto;
//
//           if _cliente <> 0 then
//              IBQ_MovEstoque.ParamByName('P_CLIFOR').Value   := _cliente;
//
//           IBQ_MovEstoque.ParamByName('P_HISTORICO').Value   := _Historico;
//           IBQ_MovEstoque.ParamByName('P_VALENTRADA').Value  := _Total;
//           IBQ_MovEstoque.ParamByName('P_QTDENTRADA').Value  := _QTD;
//           IBQ_MovEstoque.ParamByName('P_VALSAIDA').Value    := 0.00;
//           IBQ_MovEstoque.ParamByName('P_QTDSAIDA').Value    := 0.00;
//           IBQ_MovEstoque.ParamByName('P_VALSALDO').Value    := 0.00;
//           IBQ_MovEstoque.ParamByName('P_QTDSALDO').Value    := 0.00;
//           IBQ_MovEstoque.ParamByName('P_DATA').Value        := _Data;
//           IBQ_MovEstoque.ExecSQL;
//           FRM_Modulo.IBTransaction1.CommitRetaining;
//        end;
//      end
//      else if _ES = 'S' then
//      begin
//        with FRM_Modulo do
//        begin
//           if _XVERIFICASALDOZERO = 'S' then
//           begin
//              IBQ_CalEstoque.Close;
//              IBQ_CalEstoque.SQL.Clear;
//              IBQ_CalEstoque.SQL.Add('Select *');
//              IBQ_CalEstoque.SQL.Add('From MOVTOSTQ');
//              IBQ_CalEstoque.SQL.Add('Where produtos = :P_produtos');
//              IBQ_CalEstoque.ParamByName('P_produtos').Value := _produto;
//              IBQ_CalEstoque.Open;
//
//              if IBQ_CalEstoque.RecordCount = 0 then
//                 Mensagem('Não há nada lançado para este produto no estoque !!!');
//                 //showmessage
//           end;
//
//        {   IBT_MovEstoque.Append;
//           IBT_MovEstoquePRODUTOS.Value    := _produto;
//           IBT_MovEstoqueDATA.Value        := _Data;
//           IBT_MovEstoqueQTDENTRADA.Value  := 0.00;
//           IBT_MovEstoqueVALENTRADA.Value  := 0.00;
//           IBT_MovEstoqueQTDSAIDA.Value    := _QTD;
//           IBT_MovEstoqueVALSAIDA.Value    := 0.00;
//           IBT_MovEstoqueVALSALDO.Value    := 0.00;
//           IBT_MovEstoqueQTDSALDO.Value    := 0.00;
//
//           if _cliente <> 0 then
//              IBT_MovEstoqueCLIFOR.Value      := _cliente;
//
//           //if _centrocusto <> 0 then
//           //   IBT_MovEstoqueCENTROCUSTO.Value := _centrocusto;
//
//           IBT_MovEstoqueHISTORICO.Value   := _Historico;
//           IBT_MovEstoque.Post;}
//
//           IBQ_MovEstoque.Close;
//           IBQ_MovEstoque.SQL.Clear;
//
//           if _cliente <> 0 then
//           begin
//              IBQ_MovEstoque.SQL.Add('INSERT INTO MOVTOSTQ (CODIGO_ID, PRODUTOS, CLIFOR, HISTORICO, VALENTRADA, QTDENTRADA, VALSAIDA, QTDSAIDA, VALSALDO, QTDSALDO, DATA)');
//              IBQ_MovEstoque.SQL.Add('              VALUES (0, :P_PRODUTOS, :P_CLIFOR, :P_HISTORICO, :P_VALENTRADA, :P_QTDENTRADA, :P_VALSAIDA, :P_QTDSAIDA, :P_VALSALDO, :P_QTDSALDO, :P_DATA)');
//           end
//           else
//           begin
//              IBQ_MovEstoque.SQL.Add('INSERT INTO MOVTOSTQ (CODIGO_ID, PRODUTOS, HISTORICO, VALENTRADA, QTDENTRADA, VALSAIDA, QTDSAIDA, VALSALDO, QTDSALDO, DATA)');
//              IBQ_MovEstoque.SQL.Add('              VALUES (0, :P_PRODUTOS, :P_HISTORICO, :P_VALENTRADA, :P_QTDENTRADA, :P_VALSAIDA, :P_QTDSAIDA, :P_VALSALDO, :P_QTDSALDO, :P_DATA)');
//           end;
//
//           IBQ_MovEstoque.ParamByName('P_PRODUTOS').Value    := _produto;
//
//           if _cliente <> 0 then
//              IBQ_MovEstoque.ParamByName('P_CLIFOR').Value   := _cliente;
//
//           IBQ_MovEstoque.ParamByName('P_HISTORICO').Value   := _Historico;
//           IBQ_MovEstoque.ParamByName('P_VALENTRADA').Value  := 0.00;
//           IBQ_MovEstoque.ParamByName('P_QTDENTRADA').Value  := 0.00;
//           IBQ_MovEstoque.ParamByName('P_VALSAIDA').Value    := 0.00;
//           IBQ_MovEstoque.ParamByName('P_QTDSAIDA').Value    := _QTD;
//           IBQ_MovEstoque.ParamByName('P_VALSALDO').Value    := 0.00;
//           IBQ_MovEstoque.ParamByName('P_QTDSALDO').Value    := 0.00;
//           IBQ_MovEstoque.ParamByName('P_DATA').Value        := _Data;
//           IBQ_MovEstoque.ExecSQL;
//           FRM_Modulo.IBTransaction1.CommitRetaining;
//        end;
//      end;
//
//      { Recalcular estoque virtual }
//      RecProdVir(_ES,_produto,_QTD);
//
//      Result := True;
//   except
//      Result := False;
//   end;
//end;

function recestoque(_TP:string; _matprima:Integer; _tempo:TDateTime): Boolean;
var
                               _QtdSaldo : Double;
   _ValSaldo, _PrecoMedio, _PrecoEntrada : Double;//Currency;
  vAvalsaida, vAvalentra{, _APrecoMedio} : Double;//Currency;

//            _QtdSaldoENT, _ValSaldoENT : Double;
begin
  Screen.Cursor := crSQLWait;

  { Busca Preco Custo do Produto}
  with FRM_Modulo do
  begin
     IBQ_GravaProd.Close;
     IBQ_GravaProd.SQL.Clear;
     IBQ_GravaProd.SQL.Add('SELECT *');
     IBQ_GravaProd.SQL.Add('FROM PRODUTOS');
     IBQ_GravaProd.SQL.Add('Where CODIGO_ID = :codigo_id');
     IBQ_GravaProd.ParamByName('codigo_id').Value := _matprima ;
     IBQ_GravaProd.Open;

     _PrecoEntrada := (Round((FRM_Modulo.IBQ_GravaProdPRECOCUSTO.Value*100))/100);
  end;

  with FRM_Modulo do
  begin
     if _TP = 'T' then
     begin
        IBQ_CalEstoque.Close;
        IBQ_CalEstoque.SQL.Clear;
        IBQ_CalEstoque.SQL.Add('Select *');
        IBQ_CalEstoque.SQL.Add('From MOVTOSTQ');
        IBQ_CalEstoque.SQL.Add('Where produtos = :P_produtos');
        IBQ_CalEstoque.ParamByName('P_produtos').Value := _matprima;
        IBQ_CalEstoque.SQL.Add('order by PRODUTOS, DATA, CODIGO_ID desc');
        IBQ_CalEstoque.Open;

         IBQ_CalEstoque.First;
        _ValSaldo     := 0.00;
        _QtdSaldo     := 0.000;
      //_ValSaldoENT  := 0.00;
      //_QtdSaldoENT  := 0.000;
        _PrecoMedio   := 0.00;
     end
     else
     begin
        IBQ_CalEstoque.Close;
        IBQ_CalEstoque.SQL.Clear;
        IBQ_CalEstoque.SQL.Add('Select *');
        IBQ_CalEstoque.SQL.Add('From MOVTOSTQ');
        IBQ_CalEstoque.SQL.Add('Where (produtos = :P_produtos)');
        IBQ_CalEstoque.ParamByName('P_produtos').Value := _matprima;
        IBQ_CalEstoque.SQL.Add('and (DATA < :P_DATA)');
        IBQ_CalEstoque.ParamByName('P_DATA').Value     := _tempo;

        IBQ_CalEstoque.SQL.Add('order by PRODUTOS, DATA desc, CODIGO_ID');
        IBQ_CalEstoque.Open;

        IBQ_CalEstoque.First;
        if IBQ_CalEstoque.Eof then
        begin
           _ValSaldo     := 0.00;
           _QtdSaldo     := 0.000;
         //_ValSaldoENT  := 0.00;
         //_QtdSaldoENT  := 0.000;
           _PrecoMedio   := 0.00;
        end
        else
        begin
           _ValSaldo     := (Round((IBQ_CalEstoqueVALSALDO.Value*100))/100);
           _QtdSaldo     := (Round((IBQ_CalEstoqueQTDSALDO.Value*1000))/1000);
           _PrecoMedio   := (Round((IBQ_CalEstoquecPreMedio.AsFloat*1000))/1000);

           //if IBQ_GravaProdVALSALDOENT.IsNull then
           //   _ValSaldoENT  := 0.00
           //else
           //   _ValSaldoENT  := (Round((IBQ_GravaProdVALSALDOENT.AsFloat*100))/100);
           //
           //if IBQ_GravaProdQTDSALDOENT.IsNull then
           //   _QtdSaldoENT  := 0.00
           //else
           //   _QtdSaldoENT  := (Round((IBQ_GravaProdQTDSALDOENT.AsFloat*100))/100);
           //
           //if (_ValSaldoENT <> 0) and (_QtdSaldoENT <> 0) then
           //   _PrecoMedio   := (Round((((Round((_ValSaldoENT*100))/100) / (Round((_QtdSaldoENT*100))/100))*100))/100)
           //else
           //   _PrecoMedio   := 0;
        end;

        IBQ_CalEstoque.Close;
        IBQ_CalEstoque.SQL.Clear;
        IBQ_CalEstoque.SQL.Add('Select *');
        IBQ_CalEstoque.SQL.Add('From MOVTOSTQ');
        IBQ_CalEstoque.SQL.Add('Where (produtos = :P_produtos)');
        IBQ_CalEstoque.ParamByName('P_produtos').Value := _matprima;
        IBQ_CalEstoque.SQL.Add('and (DATA >= :P_DATA)');
        IBQ_CalEstoque.ParamByName('P_DATA').Value     := _tempo;
        IBQ_CalEstoque.SQL.Add('order by PRODUTOS, DATA, CODIGO_ID desc');
        IBQ_CalEstoque.Open;
        IBQ_CalEstoque.First;
     end;

     while not IBQ_CalEstoque.Eof do
     begin
       vAvalsaida := 0.00;
       vAvalentra := 0.00;

       { Valor saida em branco }
       if (IBQ_CalEstoqueQTDSAIDA.Value <> 0.00) then
       begin
          vAvalsaida := (Round((((Round((_PrecoMedio*100))/100) * (Round((IBQ_CalEstoqueQTDSAIDA.value*100))/100))*100))/100);

          if vAvalsaida < 0 then
             vAvalsaida := 0.00;

          IBQ_EstGravar.Close;
          IBQ_EstGravar.SQL.Clear;
          IBQ_EstGravar.SQL.Add('UPDATE MovtoSTQ');
          IBQ_EstGravar.SQL.Add('set VALSAIDA = :p_valsaida');
          IBQ_EstGravar.ParamByName('p_valsaida').Value := vAvalsaida;
          IBQ_EstGravar.SQL.Add('Where Codigo_id = :P_Codigo_id');
          IBQ_EstGravar.ParamByName('P_Codigo_id').Value := IBQ_CalEstoqueCODIGO_ID.Value ;
          IBQ_EstGravar.ExecSQL;
          FRM_Modulo.IBTransaction1.CommitRetaining;
       end;

       { Valor Entrada em branco }
       if (IBQ_CalEstoqueQTDENTRADA.Value <> 0.00) then
       begin
          if (IBQ_CalEstoqueVALENTRADA.Value = 0) then
          begin
             vAvalentra := (Round((((Round((_PrecoEntrada*100))/100) * (Round((IBQ_CalEstoqueQTDENTRADA.AsFloat*100))/100))*100))/100);

             if vAvalentra < 0 then
                vAvalentra := 0.00;

             IBQ_EstGravar.Close;
             IBQ_EstGravar.SQL.Clear;
             IBQ_EstGravar.SQL.Add('UPDATE MovtoSTQ');
             IBQ_EstGravar.SQL.Add('set VALENTRADA = :p_vAvalentra');
             IBQ_EstGravar.ParamByName('p_vAvalentra').Value := vAvalentra;
             IBQ_EstGravar.SQL.Add('Where codigo_id = :P_codigo_id');
             IBQ_EstGravar.ParamByName('P_codigo_id').Value := IBQ_CalEstoqueCODIGO_ID.Value ;

             IBQ_EstGravar.ExecSQL;
             FRM_Modulo.IBTransaction1.CommitRetaining;
          end
          else
          begin
             vAvalentra := (Round(((IBQ_CalEstoqueVALENTRADA.AsFloat)*100))/100);
          end;
       end;

       { Saldo }
       _ValSaldo := (Round((((Round((_ValSaldo*100))/100) + ((Round((vAvalentra*100))/100) - (Round((vAvalsaida*100))/100)))*100))/100);
       _QtdSaldo := (Round((((Round((_QtdSaldo*1000))/1000) + (Round((IBQ_CalEstoqueQTDENTRADA.AsFloat*1000))/1000) - (Round((IBQ_CalEstoqueQTDSAIDA.AsFloat*1000))/1000))*1000))/1000);

     //_ValSaldoENT := (Round((((Round((_ValSaldoENT*100))/100) + (Round((vAvalentra*100))/100))*100))/100);
     //_QtdSaldoENT := (Round((((Round((_QtdSaldoENT*1000))/1000) + (Round((IBQ_CalEstoqueQTDENTRADA.AsFloat*1000))/1000))*1000))/1000);

       { Gravar  ValSaldo }
       IBQ_EstGravar.Close;
       IBQ_EstGravar.SQL.Clear;
       IBQ_EstGravar.SQL.Add('UPDATE MovtoSTQ');
       IBQ_EstGravar.SQL.Add('set VALSALDO = :p_VALSALDO');

       if _QtdSaldo = 0 then
          _ValSaldo := 0;

       IBQ_EstGravar.ParamByName('p_VALSALDO').Value := _ValSaldo;
       IBQ_EstGravar.SQL.Add('Where codigo_id = :P_codigo_id');
       IBQ_EstGravar.ParamByName('P_codigo_id').Value := IBQ_CalEstoqueCODIGO_ID.Value ;
       IBQ_EstGravar.ExecSQL;
       FRM_Modulo.IBTransaction1.CommitRetaining;

       { Gravar QTDSALDO }
       IBQ_EstGravar.Close;
       IBQ_EstGravar.SQL.Clear;
       IBQ_EstGravar.SQL.Add('UPDATE MovtoSTQ');
       IBQ_EstGravar.SQL.Add('set QTDSALDO = :p_QTDSALDO');
       IBQ_EstGravar.ParamByName('p_QTDSALDO').Value := _QtdSaldo;
       IBQ_EstGravar.SQL.Add('Where codigo_id = :P_codigo_id');
       IBQ_EstGravar.ParamByName('P_codigo_id').Value := IBQ_CalEstoqueCODIGO_ID.Value ;
       IBQ_EstGravar.ExecSQL;
       FRM_Modulo.IBTransaction1.CommitRetaining;

       { Colocar estoque no Produtos }
       IBQ_GraEstProd.Close;
       IBQ_GraEstProd.SQL.Clear;
       IBQ_GraEstProd.SQL.Add('UPDATE PRODUTOS');

       //if _TP = 'T' then
       IBQ_GraEstProd.SQL.Add('set ESTOQUE_FISICO = :P_ESTOQUE_FISICO, VALSALDOENT = :P_VALSALDOENT, QTDSALDOENT = :P_QTDSALDOENT');
       //else
       //   IBQ_GraEstProd.SQL.Add('set ESTOQUE_FISICO = :P_ESTOQUE_FISICO, VALSALDOENT = VALSALDOENT + :P_VALSALDOENT, QTDSALDOENT = QTDSALDOENT + :P_QTDSALDOENT');

       IBQ_GraEstProd.ParamByName('P_ESTOQUE_FISICO').Value := _QtdSaldo;
       IBQ_GraEstProd.ParamByName('P_VALSALDOENT').Value    := 0; //_ValSaldoENT;
       IBQ_GraEstProd.ParamByName('P_QTDSALDOENT').Value    := 0; //_QtdSaldoENT;

       IBQ_GraEstProd.SQL.Add('Where (CODIGO_ID = :P_CODIGO_ID)');
       IBQ_GraEstProd.ParamByName('P_CODIGO_ID').Value := _matprima;
       IBQ_GraEstProd.ExecSQL;
       FRM_Modulo.IBTransaction1.CommitRetaining;

       if (IBQ_CalEstoqueQTDENTRADA.AsFloat <> 0.00) and (vAvalentra <> 0.00) then
          _PrecoMedio  := (Round((vAvalentra*100))/100) / (Round((IBQ_CalEstoqueQTDENTRADA.AsFloat*1000))/1000);

       //_APrecoMedio := _PrecoMedio;
       //
       //if _QtdSaldo <> 0 then
       // _PrecoMedio := (Round((((Round((_ValSaldo*100))/100) / (Round((_QtdSaldo*100))/100))*100))/100)
       //else
       //   _PrecoMedio := 0;
       //
       //if _PrecoMedio <= 0 then
       //   _PrecoMedio :=  _APrecoMedio;

       IBQ_CalEstoque.Next;
     end;
  end;
  Screen.Cursor := crDefault;
  Result        := True;
end;

(*{antiga}
function recestoque(_TP:string; _matprima:Integer; _tempo:TDateTime): Boolean;
var
                               _QtdSaldo : Double;
   _ValSaldo, _PrecoMedio, _PrecoEntrada : Double;//Currency;
    vAvalsaida, vAvalentra, _APrecoMedio : Double;//Currency;
begin
  Screen.Cursor := crSQLWait;
//  _QtdSaldo     := 0;
//  _ValSaldo     := 0;
//  _PrecoMedio   := 0;
//  _PrecoEntrada := 0;
//  vAvalsaida    := 0;
//  vAvalentra    := 0;
//  _APrecoMedio  := 0;
  //
  { Burca Preco Custo do Produto}
  with FRM_Modulo do
  begin
     IBQ_GravaProd.Close;
     IBQ_GravaProd.SQL.Clear;
     IBQ_GravaProd.SQL.Add('SELECT *');
     IBQ_GravaProd.SQL.Add('FROM PRODUTOS');
     IBQ_GravaProd.SQL.Add('Where CODIGO_ID = :codigo_id');
     IBQ_GravaProd.ParamByName('codigo_id').Value := _matprima ;
     IBQ_GravaProd.Open;
     //
     //_PrecoEntrada := FRM_Modulo.IBQ_GravaProdPRECO.Value;
     _PrecoEntrada := FRM_Modulo.IBQ_GravaProdPRECOCUSTO.Value;
  end;
  //
  with FRM_Modulo do
  begin
     //IBQ_CalEstoque.Close;
     //IBQ_CalEstoque.SQL.Clear;
     //IBQ_CalEstoque.SQL.Add('Select *');
     //IBQ_CalEstoque.SQL.Add('From MOVTOSTQ');
     //IBQ_CalEstoque.SQL.Add('Where produtos = :P_produtos');
     //IBQ_CalEstoque.ParamByName('P_produtos').Value := _matprima;
     //IBQ_CalEstoque.SQL.Add('order by data');
     //IBQ_CalEstoque.Open;
     if _TP = 'T' then
     begin
        IBQ_CalEstoque.Close;
        IBQ_CalEstoque.SQL.Clear;
        IBQ_CalEstoque.SQL.Add('Select *');
        IBQ_CalEstoque.SQL.Add('From MOVTOSTQ');
        IBQ_CalEstoque.SQL.Add('Where produtos = :P_produtos');
        IBQ_CalEstoque.ParamByName('P_produtos').Value := _matprima;
        //IBQ_CalEstoque.SQL.Add('order by data, codigo_id');
        IBQ_CalEstoque.SQL.Add('order by PRODUTOS, DATA, CODIGO_ID desc');
        IBQ_CalEstoque.Open;
         //
         IBQ_CalEstoque.First;
        _ValSaldo     := 0.00;
        _QtdSaldo     := 0.00;
        _PrecoMedio   := 0.00;
     end
     else
     begin
        IBQ_CalEstoque.Close;
        IBQ_CalEstoque.SQL.Clear;
        IBQ_CalEstoque.SQL.Add('Select *');
        IBQ_CalEstoque.SQL.Add('From MOVTOSTQ');
        IBQ_CalEstoque.SQL.Add('Where (produtos = :P_produtos)');
        IBQ_CalEstoque.ParamByName('P_produtos').Value := _matprima;
        IBQ_CalEstoque.SQL.Add('and (DATA < :P_DATA)');
        IBQ_CalEstoque.ParamByName('P_DATA').Value     := _tempo;
        //IBQ_CalEstoque.SQL.Add('order by PRODUTOS, DATA');
        IBQ_CalEstoque.SQL.Add('order by PRODUTOS, DATA desc, CODIGO_ID');
        IBQ_CalEstoque.Open;
        //
        IBQ_CalEstoque.First;
        if IBQ_CalEstoque.Eof then
        begin
           _ValSaldo     := 0.00;
           _QtdSaldo     := 0.00;
           _PrecoMedio   := 0.00;
        end
        else
        begin
           _ValSaldo     := IBQ_CalEstoqueVALSALDO.Value;
           _QtdSaldo     := IBQ_CalEstoqueQTDSALDO.Value;
           _PrecoMedio   := IBQ_CalEstoquecPreMedio.AsFloat;
        end;
        //

        IBQ_CalEstoque.Close;
        IBQ_CalEstoque.SQL.Clear;
        IBQ_CalEstoque.SQL.Add('Select *');
        IBQ_CalEstoque.SQL.Add('From MOVTOSTQ');
        IBQ_CalEstoque.SQL.Add('Where (produtos = :P_produtos)');
        IBQ_CalEstoque.ParamByName('P_produtos').Value := _matprima;
        IBQ_CalEstoque.SQL.Add('and (DATA >= :P_DATA)');
        IBQ_CalEstoque.ParamByName('P_DATA').Value     := _tempo;
        //IBQ_CalEstoque.SQL.Add('order by data');
        IBQ_CalEstoque.SQL.Add('order by PRODUTOS, DATA, CODIGO_ID desc');
        IBQ_CalEstoque.Open;
        //
        IBQ_CalEstoque.First;
        //IBQ_CalEstoque.Locate('Data',_tempo,[]);
        //
        //IBQ_CalEstoque.Prior;
        //if IBQ_CalEstoque.Bof then
        //begin
        //   IBQ_CalEstoque.First;
        //   _ValSaldo     := 0.00;
        //   _QtdSaldo     := 0.00;
        //   _PrecoMedio   := 0.00;
        //end
        //else
        //begin
        //   _ValSaldo     := IBQ_CalEstoqueVALSALDO.Value;
        //   _QtdSaldo     := IBQ_CalEstoqueQTDSALDO.Value;
        //   _PrecoMedio   := IBQ_CalEstoquecPreMedio.AsFloat;
        //   IBQ_CalEstoque.Next;
        //end;
     end;
     //
     while not IBQ_CalEstoque.Eof do
     begin
       vAvalsaida := 0.00;
       vAvalentra := 0.00;
       //
       { Valor saida em branco }
       if (IBQ_CalEstoqueQTDSAIDA.Value <> 0.00) then
       begin
          vAvalsaida := FloatToCurr(_PrecoMedio * IBQ_CalEstoqueQTDSAIDA.value);
          //
          if vAvalsaida < 0 then
             vAvalsaida := 0.00;
          //
          IBQ_EstGravar.Close;
          IBQ_EstGravar.SQL.Clear;
          IBQ_EstGravar.SQL.Add('UPDATE MovtoSTQ');
          IBQ_EstGravar.SQL.Add('set VALSAIDA = :p_valsaida');
          IBQ_EstGravar.ParamByName('p_valsaida').Value := vAvalsaida;
          IBQ_EstGravar.SQL.Add('Where Codigo_id = :P_Codigo_id');
          IBQ_EstGravar.ParamByName('P_Codigo_id').Value := IBQ_CalEstoqueCODIGO_ID.Value ;
          //
          IBQ_EstGravar.ExecSQL;
          //
          FRM_Modulo.IBTransaction1.CommitRetaining;
          //_IBCommit(IBQ_EstGravar);
       end;

       { Valor Entrada em branco }
       if (IBQ_CalEstoqueQTDENTRADA.Value <> 0.00) then
       begin
          if (IBQ_CalEstoqueVALENTRADA.Value = 0) then
          begin
             vAvalentra := FloatToCurr(_PrecoEntrada * IBQ_CalEstoqueQTDENTRADA.AsFloat);
             //
             if vAvalentra < 0 then
                vAvalentra := 0.00;
             //
             IBQ_EstGravar.Close;
             IBQ_EstGravar.SQL.Clear;
             IBQ_EstGravar.SQL.Add('UPDATE MovtoSTQ');
             IBQ_EstGravar.SQL.Add('set VALENTRADA = :p_vAvalentra');
             IBQ_EstGravar.ParamByName('p_vAvalentra').Value := vAvalentra;
             IBQ_EstGravar.SQL.Add('Where codigo_id = :P_codigo_id');
             IBQ_EstGravar.ParamByName('P_codigo_id').Value := IBQ_CalEstoqueCODIGO_ID.Value ;
             //
             IBQ_EstGravar.ExecSQL;
             FRM_Modulo.IBTransaction1.CommitRetaining;
             //_IBCommit(IBQ_EstGravar);
          end
          else
          begin
             vAvalentra := (IBQ_CalEstoqueVALENTRADA.AsFloat);
          end;
       end;
       //
       { Saldo }

       _ValSaldo := _ValSaldo + (vAvalentra - vAvalsaida);
       _QtdSaldo := _QtdSaldo + IBQ_CalEstoqueQTDENTRADA.AsFloat - IBQ_CalEstoqueQTDSAIDA.AsFloat;

       //
       { Gravar  ValSaldo }
       IBQ_EstGravar.Close;
       IBQ_EstGravar.SQL.Clear;
       IBQ_EstGravar.SQL.Add('UPDATE MovtoSTQ');
       IBQ_EstGravar.SQL.Add('set VALSALDO = :p_VALSALDO');

       if _QtdSaldo = 0 then
          _ValSaldo := 0;

       IBQ_EstGravar.ParamByName('p_VALSALDO').Value := _ValSaldo;
       IBQ_EstGravar.SQL.Add('Where codigo_id = :P_codigo_id');
       IBQ_EstGravar.ParamByName('P_codigo_id').Value := IBQ_CalEstoqueCODIGO_ID.Value ;
       //
       IBQ_EstGravar.ExecSQL;
       //
       FRM_Modulo.IBTransaction1.CommitRetaining;
       //_IBCommit(IBQ_EstGravar);
       //
       { Gravar QTDSALDO }
       IBQ_EstGravar.Close;
       IBQ_EstGravar.SQL.Clear;
       IBQ_EstGravar.SQL.Add('UPDATE MovtoSTQ');
       IBQ_EstGravar.SQL.Add('set QTDSALDO = :p_QTDSALDO');
       IBQ_EstGravar.ParamByName('p_QTDSALDO').Value := _QtdSaldo;
       IBQ_EstGravar.SQL.Add('Where codigo_id = :P_codigo_id');
       IBQ_EstGravar.ParamByName('P_codigo_id').Value := IBQ_CalEstoqueCODIGO_ID.Value ;
       //
       IBQ_EstGravar.ExecSQL;
       FRM_Modulo.IBTransaction1.CommitRetaining;
       //_IBCommit(IBQ_EstGravar);
       { Colocar estoque no Produtos }
       IBQ_GraEstProd.Close;
       IBQ_GraEstProd.SQL.Clear;
       IBQ_GraEstProd.SQL.Add('UPDATE PRODUTOS');
       IBQ_GraEstProd.SQL.Add('set ESTOQUE_FISICO = :P_ESTOQUE_FISICO ');
       IBQ_GraEstProd.ParamByName('P_ESTOQUE_FISICO').Value := _QtdSaldo;
       IBQ_GraEstProd.SQL.Add('Where (CODIGO_ID = :P_CODIGO_ID)');
       IBQ_GraEstProd.ParamByName('P_CODIGO_ID').Value := _matprima;
       IBQ_GraEstProd.ExecSQL;
       FRM_Modulo.IBTransaction1.CommitRetaining;
       //

       //if _QtdSaldo <> 0 then
       //begin
          _APrecoMedio := _PrecoMedio;

          //if IBQ_CalEstoquecPreMedio.Value = 0 then
              if _QtdSaldo <> 0 then
                 _PrecoMedio := _ValSaldo / _QtdSaldo
              else
                 _PrecoMedio := 0;
          //else
          //   _PrecoMedio := IBQ_CalEstoquecPreMedio.Value;

           if _PrecoMedio <= 0 then
              _PrecoMedio :=  _APrecoMedio;
       //end;

       //
       IBQ_CalEstoque.Next;
     end;
  end;
  Screen.Cursor := crDefault;
  Result        := True;
end; *)


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

function Pergunta( Texto: string ): string;
var
  Largura: integer;
begin
  { LOG - tipo -> 0 = mensagens, 1 = mensagemerros, 2 = perguntas, 3 = sistema, 4 = ecf}
  GeraLog(2, Texto, 0, 0, 0, 0);

  {tefMBD}
  if FRM_Pergunta = nil then
     FRM_Pergunta := TFRM_Pergunta.Create(Application);

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

  FRM_Pergunta := nil;

  //FocoTela;
end;

procedure Mensagem( Texto: string );
var
  Largura: integer;
begin
   { LOG - tipo -> 0 = mensagens, 1 = mensagemerros, 2 = perguntas, 3 = sistema, 4 = ecf}
   GeraLog(0, Texto, 0, 0, 0, 0);

   {tefMBD}
   if FRM_Mensagem = nil then
      FRM_Mensagem := TFRM_Mensagem.Create(Application);

   FRM_Mensagem.LBL_Frase.Caption := Texto;
   Largura := 70 + FRM_Mensagem.LBL_Frase.Width;
   if Largura < 250 then Largura := 250;
   FRM_Mensagem.Width := Largura;
   FRM_Mensagem.SPB_Ok.Left := ( FRM_Mensagem.Width - 80 ) div 2;
   MessageBeep(0);

   FRM_Mensagem.ShowModal;
   //FocoTela;
end;

function SSenha:Boolean;
begin
   FRM_Senha.EDT_Senha.Text := '';
   FRM_Senha.ShowModal;
   Result := VerifSenha;
   //FocoTela;
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

procedure SetDTHR(ExibeMensagem:Boolean);
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

   if ExibeMensagem then
      Mensagem('Data sincronizada com o servidor!!! Data = ' + FRM_Modulo.IBQ_DTSystemDATA_SER.AsString + ' Hora = ' + FRM_Modulo.IBQ_DTSystemHORA_SER.AsString + ' !!!');
end;

function Info: String;
var
   SysInfo: TSystemInfo;
begin
   GetSystemInfo(SysInfo);

   case SysInfo.dwProcessorType of
        386 : result := 'Processador 80386';
        486 : result := 'Processador 80486';
        586 : result := 'Processador Pentium';
   else
        result := Format('Processado desconhecido (%d)', [SysInfo.dwProcessorType]);
   end;

   result := IntToStr(SysInfo.wProcessorRevision);
end;

Function SerialNumHD(FDrive:String) :String;
Var
         Serial : DWord;
   DirLen,Flags : DWord;
         DLabel : Array[0..11] of Char;
begin
   Try
      GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
      Result := IntToHex(Serial,8);
   Except
      Result :='';
   end;
end;

Function SerialNumHD1(FDrive:String) :String;
Var
         Serial : DWord;
   DirLen,Flags : DWord;
         DLabel : Array[0..11] of Char;
begin
   Try
      GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
      Result := IntToStr(Serial);
   Except
      Result :='';
   end;
end;

{ procedure utilizada pela função que pega o serial do hd }
procedure ChangeByteOrder( var Data; Size : Integer );
var
   ptr : PChar;
     i : Integer;
     c : Char;
begin
   ptr := @Data;

   for i := 0 to (Size shr 1)-1 do
   begin
      c := ptr^;
      ptr^  := (ptr+1)^;
      (ptr+1)^ := c;
      Inc(ptr,2);
   end;
end;

{ função que pega o serial number FÍSICO do HD e retorna string }
function GetIdeDiskSerialNumber : String;
type
   TSrbIoControl = packed record
   HeaderLength: ULONG;
   Signature: Array[0..7] of Char;
   Timeout: ULONG;
   ControlCode: ULONG;
   ReturnCode: ULONG;
   Length: ULONG;
   end;

   SRB_IO_CONTROL = TSrbIoControl;
   PSrbIoControl = ^TSrbIoControl;

   TIDERegs = packed record
   bFeaturesReg : Byte; // especificar "comandos" SMART
   bSectorCountReg : Byte; // registro de contador de setor
   bSectorNumberReg : Byte; // registro de número de setores
   bCylLowReg : Byte; // valor de cilindro (byte mais baixo)
   bCylHighReg : Byte; // valor de cilindro (byte mais alto)
   bDriveHeadReg : Byte; // registro de drive/cabeça
   bCommandReg : Byte; // comando IDE
   bReserved : Byte; // reservado- tem que ser zero
   end;
   IDEREGS = TIDERegs;
   PIDERegs = ^TIDERegs;

   TSendCmdInParams = packed record
   cBufferSize : DWORD;
   irDriveRegs : TIDERegs;
   bDriveNumber : Byte;
   bReserved : Array[0..2] of Byte;
   dwReserved : Array[0..3] of DWORD;
   bBuffer : Array[0..0] of Byte;
   end;
   SENDCMDINPARAMS = TSendCmdInParams;
   PSendCmdInParams = ^TSendCmdInParams;

   TIdSector = packed record
   wGenConfig : Word;
   wNumCyls : Word;
   wReserved : Word;
   wNumHeads : Word;
   wBytesPerTrack : Word;
   wBytesPerSector : Word;
   wSectorsPerTrack : Word;
   wVendorUnique : Array[0..2] of Word;
   sSerialNumber : Array[0..19] of Char;
   wBufferType : Word;
   wBufferSize : Word;
   wECCSize : Word;
   sFirmwareRev : Array[0..7] of Char;
   sModelNumber : Array[0..39] of Char;
   wMoreVendorUnique : Word;
   wDoubleWordIO : Word;
   wCapabilities : Word;
   wReserved1 : Word;
   wPIOTiming : Word;
   wDMATiming : Word;
   wBS : Word;
   wNumCurrentCyls : Word;
   wNumCurrentHeads : Word;
   wNumCurrentSectorsPerTrack : Word;
   ulCurrentSectorCapacity : ULONG;
   wMultSectorStuff : Word;
   ulTotalAddressableSectors : ULONG;
   wSingleWordDMA : Word;
   wMultiWordDMA : Word;
   bReserved : Array[0..127] of Byte;
   end;
   PIdSector = ^TIdSector;

const
   IDE_ID_FUNCTION = $EC;
   IDENTIFY_BUFFER_SIZE = 512;
   DFP_RECEIVE_DRIVE_DATA = $0007c088;
   IOCTL_SCSI_MINIPORT = $0004d008;
   IOCTL_SCSI_MINIPORT_IDENTIFY = $001b0501;
   DataSize = sizeof(TSendCmdInParams)-1+IDENTIFY_BUFFER_SIZE;
   BufferSize = SizeOf(SRB_IO_CONTROL)+DataSize;
   W9xBufferSize = IDENTIFY_BUFFER_SIZE+16;

var
   hDevice : THandle;
   cbBytesReturned : DWORD;
   pInData : PSendCmdInParams;
   pOutData : Pointer; // PSendCmdOutParams
   Buffer : Array[0..BufferSize-1] of Byte;
   srbControl : TSrbIoControl absolute Buffer;

begin
   Result := '';
   FillChar(Buffer,BufferSize,#0);

   if Win32Platform=VER_PLATFORM_WIN32_NT then
      // Windows NT, Windows 2000, Windows XP
   begin
      // recuperar handle da porta SCSI
      hDevice := CreateFile('\\.\Scsi0:',
      // Nota: '\\.\C:' precisa de privilégios administrativos
      GENERIC_READ or GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, 0, 0);

      if hDevice=INVALID_HANDLE_VALUE then
         Exit;

      try
         srbControl.HeaderLength := SizeOf(SRB_IO_CONTROL);
         System.Move('SCSIDISK',srbControl.Signature,8);
         srbControl.Timeout := 2;
         srbControl.Length := DataSize;
         srbControl.ControlCode := IOCTL_SCSI_MINIPORT_IDENTIFY;
         pInData := PSendCmdInParams(PChar(@Buffer)+SizeOf(SRB_IO_CONTROL));
         pOutData := pInData;

         with pInData^ do
         begin
            cBufferSize := IDENTIFY_BUFFER_SIZE;
            bDriveNumber := 0;

            with irDriveRegs do
            begin
               bFeaturesReg := 0;
               bSectorCountReg := 1;
               bSectorNumberReg := 1;
               bCylLowReg := 0;
               bCylHighReg := 0;
               bDriveHeadReg := $A0;
               bCommandReg := IDE_ID_FUNCTION;
            end;
         end;

         if not DeviceIoControl( hDevice, IOCTL_SCSI_MINIPORT, @Buffer, BufferSize, @Buffer, BufferSize, cbBytesReturned, nil ) then
            Exit;

      finally
         CloseHandle(hDevice);
      end;
   end
   else
   begin
      // Windows 95 OSR2, Windows 98, Windows ME
      hDevice := CreateFile( '\\.\SMARTVSD', 0, 0, nil, CREATE_NEW, 0, 0 );

      if hDevice=INVALID_HANDLE_VALUE then Exit;

      try
         pInData := PSendCmdInParams(@Buffer);
         pOutData := @pInData^.bBuffer;

         with pInData^ do
         begin
            cBufferSize := IDENTIFY_BUFFER_SIZE;
            bDriveNumber := 0;
            with irDriveRegs do
            begin
               bFeaturesReg := 0;
               bSectorCountReg := 1;
               bSectorNumberReg := 1;
               bCylLowReg := 0;
               bCylHighReg := 0;
               bDriveHeadReg := $A0;
               bCommandReg := IDE_ID_FUNCTION;
            end;
         end;

         if not DeviceIoControl( hDevice, DFP_RECEIVE_DRIVE_DATA, pInData, SizeOf(TSendCmdInParams)-1, pOutData, W9xBufferSize, cbBytesReturned, nil ) then
            Exit;
      finally
         CloseHandle(hDevice);
      end;
   end;

   with PIdSector(PChar(pOutData)+16)^ do
   begin
      ChangeByteOrder(sSerialNumber,SizeOf(sSerialNumber));
      SetString(Result,sSerialNumber,SizeOf(sSerialNumber));
   end;
end;

function funpermiFR:Boolean;
begin
   Screen.Cursor := crSQLWait;
   with FRM_Modulo do
   begin
      IBQ_PermissaoFrente.Close;
      IBQ_PermissaoFrente.SQL.Clear;
      IBQ_PermissaoFrente.SQL.Add('select *');
      IBQ_PermissaoFrente.SQL.Add('from PERMISSAOFRENTE');
      IBQ_PermissaoFrente.SQL.Add('Where (Nivel = :P_Nivel)');
      IBQ_PermissaoFrente.ParamByName('P_Nivel').Value := CodigoNivel;

      IBQ_PermissaoFrente.SQL.Add('and (MOD_NAME = :P_MOD_NAME)');
      IBQ_PermissaoFrente.ParamByName('P_MOD_NAME').Value := crypt(NomeSpeedBTN);
      IBQ_PermissaoFrente.Open;

      if IBQ_PermissaoFrenteDesPermissao.AsString = 'SIM' then
         Result := True
      else
         Result := False;
   end;
   Screen.Cursor := crDefault;
end;

{Fechamento de Caixa com Transferência para Morto}

procedure FechaCaixaTransfMorto(operador : integer; data : tdate; hora : ttime; movref : tdate);
//var
//   vDateF : TDate;
//   vHoraF : TTime;
//   vAgora : TDateTime;
//
//   valTot,valDiv,valRes,    {acerta o valor no pagamento parcelado}
//   valPar,numPar:Currency;
begin
//   if FRM_Modulo.IBT_ParametrosFECHACAIXA.AsString = 'S' then
//      Exit;
//
//   Screen.Cursor := crSQLWait;
//
//   //Gera Base para Rel WEB.....................................................
//   _MensagemGerencial := 'N';
//   Gerar(operador ,data,hora,movref);
//   //...........................................................................
//
//
//   if FRM_ModuloFechaCaixa = nil then
//      FRM_ModuloFechaCaixa := TFRM_ModuloFechaCaixa.Create(Application);
//
//   with FRM_ModuloFechaCaixa do
//   begin
//    //Definir a base
//    IBQ_Gravar.Database    := FRM_Modulo.DataBaseIBF;
//    IBQ_Gravar.Transaction := FRM_Modulo.IBTransactionF;
//
//   {elimina eventuais erros}
//   IBQ_MesaFechaCC.Close;
//   IBQ_MesaFechaCC.SQL.Clear;
//   IBQ_MesaFechaCC.SQL.Add('update mesafecha');
//   IBQ_MesaFechaCC.SQL.Add('set cliente = :X_CLI');
//   IBQ_MesaFechaCC.ParamByName('X_CLI').Value := FRM_Modulo.IBT_ParametrosFRENTECLIFOR.AsInteger;
//   IBQ_MesaFechaCC.SQL.Add('where cliente is null');
//   IBQ_MesaFechaCC.SQL.Add('and (OPERADOR = :OPERADOR)');
//   IBQ_MesaFechaCC.ParamByName('OPERADOR').Value := operador;
//
//   IBQ_MesaFechaCC.ExecSQL;
//
//   FRM_Modulo.IBTransaction1.CommitRetaining;
//
//   {Transferir produtos}
//   IBQ_Produtos.Close;
//   IBQ_Produtos.Open;
//
//   IBQ_Gravar.Close;
//   IBQ_Gravar.SQL.Clear;
//   IBQ_Gravar.SQL.Add('delete from produtost');
//
//   IBQ_Gravar.ExecSQL;
//
//   FRM_Modulo.IBTransactionF.CommitRetaining;
//
//   IBQ_Produtos.First;
//   while not IBQ_Produtos.eof do
//   begin
//      IBQ_Gravar.Close;
//      IBQ_Gravar.SQL.Clear;
//      IBQ_Gravar.SQL.Add('insert into produtost');
//      IBQ_Gravar.SQL.Add('(CODPROD, PRODUTO, DESCRICAO, GRUPO, DESGRUPO)');
//      IBQ_Gravar.SQL.Add('values');
//      IBQ_Gravar.SQL.Add('(:PCODPROD, :PPRODUTO, :PDESCRICAO, :PGRUPO, :PDESGRUPO)');
//      IBQ_Gravar.ParamByName('PCODPROD').Value   := IBQ_ProdutosCODIGO_ID.Value;
//      IBQ_Gravar.ParamByName('PPRODUTO').Value   := IBQ_ProdutosPRODUTO.Value;
//      IBQ_Gravar.ParamByName('PDESCRICAO').Value := IBQ_ProdutosDESCRICAO.Value;
//      IBQ_Gravar.ParamByName('PGRUPO').Value     := IBQ_ProdutosGRUPO.Value;
//      IBQ_Gravar.ParamByName('PDESGRUPO').Value  := IBQ_ProdutosDESCRICAO1.Value;
//      IBQ_Gravar.ExecSQL;
//      FRM_Modulo.IBTransactionF.CommitRetaining;
//      IBQ_Produtos.Next;
//   end;
//
//   { Transferir Entrega }
//   if xENTREGABAUT = 'S' then
//   begin
//      IBQ_Entrega.Close;
//      IBQ_Entrega.Open;
//
//      IBT_Entrega.Close;
//      IBT_Entrega.Open;
//
//      IBQ_EntregaProd.Close;
//      IBQ_EntregaProd.Open;
//
//      IBQ_Entrega.First;
//      while not IBQ_Entrega.Eof do
//      begin
//         { Financeiro }
//         IBQ_GRavarP.Close;
//         IBQ_GRavarP.SQL.Clear;
//         IBQ_GRavarP.SQL.Add('insert into FINANCEIRO');
//         IBQ_GRavarP.SQL.Add('(CODIGO_ID, EMISSAO, VENCIMENTO, DOCUMENTO, CONTA, SUBCONTA, CLIFOR, VALOR, DEBCRED, VENDA, DESCONTO, JUROS, OBSERVACAO, OPERADOR, TIPO_ORI, CODI_ORI)');
//         IBQ_GRavarP.SQL.Add('values');
//         IBQ_GRavarP.SQL.Add('(0, :PEMISSAO, :PVENCIMENTO, :PDOCUMENTO, :PCONTA, :PSUBCONTA, :PCLIFOR, :PVALOR, :PDEBCRED, :PVENDA, 0, 0, :POBS, :POPERADOR, :PTIPO_ORI, :PCODI_ORI)');
//         IBQ_GRavarP.ParamByName('PEMISSAO').AsDate    := Date;
//         IBQ_GRavarP.ParamByName('PVENCIMENTO').AsDate := Date;
//         IBQ_GRavarP.ParamByName('PDOCUMENTO').value   := copy('Entrega',1,20);
//         IBQ_GRavarP.ParamByName('PCONTA').value       := FRM_Modulo.IBT_ParametrosECONTA.Value;
//         IBQ_GRavarP.ParamByName('PSUBCONTA').value    := FRM_Modulo.IBT_ParametrosPSUBCONTA.Value;
//         IBQ_GRavarP.ParamByName('PCLIFOR').value      := IBQ_EntregaCLIENTE.Value;
//         IBQ_GRavarP.ParamByName('PVALOR').value       := IBQ_EntregaProdXTOTAL.Value;
//         IBQ_GRavarP.ParamByName('PDEBCRED').value     := 'C';
//         IBQ_GRavarP.ParamByName('PVENDA').value       := 'S';
//         IBQ_GRavarP.ParamByName('POBS').Value         := copy('Fechamento Dia',1,80);
//         IBQ_GRavarP.ParamByName('POPERADOR').Value    := IBQ_EntregaOPCAIXA.Value;
//         IBQ_GRavarP.ParamByName('PTIPO_ORI').value    := 'ENT';
//         IBQ_GRavarP.ParamByName('PCODI_ORI').value    := IBQ_EntregaCODIGO_ID.Value;
//
//         IBQ_GRavarP.ExecSQL;
//         FRM_Modulo.IBTransaction1.CommitRetaining;
//
//         { Da baixa pra entrega }
//         IBT_Entrega.Edit;
//         IBT_EntregaFECHA_SN.Value := 'S';
//         IBT_Entrega.Post;
//         FRM_Modulo.IBTransaction1.CommitRetaining;
//
//         IBQ_Entrega.Next;
//      end;
//   end;
//
//   { Transferir abastecimento/sangria}
//   IBQ_CxMovtoTemp.Close;
//   IBQ_CxMovtoTemp.SQL.Clear;
//   IBQ_CxMovtoTemp.SQL.Add('Select *');
//   IBQ_CxMovtoTemp.SQL.Add('From CXMOVTOTEMP');
//
//   IBQ_CxMovtoTemp.SQL.Add('where OPERADOR = :OPERADOR');
//   IBQ_CxMovtoTemp.ParamByName('OPERADOR').Value := operador;
//
//   IBQ_CxMovtoTemp.SQL.Add('order by NUMERO_ID');
//   IBQ_CxMovtoTemp.Open;
//
//   IBQ_CxMovtoTemp.First;
//   while not IBQ_CxMovtoTemp.eof do
//   begin
//      IBQ_CxMovtoTempG.Close;
//      IBQ_CxMovtoTempG.SQL.Clear;
//      IBQ_CxMovtoTempG.SQL.Add('insert into CXMOVTO');
//      IBQ_CxMovtoTempG.SQL.Add('(NUMERO_ID, CAIXA, DATA, HISTORICO, CONTA, SUBCONTA, DEBCRED, VALOR, DOCUMENTO, OPERADOR)');
//      IBQ_CxMovtoTempG.SQL.Add('values');
//      IBQ_CxMovtoTempG.SQL.Add('(0, :PCAIXA, :PDATA, :PHISTORICO, :PCONTA, :PSUBCONTA, :PDEBCRED, :PVALOR, :PDOCUMENTO, :POPERADOR)');
//      IBQ_CxMovtoTempG.ParamByName('PCAIXA').value     := IBQ_CxMovtoTempCAIXA.Value;
//      IBQ_CxMovtoTempG.ParamByName('PDATA').AsDate     := IBQ_CxMovtoTempDATA.Value;
//      IBQ_CxMovtoTempG.ParamByName('PHISTORICO').value := IBQ_CxMovtoTempHISTORICO.Value;
//      IBQ_CxMovtoTempG.ParamByName('PCONTA').value     := IBQ_CxMovtoTempCONTA.Value;
//      IBQ_CxMovtoTempG.ParamByName('PSUBCONTA').value  := IBQ_CxMovtoTempSUBCONTA.Value;
//      IBQ_CxMovtoTempG.ParamByName('PDEBCRED').value   := IBQ_CxMovtoTempDEBCRED.Value;
//      IBQ_CxMovtoTempG.ParamByName('PVALOR').value     := IBQ_CxMovtoTempVALOR.Value;
//      IBQ_CxMovtoTempG.ParamByName('PDOCUMENTO').value := IBQ_CxMovtoTempDOCUMENTO.Value;
//      IBQ_CxMovtoTempG.ParamByName('POPERADOR').value  := IBQ_CxMovtoTempOPERADOR.Value;
//
//      IBQ_CxMovtoTempG.ExecSQL;
//      FRM_Modulo.IBTransaction1.CommitRetaining;
//
//      IBQ_CxMovtoTempDel.Close;
//      IBQ_CxMovtoTempDel.SQL.Clear;
//      IBQ_CxMovtoTempDel.SQL.Add('Delete From CXMOVTOTEMP');
//      IBQ_CxMovtoTempDel.SQL.Add('where NUMERO_ID = :PNUMERO');
//      IBQ_CxMovtoTempDel.ParamByName('PNUMERO').Value := IBQ_CxMovtoTempNUMERO_ID.Value;
//
//      IBQ_CxMovtoTempDel.SQL.Add('and (OPERADOR = :OPERADOR)');
//      IBQ_CxMovtoTempDel.ParamByName('OPERADOR').Value := operador;
//
//      IBQ_CxMovtoTempDel.ExecSQL;
//      FRM_Modulo.IBTransaction1.CommitRetaining;
//
//      IBQ_CxMovtoTemp.Next;
//   end;
//
//   //vDateF := Date;
//   //vHoraF := Time;
//
//   vDateF := data;
//   vHoraF := hora;
//
//   vAgora := vDateF + vHoraF;
//
//   { Abrir bases para a trasnferencia }
//   //IBT_MesaItem.Close;
//   //IBT_MesaItem.Open;
//
//   IBQ_MesaItemVisualiza.Close;
//   IBQ_MesaItemVisualiza.SQL.Clear;
//   IBQ_MesaItemVisualiza.SQL.Add('select item.CODIGO_ID, item.MESA, item.SEQUENCIA, item.GARCOM, item.PRODUTO, item.QUANTIDADE,');
//   IBQ_MesaItemVisualiza.SQL.Add('       item.CANCELADA, item.IMP_REMOTA, item.PONTOVENDA, item.HORA, item."DATE", item.MESAFECHA,');
//   IBQ_MesaItemVisualiza.SQL.Add('       item.SEQFECHA, item.GRUPO, item.PRC_UNITARIO, item.BALANCA, item.HO, item.TEMPO, item.OPCANCEL,');
//   IBQ_MesaItemVisualiza.SQL.Add('       item.ALIQUOTA, item.DATA_INICIO, item.DATA_FINAL, item.HORA_INICIO, item.HORA_FINAL,');
//   IBQ_MesaItemVisualiza.SQL.Add('       item.TEMPO_INICIAL, item.TEMPO_FINAL, item.DESCONTO, item.FINALIZADA, item.OBS, fecha.TEMPO as TEMPOFECHA, item.CLIENTEDIARIA, item.acrescimo, item.taxa,');
//   IBQ_MesaItemVisualiza.SQL.Add('       item.PIS, item.COFINS, item.ICMS, item.comissaoPr, item.comissaoFu, item.COMISPRSN, item.cortesia, item.turno');
//   IBQ_MesaItemVisualiza.SQL.Add('from mesaitem item');
//   IBQ_MesaItemVisualiza.SQL.Add('   inner join mesafecha fecha on ((item.mesafecha = fecha.mesa) and (item.seqfecha = fecha.sequencia))');
//   IBQ_MesaItemVisualiza.SQL.Add('where 1=1');
//   IBQ_MesaItemVisualiza.SQL.Add('and (fecha.tempo <= :P_TEMPO)');
//   IBQ_MesaItemVisualiza.ParamByName('P_TEMPO').Value := vAgora;
//
//   IBQ_MesaItemVisualiza.SQL.Add('and (fecha.OPERADOR = :OPERADOR)');
//   IBQ_MesaItemVisualiza.ParamByName('OPERADOR').Value := operador;
//
//   IBQ_MesaItemVisualiza.SQL.Add('order by item.CODIGO_ID');
//   IBQ_MesaItemVisualiza.Open;
//
//   //IBT_MesaCond.Close;
//   //IBT_MesaCond.Open;
//   IBQ_MesaCond.Close;
//   IBQ_MesaCond.SQL.Clear;
//   IBQ_MesaCond.SQL.Add('select cond.*');
//   IBQ_MesaCond.SQL.Add('from mesacond cond');
//   IBQ_MesaCond.SQL.Add('inner join mesafecha fecha on ((cond.mesafecha = fecha.mesa) and (cond.seqfecha = fecha.sequencia))');
//   IBQ_MesaCond.SQL.Add('where 1=1');
//   IBQ_MesaCond.SQL.Add('and (fecha.tempo <= :P_TEMPO)');
//   IBQ_MesaCond.ParamByName('P_TEMPO').Value := vAgora;
//
//   IBQ_MesaCond.SQL.Add('and (fecha.OPERADOR = :OPERADOR)');
//   IBQ_MesaCond.ParamByName('OPERADOR').Value := operador;
//
//   IBQ_MesaCond.SQL.Add('order by cond.CODIGO_ID');
//   IBQ_MesaCond.Open;
//
//   IBT_MesaFecha.Close;
//   IBT_MesaFecha.Open;
//
//   { Transferir itens }
//   IBQ_MesaItemVisualiza.First;
//   while not IBQ_MesaItemVisualiza.Eof do
//   begin
//      IBQ_Gravar.Close;
//      IBQ_Gravar.SQL.Clear;
//      IBQ_Gravar.SQL.Add('insert into mesaitem');
//      IBQ_Gravar.SQL.Add('(codigo_id, CANCELADA, "DATE", GARCOM, HORA, IMP_REMOTA, MESA, MESAFECHA, PONTOVENDA, PRODUTO, QUANTIDADE, SEQFECHA, SEQUENCIA, GRUPO, PRC_UNITARIO, BALANCA, FECHA, OPCANCEL, ALIQUOTA, OBS, FINALIZADA,');
//
//      if ApenasNumerosStr(IBQ_MesaItemVisualizaDATA_INICIO.AsString) <> '' then
//         IBQ_Gravar.SQL.Add('DATA_INICIO, HORA_INICIO,');
//
//      if ApenasNumerosStr(IBQ_MesaItemVisualizaDATA_FINAL.AsString) <> '' then
//         IBQ_Gravar.SQL.Add('DATA_FINAL, HORA_FINAL,');
//
//      IBQ_Gravar.SQL.Add('DESCONTO, CLIENTEDIARIA, ACRESCIMO, TAXA, PIS, COFINS, ICMS, comissaoPr, comissaoFu, COMISPRSN, cortesia, TURNO, REDUCAO)');
//
//      IBQ_Gravar.SQL.Add('values');
//      IBQ_Gravar.SQL.Add('(0, :PCANCELADA, :PDATE, :PGARCOM, :PHORA, :PIMP_REMOTA, :PMESA, :PMESAFECHA, :PPONTOVENDA, :PPRODUTO, :PQUANTIDADE, :PSEQFECHA, :PSEQUENCIA, :PGRUPO, :PPRC_UNITARIO, :PBALANCA, :PFECHA, :POPCANCEL,:PALIQUOTA, :P_OBS, :P_FINALIZADA,');
//
//      if ApenasNumerosStr(IBQ_MesaItemVisualizaDATA_INICIO.AsString) <> '' then
//         IBQ_Gravar.SQL.Add(':P_DATA_INICIO, :P_HORA_INICIO,');
//
//      if ApenasNumerosStr(IBQ_MesaItemVisualizaDATA_FINAL.AsString) <> '' then
//         IBQ_Gravar.SQL.Add(':P_DATA_FINAL, :P_HORA_FINAL,');
//
//      IBQ_Gravar.SQL.Add(':P_DESCONTO, :P_CLIENTEDIARIA, :P_ACRESCIMO, :P_TAXA, :P_PIS, :P_COFINS, :P_ICMS, :P_comissaoPr, :P_comissaoFu, :P_COMISPRSN, :P_cortesia, :PTURNO, :PREDUCAO)');
//
//      IBQ_Gravar.ParamByName('PCANCELADA').AsString      := IBQ_MesaItemVisualizaCANCELADA.Value;
//      IBQ_Gravar.ParamByName('PDATE').AsDate             := IBQ_MesaItemVisualizaDATE.Value;
//      IBQ_Gravar.ParamByName('PGARCOM').AsInteger        := IBQ_MesaItemVisualizaGARCOM.Value;
//      IBQ_Gravar.ParamByName('PHORA').AsString           := IBQ_MesaItemVisualizaHORA.Value;
//      IBQ_Gravar.ParamByName('PIMP_REMOTA').AsString     := IBQ_MesaItemVisualizaIMP_REMOTA.Value;
//      IBQ_Gravar.ParamByName('PMESA').AsInteger          := IBQ_MesaItemVisualizaMESA.Value;
//      IBQ_Gravar.ParamByName('PMESAFECHA').AsInteger     := IBQ_MesaItemVisualizaMESAFECHA.Value;
//      IBQ_Gravar.ParamByName('PPONTOVENDA').AsInteger    := IBQ_MesaItemVisualizaPONTOVENDA.Value;
//      IBQ_Gravar.ParamByName('PPRODUTO').AsInteger       := IBQ_MesaItemVisualizaPRODUTO.Value;
//      IBQ_Gravar.ParamByName('PQUANTIDADE').AsFloat      := IBQ_MesaItemVisualizaQUANTIDADE.Value;
//      IBQ_Gravar.ParamByName('PSEQFECHA').AsInteger      := IBQ_MesaItemVisualizaSEQFECHA.Value;
//      IBQ_Gravar.ParamByName('PSEQUENCIA').AsInteger     := IBQ_MesaItemVisualizaSEQUENCIA.Value;
//      IBQ_Gravar.ParamByName('PGRUPO').AsInteger         := IBQ_MesaItemVisualizaGRUPO.Value;
//      IBQ_Gravar.ParamByName('PPRC_UNITARIO').AsFloat    := IBQ_MesaItemVisualizaPRC_UNITARIO.Value;
//      IBQ_Gravar.ParamByName('PBALANCA').AsString        := IBQ_MesaItemVisualizaBALANCA.Value;
//      IBQ_Gravar.ParamByName('POPCANCEL').AsInteger      := IBQ_MesaItemVisualizaOPCANCEL.Value;
//      IBQ_Gravar.ParamByName('PFECHA').AsDate            := data;//vDateF;
//      IBQ_Gravar.ParamByName('PALIQUOTA').AsInteger      := IBQ_MesaItemVisualizaALIQUOTA.AsInteger;
//      IBQ_Gravar.ParamByName('P_OBS').AsString           := IBQ_MesaItemVisualizaOBS.AsString;
//      IBQ_Gravar.ParamByName('P_FINALIZADA').AsString    := IBQ_MesaItemVisualizaFINALIZADA.AsString;
//
//      if ApenasNumerosStr(IBQ_MesaItemVisualizaDATA_INICIO.AsString) <> '' then
//      begin
//         IBQ_Gravar.ParamByName('P_DATA_INICIO').AsDate   := IBQ_MesaItemVisualizaDATA_INICIO.Value;
//         IBQ_Gravar.ParamByName('P_HORA_INICIO').AsString := IBQ_MesaItemVisualizaHORA_INICIO.Value;
//      end;
//
//      if ApenasNumerosStr(IBQ_MesaItemVisualizaDATA_FINAL.AsString) <> '' then
//      begin
//         IBQ_Gravar.ParamByName('P_DATA_FINAL').AsDate   := IBQ_MesaItemVisualizaDATA_FINAL.Value;
//         IBQ_Gravar.ParamByName('P_HORA_FINAL').AsString := IBQ_MesaItemVisualizaHORA_FINAL.Value;
//      end;
//
//      IBQ_Gravar.ParamByName('P_DESCONTO').Value         := IBQ_MesaItemVisualizaDESCONTO.Value;
//
//      if not IBQ_MesaItemVisualizaCLIENTEDIARIA.IsNull then
//         IBQ_Gravar.ParamByName('P_CLIENTEDIARIA').Value := IBQ_MesaItemVisualizaCLIENTEDIARIA.Value
//      else
//         IBQ_Gravar.ParamByName('P_CLIENTEDIARIA').AsString := '';
//
//      IBQ_Gravar.ParamByName('P_ACRESCIMO').Value         := IBQ_MesaItemVisualizaACRESCIMO.Value;
//      IBQ_Gravar.ParamByName('P_TAXA').Value              := IBQ_MesaItemVisualizaTAXA.Value;
//
//      IBQ_Gravar.ParamByName('P_PIS').AsFloat             := IBQ_MesaItemVisualizaPIS.AsFloat;
//      IBQ_Gravar.ParamByName('P_COFINS').AsFloat          := IBQ_MesaItemVisualizaCOFINS.AsFloat;
//      IBQ_Gravar.ParamByName('P_ICMS').AsFloat            := IBQ_MesaItemVisualizaICMS.AsFloat;
//
//      IBQ_Gravar.ParamByName('P_comissaoPr').AsFloat     := IBQ_MesaItemVisualizaDesCOMISSAOPR.AsFloat;
//      IBQ_Gravar.ParamByName('P_comissaoFu').AsFloat     := IBQ_MesaItemVisualizaDesCOMISSAOFU.AsFloat;
//      IBQ_Gravar.ParamByName('P_COMISPRSN').AsString     := IBQ_MesaItemVisualizaDesCOMISSPRSN.AsString;
//      IBQ_Gravar.ParamByName('P_cortesia').AsString      := IBQ_MesaItemVisualizaCORTESIA.AsString;
//      IBQ_Gravar.ParamByName('PTURNO').AsInteger         := IBQ_MesaItemVisualizaTURNO.AsInteger;
//      IBQ_Gravar.ParamByName('PREDUCAO').AsCurrency      := IBQ_MesaItemVisualizaDesREDUCAO.AsCurrency;
//
//      //IBQ_Gravar.SQL.Add('where OPERADOR = :OPERADOR');
//      //IBQ_Gravar.ParamByName('OPERADOR').Value := operador;
//
//      IBQ_Gravar.ExecSQL;
//      FRM_Modulo.IBTransactionF.CommitRetaining;
//
//      //apaga as gravadas//
//      IBQ_MesaItemDELETE.Close;
//      IBQ_MesaItemDELETE.SQL.Clear;
//      IBQ_MesaItemDELETE.SQL.Add('delete from mesaitem');
//      IBQ_MesaItemDELETE.SQL.Add('where codigo_id = :p_Cod');
//      IBQ_MesaItemDELETE.ParamByName('p_Cod').Value := IBQ_MesaItemVisualizaCODIGO_ID.Value;
//
//      //IBQ_MesaItemDELETE.SQL.Add('and (OPERADOR = :OPERADOR)');
//      //IBQ_MesaItemDELETE.ParamByName('OPERADOR').Value := operador;
//
//      IBQ_MesaItemDELETE.ExecSQL;
//      FRM_Modulo.IBTransaction1.CommitRetaining;
//
//      IBQ_MesaItemVisualiza.Next;
//   end;
//
//   { Transferir para o caixa }
//   IBQ_FormaPagto1.Close;
//   IBQ_FormaPagto1.SQL.Clear;
//   IBQ_FormaPagto1.SQL.Add('Select cond.TIPO_PAGTO, Fecha.Data_pagto, Fecha.Operador, sum(cond.DEVEDOR) as tot');
//   IBQ_FormaPagto1.SQL.Add('from mesacond cond, mesafecha fecha');
//   IBQ_FormaPagto1.SQL.Add('where ((cond.MESAFECHA = fecha.MESA) and (cond.SEQFECHA = fecha.SEQUENCIA))');
//   IBQ_FormaPagto1.SQL.Add('and ((fecha.CANCELADO = :p_Cancel) or (fecha.CANCELADO is null)) and (fecha.cortesia<>''S'')');
//   IBQ_FormaPagto1.ParamByName('p_Cancel').Value := 'N';
//   IBQ_FormaPagto1.SQL.Add('and (cond.MESAFECHA is not null)');
//   IBQ_FormaPagto1.SQL.Add('and (cond.TEMPO <= :P_Tempo)');
//   IBQ_FormaPagto1.ParamByName('P_Tempo').Value := vAgora;
//
//   IBQ_FormaPagto1.SQL.Add('and (fecha.OPERADOR = :OPERADOR)');
//   IBQ_FormaPagto1.ParamByName('OPERADOR').Value := operador;
//
//   IBQ_FormaPagto1.SQL.Add('Group by cond.TIPO_PAGTO, Fecha.Data_pagto, Fecha.Operador');
//   IBQ_FormaPagto1.Open;
//
//   IBQ_FormaPagto1.First;
//   while not IBQ_FormaPagto1.Eof do
//   begin
//      FRM_Modulo.IBT_FormaPagto.Locate('codigo_id',IBQ_FormaPagto1TIPO_PAGTO.Value,[]);
//
//      if FRM_Modulo.IBT_FormaPagtoTIPO.Value = 'A' then
//      begin
//         IBQ_GRavarP.Close;
//         IBQ_GRavarP.SQL.Clear;
//         IBQ_GRavarP.SQL.Add('insert into CXMOVTO');
//         IBQ_GRavarP.SQL.Add('(NUMERO_ID, CAIXA, DATA, HISTORICO, CONTA, SUBCONTA, DEBCRED, VALOR, DOCUMENTO, OPERADOR, VENDA)');
//         IBQ_GRavarP.SQL.Add('values');
//         IBQ_GRavarP.SQL.Add('(0, :PCAIXA, :PDATA, :PHISTORICO, :PCONTA, :PSUBCONTA, :PDEBCRED, :PVALOR, :PDOCUMENTO, :POPERADOR, :PVENDA)');
//         IBQ_GRavarP.ParamByName('PCAIXA').value     := FRM_Modulo.IBT_ParametrosCAIXA.Value;
//         IBQ_GRavarP.ParamByName('PDATA').AsDate     := IBQ_FormaPagto1DATA_PAGTO.AsDateTime;
//         //IBQ_GRavarP.ParamByName('PHISTORICO').value := IBQ_FormaPagto1DesTipo_Pagto.AsString;
//         IBQ_GRavarP.ParamByName('PHISTORICO').value := 'Movimento venda - ' + IBQ_FormaPagto1DesTipo_Pagto.AsString + ' Caixa: ' + IBQ_FormaPagto1DescOperador.AsString;
//         IBQ_GRavarP.ParamByName('PCONTA').value     := FRM_Modulo.IBT_ParametrosCONTA.Value;
//         IBQ_GRavarP.ParamByName('PSUBCONTA').value  := FRM_Modulo.IBT_ParametrosSUBCONTA.Value;;
//         IBQ_GRavarP.ParamByName('PDEBCRED').value   := 'C';
//         IBQ_GRavarP.ParamByName('PVALOR').value     := IBQ_FormaPagto1TOT.Value - (IBQ_FormaPagto1TOT.Value * (FRM_Modulo.IBT_FormaPagtoDESCONTO.Value / 100));
//         IBQ_GRavarP.ParamByName('PDOCUMENTO').value := ' ';
//         IBQ_GRavarP.ParamByName('POPERADOR').value  := IBQ_FormaPagto1OPERADOR.Value;
//         IBQ_GRavarP.ParamByName('PVENDA').value     := 'S';
//
//         IBQ_GRavarP.ExecSQL;
//
//         FRM_Modulo.IBTransaction1.CommitRetaining;
//      end;
//
//      IBQ_FormaPagto1.Next;
//   end;
//
//   { Transferir para o financeiro }
//   IBQ_VendasCondFNC.Close;
//   IBQ_VendasCondFNC.SQL.Clear;
//   IBQ_VendasCondFNC.SQL.Add('Select fecha.DATA_PAGTO, cond.TIPO_PAGTO, fecha.CLIENTE, cond.DEVEDOR, fecha.OPERADOR, fecha.SEQ_FISCAL');
//   IBQ_VendasCondFNC.SQL.Add('from mesacond cond, mesafecha fecha');
//   IBQ_VendasCondFNC.SQL.Add('where ((cond.MESAFECHA = fecha.MESA) and (cond.SEQFECHA = fecha.SEQUENCIA))');
//   IBQ_VendasCondFNC.SQL.Add('and ((fecha.CANCELADO = :p_Cancel) or (fecha.CANCELADO is null)) and (fecha.cortesia<>''S'')');
//   IBQ_VendasCondFNC.ParamByName('p_Cancel').Value := 'N';
//   IBQ_VendasCondFNC.SQL.Add('and (cond.MESAFECHA is not null)');
//   IBQ_VendasCondFNC.SQL.Add('and (cond.TEMPO <= :P_Tempo)');
//   IBQ_VendasCondFNC.ParamByName('P_Tempo').Value := vAgora;
//
//   IBQ_VendasCondFNC.SQL.Add('and (fecha.OPERADOR = :OPERADOR)');
//   IBQ_VendasCondFNC.ParamByName('OPERADOR').Value := operador;
//
//   IBQ_VendasCondFNC.SQL.Add('order by fecha.DATA_PAGTO, cond.TIPO_PAGTO');
//   IBQ_VendasCondFNC.Open;
//
//   IBQ_VendasCondFNC.First;
//   while not IBQ_VendasCondFNC.Eof do
//   begin
//      FRM_Modulo.IBT_FormaPagto.Locate('codigo_id',IBQ_VendasCondFNCTIPO_PAGTO.Value,[]);
//      if FRM_Modulo.IBT_FormaPagtoTIPO.Value <> 'A' then
//      begin
//         if FRM_Modulo.IBT_FormaPagtoTIPO.Value = 'P' then
//         begin
//            IBQ_FormaParcela.Close;
//            IBQ_FormaParcela.SQL.Clear;
//            IBQ_FormaParcela.SQL.Add('select * from FORMAPARCELA');
//            IBQ_FormaParcela.SQL.Add('where FORMAPAGTO =:FORMAPAGTO');
//            IBQ_FormaParcela.ParamByName('FORMAPAGTO').Value := FRM_Modulo.IBT_FormaPagtoCODIGO_ID.Value;
//            IBQ_FormaParcela.SQL.Add('order by CODIGO_ID');
//            IBQ_FormaParcela.Open;
//
//            IBQ_FormaParcela.First;
//            IBQ_FormaParcela.Last;
//
//            if IBQ_FormaParcela.RecordCount <> 0 then
//            begin
//               numPar := IBQ_FormaParcela.RecNo;
//
//               IBQ_FormaParcela.First;
//
//               valTot := IBQ_VendasCondFNCDEVEDOR.Value;                                               //recebe valor da query
//               valRes := valTot - (StrToFloat(FormatCurr('########0.00',(valTot / numPar))) * numPar); //acerta centavos
//               valDiv := StrToFloat(FormatCurr('########0.00',(valTot / numPar)));
//
//               while not IBQ_FormaParcela.Eof do
//               begin
//                  if IBQ_FormaParcela.RecNo = 1 then
//                     valPar := valDiv + valRes
//                  else
//                     valPar := valDiv;
//
//                  IBQ_GRavarP.Close;
//                  IBQ_GRavarP.SQL.Clear;
//                  IBQ_GRavarP.SQL.Add('insert into FINANCEIRO');
//                  IBQ_GRavarP.SQL.Add('(CODIGO_ID, EMISSAO, VENCIMENTO, DOCUMENTO, CONTA, SUBCONTA, CLIFOR, VALOR, DEBCRED, VENDA, DESCONTO, JUROS, OBSERVACAO, OPERADOR)');
//                  IBQ_GRavarP.SQL.Add('values');
//                  IBQ_GRavarP.SQL.Add('(0, :PEMISSAO, :PVENCIMENTO, :PDOCUMENTO, :PCONTA, :PSUBCONTA, :PCLIFOR, :PVALOR, :PDEBCRED, :PVENDA, :PDESCONTO, 0, :POBS, :POPERADOR)');
//                  IBQ_GRavarP.ParamByName('PEMISSAO').AsDate    := IBQ_VendasCondFNCDATA_PAGTO.AsDateTime;
//                  IBQ_GRavarP.ParamByName('PVENCIMENTO').AsDate := IBQ_VendasCondFNCDATA_PAGTO.Value + IBQ_FormaParcela.FieldByName('DIAS').Value;
//                  IBQ_GRavarP.ParamByName('PDOCUMENTO').value   := copy(IBQ_VendasCondFNCDescTipo_Pagto.AsString,1,20);
//                  IBQ_GRavarP.ParamByName('PCONTA').value       := FRM_Modulo.IBT_ParametrosPCONTA.Value;
//                  IBQ_GRavarP.ParamByName('PSUBCONTA').value    := FRM_Modulo.IBT_ParametrosPSUBCONTA.Value;
//                  IBQ_GRavarP.ParamByName('PCLIFOR').value      := IBQ_VendasCondFNCCLIENTE.Value;
//                  IBQ_GRavarP.ParamByName('PVALOR').value       := valPar;
//                  IBQ_GRavarP.ParamByName('PDEBCRED').value     := 'C';
//                  IBQ_GRavarP.ParamByName('PVENDA').value       := 'S';
//                  IBQ_GRavarP.ParamByName('PDESCONTO').Value    := (valPar * (FRM_Modulo.IBT_FormaPagtoDESCONTO.Value / 100));
//                  IBQ_GRavarP.ParamByName('POBS').Value         := 'CF: '+IBQ_VendasCondFNCSEQ_FISCAL.AsString+' - '+copy('Caixa: ' + IBQ_VendasCondFNCDescOperador.AsString,1,80);
//                  IBQ_GRavarP.ParamByName('POPERADOR').Value    := IBQ_VendasCondFNCOPERADOR.Value;
//
//                  IBQ_GRavarP.ExecSQL;
//                  FRM_Modulo.IBTransaction1.CommitRetaining;
//
//                  IBQ_FormaParcela.Next;
//               end;
//            end
//            else {se nao existir parcelas}
//            begin
//               IBQ_GRavarP.Close;
//               IBQ_GRavarP.SQL.Clear;
//               IBQ_GRavarP.SQL.Add('insert into FINANCEIRO');
//               IBQ_GRavarP.SQL.Add('(CODIGO_ID, EMISSAO, VENCIMENTO, DOCUMENTO, CONTA, SUBCONTA, CLIFOR, VALOR, DEBCRED, VENDA, DESCONTO, JUROS, OBSERVACAO, OPERADOR)');
//               IBQ_GRavarP.SQL.Add('values');
//               IBQ_GRavarP.SQL.Add('(0, :PEMISSAO, :PVENCIMENTO, :PDOCUMENTO, :PCONTA, :PSUBCONTA, :PCLIFOR, :PVALOR, :PDEBCRED, :PVENDA, :PDESCONTO, 0, :POBS, :POPERADOR)');
//               IBQ_GRavarP.ParamByName('PEMISSAO').AsDate    := IBQ_VendasCondFNCDATA_PAGTO.AsDateTime;
//               IBQ_GRavarP.ParamByName('PVENCIMENTO').AsDate := IBQ_VendasCondFNCDATA_PAGTO.Value + FRM_Modulo.IBT_FormaPagtoDIAS.Value;
//               IBQ_GRavarP.ParamByName('PDOCUMENTO').value   := copy(IBQ_VendasCondFNCDescTipo_Pagto.AsString,1,20);
//               IBQ_GRavarP.ParamByName('PCONTA').value       := FRM_Modulo.IBT_ParametrosPCONTA.Value;
//               IBQ_GRavarP.ParamByName('PSUBCONTA').value    := FRM_Modulo.IBT_ParametrosPSUBCONTA.Value;
//               IBQ_GRavarP.ParamByName('PCLIFOR').value      := IBQ_VendasCondFNCCLIENTE.Value;
//               IBQ_GRavarP.ParamByName('PVALOR').value       := IBQ_VendasCondFNCDEVEDOR.Value;
//               IBQ_GRavarP.ParamByName('PDEBCRED').value     := 'C';
//               IBQ_GRavarP.ParamByName('PVENDA').value       := 'S';
//               IBQ_GRavarP.ParamByName('PDESCONTO').Value    := (IBQ_VendasCondFNCDEVEDOR.Value * (FRM_Modulo.IBT_FormaPagtoDESCONTO.Value / 100));
//               IBQ_GRavarP.ParamByName('POBS').Value         := 'CF: '+IBQ_VendasCondFNCSEQ_FISCAL.AsString+' - '+copy('Caixa: ' + IBQ_VendasCondFNCDescOperador.AsString,1,80);
//               IBQ_GRavarP.ParamByName('POPERADOR').Value    := IBQ_VendasCondFNCOPERADOR.Value;
//
//               IBQ_GRavarP.ExecSQL;
//               FRM_Modulo.IBTransaction1.CommitRetaining;
//            end;
//         end
//         else {todos tipo diferente de P}
//         begin
//            IBQ_GRavarP.Close;
//            IBQ_GRavarP.SQL.Clear;
//            IBQ_GRavarP.SQL.Add('insert into FINANCEIRO');
//            IBQ_GRavarP.SQL.Add('(CODIGO_ID, EMISSAO, VENCIMENTO, DOCUMENTO, CONTA, SUBCONTA, CLIFOR, VALOR, DEBCRED, VENDA, DESCONTO, JUROS, OBSERVACAO, OPERADOR)');
//            IBQ_GRavarP.SQL.Add('values');
//            IBQ_GRavarP.SQL.Add('(0, :PEMISSAO, :PVENCIMENTO, :PDOCUMENTO, :PCONTA, :PSUBCONTA, :PCLIFOR, :PVALOR, :PDEBCRED, :PVENDA, :PDESCONTO, 0, :POBS, :POPERADOR)');
//            IBQ_GRavarP.ParamByName('PEMISSAO').AsDate    := IBQ_VendasCondFNCDATA_PAGTO.AsDateTime;
//            IBQ_GRavarP.ParamByName('PVENCIMENTO').AsDate := IBQ_VendasCondFNCDATA_PAGTO.Value + FRM_Modulo.IBT_FormaPagtoDIAS.Value;
//            IBQ_GRavarP.ParamByName('PDOCUMENTO').value   := copy(IBQ_VendasCondFNCDescTipo_Pagto.AsString,1,20);
//            IBQ_GRavarP.ParamByName('PCONTA').value       := FRM_Modulo.IBT_ParametrosPCONTA.Value;
//            IBQ_GRavarP.ParamByName('PSUBCONTA').value    := FRM_Modulo.IBT_ParametrosPSUBCONTA.Value;
//            IBQ_GRavarP.ParamByName('PCLIFOR').value      := IBQ_VendasCondFNCCLIENTE.Value;
//            IBQ_GRavarP.ParamByName('PVALOR').value       := IBQ_VendasCondFNCDEVEDOR.Value;
//            IBQ_GRavarP.ParamByName('PDEBCRED').value     := 'C';
//            IBQ_GRavarP.ParamByName('PVENDA').value       := 'S';
//            IBQ_GRavarP.ParamByName('PDESCONTO').Value    := (IBQ_VendasCondFNCDEVEDOR.Value * (FRM_Modulo.IBT_FormaPagtoDESCONTO.Value / 100));
//            IBQ_GRavarP.ParamByName('POBS').Value         := 'CF: '+IBQ_VendasCondFNCSEQ_FISCAL.AsString+' - '+copy('Caixa: ' + IBQ_VendasCondFNCDescOperador.AsString,1,80);
//            IBQ_GRavarP.ParamByName('POPERADOR').Value    := IBQ_VendasCondFNCOPERADOR.Value;
//
//            IBQ_GRavarP.ExecSQL;
//            FRM_Modulo.IBTransaction1.CommitRetaining;
//         end;
//      end;
//
//      IBQ_VendasCondFNC.Next;
//   end;
//
//   { Transferir Cond. }
//   IBQ_MesaCond.First;
//   while not IBQ_MesaCond.Eof do
//   begin
//      if IBQ_MesaCondMESAFECHA.IsNull then
//      begin
//         IBQ_MesaCond.Next;
//         Continue;
//      end;
//
//      if IBQ_MesaCondTEMPO.Value > vAgora then
//      begin
//         IBQ_MesaCond.Next;
//         Continue;
//      end;
//
//      IBQ_Gravar.Close;
//      IBQ_Gravar.SQL.Clear;
//      IBQ_Gravar.SQL.Add('insert into mesacond');
//      IBQ_Gravar.SQL.Add('(codigo_id, mesa, sequencia, tipo_pagto, Total, hora_pagto, data_pagto, mesafecha, seqfecha, fecha, devedor, cortesia, turno)');
//      IBQ_Gravar.SQL.Add('values');
//      IBQ_Gravar.SQL.Add('(0, :Pmesa, :Psequencia, :Ptipo_pagto, :Ptotal, :Phora_pagto, :Pdata_pagto, :Pmesafecha, :Pseqfecha, :Pfecha, :Pdevedor, :Pcortesia, :PTURNO)');
//      IBQ_Gravar.ParamByName('Pmesa').AsInteger        := IBQ_MesaCondMESA.Value;
//      IBQ_Gravar.ParamByName('Psequencia').AsInteger   := IBQ_MesaCondSEQUENCIA.Value;
//      IBQ_Gravar.ParamByName('Ptipo_pagto').AsInteger  := IBQ_MesaCondTIPO_PAGTO.Value;
//      IBQ_Gravar.ParamByName('Ptotal').AsFloat         := IBQ_MesaCondTOTAL.Value;
//      IBQ_Gravar.ParamByName('Phora_pagto').AsString   := IBQ_MesaCondHORA_PAGTO.Value;
//      IBQ_Gravar.ParamByName('Pdata_pagto').AsDate     := IBQ_MesaCondDATA_PAGTO.Value;
//      IBQ_Gravar.ParamByName('Pmesafecha').AsInteger   := IBQ_MesaCondMESAFECHA.Value;
//      IBQ_Gravar.ParamByName('Pseqfecha').AsInteger    := IBQ_MesaCondSEQFECHA.Value;
//      IBQ_Gravar.ParamByName('Pfecha').AsDate          := data;//vDateF;
//      IBQ_Gravar.ParamByName('Pdevedor').AsFloat       := IBQ_MesaCondDEVEDOR.Value;
//      IBQ_Gravar.ParamByName('Pcortesia').AsString     := IBQ_MesaCondCORTESIA.Value;
//      IBQ_Gravar.ParamByName('PTURNO').AsInteger       := IBQ_MesaCondTURNO.Value;
//
//      IBQ_Gravar.ExecSQL;
//      FRM_Modulo.IBTransactionF.CommitRetaining;
//
//      //  Substituir pelo delete do SQL IBT_MesaCond.Delete;
//
//      IBQ_MesaCondDELETE.Close;
//      IBQ_MesaCondDELETE.SQL.Clear;
//      IBQ_MesaCondDELETE.SQL.Add('delete from mesacond');
//      IBQ_MesaCondDELETE.SQL.Add('where codigo_id = :p_Cod');
//      IBQ_MesaCondDELETE.ParamByName('p_Cod').Value := IBQ_MesaCondCODIGO_ID.Value;
//
//      IBQ_MesaCondDELETE.ExecSQL;
//      FRM_Modulo.IBTransaction1.CommitRetaining;
//
//      IBQ_MesaCond.Next;
//   end;
//
//   { Transferir Fecha }
//   IBT_MesaFecha.First;
//   while not IBT_MesaFecha.Eof do
//   begin
//      if IBT_MesaFechaTEMPO.Value > vAgora then
//      begin
//         IBT_MesaFecha.Next;
//         Continue;
//      end;
//
//      if IBT_MesaFechaOPERADOR.Value <> operador then
//      begin
//         IBT_MesaFecha.Next;
//         Continue;
//      end;
//
//      IBQ_Gravar.Close;
//      IBQ_Gravar.SQL.Clear;
//      IBQ_Gravar.SQL.Add('insert into mesafecha');
//
//      IBQ_Gravar.SQL.Add('(codigo_id, CANCELADO, COK, DATA_PAGTO, DESCONTO, HORA_PAGTO, MESA, MESAFECHA, NUM_CAIXA, OPERADOR, PONTOVENDA, ');
//      IBQ_Gravar.SQL.Add('SEQFECHA, SEQUENCIA, SEQ_FISCAL, TIPO_PAGTO, TROCO, VALOR, FECHA, OPCANCEL, CLIENTE, VAL_DESCONTOI, VAL_ACRESCIMOI, VAL_TAXAI, CAT_CNPJ, CAT_NOME, CAT_ENDERECO, NUMSERIEIMPRESSORA, cortesia, TURNO)');
//      IBQ_Gravar.SQL.Add('values');
//      IBQ_Gravar.SQL.Add('(0, :PCANCELADO, :PCOK, :PDATA_PAGTO, :PDESCONTO, :PHORA_PAGTO, :PMESA, :PMESAFECHA, :PNUM_CAIXA, :POPERADOR, :PPONTOVENDA, :PSEQFECHA, :PSEQUENCIA, :PSEQ_FISCAL, :PTIPO_PAGTO, :PTROCO, :PVALOR, :PFECHA, :POPCANCEL, :PCLIENTE,');
//      IBQ_Gravar.SQL.Add(':PVAL_DESCONTOI, :PVAL_ACRESCIMOI, :PVAL_TAXAI, :PCAT_CNPJ, :PCAT_NOME, :PCAT_ENDERECO, :PNUMSERIEIMPRESSORA,:Pcortesia, :PTURNO)');
//
//      IBQ_Gravar.ParamByName('PCANCELADO').AsString          := IBT_MesaFechaCANCELADO.Value;
//      IBQ_Gravar.ParamByName('PCOK').AsString                := IBT_MesaFechaCOK.Value;
//      IBQ_Gravar.ParamByName('PDATA_PAGTO').AsDate           := IBT_MesaFechaDATA_PAGTO.Value;
//      IBQ_Gravar.ParamByName('PDESCONTO').AsFloat            := IBT_MesaFechaDESCONTO.Value;
//      IBQ_Gravar.ParamByName('PHORA_PAGTO').AsString         := IBT_MesaFechaHORA_PAGTO.Value;
//      IBQ_Gravar.ParamByName('PMESA').AsInteger              := IBT_MesaFechaMESA.Value;
//      IBQ_Gravar.ParamByName('PMESAFECHA').AsInteger         := IBT_MesaFechaMESAFECHA.Value;
//      IBQ_Gravar.ParamByName('PNUM_CAIXA').AsString          := IBT_MesaFechaNUM_CAIXA.Value;
//      IBQ_Gravar.ParamByName('POPERADOR').AsInteger          := IBT_MesaFechaOPERADOR.Value;
//      IBQ_Gravar.ParamByName('PPONTOVENDA').AsInteger        := IBT_MesaFechaPONTOVENDA.Value;
//      IBQ_Gravar.ParamByName('PSEQFECHA').AsInteger          := IBT_MesaFechaSEQFECHA.Value;
//      IBQ_Gravar.ParamByName('PSEQUENCIA').AsInteger         := IBT_MesaFechaSEQUENCIA.Value;
//      IBQ_Gravar.ParamByName('PSEQ_FISCAL').AsString         := IBT_MesaFechaSEQ_FISCAL.Value;
//      IBQ_Gravar.ParamByName('PTIPO_PAGTO').AsInteger        := IBT_MesaFechaTIPO_PAGTO.Value;
//      IBQ_Gravar.ParamByName('PTROCO').AsFloat               := IBT_MesaFechaTROCO.Value;
//      IBQ_Gravar.ParamByName('PVALOR').AsFloat               := IBT_MesaFechaVALOR.Value;
//      IBQ_Gravar.ParamByName('POPCANCEL').AsInteger          := IBT_MesaFechaOPCANCEL.Value;
//      IBQ_Gravar.ParamByName('PFECHA').AsDate                := data;//vDateF;
//      IBQ_Gravar.ParamByName('PNUMSERIEIMPRESSORA').AsString := IBT_MesaFechaNUMSERIEIMPRESSORA.Value;
//      IBQ_Gravar.ParamByName('PCLIENTE').asInteger           := IBT_MesaFechaCLIENTE.Value;
//      IBQ_Gravar.ParamByName('PVAL_DESCONTOI').AsFloat       := IBT_MesaFechaVAL_DESCONTOI.Value;
//      IBQ_Gravar.ParamByName('PVAL_ACRESCIMOI').AsFloat      := IBT_MesaFechaVAL_ACRESCIMOI.Value;
//      IBQ_Gravar.ParamByName('PVAL_TAXAI').AsFloat           := IBT_MesaFechaVAL_TAXAI.Value;
//      IBQ_Gravar.ParamByName('PCAT_CNPJ').AsString           := IBT_MesaFechaCAT_CNPJ.Value;
//      IBQ_Gravar.ParamByName('PCAT_NOME').AsString           := IBT_MesaFechaCAT_NOME.Value;
//      IBQ_Gravar.ParamByName('PCAT_ENDERECO').AsString       := IBT_MesaFechaCAT_ENDERECO.Value;
//      IBQ_Gravar.ParamByName('Pcortesia').AsString           := IBT_MesaFechaCORTESIA.Value;
//      IBQ_Gravar.ParamByName('PTURNO').AsInteger             := IBT_MesaFechaTURNO.Value;
//
//      IBQ_Gravar.ExecSQL;
//      FRM_Modulo.IBTransactionF.CommitRetaining;
//
//      IBT_MesaFecha.Delete;
//   end;
//
//   { Desbloquear usuario }
//   with FRM_Frente do
//   begin
//      IBQ_Grava.Close;
//      IBQ_Grava.SQL.Clear;
//      IBQ_Grava.SQL.Add('update funcionario set status = :p_Grava');
//      IBQ_Grava.ParamByName('p_Grava').Value := ' ';
//
//      IBQ_Grava.SQL.Add('where CODIGO_ID = :OPERADOR');
//      IBQ_Grava.ParamByName('OPERADOR').Value := operador;
//
//      IBQ_Grava.ExecSQL;
//
//      FRM_Frente.Commit_Work_;
//   end;
//
//   { Zera Sequencia }
//   {FRM_Frente.IBQ_Sequencia.Close;
//   FRM_Frente.IBQ_Sequencia.Open;
//
//   if xZERASEQDIA  <> 'S' then
//   begin
//      if (FRM_Frente.IBQ_SequenciaXCOD_ID.Value >= 1000000) then
//      begin
//         IBQ_ZeraSequencia.Close;
//         IBQ_ZeraSequencia.Open;
//      end;
//   end
//   else
//   begin
//      IBQ_ZeraSequencia.Close;
//      IBQ_ZeraSequencia.Open;
//   end; }
//
//   { Zera Sequencia do Ticket }
//   {IBQ_ZeraTKTSequencia.Close;
//   IBQ_ZeraTKTSequencia.Open;}
//
//   FRM_Modulo.IBTransaction1.CommitRetaining;
//   end;
//
//   Screen.Cursor := crDefault;
//
//   Mensagem('Fechamento Realizado com Sucesso!');
end;

initialization
{formatação inicial}
ShortDateFormat  :='dd/mm/yyyy';
CurrencyDecimals := 2;

{Senha o Crypt}
senh_:= 'SmEoEaAn';

{Senha Login}
vLogin             := '';
vSenha             := '';
vNivel             := '';
VNomeCX            := '';
OpSenha            := 0;
CodigoNivel        := 0;

{Cupom SN}
vCupom             := True;
vCupImp            := False;
VerifSenha         := False;
VerifSenhaPASSOU   := False;
VerifSenhaC        := False;
VerifSenhaS        := False;

{ Variabeis do FRM_Frente }
FMesa              := 0;
FSequencia         := 0;
FSetor             := '';
FGarcon            := '0';
FOperador          := '';
FPontoVenda        := '';
FMaquina           := '';
wBaseOld           := False;
vDifTef            := 0;
oDifTef            := 0;

AbreMesa           := True;
Cab_               := True;
SFecha             := True;
vQuantidade        := 1.000;
vSubTotal          := 0.00;
oSubTotal          := 0.00;
vRecebido          := 0.00;
oRecebido          := 0.00;
vSubTotalDia       := 0.00;
oSubTotalDia       := 0.00;
vCancQTDDia        := 0;
_XvCancQTDDia      := 0;
vDesconto          := 0;
oDesconto          := 0;

vVal_TaxaI         := 0.00;
vVal_DescontoI     := 0.00;
vVal_AcrescimoI    := 0.00;

oVal_TaxaI         := 0.00;
oVal_DescontoI     := 0.00;
oVal_AcrescimoI    := 0.00;

oVal_TaxaI         := vVal_TaxaI;
oVal_DescontoI     := vVal_DescontoI;
oVal_AcrescimoI    := vVal_AcrescimoI;

vCondPagto         := 0;
vNumFicha          := 0;
vCondDesc          := '';
XClienteDiaria     := -1;

xMult              := '';
oMult              := '';
nucu               := '';
ccount             := 1;
llinha             := 0;
llinha2            := -1;
AtivBot            := 1;
xcaixa             := '';
xlocal             := '';
cCaminho           := '';
vECF_              := ' ';
xEntregaPD         := 0;

vCliente           := 0;
xTPMesaTicket      := 'T';
xImpRecibo         := 'S';
xGuilhotina        := 'N';
NomeUser           := '';
xCONTRAVALE        := 'F';
xGavetaMAN         := 'N';
xENTREGABAUT       := 'N';
_TktImpresso       := 1;
xLinhaDelete       := 0;
vNumeroTKTCOO      := 0;
xPathImagem        := '';
xIDENTMESAF9       := 'N';
_AbasSangriaF2F6   := 'N';

TotDif             := 0;
TotForm            := 0;
vTPIMPCOZ          := 0;
vImpECFT           := 'N';
xTOLEDOCOM         := 0;
xDividePesoPor     := 0;
VELOTOL            := 0;
BALANCA            := '';
cFundo             := False;
xZERASEQDIA        := 'S';
xTPBAL             := '1';
xTPBAL             := '';
xTPImpTK           := 0;
xTKItemAg          := 'N';
xSAIRSN            := 'N';
xBuscaECF          := '1';
xModImpCoz         := '1';

TPPreco            := 'PV'; //'PC'

_MensagemGerencial := 'S';
_RELWEB            := 'N';
_BuscaVenda        := 'N';

ANALISACLIENTE     := 'S';
TPDIAMES           := 'D';

vARQUIVOOFF        := 'C:\MBD\';
vADDDV             := 'N';

{ Fim }
//VarFirma   := 'Dani e Gabi - Caixa';
DT_Compila := StrToDate('31/07/2003');
xVersao    := '08.05.07';
VarVersao  := 'Versão 08.05.07';
//                   |  |  |__ dia.....{12-07-2002}
//                   |  |_____ mes.....{12-07-2002}
//                   |________ ano.....{12-07-2002}

end.
