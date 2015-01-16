program MSP;

uses
  Forms,
  UNF_MSP in 'UNF_MSP.pas' {FRM_MSP};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFRM_MSP, FRM_MSP);
  Application.Run;
end.
