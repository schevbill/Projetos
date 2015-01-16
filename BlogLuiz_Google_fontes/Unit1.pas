unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, OleCtrls, SHDocVw, StdCtrls, ComCtrls, Buttons;

type
  TfrmMain = class(TForm)
    web: TWebBrowser;
    Panel1: TPanel;
    edEnd1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    edEnd2: TEdit;
    StatusBar1: TStatusBar;
    Label2: TLabel;
    Label3: TLabel;
    ProgressBar1: TProgressBar;
    Label4: TLabel;
    edDistancia: TEdit;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    ListBox1: TListBox;
    Button2: TButton;
    re1: TRichEdit;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure webProgressChange(Sender: TObject; Progress,
      ProgressMax: Integer);
    procedure webStatusTextChange(Sender: TObject; const Text: WideString);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    procedure PegaTotal;
    function GetElementIdValue(WebBrowser: TWebBrowser; TagName, TagId,
      TagAttrib: string): string;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses MSHTML;

{$R *.dfm}

function TfrmMain.GetElementIdValue(WebBrowser: TWebBrowser;
  TagName, TagId, TagAttrib: string):string;
var
  Document: IHTMLDocument2;
  Body: IHTMLElement2;
  Tags: IHTMLElementCollection;
  Tag: IHTMLElement;
  I: Integer;
begin
  Result:='';
  if not Supports(WebBrowser.Document, IHTMLDocument2, Document) then
    raise Exception.Create('Documento HTML inválido');
  if not Supports(Document.body, IHTMLElement2, Body) then
    raise Exception.Create('Não foi possível encontrar o elemento <body>');
  Tags := Body.getElementsByTagName(UpperCase(TagName));
  for I := 0 to Pred(Tags.length) do
  begin
    Tag:=Tags.item(I, EmptyParam) as IHTMLElement;
    if Tag.id=TagId then Result := Tag.getAttribute(TagAttrib, 0);
  end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  Web.Navigate(ExtractFilePath(Application.ExeName) + 'google.html');
end;

procedure TfrmMain.Button1Click(Sender: TObject);
var
   JSFn: string ;
begin
  if (Trim(edEnd1.text)='') or (Trim(edEnd2.text)='') then exit;

  JSFn := Format( 'calcRoute("%s","%s")', [edEnd1.Text, edEnd2.Text]);

   with Web.Document as IHTMLDocument2 do
     parentWindow.execScript(JSFn, 'JavaScript' );
end ;

procedure TfrmMain.PegaTotal;
begin
  try
    edDistancia.Text := GetElementIdValue(web, 'input', 'inputTotal', 'value') +
      ' Km';
  except
    // handle exception in case JavaScript fails to run
  end;
end;

procedure TfrmMain.FormResize(Sender: TObject);
var
  r: TRect;
const
  SB_GETRECT = WM_USER + 10;
begin
  // Definindo onde ficará a progressbar, neste caso será
  //Na barra de Status, no painel 1
  Statusbar1.Perform(SB_GETRECT, 1, Integer(@R));
  ProgressBar1.Parent := Statusbar1;
  ProgressBar1.SetBounds(r.Left, r.Top,
    r.Right - r.Left - 5, r.Bottom - r.Top);
end;

procedure TfrmMain.webProgressChange(Sender: TObject; Progress,
  ProgressMax: Integer);
begin
  if (Progress >= 1) and (ProgressMax > 1) then
  begin
    ProgressBar1.Position := Round((Progress * 100)
      div ProgressMax);
    ProgressBar1.Visible := True;
  end
  else
  begin
    ProgressBar1.Position := 1;
    ProgressBar1.Visible := False;
  end;
end;

procedure TfrmMain.webStatusTextChange(Sender: TObject;
  const Text: WideString);
begin
  StatusBar1.Panels[0].Text := Text;

  if Text = 'Concluído' then
    PegaTotal;

end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
  PegaTotal;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
//  memo1.Clear;
//  with web.Document as IHTMLDocument2 do
//    with body.all as IHTMLElementCollection do
//      with item('directionsPanel', 0) as HTMLDivElement do
//      begin
//        memo1.Lines.Add(innerText);
//      end;
end;

end.

