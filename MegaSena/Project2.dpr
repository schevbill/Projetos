program Project2;

uses
  Forms,
  Unit1 in 'Unit1.pas' {fEXCEL};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfEXCEL, fEXCEL);
  Application.Run;
end.
