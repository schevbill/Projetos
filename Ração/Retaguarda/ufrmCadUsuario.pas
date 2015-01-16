unit ufrmCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmModeloCad, Data.DB, IBCustomDataSet,
  IBQuery, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.DBCtrls, ACBrBase, ACBrValidador;

type
  TfrmCadUsuario = class(TfrmModeloCad)
    Panel1: TPanel;
    Label1: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Label2: TLabel;
    edtConfSenha: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBLFUNCIONARIO: TDBLookupComboBox;
    qryFuncionario: TIBQuery;
    dtsFuncionario: TDataSource;
    qryFuncionarioID_FUNCIONARIO: TIntegerField;
    qryFuncionarioNOME: TIBStringField;
    qryFuncionarioDT_NASCTO: TDateField;
    qryFuncionarioENDERECO: TIBStringField;
    qryFuncionarioBAIRRO: TIBStringField;
    qryFuncionarioID_CIDADE: TIntegerField;
    qryFuncionarioID_UF: TIntegerField;
    qryFuncionarioTELEFONE: TIBStringField;
    qryFuncionarioATIVO: TIBStringField;
    qryFuncionarioADMISSAO: TDateField;
    qryFuncionarioDEMISSAO: TDateField;
    qryFuncionarioID_TURNO: TIntegerField;
    qryFuncionarioID_CARGO: TIntegerField;
    qryFuncionarioOBSERVACAO: TBlobField;
    qryFuncionarioCOMISSAO: TFloatField;
    qryFuncionarioRG: TIBStringField;
    qryFuncionarioCPF: TIBStringField;
    qryFuncionarioCEP: TIBStringField;
    Label5: TLabel;
    edtpescUsuario: TEdit;
    ckTodos: TCheckBox;
    qrySelectID_USUARIO: TIntegerField;
    qrySelectLOGIN: TIBStringField;
    qrySelectSENHA: TIBStringField;
    qrySelectID_FUNCIONARIO: TIntegerField;
    qrySelectNOME: TIBStringField;
    chkExibirSenha: TCheckBox;

    procedure pAtualizaUsuario;
    procedure pGravarAtualizarDeletar(vStatus : String; vID_usuario: Integer);
    procedure pCarregarEdit(vID_usuario : Integer);

    procedure btnGravarClick(Sender: TObject);
    procedure ckTodosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gGridPesquisaCellClick(Column: TColumn);
    procedure gGridPesquisaDblClick(Sender: TObject);
    procedure gGridPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure chkExibirSenhaClick(Sender: TObject);

  private
    { Private declarations }
    vStatus :string;
  public
    { Public declarations }
  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

{$R *.dfm}

uses UfrmFuncionario, ufrmPrincipal, uModule, uFuncoes;

procedure TfrmCadUsuario.pGravarAtualizarDeletar(vStatus: String; vID_USUARIO: Integer);
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
            SQL.Add(' INSERT INTO USUARIO                        ');
            SQL.Add(' (                                              ');
            SQL.Add(' ID_USUARIO,ID_FUNCIONARIO,LOGIN, SENHA         ');
            SQL.Add(' )                                              ');
            SQL.Add(' VALUES                                         ');
            SQL.Add(' (                                              ');
            SQL.Add(' :ID_USUARIO,:ID_FUNCIONARIO,:LOGIN, :SENHA ');
            SQL.Add(' )                                              ');
            ParamByName('ID_USUARIO').AsInteger := 0;
         end;
      end
      else if vStatus = 'EDITAR' then
      begin
         with qryGravar do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' UPDATE USUARIO SET LOGIN = :LOGIN, SENHA = :SENHA,           ');
            SQL.Add(' ID_FUNCIONARIO = :ID_FUNCIONARIO,ID_USUARIO = :ID_USUARIO    ');
            SQL.Add(' WHERE ID_USUARIO = :ID_USUARIO                       ');
            ParamByName('ID_USUARIO').Value := vID_USUARIO;
         end;
      end
      else
      begin
         with qryGravar do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' DELETE FROM USUARIO                ');
            SQL.Add(' WHERE ID_USUARIO = :ID_USUARIO ');
            ParamByName('ID_USUARIO').Value := vID_USUARIO;
         end;
      end;

      if vStatus <> 'DELETAR' then
      begin
         with qryGravar do
         begin
            ParamByName('ID_FUNCIONARIO').AsInteger := DBLFUNCIONARIO.KeyValue;
