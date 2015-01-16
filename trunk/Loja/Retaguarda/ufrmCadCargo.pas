unit ufrmCadCargo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmModeloCad, Data.DB, IBCustomDataSet,
  IBQuery, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

type
  TfrmCadCargo = class(TfrmModeloCad)
    EDTPESCARGO: TEdit;
    Label3: TLabel;
    CKTODOS: TCheckBox;
    pFundoCargo: TPanel;
    Label1: TLabel;
    EdtCargo: TEdit;
    Label2: TLabel;
    EdtTipo: TEdit;
    qrySelectID_CARGO: TIntegerField;
    qrySelectDESCRICAO: TIBStringField;
    qrySelectTIPO: TIBStringField;

    procedure pAtualizaCargo;
    procedure pCarregarEdit(vID_cargo : Integer);
    procedure pGravarAtualizarDeletar(vStatus : String; vID_CARGO: Integer);

    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CKTODOSClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure gGridPesquisaDblClick(Sender: TObject);
    procedure gGridPesquisaCellClick(Column: TColumn);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure gGridPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    vStatus : string;
  public

     { Public declarations }
  end;

var
  frmCadCargo: TfrmCadCargo;

implementation

{$R *.dfm}

uses ufrmPrincipal, uModule;

procedure TfrmCadCargo.btnAnteriorClick(Sender: TObject);
begin
   inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_CARGO').AsInteger);
end;

procedure TfrmCadCargo.btnEditarClick(Sender: TObject);
begin
   inherited;
   vStatus :='EDITAR';
   pCarregarEdit(qrySelect.FieldByName('ID_CARGO').AsInteger);
   EdtCargo.SetFocus;
end;

procedure TfrmCadCargo.btnExcluirClick(Sender: TObject);
var
  vPergunta : Integer;
begin
   inherited;
   vPergunta := MessageBox(Handle, pchar('Deseja excluir esse registro ?') , pchar(NomeSistema), 36);
   if vPergunta = 6 then
   begin
      pGravarAtualizarDeletar('DELETAR',qrySelect.FieldByName('ID_CARGO').AsInteger);
      pAtualizaCargo;
      pCarregarEdit(qrySelect.FieldByName('ID_CARGO').AsInteger);
   end;
end;

procedure TfrmCadCargo.btnFiltrarClick(Sender: TObject);
begin
   inherited;
   pAtualizaCargo;
end;

procedure TfrmCadCargo.btnGravarClick(Sender: TObject);
var
   vPergunta :Integer;
begin
   vPergunta := MessageBox(Handle, pchar('Deseja gravar esse registro ?') , pchar(NomeSistema), 36);
   if vPergunta = 6 then
   begin
      pGravarAtualizarDeletar(vStatus,qrySelect.FieldByName('ID_CARGO').AsInteger);
      Module.IBTransaction.CommitRetaining;
   end;

   inherited;
   pAtualizacargo;
   pCarregarEdit(qrySelect.FieldByName('ID_CARGO').AsInteger);
end;

procedure TfrmCadCargo.btnNovoClick(Sender: TObject);
begin
   inherited;
   vStatus := 'NOVO';
   EdtCargo.SetFocus;
end;

procedure TfrmCadCargo.btnPrimeiroClick(Sender: TObject);
begin
   inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_CARGO').AsInteger);
end;

procedure TfrmCadCargo.btnProximoClick(Sender: TObject);
begin
   inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_CARGO').AsInteger);
end;

procedure TfrmCadCargo.btnUltimoClick(Sender: TObject);
begin
   inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_CARGO').AsInteger);
end;

procedure TfrmCadCargo.CKTODOSClick(Sender: TObject);
begin
  inherited;
   if CKTODOS.State = cbChecked then
   begin
      EDTPESCARGO.Enabled := false;
      EDTPESCARGO.Text    := '';
   end
   else
   begin
      EDTPESCARGO.Enabled := true;
      EDTPESCARGO.SetFocus;
   end;
end;

procedure TfrmCadCargo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Action := caFree;
   frmCadCargo := nil;
end;

