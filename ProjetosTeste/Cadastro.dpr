program Cadastro;

uses
  Vcl.Forms,
  Cadastro.View.Main in 'Cadastro.View.Main.pas' {Form1},
  Cadastro.View.ClientesEditar in 'view\Cadastro.View.ClientesEditar.pas' {fmClienteEditar},
  Cadastro.View.ClientesListar in 'view\Cadastro.View.ClientesListar.pas' {fmClienteListar},
  Cadastro.Controller.DTO.Cliente in 'dto\Cadastro.Controller.DTO.Cliente.pas',
  Cadastro.Controller.DTO.Interfaces in 'dto\Cadastro.Controller.DTO.Interfaces.pas',
  Cadastro.Controller in 'controller\Cadastro.Controller.pas',
  Cadastro.Model.Entity.Cliente in 'model\Cadastro.Model.Entity.Cliente.pas',
  Cadastro.Resources.Conexao in 'resources\Cadastro.Resources.Conexao.pas',
  Cadastro.Resources.Interfaces in 'resources\Cadastro.Resources.Interfaces.pas',
  Cadastro.Service.Generic in 'services\Cadastro.Service.Generic.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfmClienteEditar, fmClienteEditar);
  Application.CreateForm(TfmClienteListar, fmClienteListar);
  Application.Run;
end.
