unit ufrmCadCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmModeloCad, Vcl.DBCtrls, Vcl.Mask,
  Vcl.Imaging.pngimage, IBTable, Data.DB, IBCustomDataSet, Vcl.StdCtrls,
  IBQuery, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  ACBrBase, ACBrValidador;

type
  TfrmCadCidade = class(TfrmModeloCad)
    dtsFiltro: TDataSource;
    Label1: TLabel;
    cbxTodos: TCheckBox;
    edtCidade: TEdit;
    pFundoCad: TPanel;
    dblcUF: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    qrySelectID_CIDADE: TIntegerField;
    qrySelectDESCRICAO: TIBStringField;
    qrySelectCODIGO_IBGE: TIntegerField;
    QRYFILTRO: TIBQuery;
    qrySelectESTADO: TIBStringField;
    edtCodIbge: TEdit;
    edtDescCidade: TEdit;

    procedure pAtualizar;
    procedure pGravarAtualizarDeletar(vStatus : String; vID_CID: Integer);
    procedure pCarregarEdit(vID_CID : Integer);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbxTodosClick(Sender: TObject);
    procedure edtCidadeChange(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure gGridPesquisaDblClick(Sender: TObject);
    procedure gGridPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure gGridPesquisaCellClick(Column: TColumn);
  private
    { Private declarations }
    vStatus :string;
  public
    { Public declarations }

  end;

var
  frmCadCidade: TfrmCadCidade;

implementation

{$R *.dfm}

uses uModule, ufrmPrincipal;

procedure TfrmCadCidade.pAtualizar;
begin
   with qrySelect do
   begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT CID.ID_CIDADE, CID.descricao, CID.CODIGO_IBGE, U.ESTADO ');
      SQL.Add('FROM CIDADE CID ');
      SQL.Add('INNER JOIN UF U ON (CID.id_uf = U.ID_UF) ');
      SQL.Add('WHERE (1 = 1)');

      if not cbxTodos.Checked then
      begin
         SQL.Add('AND upper(CID.DESCRICAO) LIKE upper(:P_CIDADE)');
         ParamByName('P_CIDADE').AsString := '%'+edtCidade.Text+'%';
      end;
      Open;
   end;
end;

procedure TfrmCadCidade.btnAnteriorClick(Sender: TObject);
begin
   inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_CIDADE').AsInteger);
end;

procedure TfrmCadCidade.btnEditarClick(Sender: TObject);
begin
   inherited;
   vStatus := 'EDITAR';
   pCarregarEdit(qrySelect.FieldByName('ID_CIDADE').AsInteger);
   edtDescCidade.SetFocus;
end;

procedure TfrmCadCidade.btnExcluirClick(Sender: TObject);
var
   vPergunta : Integer;
begin
   inherited;
   vPergunta := MessageBox(Handle, pchar('Deseja excluir esse registro ?') , pchar(NomeSistema), 36);
   if vPergunta = 6 then
   begin
      pGravarAtualizarDeletar('DELETAR',qrySelect.FieldByName('ID_CIDADE').AsInteger);
      pAtualizar;
      pCarregarEdit(qrySelect.FieldByName('ID_CIDADE').AsInteger);
   end;
end;

procedure TfrmCadCidade.btnFiltrarClick(Sender: TObject);
begin
   inherited;
   PAtualizar;
end;

procedure TfrmCadCidade.btnGravarClick(Sender: TObject);
var
   vPergunta : Integer;
begin
   vPergunta := MessageBox(Handle, pchar('Deseja gravar esse registro ?') , pchar(NomeSistema), 36);
   if vPergunta = 6 then
   begin
      pGravarAtualizarDeletar(vStatus,qrySelect.FieldByName('ID_CIDADE').AsInteger);
      Module.IBTransaction.CommitRetaining;
   end;

   inherited;
   pAtualizar;
   pCarregarEdit(qrySelect.FieldByName('ID_CIDADE').AsInteger);
end;

procedure TfrmCadCidade.btnNovoClick(Sender: TObject);
begin
   inherited;
   vStatus := 'NOVO';
   dblcUF.KeyValue := null;
   edtDescCidade.SetFocus;
end;

procedure TfrmCadCidade.btnPrimeiroClick(Sender: TObject);
begin
   inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_CIDADE').AsInteger);
end;

procedure TfrmCadCidade.btnProximoClick(Sender: TObject);
begin
   inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_CIDADE').AsInteger);
end;

procedure TfrmCadCidade.btnUltimoClick(Sender: TObject);
begin
   inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_CIDADE').AsInteger);
end;

procedure TfrmCadCidade.cbxTodosClick(Sender: TObject);
begin
   inherited;
   if not cbxTodos.Checked then
   begin
      edtCidade.Enabled := True;
      edtCidade.SetFocus;
   end
   else
   begin
      edtCidade.Text    := '';
      edtCidade.Enabled := False;
   end;
end;

procedure TfrmCadCidade.edtCidadeChange(Sender: TObject);
begin
   inherited;
 //  pAtualizar;
end;

procedure TfrmCadCidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Action       := caFree;
   frmCadCidade := nil;
end;

procedure TfrmCadcidade.pGravarAtualizarDeletar(vStatus: String; vID_CID: Integer);
begin
   qryGravar.Database    := Module.IBLOJAHS;
   qryGravar.Transaction := Module.IBTransaction;

   try
      if vStatus = 'NOVO' then
      begin
         with qryGravar do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' INSERT INTO CIDADE                           ');
            SQL.Add(' (                                            ');
            SQL.Add(' ID_CIDADE, DESCRICAO, CODIGO_IBGE, ID_UF     ');
            SQL.Add(' )                                            ');
            SQL.Add(' VALUES                                       ');
            SQL.Add(' (                                            ');
            SQL.Add(' :ID_CIDADE, :DESCRICAO, :CODIGO_IBGE, :ID_UF ');

            SQL.Add(' )                                            ');
            ParamByName('ID_CIDADE').AsInteger := 0;
         end;
      end
      else if vStatus = 'EDITAR' then
      begin
         with qryGravar do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' UPDATE CIDADE SET DESCRICAO = :DESCRICAO,  ');
            SQL.Add(' CODIGO_IBGE = :CODIGO_IBGE, ID_UF = :ID_UF ');
            SQL.Add(' WHERE ID_CIDADE = :ID_CIDADE               ');
            ParamByName('ID_CIDADE').Value := vID_CID;
         end;
      end
      else
      begin
         with qryGravar do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' DELETE FROM CIDADE           ');
            SQL.Add(' WHERE ID_CIDADE = :ID_CIDADE ');
            ParamByName('ID_CIDADE').Value := vID_CID;
         end;
      end;

      if vStatus <> 'DELETAR' then
      begin
         with qryGravar do
         begin
            ParamByName('DESCRICAO').AsString       := edtDescCidade.Text;
            ParamByName('CODIGO_IBGE').AsInteger    := strtoint(edtCodIbge.Text);
            ParamByName('ID_UF').AsInteger          := dblcUF.KeyValue;
         end;
      end;

      qryGravar.ExecSQL;
      Module.IBTransaction.CommitRetaining;
   except
      On E: Exception Do
      begin
         MessageBox(Handle, pchar(E.Message) , pchar(NomeSistema), 16);
       end;
   end;