procedure TfrmCadCargo.FormShow(Sender: TObject);
begin
   inherited;
   pAtualizaCargo;
   pCarregarEdit(qrySelect.FieldByName('ID_CARGO').AsInteger);
end;

procedure TfrmCadCargo.gGridPesquisaCellClick(Column: TColumn);
begin
   inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_CARGO').AsInteger);
end;

procedure TfrmCadCargo.gGridPesquisaDblClick(Sender: TObject);
begin
   inherited;
   pFundoCargo.Enabled  := true;
   pcGuia.TabIndex      := 1;
   pCarregarEdit(qrySelect.FieldByName('ID_cargo').AsInteger);
end;

procedure TfrmCadCargo.gGridPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   if (key = #13) and (pcGuia.TabIndex = 0) then
   begin
      pCarregarEdit(qrySelect.FieldByName('ID_cargo').AsInteger);
      pcGuia.TabIndex      := 1;
      pFundoCargo.Enabled  := True;
   end;
end;

procedure TfrmCadcargo.pCarregarEdit(vID_cargo : Integer);
var
   qryCarregar : TIBQuery;
begin
   qryCarregar := TIBQuery.Create(Self);
   with qryCarregar do
   begin
      Database := Module.IBLOJAHS;
      Transaction := Module.IBTransaction;

      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM CARGO        ');
      SQL.Add('WHERE ID_CARGO = :ID_CARGO ');
      ParamByName('ID_CARGO').AsInteger := vID_CARGO;
      Open;

      EdtCargo.Text := FieldByName('DESCRICAO').AsString;
      EdtTipo.Text  := FieldByName('TIPO').AsString;
    end;

   FreeAndNil(qryCarregar);
end;

procedure TfrmCadcargo.pGravarAtualizarDeletar(vStatus: String; vID_cargo: Integer);
begin
   qryGravar.Database    := Module.IBLOJAHS;
   qryGravar.Transaction := Module.IBTransaction;

   if vStatus = 'NOVO' then
   begin
      with qryGravar do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' INSERT INTO CARGO                              ');
         SQL.Add(' (                                              ');
         SQL.Add(' ID_CARGO, DESCRICAO, TIPO                      ');
         SQL.Add(' )                                              ');
         SQL.Add(' VALUES                                         ');
         SQL.Add(' (                                              ');
         SQL.Add(' :ID_CARGO, :DESCRICAO, :TIPO  ');
         SQL.Add(' )                                              ');
         ParamByName('ID_CARGO').AsInteger := 0;
      end;
   end
   else if vStatus = 'EDITAR' then
   begin
      with qryGravar do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' UPDATE CARGO SET DESCRICAO = :DESCRICAO, TIPO = :TIPO      ');
         SQL.Add(' WHERE ID_CARGO = :ID_CARGO                           ');
         ParamByName('ID_CARGO').Value := vID_CARGO;
      end;
   end
   else
   begin
      with qryGravar do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' DELETE FROM CARGO          ');
         SQL.Add(' WHERE ID_CARGO = :ID_CARGO ');
         ParamByName('ID_CARGO').Value := vID_CARGO;
      end;
   end;

   if vStatus <> 'DELETAR' then
   begin
      with qryGravar do
      begin
         ParamByName('DESCRICAO').AsString       := EdtCargo.Text;
         ParamByName('TIPO').AsString            := EdtTipo.Text;
      end;
   end;

   qryGravar.ExecSQL;
   Module.IBTransaction.CommitRetaining;
end;




procedure TfrmCadcargo.pAtualizaCargo;
begin


   with qrySelect do
   begin
      Close;
      SQL.Clear;
      sql.Add('SELECT ID_CARGO, DESCRICAO, TIPO');
      sql.Add('FROM CARGO    ');
      SQL.Add('WHERE (1 = 1) ');

      if CKTODOS.Checked = FALSE then
      begin
         SQL.Add('AND upper(DESCRICAO) LIKE upper(:CARGO)');
         ParamByName('CARGO').AsString := '%'+EDTPESCARGO.TEXT+'%';
      end;
      Open;
   end;
end;

end.
