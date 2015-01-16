unit ufrmEntrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Gauges, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmEntrada = class(TForm)
    ImageLogo: TImage;
    GGEProgresso: TGauge;
    Label1: TLabel;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEntrada: TfrmEntrada;

implementation

{$R *.dfm}

procedure TfrmEntrada.FormDestroy(Sender: TObject);
begin
   FormStyle := fsNormal;
end;

end.
