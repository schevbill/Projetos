program SegundoPlano;

uses
  Forms,
  Principal in 'Principal.pas' {frmPrincipal},
  uThreadPosto in 'uThreadPosto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
