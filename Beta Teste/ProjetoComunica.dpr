program ProjetoComunica;

uses
  Forms,
  Comunicacao in 'Comunicacao.pas' {FRM_Comunica},
  FunCompCub in 'FunCompCub.pas',
  uPosto in 'uPosto.pas' {FrmPosto},
  uThread in 'uThread.pas',
  uCadastro in 'uCadastro.pas' {FRMCadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFRM_Comunica, FRM_Comunica);
  Application.Run;
end.
