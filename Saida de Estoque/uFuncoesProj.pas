////////////////////////////////////////////////////////////////////////////////
//  Autor: Marcos Roberto
//  Data de criação: 18/05/09
//  Data da última alteração:
////////////////////////////////////////////////////////////////////////////////
//  Descrição simplificada: Unit responsável por todas funcoes/procedimentos
//  específicos do projeto
////////////////////////////////////////////////////////////////////////////////

unit ufuncoesproj;

interface

uses
  SysUtils, Classes, DB, IBDatabase, IBCustomDataSet, IniFiles, Forms, DBCtrls,
  graphics, Shellapi, filectrl, dbgrids, dialogs, controls,
    math,DateUtils, ConvUtils, Messages, Windows;


  // O detalhe específico de cada funcao/procedimento esta na implementação da mesma
  function  ConectaDBME : Boolean;
  function  ConectaDB(EmpresaCodigo:String) : Boolean;
  procedure CarregandoEmpresas;

  function Combo(SQL,Campo_Retorno:String):TStringList;

  function ProcuraItem(Retornar_Coluna:String) : String;
  function ProcuraEmpresa(Retornar_Coluna:String) : String;

  function IncCampoFilho(tabela, campo, campofilho, valorpai:string): string;
  function totalfilho(tabelafilho, campofilho, idfilho, valorpai: string): real;
  function inccampo(tabela,campo: string):string;
  function inccampofilho2(tabela, campo, campofilho, campofilho2, valorpai, valorpai2:string): string;


// Variáveis de uso global específicas do projeto
var
   CodEmpresa, LocalDataBase, ServerDataBase: string;
   LocalServer, Sistema: string;
   localdatabase2,serverdatabase2,sistema2,localserver2:String;
   EmpresasLista : TStringList;
   Versao : String;

   ID_Usuario : Integer;

   //
   INI_Path : String;

   //função de procura item-empresa
   Campo_Retorno, Retorna_Coluna : String;

implementation

// utilização de outras units
uses funcoes, udmcad;


function ConectaDBME : Boolean;
var
   arqini: TIniFile;
   path: String;
