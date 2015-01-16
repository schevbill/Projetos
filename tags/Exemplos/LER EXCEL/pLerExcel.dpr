program pLerExcel;

uses
  Forms,
  uEXCEL in 'uEXCEL.pas' {fLedEXCEL};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfLedEXCEL, fLedEXCEL);
  Application.Run;
end.
