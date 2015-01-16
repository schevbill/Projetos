unit UniMainBrowser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, OleCtrls, SHDocVw, ComCtrls;

type
  TfrmMain = class(TForm)
    WebBrowser1: TWebBrowser; //utilizando o componente TWebBrowser
    MemoCodFonte: TMemo;
    Panel1: TPanel;
    edtUrl: TEdit;
    btnNavegar: TButton;
    btnExibirCod: TButton;
    Label1: TLabel;
    procedure btnNavegarClick(Sender: TObject);
    procedure btnExibirCodClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}


{Adiciona o código fonte de um website o memo}
//==============================================================================
procedure TfrmMain.btnExibirCodClick(Sender: TObject);
//==============================================================================
var
  documentoAtivo : variant;
begin

  //Acessando a interface do site aberto
  documentoAtivo := WebBrowser1.Document;

  //Adicionando o código HTML ao MEMO
  MemoCodFonte.text := documentoAtivo.Body.OuterHTML;
  
end;


{Acessa o website}
//==============================================================================
procedure TfrmMain.btnNavegarClick(Sender: TObject);
//==============================================================================
begin

  //Verifica se foi informado alguma URL
  if edtUrl.Text <> '' then
  begin

    //Acessando o website informado no edit
    WebBrowser1.Navigate(edtUrl.Text);

    //Colocando a ampulheta do windows só pra saber que está executando o
    //programa
    Screen.Cursor := crHourGlass;


    //Enquanto o site não é carregado totalmente fica no loop até o estado
    //do ReadyState for 'completo'
    while WebBrowser1.ReadyState <> READYSTATE_COMPLETE do
    begin
      Application.ProcessMessages;
      Sleep(0);
    end;

    //Site foi carregado, tira a ampulheta e coloca a seta no mouse novamente
    Screen.Cursor := crDefault;

    //Site foi carregado, libera o botão de vizualizar o código fonte
    btnExibirCod.Enabled := true;
      
  end
  
  //Se nenhuma URL for informada dá uma mensage de erro, e dá focus no edit
  else
  begin

    //Exbindo a mensagem
    ShowMessage('Entre com uma URL');

    //Setando o focus no edit
    edtUrl.SetFocus;
  end;

end;

end.
