program Control;

uses
  Forms,
  UCadCliente in 'UCadCliente.pas' {FCadCliente},

  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UDMCAD in 'UDMCAD.pas' {DMCAD: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMCAD, DMCAD);
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFCadCliente, FCadCliente);
 
  Application.Run;
end.
