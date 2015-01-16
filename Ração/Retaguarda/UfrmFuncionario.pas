unit UfrmFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmModeloCad, Data.DB, IBCustomDataSet,
  IBQuery, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.DBLookup, Vcl.Imaging.pngimage, IBTable,
  Vcl.Mask, ACBrBase, ACBrValidador;

type
  TfrmCadFuncionario = class(TfrmModeloCad)
    Label2: TLabel;
    edtNome: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cknome: TCheckBox;
    ckcargo: TCheckBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DTAdmissao: TDateTimePicker;
    Label12: TLabel;
    DTdemissao: TDateTimePicker;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DT_nasc: TDateTimePicker;
    Label18: TLabel;
    DBLTurno: TDBLookupComboBox;
    DBLCargo: TDBLookupComboBox;
    DBLCidade: TDBLookupComboBox;
    Label19: TLabel;
    DBLUF: TDBLookupComboBox;
    qryTurno: TIBQuery;
    qryTurnoID_TURNO: TIntegerField;
    qryTurnoDESCRICAO: TIBStringField;
    dtsTurno: TDataSource;
    qryCargo: TIBQuery;
    qryCargoID_CARGO: TIntegerField;
    qryCargoDESCRICAO: TIBStringField;
    qryCargoTIPO: TIBStringField;
    dtsCargo: TDataSource;
    dbeNome: TEdit;
    dbeRG: TEdit;
    dbeCPF: TEdit;
    dbeTelefone: TEdit;
    dbeBairro: TEdit;
    dbeComissao: TEdit;
    mObs: TMemo;
    dbeEndereco: TEdit;
    dbeCep: TEdit;
    rgAtivoIna: TRadioGroup;
    qrySelectNOME: TIBStringField;
    qrySelectDT_NASCTO: TDateField;
    qrySelectENDERECO: TIBStringField;
    qrySelectTELEFONE: TIBStringField;
    qrySelectATIVO: TIBStringField;
    qrySelectADMISSAO: TDateField;
    qrySelectDEMISSAO: TDateField;
    qrySelectOBSERVACAO: TBlobField;
    qrySelectCOMISSAO: TFloatField;
    qrySelectRG: TIBStringField;
    qrySelectCPF: TIBStringField;
    qrySelectCEP: TIBStringField;
    qrySelectDESCRICAO: TIBStringField;
    qrySelectDESCRICAO1: TIBStringField;
    qrySelectID_FUNCIONARIO: TIntegerField;
    ckcidade: TCheckBox;
    edtcargo: TDBLookupComboBox;
    edtCIdade: TDBLookupComboBox;
    qryTurnoHORAINICIO: TTimeField;
    qryTurnoHORAFIM: TTimeField;
    procedure pAtualizaFuncionario;
    procedure pGravarAtualizarDeletar(vStatus : String; vID_Func: Integer);
    procedure pCarregarEdit(vID_Funcionario : Integer);


    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure btnNovoClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);

    procedure gGridPesquisaDblClick(Sender: TObject);
    procedure edtCIdadeExit(Sender: TObject);

    procedure cknomeClick(Sender: TObject);
    procedure ckcargoClick(Sender: TObject);
    procedure ckcidadeClick(Sender: TObject);

    procedure dbeCEPExit(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);

    procedure mObsKeyPress(Sender: TObject; var Key: Char);
    procedure rgAtivoInaClick(Sender: TObject);
    procedure gGridPesquisaCellClick(Column: TColumn);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure gGridPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeChange(Sender: TObject);

  private
    { Private declarations }
    vStatus : String;
  public
    { Public declarations }
  end;

var
  frmCadFuncionario: TfrmCadFuncionario;

implementation

{$R *.dfm}

uses uModule, ufrmCadCidade, ufrmEntrada, ufrmPrincipal, uFuncoes;

