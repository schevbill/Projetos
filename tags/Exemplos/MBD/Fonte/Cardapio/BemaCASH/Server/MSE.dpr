program MSE;

uses
  Forms,
  UNF_MSE in 'UNF_MSE.pas' {FRM_MSE};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFRM_MSE, FRM_MSE);
  Application.Run;
end.
