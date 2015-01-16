program Project2;

uses
  Forms,
  Unit1 in 'Unit1.pas' {FrmDuplicidadeC460};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Ledware - Duplicidade C460';
  Application.CreateForm(TFrmDuplicidadeC460, FrmDuplicidadeC460);
  Application.Run;
end.