procedure TfrmCadFuncionario.pAtualizaFuncionario;
begin
   Module.qryUF.Close;
   Module.qryUF.Open;

   Module.qryCidade.Close;
   Module.qryCidade.Open;

   qryCargo.Close;
   qryCargo.Open;

   qryTurno.Close;
   qryTurno.Open;

   with qrySelect do
   begin
      Close;
      SQL.Clear;
      sql.Add(' SELECT F.ID_FUNCIONARIO,F.NOME, F.DT_NASCTO, F.BAIRRO, F.ENDERECO,  ');
      sql.Add('        F.TELEFONE, F.ATIVO, F.ADMISSAO, F.DEMISSAO, F.OBSERVACAO,   ');
      sql.Add('        F.COMISSAO, F.RG, F.CPF, F.CEP, CRG.DESCRICAO, CID.DESCRICAO ');
      sql.Add(' FROM FUNCIONARIO F                                                  ');
      SQL.Add(' INNER JOIN CIDADE CID ON (F.ID_CIDADE = CID.ID_CIDADE)              ');
      SQL.Add(' INNER JOIN CARGO CRG ON (F.ID_CARGO = CRG.ID_CARGO)                 ');
      SQL.Add(' WHERE (1 = 1)                                                       ');

      if cknome.Checked = FALSE then
      begin
         SQL.Add(' AND upper(F.NOME) LIKE upper(:NOME) ');
         ParamByName('NOME').AsString := '%'+edtNome.TEXT+'%';
      end;

      if ckcidade.Checked = False  then
      begin
         sql.Add(' AND upper(CID.DESCRICAO) LIKE upper(:CIDADE) ');
         ParamByName('CIDADE').AsString := '%'+EDTCIdade.Text+'%';
      end;

      if ckcargo.Checked = FALSE then
      Begin
         SQL.Add(' AND upper(CRG.DESCRICAO) LIKE upper(:CARGO) ');
         ParamByName('CARGO').AsString := '%'+Edtcargo.Text+'%';
      End;

      if (RadioGroup1.ItemIndex) = 0 then
      begin
         SQL.Add(' AND F.ATIVO = :ATIVO ');
         ParamByName('ATIVO').AsString := 'A';
      end
      else
      begin
         SQL.Add(' AND F.ATIVO = :ATIVO ');
         ParamByName('ATIVO').AsString := 'I';
      end;
      Open;
   end;
end;

procedure TfrmCadFuncionario.pCarregarEdit(vID_Funcionario : Integer);
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
      SQL.Add('SELECT * FROM FUNCIONARIO              ');
      SQL.Add('WHERE ID_FUNCIONARIO = :ID_FUNCIONARIO ');
      ParamByName('ID_FUNCIONARIO').AsInteger := vID_Funcionario;
      Open;

      dbeNome.Text         := FieldByName('NOME').AsString;
      DT_nasc.Date         := FieldByName('DT_NASCTO').AsDateTime;
      dbeEndereco.Text     := FieldByName('ENDERECO').AsString;
      dbeBairro.Text       := FieldByName('BAIRRO').AsString;
      DBLCidade.KeyValue   := FieldByName('ID_CIDADE').AsInteger;
      DBLUF.KeyValue       := FieldByName('ID_UF').AsInteger;
      dbeTelefone.Text     := FieldByName('TELEFONE').AsString;

      if FieldByName('ATIVO').AsString = 'A' then
         rgAtivoIna.ItemIndex := 0
      else
         rgAtivoIna.ItemIndex := 1;

      DTdemissao.Date   := FieldByName('DEMISSAO').AsDateTime;
      DTAdmissao.Date   := FieldByName('ADMISSAO').AsDateTime;
      DBLTurno.KeyValue := FieldByName('ID_TURNO').AsInteger;
      DBLCargo.KeyValue := FieldByName('ID_CARGO').AsInteger;
      dbeComissao.Text  := FormatFloat('###,##0.00',FieldByName('COMISSAO').AsFloat);
      dbeRG.Text        := FieldByName('RG').AsString;
      dbeCPF.Text       := FieldByName('CPF').AsString;
      dbeCep.Text       := FieldByName('CEP').AsString;
      mObs.Lines.Clear;
      mObs.Lines.Add(FieldByName('OBSERVACAO').AsString);
    end;

   FreeAndNil(qryCarregar);
