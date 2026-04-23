"""
Busca issues com status 'Tarefas pendentes' no projeto BILL,
analisa cada uma e posta um comentário com orientação de desenvolvimento
em Delphi + código fonte completo.
"""

import requests
from requests.auth import HTTPBasicAuth
from dotenv import load_dotenv
from rich.console import Console
from rich.progress import track
import os

load_dotenv()

JIRA_URL = os.getenv("JIRA_URL")
AUTH = HTTPBasicAuth(os.getenv("JIRA_EMAIL"), os.getenv("JIRA_TOKEN"))
HEADERS_JSON = {"Accept": "application/json", "Content-Type": "application/json"}
console = Console()


# ---------------------------------------------------------------------------
# Base de conhecimento: análise + código Delphi por issue
# ---------------------------------------------------------------------------

DELPHI_POR_ISSUE = {

    "BILL-1": {
        "analise": (
            "Épico de Autenticação de Usuário. Este módulo centraliza o controle de acesso "
            "ao sistema. Em Delphi, a autenticação deve ser implementada com uma classe "
            "TAuthService que gerencia login, logout e validação de sessão via token JWT. "
            "Utilize FireDAC para acesso ao banco de dados e Indy (TIdHTTPServer) ou "
            "DataSnap para o servidor REST."
        ),
        "codigo": """\
unit AuthService;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client,
  FireDAC.Stan.Param, IdHashMessageDigest, IdGlobal;

type
  TUsuario = record
    Id: Integer;
    Nome: string;
    Email: string;
    Token: string;
  end;

  TAuthService = class
  private
    FConnection: TFDConnection;
    function GerarToken(const AEmail: string): string;
    function HashSenha(const ASenha: string): string;
  public
    constructor Create(AConnection: TFDConnection);
    function Login(const AEmail, ASenha: string; out AUsuario: TUsuario): Boolean;
    function ValidarToken(const AToken: string): Boolean;
    procedure Logout(const AToken: string);
  end;

implementation

constructor TAuthService.Create(AConnection: TFDConnection);
begin
  FConnection := AConnection;
end;

function TAuthService.HashSenha(const ASenha: string): string;
var
  Hash: TIdHashMessageDigest5;
begin
  Hash := TIdHashMessageDigest5.Create;
  try
    Result := LowerCase(Hash.HashStringAsHex(ASenha));
  finally
    Hash.Free;
  end;
end;

function TAuthService.GerarToken(const AEmail: string): string;
var
  Hash: TIdHashMessageDigest5;
  Seed: string;
begin
  Hash := TIdHashMessageDigest5.Create;
  try
    Seed := AEmail + DateTimeToStr(Now) + IntToStr(Random(999999));
    Result := Hash.HashStringAsHex(Seed);
  finally
    Hash.Free;
  end;
end;

function TAuthService.Login(const AEmail, ASenha: string;
  out AUsuario: TUsuario): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text :=
      'SELECT id, nome, email FROM usuarios ' +
      'WHERE email = :email AND senha = :senha AND ativo = 1';
    Query.ParamByName('email').AsString := AEmail;
    Query.ParamByName('senha').AsString := HashSenha(ASenha);
    Query.Open;

    if not Query.IsEmpty then
    begin
      AUsuario.Id    := Query.FieldByName('id').AsInteger;
      AUsuario.Nome  := Query.FieldByName('nome').AsString;
      AUsuario.Email := Query.FieldByName('email').AsString;
      AUsuario.Token := GerarToken(AEmail);

      // Persiste token na tabela de sessoes
      with TFDQuery.Create(nil) do
      try
        Connection := FConnection;
        SQL.Text := 'INSERT INTO sessoes (usuario_id, token, criado_em) ' +
                    'VALUES (:uid, :token, NOW())';
        ParamByName('uid').AsInteger   := AUsuario.Id;
        ParamByName('token').AsString  := AUsuario.Token;
        ExecSQL;
      finally
        Free;
      end;

      Result := True;
    end;
  finally
    Query.Free;
  end;
end;

function TAuthService.ValidarToken(const AToken: string): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text :=
      'SELECT 1 FROM sessoes WHERE token = :token AND ativo = 1';
    Query.ParamByName('token').AsString := AToken;
    Query.Open;
    Result := not Query.IsEmpty;
  finally
    Query.Free;
  end;
end;

procedure TAuthService.Logout(const AToken: string);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'UPDATE sessoes SET ativo = 0 WHERE token = :token';
    Query.ParamByName('token').AsString := AToken;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

end.
""",
    },

    "BILL-2": {
        "analise": (
            "Épico de Gestão de Produtos. Responsável por CRUD completo de produtos. "
            "Em Delphi, utilize uma classe TProdutoRepository que abstrai as operações "
            "de banco via FireDAC. A camada de apresentação pode usar TDBGrid + "
            "TFDMemTable para edição em grade ou formulário dedicado."
        ),
        "codigo": """\
unit ProdutoRepository;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections,
  FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TProduto = class
  public
    Id: Integer;
    Nome: string;
    Descricao: string;
    Preco: Currency;
    Estoque: Integer;
    Ativo: Boolean;
  end;

  TProdutoRepository = class
  private
    FConn: TFDConnection;
  public
    constructor Create(AConn: TFDConnection);
    function ListarTodos: TObjectList<TProduto>;
    function BuscarPorId(AId: Integer): TProduto;
    procedure Inserir(AProduto: TProduto);
    procedure Atualizar(AProduto: TProduto);
    procedure Excluir(AId: Integer);
  end;

implementation

constructor TProdutoRepository.Create(AConn: TFDConnection);
begin
  FConn := AConn;
end;

function TProdutoRepository.ListarTodos: TObjectList<TProduto>;
var
  Q: TFDQuery;
  P: TProduto;
begin
  Result := TObjectList<TProduto>.Create;
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FConn;
    Q.SQL.Text := 'SELECT id, nome, descricao, preco, estoque, ativo ' +
                  'FROM produtos WHERE ativo = 1 ORDER BY nome';
    Q.Open;
    while not Q.Eof do
    begin
      P := TProduto.Create;
      P.Id        := Q.FieldByName('id').AsInteger;
      P.Nome      := Q.FieldByName('nome').AsString;
      P.Descricao := Q.FieldByName('descricao').AsString;
      P.Preco     := Q.FieldByName('preco').AsCurrency;
      P.Estoque   := Q.FieldByName('estoque').AsInteger;
      P.Ativo     := Q.FieldByName('ativo').AsBoolean;
      Result.Add(P);
      Q.Next;
    end;
  finally
    Q.Free;
  end;
end;

procedure TProdutoRepository.Inserir(AProduto: TProduto);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FConn;
    Q.SQL.Text :=
      'INSERT INTO produtos (nome, descricao, preco, estoque, ativo) ' +
      'VALUES (:nome, :desc, :preco, :estoque, 1)';
    Q.ParamByName('nome').AsString    := AProduto.Nome;
    Q.ParamByName('desc').AsString    := AProduto.Descricao;
    Q.ParamByName('preco').AsCurrency := AProduto.Preco;
    Q.ParamByName('estoque').AsInteger := AProduto.Estoque;
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

procedure TProdutoRepository.Atualizar(AProduto: TProduto);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FConn;
    Q.SQL.Text :=
      'UPDATE produtos SET nome=:nome, descricao=:desc, ' +
      'preco=:preco, estoque=:estoque WHERE id=:id';
    Q.ParamByName('nome').AsString    := AProduto.Nome;
    Q.ParamByName('desc').AsString    := AProduto.Descricao;
    Q.ParamByName('preco').AsCurrency := AProduto.Preco;
    Q.ParamByName('estoque').AsInteger := AProduto.Estoque;
    Q.ParamByName('id').AsInteger     := AProduto.Id;
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

procedure TProdutoRepository.Excluir(AId: Integer);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FConn;
    // Soft delete para manter histórico
    Q.SQL.Text := 'UPDATE produtos SET ativo = 0 WHERE id = :id';
    Q.ParamByName('id').AsInteger := AId;
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

end.
""",
    },

    "BILL-3": {
        "analise": (
            "Épico de Dashboard. Tela principal do sistema com resumo de KPIs. "
            "Em Delphi, utilize TPanel com labels para exibir totalizadores e "
            "TChart (TeChart) para gráficos. Carregue os dados via queries agregadas "
            "no banco e atualize periodicamente com TTimer."
        ),
        "codigo": """\
unit FormDashboard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Comp.Client, VclTee.TeeGDIPlus, VCLTee.Chart,
  VCLTee.Series;

type
  TfrmDashboard = class(TForm)
    pnlTopo: TPanel;
    lblTotalProdutos: TLabel;
    lblUsuariosAtivos: TLabel;
    lblVendasHoje: TLabel;
    chtVendas: TChart;
    seriesVendas: TBarSeries;
    tmrAtualizar: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure tmrAtualizarTimer(Sender: TObject);
  private
    FConn: TFDConnection;
    procedure CarregarKPIs;
    procedure CarregarGraficoVendas;
  public
    constructor Create(AOwner: TComponent; AConn: TFDConnection); reintroduce;
  end;

implementation

{$R *.dfm}

constructor TfrmDashboard.Create(AOwner: TComponent; AConn: TFDConnection);
begin
  inherited Create(AOwner);
  FConn := AConn;
end;

procedure TfrmDashboard.FormCreate(Sender: TObject);
begin
  tmrAtualizar.Interval := 60000; // Atualiza a cada 1 minuto
  tmrAtualizar.Enabled := True;
  CarregarKPIs;
  CarregarGraficoVendas;
end;

procedure TfrmDashboard.CarregarKPIs;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FConn;

    Q.SQL.Text := 'SELECT COUNT(*) AS total FROM produtos WHERE ativo = 1';
    Q.Open;
    lblTotalProdutos.Caption := 'Produtos: ' + Q.FieldByName('total').AsString;

    Q.SQL.Text := 'SELECT COUNT(*) AS total FROM usuarios WHERE ativo = 1';
    Q.Open;
    lblUsuariosAtivos.Caption := 'Usuários: ' + Q.FieldByName('total').AsString;

    Q.SQL.Text :=
      'SELECT COALESCE(SUM(valor_total), 0) AS total FROM pedidos ' +
      'WHERE DATE(criado_em) = CURDATE()';
    Q.Open;
    lblVendasHoje.Caption :=
      'Vendas hoje: R$ ' + FormatCurr('#,##0.00', Q.FieldByName('total').AsCurrency);
  finally
    Q.Free;
  end;
end;

procedure TfrmDashboard.CarregarGraficoVendas;
var
  Q: TFDQuery;
begin
  seriesVendas.Clear;
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FConn;
    Q.SQL.Text :=
      'SELECT DATE_FORMAT(criado_em, ''%d/%m'') AS dia, ' +
      '       SUM(valor_total) AS total ' +
      'FROM pedidos ' +
      'WHERE criado_em >= DATE_SUB(NOW(), INTERVAL 7 DAY) ' +
      'GROUP BY dia ORDER BY criado_em';
    Q.Open;
    while not Q.Eof do
    begin
      seriesVendas.Add(
        Q.FieldByName('total').AsFloat,
        Q.FieldByName('dia').AsString
      );
      Q.Next;
    end;
  finally
    Q.Free;
  end;
end;

procedure TfrmDashboard.tmrAtualizarTimer(Sender: TObject);
begin
  CarregarKPIs;
  CarregarGraficoVendas;
end;

end.
""",
    },

    "BILL-4": {
        "analise": (
            "Módulo de Segurança. Implementar hash de senhas com MD5/SHA256, "
            "geração e validação de tokens de sessão, e proteção contra injeção SQL. "
            "Em Delphi, use as units IdHashMessageDigest (Indy) e nunca concatene "
            "parâmetros diretamente na query — sempre use ParamByName."
        ),
        "codigo": """\
unit Seguranca;

interface

uses
  System.SysUtils, System.Classes, System.Hash,
  IdHashMessageDigest, IdGlobal;

type
  TSeguranca = class
  public
    class function HashMD5(const ATexto: string): string;
    class function HashSHA256(const ATexto: string): string;
    class function GerarToken: string;
    class function SenhaValida(const ASenha: string; out AMensagem: string): Boolean;
  end;

implementation

class function TSeguranca.HashMD5(const ATexto: string): string;
var
  Hash: TIdHashMessageDigest5;
begin
  Hash := TIdHashMessageDigest5.Create;
  try
    Result := LowerCase(Hash.HashStringAsHex(ATexto));
  finally
    Hash.Free;
  end;
end;

class function TSeguranca.HashSHA256(const ATexto: string): string;
begin
  // Disponível a partir do Delphi 10.1
  Result := LowerCase(THashSHA2.GetHashString(ATexto));
end;

class function TSeguranca.GerarToken: string;
var
  GUID: TGUID;
begin
  CreateGUID(GUID);
  Result := LowerCase(
    StringReplace(GUIDToString(GUID), '-', '', [rfReplaceAll])
  );
  // Remove chaves { }
  Result := Copy(Result, 2, Length(Result) - 2);
end;

class function TSeguranca.SenhaValida(const ASenha: string;
  out AMensagem: string): Boolean;
begin
  Result := False;

  if Length(ASenha) < 8 then
  begin
    AMensagem := 'A senha deve ter pelo menos 8 caracteres.';
    Exit;
  end;

  if not (ASenha.IndexOfAny(['0','1','2','3','4','5','6','7','8','9']) >= 0) then
  begin
    AMensagem := 'A senha deve conter pelo menos um número.';
    Exit;
  end;

  if ASenha = LowerCase(ASenha) then
  begin
    AMensagem := 'A senha deve conter pelo menos uma letra maiúscula.';
    Exit;
  end;

  AMensagem := '';
  Result := True;
end;

end.
""",
    },

    "BILL-5": {
        "analise": (
            "Feature: Login de usuário. Implementar o fluxo completo de autenticação: "
            "usuário informa e-mail e senha, o sistema valida as credenciais no banco, "
            "gera um token de sessão e redireciona para a tela principal. "
            "Em Delphi, use TfrmLogin com TEdit para e-mail/senha e TButton para submit."
        ),
        "codigo": """\
unit FormLogin;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Comp.Client, AuthService;

type
  TfrmLogin = class(TForm)
    pnlCentro: TPanel;
    lblTitulo: TLabel;
    lblEmail: TLabel;
    edtEmail: TEdit;
    lblSenha: TLabel;
    edtSenha: TEdit;
    btnEntrar: TButton;
    lblEsqueceuSenha: TLabel;
    lblErro: TLabel;
    procedure btnEntrarClick(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    FAuthService: TAuthService;
    FUsuarioLogado: TUsuario;
    procedure RealizarLogin;
  public
    property UsuarioLogado: TUsuario read FUsuarioLogado;
    constructor Create(AOwner: TComponent; AConn: TFDConnection); reintroduce;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

constructor TfrmLogin.Create(AOwner: TComponent; AConn: TFDConnection);
begin
  inherited Create(AOwner);
  FAuthService := TAuthService.Create(AConn);
end;

destructor TfrmLogin.Destroy;
begin
  FAuthService.Free;
  inherited;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  edtSenha.PasswordChar := '*';
  lblErro.Visible := False;
  edtEmail.SetFocus;
end;

procedure TfrmLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then  // Enter
    RealizarLogin;
end;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
begin
  RealizarLogin;
end;

procedure TfrmLogin.RealizarLogin;
begin
  lblErro.Visible := False;

  if Trim(edtEmail.Text) = '' then
  begin
    lblErro.Caption := 'Informe o e-mail.';
    lblErro.Visible := True;
    edtEmail.SetFocus;
    Exit;
  end;

  if Trim(edtSenha.Text) = '' then
  begin
    lblErro.Caption := 'Informe a senha.';
    lblErro.Visible := True;
    edtSenha.SetFocus;
    Exit;
  end;

  btnEntrar.Enabled := False;
  btnEntrar.Caption := 'Aguarde...';
  try
    if FAuthService.Login(edtEmail.Text, edtSenha.Text, FUsuarioLogado) then
      ModalResult := mrOk
    else
    begin
      lblErro.Caption := 'E-mail ou senha inválidos.';
      lblErro.Visible := True;
      edtSenha.Clear;
      edtSenha.SetFocus;
    end;
  finally
    btnEntrar.Enabled := True;
    btnEntrar.Caption := 'Entrar';
  end;
end;

end.
""",
    },

    "BILL-6": {
        "analise": (
            "Endpoint REST POST /auth/login. Recebe JSON com email e senha, "
            "valida as credenciais e retorna um token de sessão. "
            "Em Delphi, use DataSnap ou Horse framework (recomendado para APIs REST modernas). "
            "O retorno deve ser JSON com token e dados do usuário."
        ),
        "codigo": """\
// Usando Horse Framework (instalar via Boss: boss install horse)
// Arquivo: Server.pas

unit Server;

interface

procedure IniciarServidor;

implementation

uses
  Horse, Horse.Jhonson, System.JSON,
  System.SysUtils, FireDAC.Comp.Client, AuthService;

var
  GConn: TFDConnection; // inicializada na aplicacao principal

procedure RotaLogin(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Body: TJSONObject;
  Email, Senha: string;
  AuthSvc: TAuthService;
  Usuario: TUsuario;
  Resposta: TJSONObject;
begin
  try
    Body := Req.Body<TJSONObject>;
    Email := Body.GetValue<string>('email', '');
    Senha := Body.GetValue<string>('senha', '');

    if (Email = '') or (Senha = '') then
    begin
      Res.Status(400).Send<TJSONObject>(
        TJSONObject.Create.AddPair('erro', 'Email e senha são obrigatórios')
      );
      Exit;
    end;

    AuthSvc := TAuthService.Create(GConn);
    try
      if AuthSvc.Login(Email, Senha, Usuario) then
      begin
        Resposta := TJSONObject.Create;
        Resposta.AddPair('token', Usuario.Token);
        Resposta.AddPair('nome',  Usuario.Nome);
        Resposta.AddPair('email', Usuario.Email);
        Res.Status(200).Send<TJSONObject>(Resposta);
      end
      else
        Res.Status(401).Send<TJSONObject>(
          TJSONObject.Create.AddPair('erro', 'Credenciais inválidas')
        );
    finally
      AuthSvc.Free;
    end;

  except
    on E: Exception do
      Res.Status(500).Send<TJSONObject>(
        TJSONObject.Create.AddPair('erro', E.Message)
      );
  end;
end;

procedure IniciarServidor;
begin
  THorse.Use(Jhonson);  // Middleware JSON

  THorse.Post('/auth/login', RotaLogin);

  THorse.Listen(8080);
end;

end.
""",
    },

    "BILL-7": {
        "analise": (
            "Tarefa: Criar tela de login (frontend). Implementar formulário visual "
            "de login com campos de e-mail e senha, botão de entrar e link 'Esqueceu a senha'. "
            "Em Delphi VCL, centralize os controles em um TPanel com visual moderno usando "
            "cores e fontes customizadas. Valide os campos antes de chamar o serviço."
        ),
        "codigo": """\
// FormLogin.dfm — definicao visual do formulario
object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 400
  ClientWidth = 450
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  object pnlCentro: TPanel
    Left = 75
    Top = 60
    Width = 300
    Height = 280
    BevelOuter = bvNone
    Color = clWhite
    object lblTitulo: TLabel
      Left = 0
      Top = 0
      Width = 300
      Caption = 'Bem-vindo'
      Font.Height = -24
      Font.Style = [fsBold]
      Alignment = taCenter
    end
    object lblEmail: TLabel
      Left = 0
      Top = 60
      Caption = 'E-mail'
      Font.Style = [fsBold]
    end
    object edtEmail: TEdit
      Left = 0
      Top = 80
      Width = 300
      Height = 35
      Font.Height = -14
      TabOrder = 0
    end
    object lblSenha: TLabel
      Left = 0
      Top = 125
      Caption = 'Senha'
      Font.Style = [fsBold]
    end
    object edtSenha: TEdit
      Left = 0
      Top = 145
      Width = 300
      Height = 35
      Font.Height = -14
      PasswordChar = '*'
      TabOrder = 1
    end
    object btnEntrar: TButton
      Left = 0
      Top = 200
      Width = 300
      Height = 40
      Caption = 'Entrar'
      Font.Height = -14
      Font.Style = [fsBold]
      TabOrder = 2
      OnClick = btnEntrarClick
    end
    object lblErro: TLabel
      Left = 0
      Top = 250
      Width = 300
      Caption = ''
      Font.Color = clRed
      Visible = False
    end
  end
end

// Codigo Pascal correspondente: ver BILL-5 (FormLogin.pas)
""",
    },

    "BILL-8": {
        "analise": (
            "Tarefa: Validação de formulário no lado cliente. "
            "Implementar validações de campos obrigatórios, formato de e-mail, "
            "tamanho mínimo de senha e feedback visual de erros. "
            "Criar uma unit reutilizável TValidador para usar em todos os formulários."
        ),
        "codigo": """\
unit Validador;

interface

uses
  System.SysUtils, System.RegularExpressions, Vcl.StdCtrls, Vcl.Graphics;

type
  TValidador = class
  private
    class procedure MarcarErro(AEdit: TEdit; const AMensagem: string);
    class procedure LimparErro(AEdit: TEdit);
  public
    class function EmailValido(const AEmail: string): Boolean;
    class function CampoObrigatorio(AEdit: TEdit; const ANome: string;
      out AErro: string): Boolean;
    class function EmailFormatado(AEdit: TEdit; out AErro: string): Boolean;
    class function SenhaSuficiente(AEdit: TEdit; ATamanhoMin: Integer;
      out AErro: string): Boolean;
    class function PrecoValido(const AValor: Currency;
      out AErro: string): Boolean;
  end;

implementation

class procedure TValidador.MarcarErro(AEdit: TEdit; const AMensagem: string);
begin
  AEdit.Color := $00E8F1FF;  // azul claro = erro
  AEdit.Hint  := AMensagem;
  AEdit.ShowHint := True;
  AEdit.SetFocus;
end;

class procedure TValidador.LimparErro(AEdit: TEdit);
begin
  AEdit.Color := clWindow;
  AEdit.Hint  := '';
end;

class function TValidador.EmailValido(const AEmail: string): Boolean;
begin
  Result := TRegEx.IsMatch(AEmail,
    '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
end;

class function TValidador.CampoObrigatorio(AEdit: TEdit; const ANome: string;
  out AErro: string): Boolean;
begin
  LimparErro(AEdit);
  if Trim(AEdit.Text) = '' then
  begin
    AErro := ANome + ' é obrigatório.';
    MarcarErro(AEdit, AErro);
    Result := False;
  end
  else
    Result := True;
end;

class function TValidador.EmailFormatado(AEdit: TEdit;
  out AErro: string): Boolean;
begin
  LimparErro(AEdit);
  if not EmailValido(AEdit.Text) then
  begin
    AErro := 'E-mail inválido.';
    MarcarErro(AEdit, AErro);
    Result := False;
  end
  else
    Result := True;
end;

class function TValidador.SenhaSuficiente(AEdit: TEdit; ATamanhoMin: Integer;
  out AErro: string): Boolean;
begin
  LimparErro(AEdit);
  if Length(AEdit.Text) < ATamanhoMin then
  begin
    AErro := Format('A senha deve ter pelo menos %d caracteres.', [ATamanhoMin]);
    MarcarErro(AEdit, AErro);
    Result := False;
  end
  else
    Result := True;
end;

class function TValidador.PrecoValido(const AValor: Currency;
  out AErro: string): Boolean;
begin
  if AValor <= 0 then
  begin
    AErro := 'O preço deve ser maior que zero.';
    Result := False;
  end
  else
  begin
    AErro := '';
    Result := True;
  end;
end;

end.
""",
    },

    "BILL-9": {
        "analise": (
            "Feature: Cadastro de usuário. Tela para criação de nova conta com "
            "campos nome, e-mail, senha e confirmação de senha. "
            "Validar e-mail único antes de gravar. Em Delphi, reutilize "
            "o TValidador (BILL-8) e TAuthService para persistência."
        ),
        "codigo": """\
unit FormCadastro;

interface

uses
  System.SysUtils, System.Classes,
  Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Controls,
  FireDAC.Comp.Client, Validador, AuthService;

type
  TfrmCadastro = class(TForm)
    pnlForm: TPanel;
    lblTitulo: TLabel;
    edtNome: TEdit;
    edtEmail: TEdit;
    edtSenha: TEdit;
    edtConfirmaSenha: TEdit;
    btnCadastrar: TButton;
    lblErro: TLabel;
    procedure btnCadastrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FConn: TFDConnection;
    function EmailJaCadastrado(const AEmail: string): Boolean;
    function ValidarFormulario: Boolean;
    procedure SalvarUsuario;
  public
    constructor Create(AOwner: TComponent; AConn: TFDConnection); reintroduce;
  end;

implementation

{$R *.dfm}

constructor TfrmCadastro.Create(AOwner: TComponent; AConn: TFDConnection);
begin
  inherited Create(AOwner);
  FConn := AConn;
end;

procedure TfrmCadastro.FormCreate(Sender: TObject);
begin
  edtSenha.PasswordChar := '*';
  edtConfirmaSenha.PasswordChar := '*';
  lblErro.Visible := False;
end;

function TfrmCadastro.EmailJaCadastrado(const AEmail: string): Boolean;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FConn;
    Q.SQL.Text := 'SELECT 1 FROM usuarios WHERE email = :email';
    Q.ParamByName('email').AsString := AEmail;
    Q.Open;
    Result := not Q.IsEmpty;
  finally
    Q.Free;
  end;
end;

function TfrmCadastro.ValidarFormulario: Boolean;
var
  Erro: string;
begin
  Result := False;
  lblErro.Visible := False;

  if not TValidador.CampoObrigatorio(edtNome, 'Nome', Erro) then
  begin lblErro.Caption := Erro; lblErro.Visible := True; Exit; end;

  if not TValidador.EmailFormatado(edtEmail, Erro) then
  begin lblErro.Caption := Erro; lblErro.Visible := True; Exit; end;

  if EmailJaCadastrado(edtEmail.Text) then
  begin
    lblErro.Caption := 'Este e-mail já está cadastrado.';
    lblErro.Visible := True;
    edtEmail.SetFocus;
    Exit;
  end;

  if not TValidador.SenhaSuficiente(edtSenha, 8, Erro) then
  begin lblErro.Caption := Erro; lblErro.Visible := True; Exit; end;

  if edtSenha.Text <> edtConfirmaSenha.Text then
  begin
    lblErro.Caption := 'As senhas não conferem.';
    lblErro.Visible := True;
    edtConfirmaSenha.SetFocus;
    Exit;
  end;

  Result := True;
end;

procedure TfrmCadastro.SalvarUsuario;
var
  Q: TFDQuery;
  Hash: string;
begin
  Hash := TSeguranca.HashSHA256(edtSenha.Text);
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FConn;
    Q.SQL.Text :=
      'INSERT INTO usuarios (nome, email, senha, ativo, criado_em) ' +
      'VALUES (:nome, :email, :senha, 1, NOW())';
    Q.ParamByName('nome').AsString  := Trim(edtNome.Text);
    Q.ParamByName('email').AsString := Trim(edtEmail.Text);
    Q.ParamByName('senha').AsString := Hash;
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

procedure TfrmCadastro.btnCadastrarClick(Sender: TObject);
begin
  if not ValidarFormulario then Exit;

  try
    SalvarUsuario;
    ShowMessage('Cadastro realizado com sucesso!');
    ModalResult := mrOk;
  except
    on E: Exception do
    begin
      lblErro.Caption := 'Erro ao salvar: ' + E.Message;
      lblErro.Visible := True;
    end;
  end;
end;

end.
""",
    },

    "BILL-10": {
        "analise": (
            "Endpoint REST POST /auth/register. Recebe JSON com nome, email e senha, "
            "valida os dados, verifica e-mail único e cria o usuário no banco. "
            "Retorna 201 Created com os dados do usuário ou 400/409 em caso de erro."
        ),
        "codigo": """\
// Rota POST /auth/register — adicionar ao Server.pas (ver BILL-6)

procedure RotaCadastro(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Body: TJSONObject;
  Nome, Email, Senha: string;
  Q: TFDQuery;
  HashSenha: string;
  Resposta: TJSONObject;
begin
  try
    Body  := Req.Body<TJSONObject>;
    Nome  := Body.GetValue<string>('nome', '');
    Email := Body.GetValue<string>('email', '');
    Senha := Body.GetValue<string>('senha', '');

    // Validações básicas
    if (Nome = '') or (Email = '') or (Senha = '') then
    begin
      Res.Status(400).Send<TJSONObject>(
        TJSONObject.Create.AddPair('erro', 'Nome, email e senha são obrigatórios')
      );
      Exit;
    end;

    if Length(Senha) < 8 then
    begin
      Res.Status(400).Send<TJSONObject>(
        TJSONObject.Create.AddPair('erro', 'Senha deve ter no mínimo 8 caracteres')
      );
      Exit;
    end;

    Q := TFDQuery.Create(nil);
    try
      Q.Connection := GConn;

      // Verifica email único
      Q.SQL.Text := 'SELECT 1 FROM usuarios WHERE email = :email';
      Q.ParamByName('email').AsString := Email;
      Q.Open;

      if not Q.IsEmpty then
      begin
        Res.Status(409).Send<TJSONObject>(
          TJSONObject.Create.AddPair('erro', 'E-mail já cadastrado')
        );
        Exit;
      end;

      HashSenha := TSeguranca.HashSHA256(Senha);

      Q.SQL.Text :=
        'INSERT INTO usuarios (nome, email, senha, ativo, criado_em) ' +
        'VALUES (:nome, :email, :senha, 1, NOW())';
      Q.ParamByName('nome').AsString  := Nome;
      Q.ParamByName('email').AsString := Email;
      Q.ParamByName('senha').AsString := HashSenha;
      Q.ExecSQL;

      Resposta := TJSONObject.Create;
      Resposta.AddPair('mensagem', 'Usuário cadastrado com sucesso');
      Resposta.AddPair('email', Email);
      Res.Status(201).Send<TJSONObject>(Resposta);

    finally
      Q.Free;
    end;

  except
    on E: Exception do
      Res.Status(500).Send<TJSONObject>(
        TJSONObject.Create.AddPair('erro', E.Message)
      );
  end;
end;

// Registrar no IniciarServidor:
// THorse.Post('/auth/register', RotaCadastro);
""",
    },

    "BILL-11": {
        "analise": (
            "Tarefa: Validação de e-mail único no banco. "
            "Antes de inserir ou atualizar um usuário, verificar se o e-mail já existe. "
            "Implementar como método reutilizável no repositório de usuários. "
            "Usar índice UNIQUE no banco para garantia dupla."
        ),
        "codigo": """\
unit UsuarioRepository;

interface

uses
  System.SysUtils, FireDAC.Comp.Client;

type
  TUsuarioRepository = class
  private
    FConn: TFDConnection;
  public
    constructor Create(AConn: TFDConnection);
    function EmailDisponivel(const AEmail: string; AIdExcluir: Integer = 0): Boolean;
    function BuscarPorEmail(const AEmail: string): Integer; // retorna ID ou 0
  end;

implementation

constructor TUsuarioRepository.Create(AConn: TFDConnection);
begin
  FConn := AConn;
end;

function TUsuarioRepository.BuscarPorEmail(const AEmail: string): Integer;
var
  Q: TFDQuery;
begin
  Result := 0;
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FConn;
    Q.SQL.Text := 'SELECT id FROM usuarios WHERE email = :email AND ativo = 1';
    Q.ParamByName('email').AsString := LowerCase(Trim(AEmail));
    Q.Open;
    if not Q.IsEmpty then
      Result := Q.FieldByName('id').AsInteger;
  finally
    Q.Free;
  end;
end;

function TUsuarioRepository.EmailDisponivel(const AEmail: string;
  AIdExcluir: Integer): Boolean;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FConn;
    if AIdExcluir > 0 then
    begin
      // Na edicao, ignora o proprio registro
      Q.SQL.Text :=
        'SELECT 1 FROM usuarios WHERE email = :email AND id <> :id AND ativo = 1';
      Q.ParamByName('id').AsInteger := AIdExcluir;
    end
    else
      Q.SQL.Text := 'SELECT 1 FROM usuarios WHERE email = :email AND ativo = 1';

    Q.ParamByName('email').AsString := LowerCase(Trim(AEmail));
    Q.Open;
    Result := Q.IsEmpty; // True = disponível
  finally
    Q.Free;
  end;
end;

end.

// SQL para criar o índice único no banco:
// ALTER TABLE usuarios ADD UNIQUE INDEX idx_email (email);
""",
    },

    "BILL-12": {
        "analise": (
            "Bug: Erro 500 no login. Causas comuns: conexão com banco instável, "
            "query sem tratamento de exceção, ou parâmetro nulo. "
            "Solução: envolver toda a lógica de autenticação em try/except, "
            "logar o erro completo e retornar mensagem genérica ao cliente "
            "sem expor detalhes internos."
        ),
        "codigo": """\
// Correcao no AuthService.Login — tratamento robusto de excecoes

function TAuthService.Login(const AEmail, ASenha: string;
  out AUsuario: TUsuario): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  AUsuario := Default(TUsuario);

  // Validacao antecipada de entrada (evita query desnecessaria)
  if Trim(AEmail) = '' then
    raise EArgumentException.Create('E-mail não informado');
  if Trim(ASenha) = '' then
    raise EArgumentException.Create('Senha não informada');

  if not FConnection.Connected then
  begin
    try
      FConnection.Connected := True;
    except
      on E: Exception do
      begin
        // Loga sem expor detalhes ao cliente
        TLogger.Erro('Falha ao conectar ao banco: ' + E.Message);
        raise EServiceUnavailable.Create('Serviço temporariamente indisponível');
      end;
    end;
  end;

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    try
      Query.SQL.Text :=
        'SELECT id, nome, email FROM usuarios ' +
        'WHERE email = :email AND senha = :senha AND ativo = 1';
      Query.ParamByName('email').AsString := Trim(AEmail);
      Query.ParamByName('senha').AsString := HashSenha(Trim(ASenha));
      Query.Open;
    except
      on E: Exception do
      begin
        TLogger.Erro('Erro na query de login: ' + E.Message + ' | Email: ' + AEmail);
        raise Exception.Create('Erro interno ao processar login');
      end;
    end;

    if not Query.IsEmpty then
    begin
      AUsuario.Id    := Query.FieldByName('id').AsInteger;
      AUsuario.Nome  := Query.FieldByName('nome').AsString;
      AUsuario.Email := Query.FieldByName('email').AsString;
      AUsuario.Token := GerarToken(AEmail);
      GravarSessao(AUsuario);
      Result := True;
    end;
  finally
    Query.Free;
  end;
end;

// Unit de log simples
unit Logger;

interface
uses System.SysUtils, System.IOUtils;

type
  TLogger = class
  public
    class procedure Erro(const AMensagem: string);
    class procedure Info(const AMensagem: string);
  end;

implementation

class procedure TLogger.Erro(const AMensagem: string);
var
  Linha: string;
begin
  Linha := Format('[%s][ERRO] %s', [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now), AMensagem]);
  TFile.AppendAllText('logs\app.log', Linha + sLineBreak);
end;

class procedure TLogger.Info(const AMensagem: string);
var
  Linha: string;
begin
  Linha := Format('[%s][INFO] %s', [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now), AMensagem]);
  TFile.AppendAllText('logs\app.log', Linha + sLineBreak);
end;

end.
""",
    },

    "BILL-13": {
        "analise": (
            "Feature: Listar produtos. Carregar todos os produtos ativos do banco "
            "e exibir em uma grade. Em Delphi, use TStringGrid ou TDBGrid com "
            "TFDQuery como DataSet. Adicionar filtro por nome e ordenação por coluna."
        ),
        "codigo": """\
unit FormProdutos;

interface

uses
  System.SysUtils, System.Classes,
  Vcl.Forms, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Controls, Data.DB, FireDAC.Comp.Client;

type
  TfrmProdutos = class(TForm)
    pnlTopo: TPanel;
    edtBusca: TEdit;
    btnBuscar: TButton;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    dbgProdutos: TDBGrid;
    dssProdutos: TDataSource;
    fdqProdutos: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    FConn: TFDConnection;
    procedure CarregarProdutos(const AFiltro: string = '');
    function ProdutoSelecionadoId: Integer;
  public
    constructor Create(AOwner: TComponent; AConn: TFDConnection); reintroduce;
  end;

implementation

{$R *.dfm}

constructor TfrmProdutos.Create(AOwner: TComponent; AConn: TFDConnection);
begin
  inherited Create(AOwner);
  FConn := AConn;
  fdqProdutos.Connection := FConn;
  dssProdutos.DataSet := fdqProdutos;
  dbgProdutos.DataSource := dssProdutos;
end;

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
  CarregarProdutos;
  // Configura colunas do DBGrid
  dbgProdutos.Columns.Clear;
  with dbgProdutos.Columns.Add do begin FieldName := 'id';    Title.Caption := 'ID';     Width := 50; end;
  with dbgProdutos.Columns.Add do begin FieldName := 'nome';  Title.Caption := 'Nome';   Width := 200; end;
  with dbgProdutos.Columns.Add do begin FieldName := 'preco'; Title.Caption := 'Preço';  Width := 100; end;
  with dbgProdutos.Columns.Add do begin FieldName := 'estoque'; Title.Caption := 'Estoque'; Width := 80; end;
end;

procedure TfrmProdutos.CarregarProdutos(const AFiltro: string);
begin
  fdqProdutos.Close;
  fdqProdutos.SQL.Text :=
    'SELECT id, nome, descricao, preco, estoque FROM produtos ' +
    'WHERE ativo = 1 ' +
    IfThen(AFiltro <> '', 'AND nome LIKE :filtro ', '') +
    'ORDER BY nome';

  if AFiltro <> '' then
    fdqProdutos.ParamByName('filtro').AsString := '%' + AFiltro + '%';

  fdqProdutos.Open;
end;

function TfrmProdutos.ProdutoSelecionadoId: Integer;
begin
  Result := 0;
  if not fdqProdutos.IsEmpty then
    Result := fdqProdutos.FieldByName('id').AsInteger;
end;

procedure TfrmProdutos.btnBuscarClick(Sender: TObject);
begin
  CarregarProdutos(Trim(edtBusca.Text));
end;

procedure TfrmProdutos.btnNovoClick(Sender: TObject);
begin
  // Abrir FormCriarProduto (ver BILL-16)
end;

procedure TfrmProdutos.btnEditarClick(Sender: TObject);
begin
  if ProdutoSelecionadoId = 0 then
  begin
    ShowMessage('Selecione um produto para editar.');
    Exit;
  end;
  // Abrir FormCriarProduto passando o ID
end;

procedure TfrmProdutos.btnExcluirClick(Sender: TObject);
var
  Id: Integer;
  Q: TFDQuery;
begin
  Id := ProdutoSelecionadoId;
  if Id = 0 then begin ShowMessage('Selecione um produto.'); Exit; end;

  if MessageDlg('Confirma a exclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Q := TFDQuery.Create(nil);
    try
      Q.Connection := FConn;
      Q.SQL.Text := 'UPDATE produtos SET ativo = 0 WHERE id = :id';
      Q.ParamByName('id').AsInteger := Id;
      Q.ExecSQL;
      CarregarProdutos;
    finally
      Q.Free;
    end;
  end;
end;

end.
""",
    },

    "BILL-14": {
        "analise": (
            "Endpoint REST GET /products. Retorna lista de produtos ativos em JSON. "
            "Suportar filtro por nome via query string (?nome=xyz) e paginação "
            "(?page=1&limit=20). Retorno: array de objetos produto."
        ),
        "codigo": """\
// Rota GET /products — adicionar ao Server.pas

procedure RotaListarProdutos(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Q: TFDQuery;
  Filtro: string;
  Page, Limite, Offset: Integer;
  Lista: TJSONArray;
  Item: TJSONObject;
  Resposta: TJSONObject;
begin
  try
    Filtro := Req.Params.Field('nome').AsString;
    Page   := StrToIntDef(Req.Params.Field('page').AsString, 1);
    Limite := StrToIntDef(Req.Params.Field('limit').AsString, 20);
    Offset := (Page - 1) * Limite;

    Q := TFDQuery.Create(nil);
    try
      Q.Connection := GConn;
      Q.SQL.Text :=
        'SELECT id, nome, descricao, preco, estoque FROM produtos ' +
        'WHERE ativo = 1 ' +
        IfThen(Filtro <> '', 'AND nome LIKE :nome ', '') +
        'ORDER BY nome LIMIT :limite OFFSET :offset';

      if Filtro <> '' then
        Q.ParamByName('nome').AsString := '%' + Filtro + '%';
      Q.ParamByName('limite').AsInteger := Limite;
      Q.ParamByName('offset').AsInteger := Offset;
      Q.Open;

      Lista := TJSONArray.Create;
      while not Q.Eof do
      begin
        Item := TJSONObject.Create;
        Item.AddPair('id',       TJSONNumber.Create(Q.FieldByName('id').AsInteger));
        Item.AddPair('nome',     Q.FieldByName('nome').AsString);
        Item.AddPair('descricao',Q.FieldByName('descricao').AsString);
        Item.AddPair('preco',    TJSONNumber.Create(Q.FieldByName('preco').AsFloat));
        Item.AddPair('estoque',  TJSONNumber.Create(Q.FieldByName('estoque').AsInteger));
        Lista.Add(Item);
        Q.Next;
      end;

      Resposta := TJSONObject.Create;
      Resposta.AddPair('dados',    Lista);
      Resposta.AddPair('pagina',   TJSONNumber.Create(Page));
      Resposta.AddPair('limite',   TJSONNumber.Create(Limite));
      Res.Status(200).Send<TJSONObject>(Resposta);

    finally
      Q.Free;
    end;
  except
    on E: Exception do
      Res.Status(500).Send<TJSONObject>(
        TJSONObject.Create.AddPair('erro', E.Message)
      );
  end;
end;

// Registrar: THorse.Get('/products', RotaListarProdutos);
""",
    },

    "BILL-15": {
        "analise": (
            "Tarefa: Criar listagem de produtos no frontend Delphi. "
            "Exibir os produtos em TListView modo vsReport com colunas. "
            "Carregar os dados via REST consumindo o endpoint /products "
            "com TRESTClient + TRESTRequest + TRESTResponse."
        ),
        "codigo": """\
unit FrameListaProdutos;

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  Vcl.Forms, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Controls,
  REST.Client, REST.Types, REST.Response.Adapter;

type
  TfraListaProdutos = class(TFrame)
    lvProdutos: TListView;
    edtBusca: TEdit;
    btnBuscar: TButton;
    lblCarregando: TLabel;
    procedure btnBuscarClick(Sender: TObject);
    procedure FrameCreate(Sender: TObject);
  private
    FBaseURL: string;
    procedure CarregarProdutos(const AFiltro: string = '');
    procedure PreencherLista(const AJson: TJSONArray);
  public
    constructor Create(AOwner: TComponent; const ABaseURL: string); reintroduce;
  end;

implementation

{$R *.dfm}

constructor TfraListaProdutos.Create(AOwner: TComponent; const ABaseURL: string);
begin
  inherited Create(AOwner);
  FBaseURL := ABaseURL;
end;

procedure TfraListaProdutos.FrameCreate(Sender: TObject);
begin
  lvProdutos.ViewStyle := vsReport;
  lvProdutos.Columns.Clear;
  with lvProdutos.Columns.Add do begin Caption := 'ID';      Width := 50; end;
  with lvProdutos.Columns.Add do begin Caption := 'Nome';    Width := 200; end;
  with lvProdutos.Columns.Add do begin Caption := 'Preço';   Width := 100; end;
  with lvProdutos.Columns.Add do begin Caption := 'Estoque'; Width := 80; end;
  CarregarProdutos;
end;

procedure TfraListaProdutos.CarregarProdutos(const AFiltro: string);
var
  Client: TRESTClient;
  Request: TRESTRequest;
  Response: TRESTResponse;
  Json: TJSONObject;
begin
  lblCarregando.Visible := True;
  lvProdutos.Items.Clear;

  Client   := TRESTClient.Create(FBaseURL);
  Request  := TRESTRequest.Create(nil);
  Response := TRESTResponse.Create(nil);
  try
    Request.Client   := Client;
    Request.Response := Response;
    Request.Resource := 'products';
    Request.Method   := rmGET;

    if AFiltro <> '' then
      Request.AddParameter('nome', AFiltro, pkQUERY);

    Request.Execute;

    if Response.StatusCode = 200 then
    begin
      Json := Response.JSONValue as TJSONObject;
      PreencherLista(Json.GetValue<TJSONArray>('dados'));
    end;
  finally
    Response.Free;
    Request.Free;
    Client.Free;
    lblCarregando.Visible := False;
  end;
end;

procedure TfraListaProdutos.PreencherLista(const AJson: TJSONArray);
var
  I: Integer;
  Obj: TJSONObject;
  Item: TListItem;
begin
  lvProdutos.Items.BeginUpdate;
  try
    lvProdutos.Items.Clear;
    for I := 0 to AJson.Count - 1 do
    begin
      Obj  := AJson.Items[I] as TJSONObject;
      Item := lvProdutos.Items.Add;
      Item.Caption := Obj.GetValue<string>('id');
      Item.SubItems.Add(Obj.GetValue<string>('nome'));
      Item.SubItems.Add('R$ ' + FormatCurr('#,##0.00', Obj.GetValue<Double>('preco')));
      Item.SubItems.Add(Obj.GetValue<string>('estoque'));
    end;
  finally
    lvProdutos.Items.EndUpdate;
  end;
end;

procedure TfraListaProdutos.btnBuscarClick(Sender: TObject);
begin
  CarregarProdutos(Trim(edtBusca.Text));
end;

end.
""",
    },

    "BILL-16": {
        "analise": (
            "Tarefa: Criar formulário de criação/edição de produto. "
            "Campos: nome (obrigatório), descrição, preço (Currency), estoque (Integer). "
            "Validar antes de salvar. Reutilizar no modo edição passando o ID do produto."
        ),
        "codigo": """\
unit FormProduto;

interface

uses
  System.SysUtils, System.Classes,
  Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Controls, Vcl.Mask,
  FireDAC.Comp.Client, Validador;

type
  TfrmProduto = class(TForm)
    edtNome: TEdit;
    edtDescricao: TMemo;
    edtPreco: TEdit;
    edtEstoque: TEdit;
    btnSalvar: TButton;
    btnCancelar: TButton;
    lblErro: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FConn: TFDConnection;
    FProdutoId: Integer;
    procedure CarregarProduto;
    function ValidarFormulario: Boolean;
    procedure Salvar;
  public
    constructor Create(AOwner: TComponent; AConn: TFDConnection;
      AProdutoId: Integer = 0); reintroduce;
  end;

implementation

{$R *.dfm}

constructor TfrmProduto.Create(AOwner: TComponent; AConn: TFDConnection;
  AProdutoId: Integer);
begin
  inherited Create(AOwner);
  FConn := AConn;
  FProdutoId := AProdutoId;
end;

procedure TfrmProduto.FormCreate(Sender: TObject);
begin
  lblErro.Visible := False;
  Caption := IfThen(FProdutoId > 0, 'Editar Produto', 'Novo Produto');
  if FProdutoId > 0 then
    CarregarProduto;
end;

procedure TfrmProduto.CarregarProduto;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FConn;
    Q.SQL.Text := 'SELECT nome, descricao, preco, estoque FROM produtos WHERE id = :id';
    Q.ParamByName('id').AsInteger := FProdutoId;
    Q.Open;
    if not Q.IsEmpty then
    begin
      edtNome.Text    := Q.FieldByName('nome').AsString;
      edtDescricao.Text := Q.FieldByName('descricao').AsString;
      edtPreco.Text   := FormatCurr('#,##0.00', Q.FieldByName('preco').AsCurrency);
      edtEstoque.Text := Q.FieldByName('estoque').AsString;
    end;
  finally
    Q.Free;
  end;
end;

function TfrmProduto.ValidarFormulario: Boolean;
var
  Erro: string;
  Preco: Currency;
begin
  Result := False;
  lblErro.Visible := False;

  if not TValidador.CampoObrigatorio(edtNome, 'Nome', Erro) then
  begin lblErro.Caption := Erro; lblErro.Visible := True; Exit; end;

  try
    Preco := StrToCurr(StringReplace(edtPreco.Text, '.', ',', [rfReplaceAll]));
  except
    lblErro.Caption := 'Preço inválido.';
    lblErro.Visible := True;
    edtPreco.SetFocus;
    Exit;
  end;

  if not TValidador.PrecoValido(Preco, Erro) then
  begin lblErro.Caption := Erro; lblErro.Visible := True; Exit; end;

  Result := True;
end;

procedure TfrmProduto.Salvar;
var
  Q: TFDQuery;
  Preco: Currency;
begin
  Preco := StrToCurr(StringReplace(edtPreco.Text, '.', ',', [rfReplaceAll]));

  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FConn;
    if FProdutoId = 0 then
    begin
      Q.SQL.Text :=
        'INSERT INTO produtos (nome, descricao, preco, estoque, ativo) ' +
        'VALUES (:nome, :desc, :preco, :estoque, 1)';
    end
    else
    begin
      Q.SQL.Text :=
        'UPDATE produtos SET nome=:nome, descricao=:desc, ' +
        'preco=:preco, estoque=:estoque WHERE id=:id';
      Q.ParamByName('id').AsInteger := FProdutoId;
    end;
    Q.ParamByName('nome').AsString    := Trim(edtNome.Text);
    Q.ParamByName('desc').AsString    := Trim(edtDescricao.Text);
    Q.ParamByName('preco').AsCurrency := Preco;
    Q.ParamByName('estoque').AsInteger := StrToIntDef(edtEstoque.Text, 0);
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

procedure TfrmProduto.btnSalvarClick(Sender: TObject);
begin
  if not ValidarFormulario then Exit;
  try
    Salvar;
    ModalResult := mrOk;
  except
    on E: Exception do
    begin
      lblErro.Caption := 'Erro: ' + E.Message;
      lblErro.Visible := True;
    end;
  end;
end;

end.
""",
    },

    "BILL-17": {
        "analise": (
            "Endpoint REST POST /products. Recebe JSON com nome, descrição, preço e estoque. "
            "Valida os dados, verifica nome único e persiste no banco. "
            "Retorna 201 com o produto criado ou 400/500 em erro."
        ),
        "codigo": """\
// Rota POST /products

procedure RotaCriarProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Body: TJSONObject;
  Nome, Descricao: string;
  Preco: Double;
  Estoque: Integer;
  Q: TFDQuery;
  NovoId: Integer;
  Resposta: TJSONObject;
begin
  try
    Body     := Req.Body<TJSONObject>;
    Nome     := Body.GetValue<string>('nome', '');
    Descricao:= Body.GetValue<string>('descricao', '');
    Preco    := Body.GetValue<Double>('preco', 0);
    Estoque  := Body.GetValue<Integer>('estoque', 0);

    if Nome = '' then
    begin
      Res.Status(400).Send<TJSONObject>(
        TJSONObject.Create.AddPair('erro', 'Nome é obrigatório')
      );
      Exit;
    end;

    if Preco <= 0 then
    begin
      Res.Status(400).Send<TJSONObject>(
        TJSONObject.Create.AddPair('erro', 'Preço deve ser maior que zero')
      );
      Exit;
    end;

    Q := TFDQuery.Create(nil);
    try
      Q.Connection := GConn;
      Q.SQL.Text :=
        'INSERT INTO produtos (nome, descricao, preco, estoque, ativo, criado_em) ' +
        'VALUES (:nome, :desc, :preco, :estoque, 1, NOW())';
      Q.ParamByName('nome').AsString    := Nome;
      Q.ParamByName('desc').AsString    := Descricao;
      Q.ParamByName('preco').AsFloat    := Preco;
      Q.ParamByName('estoque').AsInteger := Estoque;
      Q.ExecSQL;
      NovoId := GConn.GetLastAutoGenValue('');

      Resposta := TJSONObject.Create;
      Resposta.AddPair('id',       TJSONNumber.Create(NovoId));
      Resposta.AddPair('nome',     Nome);
      Resposta.AddPair('descricao',Descricao);
      Resposta.AddPair('preco',    TJSONNumber.Create(Preco));
      Resposta.AddPair('estoque',  TJSONNumber.Create(Estoque));
      Res.Status(201).Send<TJSONObject>(Resposta);
    finally
      Q.Free;
    end;
  except
    on E: Exception do
      Res.Status(500).Send<TJSONObject>(
        TJSONObject.Create.AddPair('erro', E.Message)
      );
  end;
end;

// Registrar: THorse.Post('/products', RotaCriarProduto);
""",
    },

    "BILL-18": {
        "analise": (
            "Tarefa: Validação backend de produtos. "
            "Implementar regras de negócio no servidor: preço > 0, nome não vazio, "
            "estoque >= 0, nome com no máximo 200 caracteres. "
            "Centralizar em uma classe TProdutoValidator reutilizável nos endpoints."
        ),
        "codigo": """\
unit ProdutoValidator;

interface

uses
  System.SysUtils, System.Generics.Collections;

type
  TErroValidacao = record
    Campo: string;
    Mensagem: string;
  end;

  TProdutoValidator = class
  public
    class function Validar(
      const ANome: string;
      const ADescricao: string;
      APreco: Double;
      AEstoque: Integer;
      out AErros: TArray<TErroValidacao>
    ): Boolean;
  end;

implementation

class function TProdutoValidator.Validar(
  const ANome, ADescricao: string;
  APreco: Double; AEstoque: Integer;
  out AErros: TArray<TErroValidacao>): Boolean;
var
  Lista: TList<TErroValidacao>;
  Erro: TErroValidacao;
begin
  Lista := TList<TErroValidacao>.Create;
  try
    if Trim(ANome) = '' then
    begin
      Erro.Campo    := 'nome';
      Erro.Mensagem := 'Nome é obrigatório';
      Lista.Add(Erro);
    end
    else if Length(ANome) > 200 then
    begin
      Erro.Campo    := 'nome';
      Erro.Mensagem := 'Nome deve ter no máximo 200 caracteres';
      Lista.Add(Erro);
    end;

    if APreco <= 0 then
    begin
      Erro.Campo    := 'preco';
      Erro.Mensagem := 'Preço deve ser maior que zero';
      Lista.Add(Erro);
    end;

    if AEstoque < 0 then
    begin
      Erro.Campo    := 'estoque';
      Erro.Mensagem := 'Estoque não pode ser negativo';
      Lista.Add(Erro);
    end;

    AErros := Lista.ToArray;
    Result := Lista.Count = 0;
  finally
    Lista.Free;
  end;
end;

end.

// Uso no endpoint:
// var Erros: TArray<TErroValidacao>;
// if not TProdutoValidator.Validar(Nome, Desc, Preco, Estoque, Erros) then
// begin
//   // montar JSON de erros e retornar 400
// end;
""",
    },

    "BILL-19": {
        "analise": (
            "Bug: Produto sendo salvo sem preço (preço = 0 ou nulo). "
            "Solução: adicionar validação tanto no formulário (frontend) quanto "
            "no endpoint (backend). No banco, adicionar constraint CHECK (preco > 0). "
            "Nunca confiar apenas no frontend para validações de negócio."
        ),
        "codigo": """\
// 1. Validacao no formulario Delphi (frontend) — FormProduto.pas
procedure TfrmProduto.ValidarPreco;
var
  Preco: Currency;
  Erro: string;
begin
  if Trim(edtPreco.Text) = '' then
  begin
    lblErro.Caption := 'O preço é obrigatório.';
    lblErro.Visible := True;
    edtPreco.SetFocus;
    Exit;
  end;

  try
    Preco := StrToCurr(StringReplace(edtPreco.Text, '.', ',', [rfReplaceAll]));
  except
    lblErro.Caption := 'Preço inválido. Use formato: 99,90';
    lblErro.Visible := True;
    edtPreco.SetFocus;
    Exit;
  end;

  if not TValidador.PrecoValido(Preco, Erro) then
  begin
    lblErro.Caption := Erro;
    lblErro.Visible := True;
    edtPreco.SetFocus;
  end;
end;

// 2. Constraint no banco de dados — executar no MySQL/PostgreSQL:
// ALTER TABLE produtos
//   ADD CONSTRAINT chk_preco_positivo CHECK (preco > 0),
//   MODIFY COLUMN preco DECIMAL(10,2) NOT NULL;

// 3. Trigger de segurança no banco (camada extra):
// CREATE TRIGGER before_produto_insert
// BEFORE INSERT ON produtos
// FOR EACH ROW
// BEGIN
//   IF NEW.preco IS NULL OR NEW.preco <= 0 THEN
//     SIGNAL SQLSTATE '45000'
//     SET MESSAGE_TEXT = 'Preco deve ser maior que zero';
//   END IF;
// END;
""",
    },

    "BILL-20": {
        "analise": (
            "Feature: Dashboard principal com totalizadores. "
            "Exibir cards com: total de produtos, usuários ativos, vendas do dia. "
            "Em Delphi, usar TPanel para cada card com TLabel para o número "
            "e TLabel menor para a legenda. Cores diferenciadas por categoria."
        ),
        "codigo": """\
// Ver codigo completo em BILL-3 (FormDashboard.pas)
// Esta tarefa foca nos cards visuais — complemento ao epico

unit FrameCard;

interface

uses
  System.SysUtils, System.Classes,
  Vcl.Forms, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Controls, Vcl.Graphics;

type
  TfraCard = class(TFrame)
    pnlCard: TPanel;
    lblValor: TLabel;
    lblTitulo: TLabel;
    procedure FrameCreate(Sender: TObject);
  public
    procedure Configurar(const ATitulo, AValor: string; ACorFundo: TColor);
  end;

implementation

{$R *.dfm}

procedure TfraCard.FrameCreate(Sender: TObject);
begin
  pnlCard.BevelOuter := bvNone;

  lblValor.Font.Height := -32;
  lblValor.Font.Style  := [fsBold];
  lblValor.Alignment   := taCenter;

  lblTitulo.Font.Height := -12;
  lblTitulo.Alignment   := taCenter;
end;

procedure TfraCard.Configurar(const ATitulo, AValor: string; ACorFundo: TColor);
begin
  lblTitulo.Caption := ATitulo;
  lblValor.Caption  := AValor;
  pnlCard.Color     := ACorFundo;

  // Cor do texto baseada na luminosidade do fundo
  if ACorFundo < $808080 then
  begin
    lblValor.Font.Color  := clWhite;
    lblTitulo.Font.Color := clWhite;
  end;
end;

// Uso no FormDashboard:
// fraCardProdutos.Configurar('Produtos', IntToStr(Total), $004C9F50);  // verde
// fraCardUsuarios.Configurar('Usuários', IntToStr(Usuarios), $00437ABD); // azul
// fraCardVendas.Configurar('Vendas Hoje', 'R$ ' + Valor, $00C0392B);    // vermelho
end.
""",
    },

    "BILL-21": {
        "analise": (
            "Endpoint REST GET /dashboard. Retorna JSON com os KPIs do sistema: "
            "total de produtos, usuários ativos, valor de vendas do dia e "
            "vendas por dia nos últimos 7 dias (para o gráfico)."
        ),
        "codigo": """\
// Rota GET /dashboard

procedure RotaDashboard(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Q: TFDQuery;
  Kpis: TJSONObject;
  Vendas7Dias: TJSONArray;
  Item: TJSONObject;
begin
  try
    Q := TFDQuery.Create(nil);
    try
      Q.Connection := GConn;
      Kpis := TJSONObject.Create;

      // Total de produtos ativos
      Q.SQL.Text := 'SELECT COUNT(*) AS total FROM produtos WHERE ativo = 1';
      Q.Open;
      Kpis.AddPair('total_produtos', TJSONNumber.Create(Q.FieldByName('total').AsInteger));

      // Usuarios ativos
      Q.SQL.Text := 'SELECT COUNT(*) AS total FROM usuarios WHERE ativo = 1';
      Q.Open;
      Kpis.AddPair('usuarios_ativos', TJSONNumber.Create(Q.FieldByName('total').AsInteger));

      // Vendas do dia
      Q.SQL.Text :=
        'SELECT COALESCE(SUM(valor_total), 0) AS total FROM pedidos ' +
        'WHERE DATE(criado_em) = CURDATE()';
      Q.Open;
      Kpis.AddPair('vendas_hoje', TJSONNumber.Create(Q.FieldByName('total').AsFloat));

      // Vendas por dia — últimos 7 dias
      Q.SQL.Text :=
        'SELECT DATE_FORMAT(criado_em, ''%Y-%m-%d'') AS dia, ' +
        '       SUM(valor_total) AS total ' +
        'FROM pedidos ' +
        'WHERE criado_em >= DATE_SUB(NOW(), INTERVAL 7 DAY) ' +
        'GROUP BY dia ORDER BY dia';
      Q.Open;

      Vendas7Dias := TJSONArray.Create;
      while not Q.Eof do
      begin
        Item := TJSONObject.Create;
        Item.AddPair('dia',   Q.FieldByName('dia').AsString);
        Item.AddPair('total', TJSONNumber.Create(Q.FieldByName('total').AsFloat));
        Vendas7Dias.Add(Item);
        Q.Next;
      end;
      Kpis.AddPair('vendas_7_dias', Vendas7Dias);

      Res.Status(200).Send<TJSONObject>(Kpis);
    finally
      Q.Free;
    end;
  except
    on E: Exception do
      Res.Status(500).Send<TJSONObject>(
        TJSONObject.Create.AddPair('erro', E.Message)
      );
  end;
end;

// Registrar: THorse.Get('/dashboard', RotaDashboard);
""",
    },

    "BILL-22": {
        "analise": (
            "Tarefa: Frontend do dashboard. Consumir o endpoint GET /dashboard "
            "via TRESTClient, popular os cards de KPI e o gráfico de vendas. "
            "Atualizar automaticamente a cada minuto com TTimer."
        ),
        "codigo": """\
// Ver FormDashboard.pas em BILL-3 — esta tarefa adiciona o consumo REST

procedure TfrmDashboard.CarregarKPIsViaAPI;
var
  Client: TRESTClient;
  Request: TRESTRequest;
  Response: TRESTResponse;
  Json: TJSONObject;
  Vendas: TJSONArray;
  I: Integer;
  Item: TJSONObject;
begin
  Client   := TRESTClient.Create(FBaseURL);
  Request  := TRESTRequest.Create(nil);
  Response := TRESTResponse.Create(nil);
  try
    Request.Client   := Client;
    Request.Response := Response;
    Request.Resource := 'dashboard';
    Request.Method   := rmGET;

    // Token de autenticacao no header
    Request.AddAuthParameter('Authorization',
      'Bearer ' + FTokenSessao, pkHTTPHEADER, [poDoNotEncode]);

    Request.Execute;

    if Response.StatusCode = 200 then
    begin
      Json := Response.JSONValue as TJSONObject;

      lblTotalProdutos.Caption :=
        'Produtos: ' + Json.GetValue<string>('total_produtos');
      lblUsuariosAtivos.Caption :=
        'Usuários: ' + Json.GetValue<string>('usuarios_ativos');
      lblVendasHoje.Caption :=
        'Vendas hoje: R$ ' +
        FormatCurr('#,##0.00', Json.GetValue<Double>('vendas_hoje'));

      // Grafico
      seriesVendas.Clear;
      Vendas := Json.GetValue<TJSONArray>('vendas_7_dias');
      for I := 0 to Vendas.Count - 1 do
      begin
        Item := Vendas.Items[I] as TJSONObject;
        seriesVendas.Add(
          Item.GetValue<Double>('total'),
          Copy(Item.GetValue<string>('dia'), 9, 2) + '/' +
          Copy(Item.GetValue<string>('dia'), 6, 2)  // dd/mm
        );
      end;
    end;
  finally
    Response.Free;
    Request.Free;
    Client.Free;
  end;
end;
""",
    },

    "BILL-23": {
        "analise": (
            "Feature: Reset de senha. Fluxo: usuário solicita reset informando e-mail, "
            "sistema gera um código temporário (token), salva no banco com expiração "
            "de 1 hora e envia por e-mail. Ao receber o token, usuário define nova senha."
        ),
        "codigo": """\
unit ResetSenhaService;

interface

uses
  System.SysUtils, System.DateUtils,
  FireDAC.Comp.Client, Seguranca, EmailService;

type
  TResetSenhaService = class
  private
    FConn: TFDConnection;
    FEmailService: TEmailService;
  public
    constructor Create(AConn: TFDConnection; AEmailService: TEmailService);
    function SolicitarReset(const AEmail: string): Boolean;
    function ValidarToken(const AToken: string): Boolean;
    function RedefinirSenha(const AToken, ANovaSenha: string): Boolean;
  end;

implementation

constructor TResetSenhaService.Create(AConn: TFDConnection;
  AEmailService: TEmailService);
begin
  FConn := AConn;
  FEmailService := AEmailService;
end;

function TResetSenhaService.SolicitarReset(const AEmail: string): Boolean;
var
  Q: TFDQuery;
  Token: string;
  UsuarioId: Integer;
begin
  Result := False;
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FConn;

    // Verifica se o e-mail existe
    Q.SQL.Text := 'SELECT id FROM usuarios WHERE email = :email AND ativo = 1';
    Q.ParamByName('email').AsString := AEmail;
    Q.Open;

    if Q.IsEmpty then Exit; // Nao revela se e-mail existe (segurança)

    UsuarioId := Q.FieldByName('id').AsInteger;
    Token := TSeguranca.GerarToken;

    // Salva token com expiração de 1 hora
    Q.SQL.Text :=
      'INSERT INTO reset_senha (usuario_id, token, expira_em, usado) ' +
      'VALUES (:uid, :token, :expira, 0)';
    Q.ParamByName('uid').AsInteger   := UsuarioId;
    Q.ParamByName('token').AsString  := Token;
    Q.ParamByName('expira').AsDateTime := IncHour(Now, 1);
    Q.ExecSQL;

    // Envia e-mail
    FEmailService.EnviarResetSenha(AEmail, Token);
    Result := True;
  finally
    Q.Free;
  end;
end;

function TResetSenhaService.ValidarToken(const AToken: string): Boolean;
var
  Q: TFDQuery;
begin
  Result := False;
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FConn;
    Q.SQL.Text :=
      'SELECT 1 FROM reset_senha ' +
      'WHERE token = :token AND usado = 0 AND expira_em > NOW()';
    Q.ParamByName('token').AsString := AToken;
    Q.Open;
    Result := not Q.IsEmpty;
  finally
    Q.Free;
  end;
end;

function TResetSenhaService.RedefinirSenha(const AToken,
  ANovaSenha: string): Boolean;
var
  Q: TFDQuery;
  UsuarioId: Integer;
begin
  Result := False;
  if not ValidarToken(AToken) then Exit;

  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FConn;

    Q.SQL.Text := 'SELECT usuario_id FROM reset_senha WHERE token = :token';
    Q.ParamByName('token').AsString := AToken;
    Q.Open;
    UsuarioId := Q.FieldByName('usuario_id').AsInteger;

    Q.SQL.Text := 'UPDATE usuarios SET senha = :senha WHERE id = :id';
    Q.ParamByName('senha').AsString   := TSeguranca.HashSHA256(ANovaSenha);
    Q.ParamByName('id').AsInteger     := UsuarioId;
    Q.ExecSQL;

    // Invalida o token
    Q.SQL.Text := 'UPDATE reset_senha SET usado = 1 WHERE token = :token';
    Q.ParamByName('token').AsString := AToken;
    Q.ExecSQL;

    Result := True;
  finally
    Q.Free;
  end;
end;

end.
""",
    },

    "BILL-24": {
        "analise": (
            "Endpoint REST POST /auth/forgot-password. Recebe JSON com e-mail, "
            "aciona o TResetSenhaService e sempre retorna 200 (não revela se "
            "o e-mail existe, por segurança). "
            "Também implementar POST /auth/reset-password com token e nova senha."
        ),
        "codigo": """\
// Rotas de reset de senha — adicionar ao Server.pas

procedure RotaForgotPassword(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Body: TJSONObject;
  Email: string;
  Svc: TResetSenhaService;
begin
  try
    Body  := Req.Body<TJSONObject>;
    Email := Body.GetValue<string>('email', '');

    if Email = '' then
    begin
      Res.Status(400).Send<TJSONObject>(
        TJSONObject.Create.AddPair('erro', 'E-mail é obrigatório')
      );
      Exit;
    end;

    Svc := TResetSenhaService.Create(GConn, GEmailService);
    try
      Svc.SolicitarReset(Email); // ignora retorno por segurança
    finally
      Svc.Free;
    end;

    // Sempre retorna 200 para não revelar se e-mail está cadastrado
    Res.Status(200).Send<TJSONObject>(
      TJSONObject.Create.AddPair(
        'mensagem',
        'Se o e-mail estiver cadastrado, você receberá as instruções em breve'
      )
    );
  except
    on E: Exception do
      Res.Status(500).Send<TJSONObject>(
        TJSONObject.Create.AddPair('erro', E.Message)
      );
  end;
end;

procedure RotaResetPassword(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Body: TJSONObject;
  Token, NovaSenha: string;
  Svc: TResetSenhaService;
begin
  try
    Body      := Req.Body<TJSONObject>;
    Token     := Body.GetValue<string>('token', '');
    NovaSenha := Body.GetValue<string>('nova_senha', '');

    if (Token = '') or (NovaSenha = '') then
    begin
      Res.Status(400).Send<TJSONObject>(
        TJSONObject.Create.AddPair('erro', 'Token e nova senha são obrigatórios')
      );
      Exit;
    end;

    if Length(NovaSenha) < 8 then
    begin
      Res.Status(400).Send<TJSONObject>(
        TJSONObject.Create.AddPair('erro', 'Nova senha deve ter pelo menos 8 caracteres')
      );
      Exit;
    end;

    Svc := TResetSenhaService.Create(GConn, GEmailService);
    try
      if Svc.RedefinirSenha(Token, NovaSenha) then
        Res.Status(200).Send<TJSONObject>(
          TJSONObject.Create.AddPair('mensagem', 'Senha redefinida com sucesso')
        )
      else
        Res.Status(400).Send<TJSONObject>(
          TJSONObject.Create.AddPair('erro', 'Token inválido ou expirado')
        );
    finally
      Svc.Free;
    end;
  except
    on E: Exception do
      Res.Status(500).Send<TJSONObject>(
        TJSONObject.Create.AddPair('erro', E.Message)
      );
  end;
end;

// Registrar:
// THorse.Post('/auth/forgot-password', RotaForgotPassword);
// THorse.Post('/auth/reset-password', RotaResetPassword);
""",
    },

    "BILL-25": {
        "analise": (
            "Feature: Envio de e-mail (SMTP). Implementar serviço de e-mail "
            "usando Indy (TIdSMTP + TIdMessage). Usar para envio de confirmação "
            "de cadastro e reset de senha. Configurar via variáveis de ambiente "
            "para não expor credenciais no código."
        ),
        "codigo": """\
unit EmailService;

interface

uses
  System.SysUtils, System.Classes,
  IdSMTP, IdMessage, IdText, IdSSLOpenSSL, IdComponent,
  IdBaseComponent, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdTCPConnection, IdTCPClient;

type
  TEmailService = class
  private
    FHost: string;
    FPort: Integer;
    FUsuario: string;
    FSenha: string;
    FRemetente: string;
    FUsarSSL: Boolean;
  public
    constructor Create(
      const AHost, AUsuario, ASenha, ARemetente: string;
      APort: Integer = 587;
      AUsarSSL: Boolean = True
    );
    procedure EnviarEmail(
      const ADestinatario, AAssunto, ACorpo: string
    );
    procedure EnviarResetSenha(const AEmail, AToken: string);
    procedure EnviarBoasVindas(const AEmail, ANome: string);
  end;

implementation

constructor TEmailService.Create(const AHost, AUsuario, ASenha,
  ARemetente: string; APort: Integer; AUsarSSL: Boolean);
begin
  FHost      := AHost;
  FPort      := APort;
  FUsuario   := AUsuario;
  FSenha     := ASenha;
  FRemetente := ARemetente;
  FUsarSSL   := AUsarSSL;
end;

procedure TEmailService.EnviarEmail(const ADestinatario, AAssunto, ACorpo: string);
var
  SMTP: TIdSMTP;
  MSG: TIdMessage;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
begin
  SMTP := TIdSMTP.Create(nil);
  MSG  := TIdMessage.Create(nil);
  SSL  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    if FUsarSSL then
    begin
      SSL.SSLOptions.Method  := sslvTLSv1_2;
      SSL.SSLOptions.Mode    := sslmClient;
      SMTP.IOHandler         := SSL;
      SMTP.UseTLS            := utUseExplicitTLS;
    end;

    SMTP.Host     := FHost;
    SMTP.Port     := FPort;
    SMTP.Username := FUsuario;
    SMTP.Password := FSenha;
    SMTP.AuthType := satDefault;

    MSG.From.Address := FRemetente;
    MSG.From.Name    := 'Sistema Bill';
    MSG.Recipients.EMailAddresses := ADestinatario;
    MSG.Subject  := AAssunto;
    MSG.CharSet  := 'utf-8';

    with TIdText.Create(MSG.MessageParts, nil) do
    begin
      Body.Text    := ACorpo;
      ContentType  := 'text/html; charset=utf-8';
    end;

    SMTP.Connect;
    try
      SMTP.Send(MSG);
    finally
      SMTP.Disconnect;
    end;
  finally
    MSG.Free;
    SSL.Free;
    SMTP.Free;
  end;
end;

procedure TEmailService.EnviarResetSenha(const AEmail, AToken: string);
var
  LinkReset, Corpo: string;
begin
  LinkReset := 'https://seusite.com/reset-senha?token=' + AToken;
  Corpo :=
    '<h2>Redefinição de senha</h2>' +
    '<p>Clique no link abaixo para redefinir sua senha:</p>' +
    '<p><a href="' + LinkReset + '">' + LinkReset + '</a></p>' +
    '<p>Este link expira em 1 hora.</p>' +
    '<p>Se você não solicitou a redefinição, ignore este e-mail.</p>';

  EnviarEmail(AEmail, 'Redefinição de senha — Sistema Bill', Corpo);
end;

procedure TEmailService.EnviarBoasVindas(const AEmail, ANome: string);
var
  Corpo: string;
begin
  Corpo :=
    '<h2>Bem-vindo, ' + ANome + '!</h2>' +
    '<p>Sua conta foi criada com sucesso no Sistema Bill.</p>' +
    '<p>Agora você pode acessar o sistema com seu e-mail e senha cadastrados.</p>';

  EnviarEmail(AEmail, 'Bem-vindo ao Sistema Bill!', Corpo);
end;

end.

// Instanciar na inicializacao da aplicacao:
// GEmailService := TEmailService.Create(
//   GetEnvironmentVariable('SMTP_HOST'),
//   GetEnvironmentVariable('SMTP_USER'),
//   GetEnvironmentVariable('SMTP_PASS'),
//   GetEnvironmentVariable('SMTP_FROM'),
//   StrToIntDef(GetEnvironmentVariable('SMTP_PORT'), 587)
// );
""",
    },
}