//            ParamByName('LOGIN').AsString           := cryptNova(edtUsuario.Text,False);
//            ParamByName('SENHA').AsString           := cryptNova(edtSenha.Text,False);
            ParamByName('LOGIN').AsString           := crypt(edtUsuario.Text);
            ParamByName('SENHA').AsString           := crypt(edtSenha.Text);
         end;
      end;

      qryGravar.ExecSQL;
      Module.IBTransaction.CommitRetaining;
   Except
      On E: Exception Do
      begin
         MessageBox(Handle, pchar(E.Message) , pchar(NomeSistema), 16);
       end;
   end;
end;

procedure TfrmCadUSUARIO.pCarregarEdit(vID_USUARIO : Integer);
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
      SQL.Add('SELECT * FROM USUARIO          ');
      SQL.Add('WHERE ID_USUARIO = :ID_USUARIO ');
      ParamByName('ID_USUARIO').AsInteger := vID_USUARIO;
      Open;

      DBLFUNCIONARIO.KeyValue := FieldByName('ID_FUNCIONARIO').AsInteger;
//      edtUsuario.Text         := cryptNova(FieldByName('LOGIN').AsString,chkExibirUsuario.Checked);
//      edtSenha.Text           := cryptNova(FieldByName('SENHA').AsString,chkExibirSenha.Checked);
//      edtConfSenha.Text       := cryptNova(FieldByName('SENHA').AsString,chkExibirSenha.Checked);
      edtUsuario.Text         := crypt(FieldByName('LOGIN').AsString);
      edtSenha.Text           := crypt(FieldByName('SENHA').AsString);
      edtConfSenha.Text       := crypt(FieldByName('SENHA').AsString);

    end;

   FreeAndNil(qryCarregar);
end;

procedure TfrmCadUsuario.btnAnteriorClick(Sender: TObject);
begin
  inherited;
  pCarregarEdit(qrySelect.FieldByName('ID_USUARIO').AsInteger);
end;

procedure TfrmCadUsuario.btnEditarClick(Sender: TObject);
begin
   inherited;
   vStatus := 'EDITAR';
   pCarregarEdit(qrySelect.FieldByName('ID_USUARIO').AsInteger);
   edtUsuario.SetFocus;
end;

procedure TfrmCadUsuario.btnExcluirClick(Sender: TObject);
var
  vPergunta : Integer;
begin
   inherited;
   vPergunta := MessageBox(Handle, pchar('Deseja excluir esse registro ?') , pchar(NomeSistema), 36);
   if vPergunta = 6 then
   begin
      pGravarAtualizarDeletar('DELETAR',qrySelect.FieldByName('ID_USUARIO').AsInteger);
      pAtualizaUsuario;
      pCarregarEdit(qrySelect.FieldByName('ID_USUARIO').AsInteger);
   end;
end;

procedure TfrmCadUsuario.btnFiltrarClick(Sender: TObject);
begin
   inherited;
   pAtualizaUsuario;
end;

procedure TfrmCadUsuario.btnGravarClick(Sender: TObject);
var
   vPergunta : Integer;
begin
   vPergunta := MessageBox(Handle, pchar('Deseja gravar esse registro ?') , pchar(NomeSistema), 36);
   if vPergunta = 6 then
   begin
      if edtsenha.Text <> edtConfSenha.text then
      begin
        MessageBox(Handle, pchar('Essas Senhas não coincidem!!!') , pchar(NomeSistema), 48);
        edtsenha.Text     :='';
        edtconfsenha.Text :='';
        edtsenha.SetFocus;
        exit;
      end
      else
      begin
        pGravarAtualizarDeletar(vStatus,qrySelect.FieldByName('ID_USUARIO').AsInteger);
        Module.IBTransaction.CommitRetaining;
      end;
   end;

   inherited;
   chkExibirSenha.Checked   := False;
   pAtualizaUsuario;
   pCarregarEdit(qrySelect.FieldByName('ID_USUARIO').AsInteger);
