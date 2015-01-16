unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Soap.InvokeRegistry, Vcl.StdCtrls,
  Vcl.Buttons, Soap.Rio, Soap.SOAPHTTPClient, Vcl.Mask, Vcl.Touch.Keyboard;

const
   LoginCep = 'mbd';
   SenhaCEP = 'mbd0email';

type
  TfrmPrincipal = class(TForm)
    HTTPRIO: THTTPRIO;
    eLogradouro: TEdit;
    eBairro: TEdit;
    eUF: TEdit;
    btnImportar: TBitBtn;
    mCEP: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    eCidade: TEdit;
    Keyboard: TTouchKeyboard;
    Label6: TLabel;
    eCEP2: TEdit;
    procedure pTeclado(Layout : Integer);
    procedure pBuscarWS;
    procedure btnImportarClick(Sender: TObject);
    procedure eCEP2Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eLogradouroEnter(Sender: TObject);
    procedure eCEP21Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses funCEP;

procedure TfrmPrincipal.btnImportarClick(Sender: TObject);
begin
   pBuscarWS;
end;

procedure TfrmPrincipal.eCEP21Enter(Sender: TObject);
begin
   pTeclado(1);
end;

procedure TfrmPrincipal.eCEP2Enter(Sender: TObject);
begin
   pTeclado(1);
end;

procedure TfrmPrincipal.eLogradouroEnter(Sender: TObject);
begin
   pTeclado(0);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   eCEP2.SetFocus;
end;

procedure TfrmPrincipal.pBuscarWS;
var
   ser   : CEPServicePort;
   lista : TStringList;
   CEP   : String;
   CEP2  : ArrayOfstring;
   i     : Integer;
begin
   try
      mCEP.Text := '';
      ser       := GetCEPServicePorT(false,'',HTTPRIO);

      if eCEP2.Text <> '' then
      begin
         CEP   := ser.obterLogradouroAuth(eCEP2.Text,LoginCep,SenhaCEP);
         lista := TStringList.Create;
         ExtractStrings([','],[' '],pchar(CEP),lista);

         mCEP.Text        := CEP;
         eLogradouro.Text := TRIM(lista.Strings[0]);
         eBairro.Text     := TRIM(lista.Strings[1]);
         eCidade.Text     := TRIM(lista.Strings[2]);
         eUF.Text         := TRIM(lista.Strings[3]);
      end
      else
      begin


         CEP2      := ser.obterCEPAuth(eLogradouro.Text,eCidade.Text,eUF.Text,LoginCep,SenhaCEP);
//               pos(cep2,',');


//         mCEP.Text := CEP2;

//         eCEP2.Text       := TRIM(lista.Strings[0]);
//         eLogradouro.Text := TRIM(lista.Strings[1]);
//         eBairro.Text     := TRIM(lista.Strings[2]);
//         eCidade.Text     := TRIM(lista.Strings[3]);
//         eUF.Text         := TRIM(lista.Strings[4]);
      end;

   except
      mCEP.Text := 'NÃO EXISTE !!'
   end;

   FreeAndNil(lista);
end;

procedure TfrmPrincipal.pTeclado(Layout: Integer);
begin
   if Layout = 0 then
   begin
      ActivateKeyboardLayout(67699721 {en-US}, 0);
      Keyboard.Layout   := 'Standard';
      Keyboard.Top      := 144;
      Keyboard.Left     := 18;
      Keyboard.Height   := 180;
      Keyboard.Width    := 555;
      Application.ProcessMessages;
      Keyboard.Redraw;
   end
   else
   begin
      ActivateKeyboardLayout(67699721 {en-US}, 0);
      Keyboard.Layout   := 'NumPad';
      Keyboard.Top      := 144;
      Keyboard.Left     := 201;
      Keyboard.Height   := 180;
      Keyboard.Width    := 231;
      Application.ProcessMessages;
      Keyboard.Redraw;
   end;
end;

end.
