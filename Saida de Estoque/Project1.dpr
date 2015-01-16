program Project1;

uses
  Forms,
  UCadCliente in 'UCadCliente.pas' {FCadCliente},
  Unit2 in 'Unit2.pas' {DataModule2: TDataModule},
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UDMCAD in 'UDMCAD.pas' {DMCAD: TDataModule},
  ULogin in 'ULogin.pas' {FLogin},
  UCadUsuario in 'UCadUsuario.pas' {FUsuario},
  UCadProduto in 'UCadProduto.pas' {FCadProduto},
  UOrdemServico in 'UOrdemServico.pas' {FOrdemServico},
  ULancamentoMaterial in 'ULancamentoMaterial.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Saida de Estoque';
  Application.CreateForm(TFPrincipal, FPrincipal);
  //Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.
