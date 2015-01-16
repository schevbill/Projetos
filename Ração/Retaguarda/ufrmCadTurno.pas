unit ufrmCadTurno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmModeloCad, Data.DB, IBCustomDataSet,
  IBQuery, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

type
  TfrmCadTurno = class(TfrmModeloCad)
    Panel1: TPanel;
    edtTurno: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtPescTurno: TEdit;
    Label2: TLabel;
    cktodos: TCheckBox;
    dtHrInicial: TDateTimePicker;
    dtHrFinal: TDateTimePicker;
    qrySelectID_TURNO: TIntegerField;
    qrySelectDESCRICAO: TIBStringField;
    qrySelectHORAINICIO: TTimeField;
    qrySelectHORAFIM: TTimeField;

    procedure pAtualizaTURNO;
    procedure pCarregarEdit(vID_TURNO : Integer);
    procedure pGravarAtualizarDeletar(vStatus : String; vID_TURNO: Integer);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure cktodosClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure gGridPesquisaCellClick(Column: TColumn);
    procedure gGridPesquisaDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure gGridPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);



  private
    { Private declarations }
    vStatus :string;
  public
    { Public declarations }
  end;

var
  frmCadTurno: TfrmCadTurno;

implementation

{$R *.dfm}

uses UfrmFuncionario, ufrmPrincipal, uModule;

procedure TfrmCadTurno.btnAnteriorClick(Sender: TObject);
begin
   inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_TURNO').AsInteger);
end;

procedure TfrmCadTurno.btnEditarClick(Sender: TObject);
begin
   inherited;
   vStatus := 'EDITAR';
   pCarregarEdit(qrySelect.FieldByName('ID_TURNO').AsInteger);
   edtTurno.SetFocus;
end;

procedure TfrmCadTurno.btnExcluirClick(Sender: TObject);
var
   vPergunta : Integer;
begin
   inherited;
   vPergunta := MessageBox(Handle, pchar('Deseja excluir esse registro ?') , pchar(NomeSistema), 36);
   if vPergunta = 6 then
   begin
      pGravarAtualizarDeletar('DELETAR',qrySelect.FieldByName('ID_TURNO').AsInteger);
      pAtualizaTURNO;
      pCarregarEdit(qrySelect.FieldByName('ID_TURNO').AsInteger);
   end;
end;

procedure TfrmCadTurno.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  pAtualizaTURNO;
end;

procedure TfrmCadTurno.btnGravarClick(Sender: TObject);
var
vPergunta :Integer;
begin
    vPergunta := MessageBox(Handle, pchar('Deseja gravar esse registro ?') , pchar(NomeSistema), 36);
   if vPergunta = 6 then
   begin
      pGravarAtualizarDeletar(vStatus,qrySelect.FieldByName('ID_TURNO').AsInteger);
      Module.IBTransaction.CommitRetaining;
   end;

   inherited;
   pAtualizaTURNO;
   pCarregarEdit(qrySelect.FieldByName('ID_TURNO').AsInteger);

end;

procedure TfrmCadTurno.btnNovoClick(Sender: TObject);
begin
  inherited;
   vStatus := 'NOVO';
   edtTurno.SetFocus;
end;

procedure TfrmCadTurno.btnPrimeiroClick(Sender: TObject);
begin
   inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_TURNO').AsInteger);
end;

procedure TfrmCadTurno.btnProximoClick(Sender: TObject);
begin
   inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_TURNO').AsInteger);
end;

procedure TfrmCadTurno.btnUltimoClick(Sender: TObject);
begin
   inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_TURNO').AsInteger);
end;

procedure TfrmCadTurno.cktodosClick(Sender: TObject);
begin
   inherited;
   if CKTODOS.State = cbChecked then
   begin
      edtPescTurno.Enabled := false;
      edtPescTurno.Text    := '';
   end
   else
   begin
      edtPescTurno.Enabled := true;
      edtPescTurno.SetFocus;
   end;
end;

procedure TfrmCadTurno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Action := caFree;
   frmCadTurno := nil;
end;

