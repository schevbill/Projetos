program Hightech_System;

uses
  Vcl.Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {frmPrincipal},
  ufrmModeloCad in 'ufrmModeloCad.pas' {frmModeloCad},
  uModule in 'uModule.pas' {Module: TDataModule},
  ufrmEntrada in 'ufrmEntrada.pas' {frmEntrada},
  Vcl.Themes,
  Vcl.Styles,
  uFuncoes in 'uFuncoes.pas',
  ufrmCadCidade in 'ufrmCadCidade.pas' {frmCadCidade},
  UfrmFuncionario in 'UfrmFuncionario.pas' {frmCadFuncionario},
  funCEP in 'funCEP.pas',
  ufrmCadCargo in 'ufrmCadCargo.pas' {frmCadCargo},
  ufrmCadTurno in 'ufrmCadTurno.pas' {frmCadTurno},
  ufrmCadUsuario in 'ufrmCadUsuario.pas' {frmCadUsuario},
  ufrmCadClifor in 'ufrmCadClifor.pas' {frmCadClifor};

{$R *.res}

begin
   frmEntrada := TfrmEntrada.Create(Application);
   frmEntrada.Show;
   frmEntrada.Refresh;
   Application.Initialize;
   Application.MainFormOnTaskbar := True;
   FRMEntrada.Refresh;
   Application.Title := 'Hightech System';
   TStyleManager.TrySetStyle('Cyan Dusk');
   Application.CreateForm(TModule, Module);
   Application.CreateForm(TfrmPrincipal, frmPrincipal);
  // VERIFICAR O ERRO AQUI   FRMEntrada.Refresh;
//   Frm_NLogin := TFrm_NLogin.Create(Application);
//   Frm_NLogin.ShowModal;
//   FRM_Entrada.Refresh;
   Application.Run;

end.