end;

procedure TfrmCadFuncionario.btnAnteriorClick(Sender: TObject);
begin
   inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_FUNCIONARIO').AsInteger);
end;

procedure TfrmCadFuncionario.btnEditarClick(Sender: TObject);
begin
   inherited;
   vStatus := 'EDITAR';
   pCarregarEdit(qrySelect.FieldByName('ID_FUNCIONARIO').AsInteger);
   dbeNome.SetFocus;
end;

procedure TfrmCadFuncionario.btnExcluirClick(Sender: TObject);
var
  vPergunta : Integer;
begin
   inherited;
   vPergunta := MessageBox(Handle, pchar('Deseja excluir esse registro ?') , pchar(NomeSistema), 36);
   if vPergunta = 6 then
   begin
      pGravarAtualizarDeletar('DELETAR',qrySelect.FieldByName('ID_FUNCIONARIO').AsInteger);
      pAtualizaFuncionario;
      pCarregarEdit(qrySelect.FieldByName('ID_FUNCIONARIO').AsInteger);
   end;
end;

procedure TfrmCadFuncionario.btnFiltrarClick(Sender: TObject);
begin
   inherited;
   pAtualizaFuncionario;
end;

procedure TfrmCadFuncionario.btnGravarClick(Sender: TObject);
var
   vPergunta : Integer;
begin
   vPergunta := MessageBox(Handle, pchar('Deseja gravar esse registro ?') , pchar(NomeSistema), 36);
   if vPergunta = 6 then
   begin
      pGravarAtualizarDeletar(vStatus,qrySelect.FieldByName('ID_FUNCIONARIO').AsInteger);
      Module.IBTransaction.CommitRetaining;
   end;

   inherited;
   pAtualizaFuncionario;
   pCarregarEdit(qrySelect.FieldByName('ID_FUNCIONARIO').AsInteger);
end;

procedure TfrmCadFuncionario.btnNovoClick(Sender: TObject);
begin
   inherited;
   dbeNome.SetFocus;
   DBLTurno.KeyValue  := Null;
   DBLCargo.KeyValue  := Null;
   DBLCidade.KeyValue := Null;
   DBLUF.KeyValue     := Null;
   vStatus := 'NOVO';
end;

procedure TfrmCadFuncionario.btnPrimeiroClick(Sender: TObject);
begin
   inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_FUNCIONARIO').AsInteger);
end;

procedure TfrmCadFuncionario.btnProximoClick(Sender: TObject);
begin
   inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_FUNCIONARIO').AsInteger);
end;

procedure TfrmCadFuncionario.btnUltimoClick(Sender: TObject);
begin
   inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_FUNCIONARIO').AsInteger);
end;

procedure TfrmCadFuncionario.ckcargoClick(Sender: TObject);
begin
   inherited;
   if ckcargo.State = cbChecked then
      Edtcargo.Enabled := false
   else
   begin
      edtcargo.Enabled := true;
      edtcargo.SetFocus;
   end;
end;

procedure TfrmCadFuncionario.ckcidadeClick(Sender: TObject);
begin
   inherited;
   if ckcidade.State = cbChecked then
      edtCIdade.Enabled := false
   else
   begin
      edtCIdade.Enabled :=true;
      edtCIdade.SetFocus;
   end;
end;

procedure TfrmCadFuncionario.cknomeClick(Sender: TObject);
begin
   inherited;
   if cknome.State = cbChecked then
   begin
      edtnome.Enabled := False;
      edtNome.Text    := '';
   end
   else
   begin
      edtNome.Enabled := True;
      edtNome.SetFocus;
   end;
end;

procedure TfrmCadFuncionario.dbeCEPExit(Sender: TObject);
var
   qrySelect : TIBQuery;
   listaCEP : TStringList;