# ---------------------------------------------------------------------------
# Funções de montagem do comentário em ADF (Atlassian Document Format)
# ---------------------------------------------------------------------------

def montar_comentario_adf(analise: str, codigo: str, issue_key: str) -> dict:
    """Monta o body do comentário no formato ADF esperado pela API v3 do Jira."""

    def paragrafo(texto: str) -> dict:
        return {
            "type": "paragraph",
            "content": [{"type": "text", "text": texto}]
        }

    def bloco_codigo(codigo: str) -> dict:
        return {
            "type": "codeBlock",
            "attrs": {"language": "pascal"},
            "content": [{"type": "text", "text": codigo}]
        }

    def titulo(texto: str, nivel: int = 3) -> dict:
        return {
            "type": f"heading",
            "attrs": {"level": nivel},
            "content": [{"type": "text", "text": texto}]
        }

    return {
        "body": {
            "version": 1,
            "type": "doc",
            "content": [
                titulo(f"Orientação de Desenvolvimento — {issue_key}", nivel=3),
                paragrafo("Linguagem: Delphi | Framework: FireDAC + Horse + Indy"),
                titulo("Análise", nivel=4),
                paragrafo(analise),
                titulo("Código Fonte (Delphi)", nivel=4),
                bloco_codigo(codigo),
                paragrafo(
                    "Gerado automaticamente pelo agente de análise. "
                    "Revise e adapte ao contexto real do projeto antes de usar em produção."
                ),
            ]
        }
    }


