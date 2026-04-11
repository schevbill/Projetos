unit Cadastro.View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Router4D,
  Cadastro.View.ClientesListar, Cadastro.View.ClientesEditar, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    pnlContainer: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure RegistrarRotas;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
// LINK DO VIDEO --> https://www.youtube.com/watch?v=DjjW7ZvLK5k
// Boss -> Router4D e SimpleORM


// 1h 5m video parei

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  RegistrarRotas;
  TRouter4D.Render<TfmClienteListar>.SetElement(pnlContainer);            // 1 Panel apenas
  //TRouter4D.Render<TfmClienteListar>.SetElement(Panel1, pnlContainer);  // 2 painel dentro do outro
end;

procedure TForm1.RegistrarRotas;
begin
  TRouter4D.Switch.Router('ClienteListar',TfmClienteListar);
  TRouter4D.Switch.Router('ClienteEditar',TfmClienteEditar);
end;

end.

