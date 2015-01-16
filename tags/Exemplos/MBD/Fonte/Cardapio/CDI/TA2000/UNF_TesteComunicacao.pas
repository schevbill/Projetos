unit UNF_TesteComunicacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

type
  TFRM_TesteComunicacao = class(TForm)
    EDT_Comando: TEdit;
    BNT_Enviar: TButton;
    EDT_Retorno: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    Limpar1: TMenuItem;
    Entrada1: TMenuItem;
    Encerrar1: TMenuItem;
    N1: TMenuItem;
    procedure BNT_EnviarClick(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Limpar1Click(Sender: TObject);
    procedure Entrada1Click(Sender: TObject);
    procedure Encerrar1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_TesteComunicacao: TFRM_TesteComunicacao;

implementation

uses UNF_FTA2000;

{$R *.dfm}

procedure TFRM_TesteComunicacao.BNT_EnviarClick(Sender: TObject);
var
     iRetorno : Integer;
    szRetorno : String;
begin
   SetLength(szRetorno, 81);
   iRetorno := iEnviarDadosFormatados_TA2000_Daruma(EDT_Comando.Text, szRetorno);
   if (iRetorno = 1) then
   begin
      EDT_Retorno.Text := szRetorno;
      Application.MessageBox(pchar('Dados enviados com sucesso:' + szRetorno), 'Daruma DLL Framework', mb_ok);
   end
   else
   begin
      Application.MessageBox('Erro no envio dos dados', 'Daruma DLL Framework', MB_OK + MB_ICONERROR);
      ShowMessage(IntToStr(iRetorno));
   end;
end;

procedure TFRM_TesteComunicacao.Imprimir1Click(Sender: TObject);
begin
   EDT_Comando.text := '';
   EDT_Retorno.text := '';

   EDT_Comando.Text := '<limpar>0</limpar><imprimir><texto>Teste</texto><linha>2</linha><coluna>11</coluna></imprimir>';
end;

procedure TFRM_TesteComunicacao.Limpar1Click(Sender: TObject);
begin
   EDT_Comando.text:= '';
   EDT_Retorno.text:= '';

   EDT_Comando.Text:= '<limpar>0</limpar>';
end;

procedure TFRM_TesteComunicacao.Entrada1Click(Sender: TObject);
var
   stComando1 : String;
   stComando2 : String;
   stComando3 : String;
begin
   EDT_Comando.text := '';
   EDT_Retorno.text := '';

   stComando1 := '<limpar>0</limpar><imprimir><texto>Artigo:1234</texto><linha>1</linha><coluna>1</coluna></imprimir><imprimir><texto>Descr:Agua sem Gas</texto><linha>1</linha><coluna>15</coluna></imprimir><imprimir><texto>';
   stComando2 := 'Valor:1234</texto><linha>2</linha><coluna>1</coluna></imprimir><imprimir><texto>Qtda:</texto><linha>2</linha><coluna>12</coluna></imprimir><campo><valor>1</valor><tipo>3</tipo><tamanho>1</tamanho><linha>2</linha>';
   stComando3 := '<coluna>17</coluna></campo><modocursor>2</modocursor><setfocus>1</setfocus><getdadocampo>1</getdadocampo>';

   EDT_Comando.Text:= stComando1 + stComando2 + stComando3;
end;

procedure TFRM_TesteComunicacao.Encerrar1Click(Sender: TObject);
begin
   EDT_Comando.text := '';
   EDT_Retorno.text := '';

   EDT_Comando.Text := '<encerrar>3</encerrar>';
end;

//         '<imprimir>' + #13+#10 +
//         '  <texto>Nome:</texto>         //imprime o texto "nome:"' + #13+#10 +
//         '</imprimir>' + #13+#10 +
//         '<campo>' + #13+#10 +
//         '  <tipo>2</tipo>               //aceita apenas letras' + #13+#10 +
//         '  <tamanho>15</tamanho>        //o tamanho do campo sera 15' + #13+#10 +
//         '</campo>' + #13+#10 +
//         '<imprimir>' + #13+#10 +
//         '  <texto>Fone:</texto>         //imprime o texto "Fone:"' + #13+#10 +
//         '  <linha>2</linha>	         //na 2º linha' + #13+#10 +
//         '</imprimir>' + #13+#10 +
//         '<campo>' + #13+#10 +
//         '  <tipo>1</tipo>               //aceita apenas numeros' + #13+#10 +
//         '  <tamanho>8</tamanho>	 //o tamanho do campo sera 8' + #13+#10 +
//         '</campo>' + #13+#10 +
//         '<combo>' + #13+#10 +
//         '  <linha>1</linha>             //linha 1' + #13+#10 +
//         '  <coluna>15</coluna>          //coluna 15' + #13+#10 +
//         '  <tamanho>10</tamanho>        //o tamanho do combo será 10' + #13+#10 +
//         '  <opcao1>nome</opcao1>        //a primeira opção será nome' + #13+#10 +
//         '  <opcao2>fone</opcao2>        //a segunda opção será fone' + #13+#10 +
//         '</combo>' + #13+#10 +
//         '<setfocus>2</setfocus>          //ativa os campos com foco inicialmente no 2';

procedure TFRM_TesteComunicacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action               := caFree;
   FRM_TesteComunicacao := nil;
end;

end.
