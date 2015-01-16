program HSMedicalSys;

uses
  Vcl.Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {frmPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  ufrmEntrada in 'ufrmEntrada.pas' {frmEntrada},
  uFuncoes in 'uFuncoes.pas',
  uModule in 'uModule.pas' {Module: TDataModule},
  ufrmModeloCad in 'ufrmModeloCad.pas' {frmModeloCad},
  funCEP in 'funCEP.pas',
  ufrmCadCargo in 'ufrmCadCargo.pas' {frmCadCargo},
  ufrmCadCidade in 'ufrmCadCidade.pas' {frmCadCidade};

{$R *.res}

begin
   frmEntrada := TfrmEntrada.Create(Application);
   frmEntrada.Show;
   frmEntrada.Refresh;
   Application.Initialize;
   Application.MainFormOnTaskbar := True;
   frmEntrada.Refresh;
   Application.Title := 'HS - Medical Sys';
   TStyleManager.TrySetStyle('Iceberg Classico');
   Application.CreateForm(TModule, Module);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  // VERIFICAR O ERRO AQUI   FRMEntrada.Refresh;
//   Frm_NLogin := TFrm_NLogin.Create(Application);
//   Frm_NLogin.ShowModal;
//   FRM_Entrada.Refresh;
   Application.Run;
end.
