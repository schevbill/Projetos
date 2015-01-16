unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Bematech_FI_AbrePortaSerial: Integer; StdCall; External 'BEMAFI32.DLL';
  function Bematech_FI_FechaPortaSerial: Integer; StdCall; External 'BEMAFI32.DLL';

  function Bematech_FI_AbreCupomMFD(CGC: String; Nome: String; Endereco : String): Integer; StdCall; External 'BEMAFI32.DLL';
  function Bematech_FI_AbreCupom(CGC: String): Integer; StdCall; External 'BEMAFI32.DLL';
  function Bematech_FI_CancelaCupom: Integer; StdCall; External 'BEMAFI32.DLL';
var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
   Bematech_FI_AbrePortaSerial();


   Bematech_FI_AbreCupom( pchar( '' ) );
   Bematech_FI_CancelaCupom();

   Bematech_FI_AbreCupomMFD('31387015826','TESTE','RUA SEM NADA');
   Bematech_FI_CancelaCupom();
end;

end.