end;

procedure TfrmCadCIDADE.pCarregarEdit(vID_CID : Integer);
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
      SQL.Add('SELECT * FROM CIDADE         ');
      SQL.Add('WHERE ID_CIDADE = :ID_CIDADE ');
      ParamByName('ID_CIDADE').AsInteger := vID_CID;
      Open;

      edtDescCidade.Text   := FieldByName('DESCRICAO').AsString;
      edtCodIbge.Text      := FieldByName('CODIGO_IBGE').AsString;
      dblcUF.KeyValue      := FieldByName('ID_UF').AsInteger;
    end;

   FreeAndNil(qryCarregar);
end;

procedure TfrmCadCidade.FormShow(Sender: TObject);
begin
   inherited;
   pAtualizar;
   pCarregarEdit(qrySelect.FieldByName('ID_CIDADE').AsInteger);
end;

procedure TfrmCadCidade.gGridPesquisaCellClick(Column: TColumn);
begin
   inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_CIDADE').AsInteger);
end;

procedure TfrmCadCidade.gGridPesquisaDblClick(Sender: TObject);
begin
   inherited;
   pFundoCad.Enabled  := True;
   pcGuia.TabIndex    := 1;
   pCarregarEdit(qrySelect.FieldByName('ID_CIDADE').AsInteger);
end;

procedure TfrmCadCidade.gGridPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   if (key = #13) and (pcGuia.TabIndex = 0) then
   begin
      pCarregarEdit(qrySelect.FieldByName('ID_CIDADE').AsInteger);
      pcGuia.TabIndex    := 1;
      pFundoCad.Enabled  := True;
   end;
end;

end.