begin
   inherited;
   if dbeCEP.Text <> '' then
   begin
      listaCEP := TStringList.Create;
      ExtractStrings([','],[' '],pchar(uFuncoes.fBuscarWS(dbeCEP.Text)),listaCEP);

      try
         dbeEndereco.Text := TRIM(listaCEP.Strings[0]);
      except
      end;

      try
         dbeBAIRRO.Text   := TRIM(listaCEP.Strings[1]);
      except
      end;

      qrySelect := TIBQuery.Create(Self);

      try
         with qrySelect do
         begin
            Database    := Module.IBLOJAHS;
            Transaction := Module.IBTransaction;

            Close;
            SQL.Clear;
            SQL.Add(' SELECT ID_CIDADE FROM CIDADE ');
            SQL.Add(' WHERE upper(DESCRICAO) = :P_DESCRICAO ');
            ParamByName('P_DESCRICAO').AsString := UpperCase(TRIM(listaCEP.Strings[2]));
            Open;
            First;
         end;

         DBLCidade.KeyValue := qrySelect.FieldByName('ID_CIDADE').AsInteger;
      except
      end;

      try
         with qrySelect do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' SELECT ID_UF FROM UF ');
            SQL.Add(' WHERE upper(ESTADO) = :P_ESTADO ');
            ParamByName('P_ESTADO').AsString := UpperCase(TRIM(listaCEP.Strings[3]));
            Open;
            First;
         end;

         DBLUF.KeyValue := qrySelect.FieldByName('ID_UF').AsInteger;
      except
      end;

      FreeAndNil(qrySelect);
      FreeAndNil(listaCEP);
   end;
end;

procedure TfrmCadFuncionario.edtCIdadeExit(Sender: TObject);
begin
   inherited;
   if edtcidade.Text = '' then
      ckcidade.State  := cbChecked;
end;

procedure TfrmCadFuncionario.edtNomeChange(Sender: TObject);
begin
  inherited;
  pAtualizaFuncionario;
end;

procedure TfrmCadFuncionario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   Action := caFree;
   frmCadFuncionario := nil;
end;

procedure TfrmCadFuncionario.FormShow(Sender: TObject);
begin
   inherited;
   pAtualizaFuncionario;
   pCarregarEdit(qrySelect.FieldByName('ID_FUNCIONARIO').AsInteger);
end;

procedure TfrmCadFuncionario.gGridPesquisaCellClick(Column: TColumn);
begin
   inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_FUNCIONARIO').AsInteger);
end;

procedure TfrmCadFuncionario.gGridPesquisaDblClick(Sender: TObject);
begin
   inherited;
   panel1.Enabled  := True;
   pcGuia.TabIndex := 1;
   pCarregarEdit(qrySelect.FieldByName('ID_FUNCIONARIO').AsInteger);
end;

