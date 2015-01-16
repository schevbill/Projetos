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


{Adiciona o c�digo fonte de um website o memo}
//==============================================================================
procedure TfrmMain.btnExibirCodClick(Sender: TObject);
//==============================================================================
var
  documentoAtivo : variant;
begin

  //Acessando a interface do site aberto
  documentoAtivo := WebBrowser1.Document;

  //Adicionando o c�digo HTML ao MEMO
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

    //Colocando a ampulheta do windows s� pra saber que est� executando o
    //programa
    Screen.Cursor := crHourGlass;


    //Enquanto o site n�o � carregado totalmente fica no loop at� o estado
    //do ReadyState for 'completo'
    while WebBrowser1.ReadyState <> READYSTATE_COMPLETE do
    begin
      Application.ProcessMessages;
      Sleep(0);
    end;

    //Site foi carregado, tira a ampulheta e coloca a seta no mouse novamente
    Screen.Cursor := crDefault;

    //Site foi carregado, libera o bot�o de vizualizar o c�digo fonte
    btnExibirCod.Enabled := true;
      
  end
  
  //Se nenhuma URL for informada d� uma mensage de erro, e d� focus no edit
  else
  begin

    //Exbindo a mensagem
    ShowMessage('Entre com uma URL');

    //Setando o focus no edit
    edtUrl.SetFocus;
  end;

end;

end.
