program SaidaEstoque;

uses
  Forms,
  UCadCliente in 'UCadCliente.pas' {FCadPaciente},
  Unit2 in 'Unit2.pas' {DataModule2: TDataModule},
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UDMCAD in 'UDMCAD.pas' {DMCAD: TDataModule},
  ULogin in 'ULogin.pas' {FLogin},
  UCadUsuario in 'UCadUsuario.pas' {FUsuario},
  UCadProduto in 'UCadProduto.pas' {FCadProduto},
  UOrdemServico in 'UOrdemServico.pas' {FOrdemServico},
  ULancMaterial in 'ULancMaterial.pas' {FLancMaterial};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Saida de Estoque';
  Application.CreateForm(TDMCAD, DMCAD);
  Application.CreateForm(TFPrincipal, FPrincipal);
  //Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.
