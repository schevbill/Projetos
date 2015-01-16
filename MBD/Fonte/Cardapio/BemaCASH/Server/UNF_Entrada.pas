unit UNF_Entrada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, jpeg, Gauges, IniFileS;

type
  TFRM_Entrada = class(TForm)
    PNL_Entarda: TPanel;
    GGE_Progresso: TGauge;
    STT_Firma: TStaticText;
    STT_MBD: TStaticText;
    STT_Aguarde: TStaticText;
    Panel1: TPanel;
    IMG_MBD: TImage;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_Entrada: TFRM_Entrada;

implementation

uses UNF_Funcoes;

{$R *.DFM}

procedure TFRM_Entrada.FormDestroy(Sender: TObject);
begin
 FormStyle := fsNormal;
end;

procedure TFRM_Entrada.FormCreate(Sender: TObject);
var
   Ini : TIniFile;
  _app : String;
begin
   _app := GetCurrentDir;
    Ini := TIniFile.Create( _app+'\CONFIG.INI' );

   Try
     { Configura Empresa }
     dnome      := Ini.ReadString( 'DADOSEMPRESA', 'NOME'      , 'Cardapio' );
     dcnpj      := Ini.ReadString( 'DADOSEMPRESA', 'CNPJ'      , '' );
     dendereco  := Ini.ReadString( 'DADOSEMPRESA', 'ENDERECO'  , '' );
     dadicional := Ini.ReadString( 'DADOSEMPRESA', 'ADICIONAL' , '' );
     dtelefone  := Ini.ReadString( 'DADOSEMPRESA', 'TELEFONE'  , '' );

     Ini.Free;
   except
     Exit;
   end;

   if AllTrim(dnome) = '' then
      dnome := 'Cardapio';

   STT_Firma.Caption := dnome;
end;

end.
