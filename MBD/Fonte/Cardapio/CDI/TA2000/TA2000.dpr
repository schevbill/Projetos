program TA2000;

uses
  Forms,
  UNF_TA2000 in 'UNF_TA2000.pas' {FRM_TA2000},
  UNF_TesteComunicacao in 'UNF_TesteComunicacao.pas' {FRM_TesteComunicacao},
  UNF_FTA2000 in 'UNF_FTA2000.pas',
  uSocketPing in 'uSocketPing.pas';

{$R *.res}

begin
  Application.Initialize;
  // Bandeja....
  //Application.ShowMainForm := False;
  Application.CreateForm(TFRM_TA2000, FRM_TA2000);
  Application.Run;
end.