begin
  { try
      with DMEMP do
      begin
         DBK2.CloseDataSets;
         DBK2.Close;

         path := ExtractFilePath(Application.exename);

         if FileExists(path+'\k2.ini') then
            arqini := Tinifile.create(path+'\k2.ini')
         else if FileExists(path+'k2.ini') then
            arqini := Tinifile.create(path+'k2.ini')
         else
         begin
            ShowMessage('Não foi possível encontrar o arquivo de inicialização em:'+#13+path+'\k2.ini');
            Result := False;
            Exit;
         end;

         if FileExists(ExtractFilePath(Application.exename)+'\k2.ini') then
            arqini := Tinifile.create(ExtractFilePath(Application.exename)+'\k2.ini');

         localdatabase  := arqini.ReadString('DATABASE','LOCAL','');
         serverdatabase := arqini.readstring('DATABASE','SERVER', '');
         sistema        := arqini.ReadString('SERVER','SYSTEM','');
         localserver    := ExtractFilePath(Application.exename);

         if sistema='Linux' then
         begin
            if copy(localserver, length(localserver), 1)<>'/' then
               localserver:=localserver+'/';
         end
         else
         begin
            if copy(localserver, length(localserver), 1)<>'\' then
               localserver:=localserver+'\';
         end;

         arqini.free;

         DBK2.DatabaseName:=serverdatabase+':'+localdatabase+'k2me.gdb';
         DBK2.Open;

         TMULTI_EMPRESA.Active := True;

         CarregandoEmpresas;

         Result := True;
      end;
   except
      Result := False;
   end;   }
end;

function ConectaDB(EmpresaCodigo:String) : Boolean;
begin
 {  try
      with DMCAD do
      begin
         Result := True;

         if INI_MENSAGEM = nil then
            INI_MENSAGEM := TINI_MENSAGEM.Create(Application);

         INI_MENSAGEM.LBL_Mensagem.Caption := 'Conectando na base de dados...';
         INI_MENSAGEM.Show;

         INI_MENSAGEM.Repaint;
         Application.ProcessMessages;

         //conecta na base de dados referente a empresa
         try
          DBK2.CloseDataSets;
          DBK2.ForceClose;
          DBK2.Connected    := False;
          DBK2.DatabaseName := serverdatabase + ':' + localdatabase + '\empresas\'+EmpresaCodigo+'\k2.gdb';
          DBK2.Connected    := True;
         except
          if INI_MENSAGEM <> nil then
           INI_MENSAGEM.Close;

          MessageBox(Application.Handle,'É necessário primeiramente cadastrar sua empresa no Sistema K2!','Empresa',MB_OK+MB_ICONEXCLAMATION);
          DBK2.CloseDataSets;
          DBK2.ForceClose;
          DBK2.Connected    := False;
            
          Result := False;
          Application.Terminate;
         end;
                  
         if Result then
         begin
          INI_Path := serverdatabase + ':' + localdatabase + '\empresas\'+EmpresaCodigo+'\k2.gdb';
          CodEmpresa := EmpresaCodigo;
          TK2.Active := True;

          TPARAMETROS.Close;
          TPARAMETROS.Open;

          DMEMP.PEMPRESA.Close;
          DMEMP.PEMPRESA.open;
          DMEMP.PEMPRESA.Locate('CODIGO',EmpresaCodigo,[]);

          DMEMP.TMEMPRESA.Close;
          DMEMP.TMEMPRESA.open;
          DMEMP.TMEMPRESA.Locate('CODIGO',EmpresaCodigo,[]);


          if INI_MENSAGEM <> nil then
             INI_MENSAGEM.Close;

          Result := True;
         end;
      end;
   except
      if INI_MENSAGEM <> nil then
         INI_MENSAGEM.Close;

      Result := False;
   end;    }
end;

procedure CarregandoEmpresas;
begin
  { try
      DMEMP.TMEMPRESA.Open;
      DMEMP.TMEMPRESA.First;

      if EmpresasLista = nil then
         EmpresasLista := TStringList.Create;

      EmpresasLista.Clear;
      while not DMEMP.TMEMPRESA.Eof do
      begin
         EmpresasLista.Add(DMEMP.TMEMPRESACODIGO.AsString+' > '+DMEMP.TMEMPRESANOME_FANTASIA.AsString);
         DMEMP.TMEMPRESA.Next;
         Application.ProcessMessages;
      end;

      if EmpresasLista.Text = '' then
      begin
       MessageBox(Application.Handle,'É necessário primeiramente cadastrar sua empresa no Sistema K2!','Empresa',MB_OK+MB_ICONEXCLAMATION);
       Application.Terminate;
      end;

   except
      ShowMessage('Não foi possível carregar os dados da Empresa !!!'+#13+'Verifique se o arquivo K2.INI esta no mesmo diretório que o aplicativo.');
   end; }
end;

function Combo(SQL,Campo_Retorno:String):TStringList;
var
   Resultado : TStringList;
begin
   //
 {  with DMPcp do
   begin
      Resultado := TStringList.Create;
      Resultado.Clear;

      PConsulta.Close;
      PConsulta.SQL.Clear;
      PConsulta.SQL.Add(SQL);
      PConsulta.Open;

      PConsulta.First;
      while not PConsulta.Eof do
      begin
         Resultado.Add(PConsulta.FieldByName(Campo_Retorno).AsString);

         PConsulta.Next;
         Application.ProcessMessages;
      end;

      Result := Resultado;
   end;  }
end;

function ProcuraItem(Retornar_Coluna:String) : String;
begin
 {  Campo_Retorno := '';
   Retorna_Coluna := Retornar_Coluna;

   if PRO_ITEM = nil then
      PRO_ITEM := TPRO_ITEM.Create(Application);
   PRO_ITEM.ShowModal;

   Result := Campo_Retorno; }
end;

function ProcuraEmpresa(Retornar_Coluna:String) : String;
begin
  { Campo_Retorno := '';
   Retorna_Coluna := Retornar_Coluna;

   if PRO_EMPRESAS = nil then
      PRO_EMPRESAS := TPRO_EMPRESAS.Create(Application);
   PRO_EMPRESAS.ShowModal;

   Result := Campo_Retorno;      }
end;


function IncCampoFilho(tabela, campo, campofilho, valorpai:string): string;
begin
{   with DMPcp do
   begin
      IBQUERY.close;
      IBQUERY.SQL.Clear;
      IBQUERY.SQL.Add('SELECT MAX('+campo+') FROM '+tabela);
      IBQUERY.SQL.Add('WHERE '+campofilho+'='+valorpai);
      IBQUERY.Open;

      if IBQUERY.Fields[0].isnull then result:='1' else
         result:=IBQUERY.Fields[0].value+1;
   end;   }
end;

function inccampofilho2(tabela, campo, campofilho, campofilho2, valorpai, valorpai2:string): string;
begin
 {  with DMPcp do
   begin
      IBQUERY.close;
      IBQUERY.SQL.Clear;
      IBQUERY.SQL.Add('SELECT MAX('+campo+') FROM '+tabela);
      IBQUERY.SQL.Add('WHERE ('+campofilho+'=:p1 ) AND ('+campofilho2+'=:p2 )');
      IBQUERY.ParamByName('p1').AsString := valorpai;
      IBQUERY.ParamByName('p2').AsString := valorpai2;
      IBQUERY.Open;

      if IBQUERY.Fields[0].isnull then
       result:='1'
      else
       result:= IBQUERY.Fields[0].value+1;
   end;    }
end;


function totalfilho(tabelafilho, campofilho, idfilho, valorpai: string): real;
begin
 {  with DMPcp do
   begin
      IBQUERY.close;
      IBQUERY.SQL.Clear;
      IBQUERY.SQL.Add('SELECT CAST(SUM('+campofilho+') AS NUMERIC(15,3)) FROM '+tabelafilho);
      IBQUERY.SQL.Add('WHERE '+idfilho+'='+valorpai);
      IBQUERY.Open;

      result:=IBQUERY.Fields[0].AsFloat;
   end;  }
end;

function inccampo(tabela,campo: string):string;
begin
 {  with DMPcp do
   begin
      IBQUERY.close;
      IBQUERY.SQL.Clear;
      IBQUERY.SQL.Add('SELECT MAX('+campo+') FROM '+tabela);
      IBQUERY.Open;

      if IBQUERY.Fields[0].isnull then result:='1' else
         result:=IBQUERY.Fields[0].value+1;
   end;  }
end;



initialization

Versao := 'Versão: 2.02';

end.
