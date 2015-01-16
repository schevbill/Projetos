program ProjVerCodigoSite;

uses
  Forms,
  UniMainBrowser in 'UniMainBrowser.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