procedure TfrmCadTurno.FormShow(Sender: TObject);
begin
  inherited;
   pAtualizaTURNO;
   pCarregarEdit(qrySelect.FieldByName('ID_TURNO').AsInteger);
end;

procedure TfrmCadTurno.gGridPesquisaCellClick(Column: TColumn);
begin
   inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_TURNO').AsInteger);
end;

procedure TfrmCadTurno.gGridPesquisaDblClick(Sender: TObject);
begin
   inherited;
   Panel1.Enabled  := True;
   pcGuia.TabIndex := 1;
   pCarregarEdit(qrySelect.FieldByName('ID_TURNO').AsInteger);
end;

procedure TfrmCadTurno.gGridPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   if (key = #13) and (pcGuia.TabIndex = 0) then
   begin
      pCarregarEdit(qrySelect.FieldByName('ID_TURNO').AsInteger);
      pcGuia.TabIndex := 1;
   end;
end;

procedure TfrmCadTURNO.pAtualizaTURNO;
begin
   with qrySelect do
   begin
      Close;
      SQL.Clear;
      sql.Add('SELECT ID_TURNO, DESCRICAO, HORAINICIO, HORAFIM  ');
      sql.Add('FROM TURNO    ');
      SQL.Add('WHERE (1 = 1) ');

      if CKTODOS.Checked = FALSE then
      begin
         SQL.Add('AND upper(DESCRICAO) LIKE upper(:TURNO)');
         ParamByName('TURNO').AsString := '%'+edtPescTurno.TEXT+'%';
      end;
      Open;
   end;
end;

procedure TfrmCadTURNO.pCarregarEdit(vID_TURNO : Integer);
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
      SQL.Add('SELECT * FROM TURNO              ');
      SQL.Add('WHERE ID_TURNO = :ID_TURNO ');
      ParamByName('ID_TURNO').AsInteger := vID_TURNO;
      Open;

      edtTurno.Text         := FieldByName('DESCRICAO').AsString;
      dtHrInicial.DateTime  := FieldByName('HORAINICIO').AsDateTime;
      dtHrFinal.DateTime    := FieldByName('HORAFIM').AsDateTime;
    end;

   FreeAndNil(qryCarregar);
end;

procedure TfrmCadTURNO.pGravarAtualizarDeletar(vStatus: String; vID_TURNO: Integer);
begin
   try
      qryGravar.Database    := Module.IBLOJAHS;
      qryGravar.Transaction := Module.IBTransaction;

      if vStatus = 'NOVO' then
      begin
         with qryGravar do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' INSERT INTO TURNO                              ');
            SQL.Add(' (                                              ');
            SQL.Add(' ID_TURNO, DESCRICAO, HORAINICIO, HORAFIM    ');
            SQL.Add(' )                                              ');
            SQL.Add(' VALUES                                         ');
            SQL.Add(' (                                              ');
            SQL.Add(' :ID_TURNO,:DESCRICAO, :HORAINICIO,:HORAFIM ');
            SQL.Add(' )                                              ');
            ParamByName('ID_TURNO').AsInteger := 0;
         end;
      end
      else if vStatus = 'EDITAR' then
      begin
         with qryGravar do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' UPDATE TURNO SET DESCRICAO = :DESCRICAO,  HORAINICIO = :HORAINICIO, HORAFIM = :HORAFIM ');
            SQL.Add(' WHERE ID_TURNO = :ID_TURNO                           ');
            ParamByName('ID_TURNO').Value := vID_TURNO;
         end;
      end
      else
      begin
         with qryGravar do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' DELETE FROM TURNO          ');
            SQL.Add(' WHERE ID_TURNO = :ID_TURNO ');
            ParamByName('ID_TURNO').Value := vID_TURNO;
         end;
      end;

      if vStatus <> 'DELETAR' then
      begin
         with qryGravar do
         begin
            ParamByName('DESCRICAO').AsString       := edtTurno.Text;
            ParamByName('HORAINICIO').AsTime    := dtHrInicial.Time;
            ParamByName('HORAFIM').AsTime       := dtHrFinal.Time;
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

end.