def postar_comentario(issue_key: str, body: dict) -> bool:
    """Posta o comentário em uma issue via API v3."""
    url = f"{JIRA_URL}/rest/api/3/issue/{issue_key}/comment"
    resp = requests.post(url, auth=AUTH, headers=HEADERS_JSON, json=body)
    return resp.status_code == 201


def buscar_issues_pendentes() -> list[dict]:
    """Retorna todas as issues com status 10004 (Tarefas pendentes)."""
    payload = {
        "jql": "project = BILL AND status = 10004 ORDER BY key ASC",
        "maxResults": 100,
        "fieldsByKeys": False,
        "fields": ["summary", "status"],
    }
    resp = requests.post(
        f"{JIRA_URL}/rest/api/3/search/jql",
        auth=AUTH,
        headers=HEADERS_JSON,
        json=payload,
    )
    resp.raise_for_status()
    return resp.json().get("issues", [])


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main():
    console.print("[bold blue]Buscando issues com status 'Tarefas pendentes'...[/bold blue]")
    issues = buscar_issues_pendentes()

    if not issues:
        console.print("[yellow]Nenhuma issue encontrada com esse status.[/yellow]")
        return

    console.print(f"[green]{len(issues)} issues encontradas.[/green]\n")

    sucesso = 0
    sem_codigo = []

    for issue in track(issues, description="Postando comentarios..."):
        key = issue["key"]
        summary = issue["fields"]["summary"]

        if key not in DELPHI_POR_ISSUE:
            sem_codigo.append(key)
            continue

        info = DELPHI_POR_ISSUE[key]
        body = montar_comentario_adf(info["analise"], info["codigo"], key)

        if postar_comentario(key, body):
            console.print(f"  [green]OK[/green] {key} - {summary}")
            sucesso += 1
        else:
            console.print(f"  [red]ERRO[/red] {key} - falha ao postar comentario")

    console.print(f"\n[bold green]Concluido: {sucesso}/{len(issues)} comentarios postados.[/bold green]")

    if sem_codigo:
        console.print(f"[yellow]Issues sem codigo Delphi mapeado: {', '.join(sem_codigo)}[/yellow]")


if __name__ == "__main__":
    main()
