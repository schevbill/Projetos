unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, DB, IBCustomDataSet,
  IBDatabase, IBTable;

type
  TFCadCliente = class(TForm)
    DataSource1: TDataSource;
    IBDCADCLIENTE: TIBDatabase;
    IBTCADCLIENTE: TIBTable;
    IBTransaction1: TIBTransaction;
    IBTCADCLIENTECODIGO: TSmallintField;
    IBTCADCLIENTENOME: TIBStringField;
    IBTCADCLIENTEENDERECO: TIBStringField;
    IBTCADCLIENTETELEFONE: TIBStringField;
    IBTCADCLIENTEID_CLIENTE: TIntegerField;
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    DBECODIGO: TDBEdit;
    Label2: TLabel;
    DBENOME: TDBEdit;
    Label3: TLabel;
    DBEENDERECO: TDBEdit;
    DBETELEFONE: TDBEdit;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadCliente: TFCadCliente;

implementation

{$R *.dfm}

procedure TFCadCliente.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
 if DBECODIGO.Text = '' then
 begin
  MessageDlg('Campo Codigo precisa ser preenchido',mtInformation,[mbYes],0);
  exit;
 end;
end;

procedure TFCadCliente.FormCreate(Sender: TObject);
begin
 IBDCADCLIENTE.Connected := true;
 IBTCADCLIENTE.Active    := true;
end;

end.