end;

procedure TfrmCadUsuario.btnNovoClick(Sender: TObject);
begin
  inherited;
  DBLFUNCIONARIO.KeyValue := null;
  DBLFUNCIONARIO.SetFocus;
  vStatus := 'NOVO';
end;

procedure TfrmCadUsuario.btnPrimeiroClick(Sender: TObject);
begin
  inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_USUARIO').AsInteger);
end;

procedure TfrmCadUsuario.btnProximoClick(Sender: TObject);
begin
  inherited;
  pCarregarEdit(qrySelect.FieldByName('ID_USUARIO').AsInteger);
end;

procedure TfrmCadUsuario.btnUltimoClick(Sender: TObject);
begin
  inherited;
  pCarregarEdit(qrySelect.FieldByName('ID_USUARIO').AsInteger);
end;

procedure TfrmCadUsuario.chkExibirSenhaClick(Sender: TObject);
begin
   inherited;
   if chkExibirSenha.Checked then
   begin
      edtSenha.PasswordChar     := #0;
      edtConfSenha.PasswordChar := #0;
   end
   else
   begin
      edtSenha.PasswordChar     := '*';
      edtConfSenha.PasswordChar := '*';
   end;
end;

procedure TfrmCadUsuario.ckTodosClick(Sender: TObject);
begin
  inherited;
   if ckTodos.State = cbChecked then
   begin
      edtpescUsuario.Enabled := False;
      edtpescUsuario.Text    := '';
   end
   else
   begin
      edtpescUsuario.Enabled := True;
      edtpescUsuario.SetFocus;
   end;
end;

procedure TfrmCadUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Action := caFree;
   frmCadUsuario := nil;
end;

procedure TfrmCadUsuario.FormShow(Sender: TObject);
begin
   inherited;
   chkExibirSenha.Checked   := False;
   pAtualizaUsuario;
   pCarregarEdit(qrySelect.FieldByName('ID_USUARIO').AsInteger);
end;

procedure TfrmCadUsuario.gGridPesquisaCellClick(Column: TColumn);
begin
   inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_USUARIO').AsInteger);
end;

procedure TfrmCadUsuario.gGridPesquisaDblClick(Sender: TObject);
begin
   inherited;
   panel1.Enabled  := True;
   pcGuia.TabIndex := 1;
   pCarregarEdit(qrySelect.FieldByName('ID_USUARIO').AsInteger);
end;

procedure TfrmCadUsuario.gGridPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   if (key = #13) and (pcGuia.TabIndex = 0) then
   begin
      pCarregarEdit(qrySelect.FieldByName('ID_USUARIO').AsInteger);
      pcGuia.TabIndex := 1;
   end;
end;

procedure TfrmCadUsuario.pAtualizaUsuario;
begin
   qryFuncionario.Close;
   qryFuncionario.Open;

   with qrySelect do
   begin
      Close;
      SQL.Clear;
      sql.Add('SELECT U.ID_FUNCIONARIO, U.ID_USUARIO, U.LOGIN, U.SENHA, ');
      sql.Add('       F.NOME                                            ');
      sql.Add('FROM USUARIO U                                           ');
      SQL.Add('INNER JOIN FUNCIONARIO F ON (F.ID_FUNCIONARIO = U.ID_FUNCIONARIO) ');
      SQL.Add('WHERE (1 = 1) ');

      if ckTodos.Checked = FALSE then
      begin
         SQL.Add(' AND upper(F.NOME) LIKE upper(:NOME) ');
         ParamByName('NOME').AsString := '%'+edtpescUsuario.Text+'%';
      end;

      Open;
   end;
end;



end.
