unit uCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StrUtils, ComCtrls, DB, ADODB, StdCtrls, ExtCtrls, DBCtrls;

type
  TFRMCadastro = class(TForm)
    qryGravar: TADOQuery;
    pcAbas: TPageControl;
    tsTanque: TTabSheet;
    tsBomba: TTabSheet;
    tsBico: TTabSheet;
    pButon: TPanel;
    edtCodAutomacao: TEdit;
    edtLastro: TEdit;
    Label1: TLabel;
    bSair: TButton;
    Label2: TLabel;
    qryProd: TADOQuery;
    qryProdXCD_INT_PRODUTO: TAutoIncField;
    qryProdXDESCRICAO: TStringField;
    dtsProd: TDataSource;
    qryUND: TADOQuery;
    dtsUND: TDataSource;
    Label3: TLabel;
    edtDescricao: TEdit;
    cbProduto: TDBLookupComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtFaltaComp: TEdit;
    edtStqTanq: TEdit;
    Edit2: TEdit;
    cbUnidade: TDBLookupComboBox;
    Label7: TLabel;
    Label8: TLabel;
    qryTurno: TADOQuery;
    qryTurnoXCD_INT_TURNO: TAutoIncField;
    qryTurnoXDESCRICAO: TStringField;
    dtsTurno: TDataSource;
    Label9: TLabel;
    Label10: TLabel;
    cbTurnoInstal: TDBLookupComboBox;
    dtDataInstal: TDateTimePicker;
    dtDataExc: TDateTimePicker;
    Label11: TLabel;
    cbTurnoExc: TDBLookupComboBox;
    Label12: TLabel;
    bNovo: TButton;
    bEditar: TButton;
    bSalvar: TButton;
    bCancelar: TButton;
    qryUNDXCD_INT_UNIDADE: TAutoIncField;
    qryUNDSiglaDesc: TStringField;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;

    function fGravar(Tabela : String) : Boolean;
    procedure pEnabledTS;
    procedure pEnabledBtn;
    procedure pAtualiza;

    procedure bSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bEditarClick(Sender: TObject);
    procedure bSalvarClick(Sender: TObject);
    procedure bCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMCadastro: TFRMCadastro;

implementation

uses Comunicacao;

{$R *.dfm}

{ TForm1 }

procedure TFRMCadastro.bCancelarClick(Sender: TObject);
begin
   pEnabledTS;
   pEnabledBtn;

   pAtualiza;
end;

procedure TFRMCadastro.bEditarClick(Sender: TObject);
begin
   pEnabledTS;
   pEnabledBtn;
end;

procedure TFRMCadastro.bNovoClick(Sender: TObject);
begin
   pEnabledTS;
   pEnabledBtn;

end;

procedure TFRMCadastro.bSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFRMCadastro.bSalvarClick(Sender: TObject);
begin
   pEnabledTS;
   pEnabledBtn;

   pAtualiza;
end;

function TFRMCadastro.fGravar(Tabela: String): Boolean;
begin
//   case AnsiIndexStr(Tabela,['L','B','A']) of
//
//   end;
end;

procedure TFRMCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action      := cafree;
   FRMCadastro := nil;
end;

procedure TFRMCadastro.FormCreate(Sender: TObject);
begin
   pEnabledTS;
   pAtualiza;
end;

procedure TFRMCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If key = #13 then
      begin
         Key := #0;
         Perform(Wm_NextDlgCtl,0,0);
      end;
end;

procedure TFRMCadastro.pAtualiza;
begin
   qryProd.Close;
   qryProd.Open;

   qryUND.Close;
   qryUND.Open;

   qryTurno.Close;
   qryTurno.Open;
end;

procedure TFRMCadastro.pEnabledBtn;
begin
   bNovo.Enabled     := not bNovo.Enabled;
   bEditar.Enabled   := not bEditar.Enabled;
   bSalvar.Enabled   := not bSalvar.Enabled;
   bCancelar.Enabled := not bCancelar.Enabled;
   bSair.Enabled     := not bSair.Enabled;
end;

procedure TFRMCadastro.pEnabledTS;
begin
   tsTanque.Enabled := not tsTanque.Enabled;
   tsBomba.Enabled  := not tsBomba.Enabled;
   tsBico.Enabled   := not tsBico.Enabled;
end;

end.