procedure TfrmCadFuncionario.gGridPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if (key = #13) and (pcGuia.TabIndex = 0) then
   begin
      pCarregarEdit(qrySelect.FieldByName('ID_FUNCIONARIO').AsInteger);
      pcGuia.TabIndex := 1;
   end;
end;

procedure TfrmCadFuncionario.mObsKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   if key = #13 then
      key := #0;
end;

procedure TfrmCadFuncionario.pGravarAtualizarDeletar(vStatus: String; vID_Func: Integer);
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
            SQL.Add(' INSERT INTO FUNCIONARIO                        ');
            SQL.Add(' (                                              ');
            SQL.Add(' ID_FUNCIONARIO, NOME, DT_NASCTO, ENDERECO,     ');
            SQL.Add(' BAIRRO, ID_CIDADE, ID_UF, TELEFONE, ATIVO,     ');
            SQL.Add(' ADMISSAO, DEMISSAO, ID_TURNO, ID_CARGO,        ');
            SQL.Add(' COMISSAO, RG, CPF, CEP, OBSERVACAO             ');
            SQL.Add(' )                                              ');
            SQL.Add(' VALUES                                         ');
            SQL.Add(' (                                              ');
            SQL.Add(' :ID_FUNCIONARIO, :NOME, :DT_NASCTO, :ENDERECO, ');
            SQL.Add(' :BAIRRO, :ID_CIDADE, :ID_UF, :TELEFONE, :ATIVO,');
            SQL.Add(' :ADMISSAO, :DEMISSAO, :ID_TURNO, :ID_CARGO,    ');
            SQL.Add(' :COMISSAO, :RG, :CPF, :CEP, :OBSERVACAO         ');
            SQL.Add(' )                                              ');
            ParamByName('ID_FUNCIONARIO').AsInteger := 0;
         end;
      end
      else if vStatus = 'EDITAR' then
      begin
         with qryGravar do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' UPDATE FUNCIONARIO SET NOME = :NOME, DT_NASCTO = :DT_NASCTO,      ');
            SQL.Add(' ENDERECO = :ENDERECO, BAIRRO = :BAIRRO, ID_CIDADE = :ID_CIDADE,   ');
            SQL.Add(' ID_UF = :ID_UF, TELEFONE = :TELEFONE, ATIVO = :ATIVO,             ');
            SQL.Add(' ADMISSAO = :ADMISSAO, DEMISSAO = :DEMISSAO, ID_TURNO = :ID_TURNO, ');
            SQL.Add(' ID_CARGO = :ID_CARGO, COMISSAO = :COMISSAO, RG = :RG, CPF = :CPF, ');
            SQL.Add(' CEP = :CEP, OBSERVACAO = :OBSERVACAO                              ');
            SQL.Add(' WHERE ID_FUNCIONARIO = :ID_FUNCIONARIO                            ');
            ParamByName('ID_FUNCIONARIO').Value := vID_Func;
         end;
      end
      else
      begin
         with qryGravar do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' DELETE FROM FUNCIONARIO                ');
            SQL.Add(' WHERE ID_FUNCIONARIO = :ID_FUNCIONARIO ');
            ParamByName('ID_FUNCIONARIO').Value := vID_Func;
         end;
      end;

      if vStatus <> 'DELETAR' then
      begin
         with qryGravar do
         begin
            ParamByName('NOME').AsString            := dbeNome.Text;
            ParamByName('DT_NASCTO').AsDate         := DT_nasc.Date;
            ParamByName('ENDERECO').AsString        := dbeEndereco.Text;
            ParamByName('BAIRRO').AsString          := dbeBairro.Text;
            ParamByName('ID_CIDADE').AsInteger      := DBLCidade.KeyValue;
            ParamByName('ID_UF').AsInteger          := DBLUF.KeyValue;
            ParamByName('TELEFONE').AsString        := dbeTelefone.Text;

            if rgAtivoIna.ItemIndex = 0 then
            begin
               ParamByName('ATIVO').AsString        := 'A';
               ParamByName('DEMISSAO').IsNull;
            end
            else
            begin
               ParamByName('ATIVO').AsString        := 'I';
               ParamByName('DEMISSAO').AsDate       := DTdemissao.Date;
            end;

            ParamByName('ADMISSAO').AsDate          := DTAdmissao.Date;

            ParamByName('ID_TURNO').AsInteger       := DBLTurno.KeyValue;
            ParamByName('ID_CARGO').AsInteger       := DBLCargo.KeyValue;
            ParamByName('COMISSAO').AsFloat         := StrToFloat(Trim(StringReplace(dbeComissao.Text,'.','',[rfReplaceAll])));
            ParamByName('RG').AsString              := dbeRG.Text;
            ParamByName('CPF').AsString             := dbeCPF.Text;
            ParamByName('CEP').AsString             := dbeCep.Text;
            ParamByName('OBSERVACAO').AsString      := mObs.Text;
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

procedure TfrmCadFuncionario.rgAtivoInaClick(Sender: TObject);
begin
   inherited;
   if rgAtivoIna.ItemIndex = 1 then
      DTdemissao.Enabled := true
   else
      DTdemissao.Enabled := false;
end;

end.
