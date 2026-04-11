unit Cadastro.View.ClientesEditar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Router4D, Router4D.Interfaces, Cadastro.Controller;

type
  TfmClienteEditar = class(TForm, iRouter4DComponent)
    pnlFundo: TPanel;
    pnlButton: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    pnlCentro: TPanel;
    edtNome: TEdit;
    edtIdade: TEdit;
    DtNascimento: TDateTimePicker;
    lbNome: TLabel;
    lbIdade: TLabel;
    lbNascimento: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    Fcontroller: iController;
  public
    { Public declarations }
    function Render: TForm;
    procedure UnRender;
  end;

var
  fmClienteEditar: TfmClienteEditar;

implementation

uses
   Router4D.Props;

{$R *.dfm}

{ TfmClienteEditar }

procedure TfmClienteEditar.btnCancelarClick(Sender: TObject);
begin
  TRouter4D
    .Link
    .&To('ClienteListar',Tprops.Create.PropString('True'));
end;

procedure TfmClienteEditar.btnSalvarClick(Sender: TObject);
begin
  Fcontroller
    .Cliente
      .Nome(edtNome.Text)
      .Idade(StrToIntDef(edtIdade.Text, 0))
      .Data_Nascimento(DtNascimento.Date)
    .Build
      .Inserir;
end;

function TfmClienteEditar.Render: TForm;
begin
  Fcontroller := TController.New;
  Result := Self;
end;

procedure TfmClienteEditar.UnRender;
begin

end;

end.
