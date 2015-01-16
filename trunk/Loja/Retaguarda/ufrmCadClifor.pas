unit ufrmCadClifor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmModeloCad, Data.DB, IBCustomDataSet,
  IBQuery, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, ACBrBase, ACBrValidador, strutils;

type
  TfrmCadClifor = class(TfrmModeloCad)
    Panel1: TPanel;
    Label1: TLabel;
    edtRazaoSocia_nome: TEdit;
    Label2: TLabel;
    edtNfantasia_apelido: TEdit;
    Label3: TLabel;
    EdtCNPJ_CPF: TEdit;
    RGTipo: TRadioGroup;
    Label5: TLabel;
    Label7: TLabel;
    edtIM: TEdit;
    Label8: TLabel;
    edtEndereco: TEdit;
    Label9: TLabel;
    EDTBairro: TEdit;
    Label11: TLabel;
    Label10: TLabel;
    DBLUF: TDBLookupComboBox;
    Label13: TLabel;
    edtTelefone: TEdit;
    EDTFax: TEdit;
    Label14: TLabel;
    EDTCelular: TEdit;
    Label15: TLabel;
    edtPais: TEdit;
    Label16: TLabel;
    EDTNumero: TEdit;
    Label17: TLabel;
    edtContato: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    edtSite: TEdit;
    Label20: TLabel;
    rgClienteTipo: TRadioGroup;
    Label21: TLabel;
    EDTCEP: TEdit;
    mObservacao: TMemo;
    Label22: TLabel;
    DT_Cadastro: TDateTimePicker;
    Label23: TLabel;
    DT_Nascimento: TDateTimePicker;
    Label24: TLabel;
    Label25: TLabel;
    edtIBGE: TEdit;
    Label26: TLabel;
    edtSuframa: TEdit;
    rgSexo: TRadioGroup;
    edtIE_RG: TEdit;
    dblCidade: TDBLookupComboBox;
    edtEmail: TEdit;
    Label4: TLabel;
    edtNomeRazao: TEdit;
    PesquisaPFPJ: TRadioGroup;
    edtApelidoFantasia: TEdit;
    Label6: TLabel;
    ckNome_razao: TCheckBox;
    ckApelidoFantasia: TCheckBox;
    edtCPFCNPJ: TEdit;
    Label12: TLabel;
    ckCPFCNPJ: TCheckBox;
    RadioGroup4: TRadioGroup;
    qrySelectID_CLIFOR: TIntegerField;
    qrySelectNOMEFANTASIA: TIBStringField;
    qrySelectRAZAOSOCIAL: TIBStringField;
    qrySelectCNPJ: TIBStringField;
    qrySelectCPF: TIBStringField;
    qrySelectIE: TIBStringField;
    qrySelectRG: TIBStringField;
    qrySelectIM: TIBStringField;
    qrySelectENDERECO: TIBStringField;
    qrySelectBAIRRO: TIBStringField;
    qrySelectCIDADE: TIntegerField;
    qrySelectUF: TIntegerField;
    qrySelectTELEFONE: TIBStringField;
    qrySelectFAX: TIBStringField;
    qrySelectCELULAR: TIBStringField;
    qrySelectPAIS: TIBStringField;
    qrySelectNUMEROCASA: TIBStringField;
    qrySelectCONTATO: TIBStringField;
    qrySelectEMAIL: TIBStringField;
    qrySelectSITE: TIBStringField;
    qrySelectATIVO: TIBStringField;
    qrySelectCEP: TIBStringField;
    qrySelectTIPOCLIFOR: TIBStringField;
    qrySelectOBSERVACAO: TBlobField;
    qrySelectDTCADASTRO: TDateField;
    qrySelectDATA_NASC: TDateField;
    qrySelectCOD_IBGE_CIDADE: TIBStringField;
    qrySelectSUFRAMA: TIBStringField;
    qrySelectSEXO: TIBStringField;
    qrySelectTIPODOC: TIBStringField;
    rgTipoPessoa: TRadioGroup;
    RadioGroup6: TRadioGroup;
    { Procedures e funções         }
    procedure pAtualizaClifor;
    procedure pGravarAtualizarDeletar(vStatus : String; vID_clifor: Integer);
    procedure pCarregarEdit(vID_clifor : Integer);

    procedure RGTipoEnter(Sender: TObject);
    procedure RGTipoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure PesquisaPFPJEnter(Sender: TObject);
    procedure ckNome_razaoClick(Sender: TObject);
    procedure ckApelidoFantasiaClick(Sender: TObject);
    procedure ckCPFCNPJClick(Sender: TObject);
    procedure PesquisaPFPJClick(Sender: TObject);
    procedure PesquisaPFPJExit(Sender: TObject);
    procedure RGTipoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure RadioGroup4Click(Sender: TObject);
    procedure RadioGroup4Enter(Sender: TObject);
    procedure RadioGroup4Exit(Sender: TObject);
    procedure edtNomeRazaoChange(Sender: TObject);
    procedure edtApelidoFantasiaChange(Sender: TObject);
    procedure edtCPFCNPJChange(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure gGridPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure gGridPesquisaDblClick(Sender: TObject);
    procedure gGridPesquisaCellClick(Column: TColumn);
    procedure rgTipoPessoaClick(Sender: TObject);
    procedure rgTipoPessoaEnter(Sender: TObject);
    procedure rgTipoPessoaExit(Sender: TObject);
    procedure EDTCEPExit(Sender: TObject);
    procedure EdtCNPJ_CPFExit(Sender: TObject);
    procedure pcGuiaChange(Sender: TObject);
  private
    { Private declarations }
    vStatus : string;
  public
    { Public declarations }
  end;

var
  frmCadClifor: TfrmCadClifor;

implementation

{$R *.dfm}

uses funCEP, ufrmPrincipal, uFuncoes, uModule;

procedure TfrmCadClifor.btnAnteriorClick(Sender: TObject);
begin
  inherited;
   pCarregarEdit(qrySelect.FieldByName('ID_clifor').AsInteger);
end;

procedure TfrmCadClifor.btnEditarClick(Sender: TObject);
begin
  inherited;
   vStatus := 'EDITAR';
   pCarregarEdit(qrySelect.FieldByName('ID_CLIFOR').AsInteger);
   edtRazaoSocia_nome.SetFocus;
end;

procedure TfrmCadClifor.btnExcluirClick(Sender: TObject);
var
  vPergunta : Integer;
begin
   inherited;
   vPergunta := MessageBox(Handle, pchar('Deseja excluir esse registro ?') , pchar(NomeSistema), 36);
   if vPergunta = 6 then
   begin
      pGravarAtualizarDeletar('DELETAR',qrySelect.FieldByName('ID_CLIFOR').AsInteger);
      pAtualizaCLIFOR;
      pCarregarEdit(qrySelect.FieldByName('ID_CLIFOR').AsInteger);
   end;
end;

procedure TfrmCadClifor.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  pAtualizaClifor;
end;

procedure TfrmCadClifor.btnGravarClick(Sender: TObject);
var
   vPergunta : Integer;
begin
   // validador CPF/CNPJ
   if rgTipoPessoa.ItemIndex = 1 then
   begin
     ValidadorDoc.TipoDocto := docCNPJ;
     ValidadorDoc.Documento := EdtCNPJ_CPF.Text;
     if not ValidadorDoc.Validar then
     begin
       MessageBox(Handle, pchar('CNPJ Inválido') , pchar(NomeSistema), 48);
       EdtCNPJ_CPF.Clear;
       EdtCNPJ_CPF.SetFocus;
       abort;
     end;
   end
   else
   begin
     ValidadorDoc.TipoDocto := docCPF;
     ValidadorDoc.Documento := EdtCNPJ_CPF.Text;
     if not ValidadorDoc.Validar then
     begin
       MessageBox(Handle, pchar('CPF Inválido') , pchar(NomeSistema), 48);
       EdtCNPJ_CPF.Clear;
       EdtCNPJ_CPF.SetFocus;
       abort;
     end;
   end;
   // VALIDADOR DE Inscrição estadual
     if rgTipoPessoa.ItemIndex = 1 then
   begin
     ValidadorDoc.TipoDocto := docInscEst;
     ValidadorDoc.Documento := edtIE_RG.Text;

     if edtie_rg.Text <> '' then
     begin
        if not ValidadorDoc.Validar then
        begin
          MessageBox(Handle, pchar('Inscrição Estadual Inválida') , pchar(NomeSistema), 48);
          edtIE_RG.Clear;
          edtIE_RG.SetFocus;
          abort;
        end;
     end;
   end;





   vPergunta := MessageBox(Handle, pchar('Deseja gravar esse registro ?') , pchar(NomeSistema), 36);
   if vPergunta = 6 then
   begin
     pGravarAtualizarDeletar(vStatus,qrySelect.FieldByName('ID_CLIFOR').AsInteger);
     Module.IBTransaction.CommitRetaining;
   end;

   inherited;
   pAtualizaClifor;
   pCarregarEdit(qrySelect.FieldByName('ID_CLIFOR').AsInteger);
end;

procedure TfrmCadClifor.btnNovoClick(Sender: TObject);
begin
  inherited;
   edtRazaoSocia_nome.SetFocus;
   DBLCidade.KeyValue := Null;
   DBLUF.KeyValue     := Null;
   vStatus := 'NOVO';
end;

procedure TfrmCadClifor.btnPrimeiroClick(Sender: TObject);
begin
  inherited;
  pCarregarEdit(qrySelect.FieldByName('ID_clifor').AsInteger);
end;

procedure TfrmCadClifor.btnProximoClick(Sender: TObject);
begin
  inherited;
  pCarregarEdit(qrySelect.FieldByName('ID_clifor').AsInteger);
end;

procedure TfrmCadClifor.btnUltimoClick(Sender: TObject);
begin
  inherited;
  pCarregarEdit(qrySelect.FieldByName('ID_clifor').AsInteger);
end;

procedure TfrmCadClifor.ckApelidoFantasiaClick(Sender: TObject);
begin
  inherited;
  if ckApelidoFantasia.State = cbChecked then
     edtApelidoFantasia.Enabled :=false
   else
     edtApelidoFantasia.Enabled := true;
end;

procedure TfrmCadClifor.ckCPFCNPJClick(Sender: TObject);
begin
  inherited;
  if ckCPFCNPJ.State = cbChecked then
    edtCPFCNPJ.Enabled := false
  else
    edtCPFCNPJ.enabled := true;
end;

procedure TfrmCadClifor.ckNome_razaoClick(Sender: TObject);
begin
  inherited;
  if ckNome_razao.State = cbChecked then
   edtNomeRazao.Enabled := false
  else
   edtNomeRazao.Enabled := true;
end;

procedure TfrmCadClifor.edtApelidoFantasiaChange(Sender: TObject);
begin
  inherited;
  pAtualizaClifor;
end;

procedure TfrmCadClifor.EDTCEPExit(Sender: TObject);
var
   qrySelect : TIBQuery;
   listaCEP : TStringList;

begin
  inherited;
  if EDTCEP.Text <> '' then
   begin
      listaCEP := TStringList.Create;
      ExtractStrings([','],[' '],pchar(uFuncoes.fBuscarWS(EDTCEP.Text)),listaCEP);

      try
         edtEndereco.Text := TRIM(listaCEP.Strings[0]);
      except
      end;

      try
         edtBAIRRO.Text   := TRIM(listaCEP.Strings[1]);
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
            SQL.Add(' SELECT ID_CIDADE, CODIGO_IBGE FROM CIDADE ');
            SQL.Add(' WHERE upper(DESCRICAO) = :P_DESCRICAO ');
            ParamByName('P_DESCRICAO').AsString := UpperCase(TRIM(listaCEP.Strings[2]));
            Open;
            First;
         end;

         DBLCidade.KeyValue := qrySelect.FieldByName('ID_CIDADE').AsInteger;
         edtIBGE.Text       := IntToStr(qrySelect.FieldByName('CODIGO_IBGE').AsInteger);
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

procedure TfrmCadClifor.EdtCNPJ_CPFExit(Sender: TObject);
begin
   inherited;
   EdtCNPJ_CPF.Text := fMaskCNPJ_CPF(EdtCNPJ_CPF.Text,rgTipoPessoa.ItemIndex,'N');
end;

procedure TfrmCadClifor.edtCPFCNPJChange(Sender: TObject);
begin
  inherited;
  pAtualizaClifor;
end;

procedure TfrmCadClifor.edtNomeRazaoChange(Sender: TObject);
begin
  inherited;
  pAtualizaClifor;
end;

procedure TfrmCadClifor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   Action := caFree;
   frmcadClifor := nil;
end;

procedure TfrmCadClifor.pAtualizaClifor;
begin
   Module.qryUF.Close;
   Module.qryUF.Open;

   Module.qryCidade.Close;
   Module.qryCidade.Open;


   with qrySelect do
   begin
      Close;
      SQL.Clear;
      sql.Add(' SELECT CL.ID_CLIFOR, CL.NOMEFANTASIA, CL.RAZAOSOCIAL, CL.CNPJ, CL.CPF, CL.IE, CL.RG, CL.IM, CL.ENDERECO,   ');
      sql.Add('        CL.BAIRRO, CL.CIDADE, CL.UF, CL.TELEFONE, CL.FAX, CL.CELULAR, CL.PAIS, CL.NUMEROCASA, ');
      sql.Add('        CL.CONTATO, CL.EMAIL, CL.SITE, CL.ATIVO, CL.CEP, CL.TIPOCLIFOR, CL.OBSERVACAO, CL.DTCADASTRO, CL.DATA_NASC, CL.COD_IBGE_CIDADE, CL.SUFRAMA, CL.SEXO, CL.TIPODOC ');
      sql.Add(' FROM CLIFOR CL                                                  ');
      SQL.Add(' INNER JOIN CIDADE CID ON (CL.CIDADE = CID.ID_CIDADE)              ');
      SQL.Add(' INNER JOIN UF U ON (CL.UF = U.ID_UF)              ');
      SQL.Add(' WHERE (1 = 1)                                                       ');


      if PesquisaPFPJ.ItemIndex = 0 then
      begin
         SQL.Add(' AND upper(CL.TIPOCLIFOR) LIKE upper(:TIPOCLIFOR) ');
         ParamByName('TIPOCLIFOR').AsString := 'A';
      end
      else
      if PesquisaPFPJ.ItemIndex = 1 then
      begin
         SQL.Add(' AND upper(CL.TIPOCLIFOR) LIKE upper(:TIPOCLIFOR) ');
         ParamByName('TIPOCLIFOR').AsString := 'C';
      end
      else
      if PesquisaPFPJ.ItemIndex = 2 then
      begin
         SQL.Add(' AND upper(CL.TIPOCLIFOR) LIKE upper(:TIPOCLIFOR) ');
         ParamByName('TIPOCLIFOR').AsString := 'F';
      end;


       if RadioGroup4.ItemIndex = 0 then
      begin
         SQL.Add(' AND upper(CL.ATIVO) LIKE upper(:ATIVO) ');
         ParamByName('ATIVO').AsString := 'A';
      end
      else
      begin
         SQL.Add(' AND upper(CL.ATIVO) LIKE upper(:ATIVO) ');
         ParamByName('ATIVO').AsString := 'I';
      end;

      if ckNome_razao.Checked = FALSE then
      begin
         SQL.Add(' AND upper(CL.RAZAOSOCIAL) LIKE upper(:NOMERAZAO) ');
         ParamByName('NOMERAZAO').AsString := '%'+edtNomeRazao.TEXT+'%';
      end;

      if ckApelidoFantasia.Checked = False  then
      begin
         sql.Add(' AND upper(CL.NOMEFANTASIA) LIKE upper(:APELIDOFANTASIA) ');
         ParamByName('APELIDOFANTASIA').AsString := '%'+edtApelidoFantasia.Text+'%';
      end;

      if ckCPFCNPJ.Checked = FALSE then
      Begin
         SQL.Add(' AND upper(CL.cpf) LIKE upper(:cpf) ');
         ParamByName('cpf').AsString := '%'+edtCPFCNPJ.Text+'%';
      End;

      if (PesquisaPFPJ.ItemIndex) = 0 then
      begin
         SQL.Add('AND upper(CL.cpf) LIKE upper(:cpf)');
         ParamByName('cpf').AsString := '%'+edtCPFCNPJ.Text+'%';
      end
      else
      begin
         SQL.Add('AND upper(CL.cnpj) LIKE upper(:cnpj)');
         ParamByName('cnpj').AsString := '%'+edtCPFCNPJ.Text+'%';
      end;
      Open;
   end;
end;

procedure TfrmCadclifor.pGravarAtualizarDeletar(vStatus: String; vID_clifor: Integer);
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
            SQL.Add(' INSERT INTO CLIFOR                             ');
            SQL.Add(' (                                              ');
            SQL.Add(' ID_CLIFOR, RAZAOSOCIAL, NOMEFANTASIA, CNPJ, CPF, IE, RG, IM, ENDERECO,      ');
            SQL.Add(' BAIRRO, CIDADE, UF, TELEFONE, FAX, CELULAR, PAIS, NUMEROCASA, ATIVO,        ');
            SQL.Add(' CONTATO, EMAIL, SITE, CEP, TIPOCLIFOR, OBSERVACAO, DTCADASTRO, DATA_NASC,   ');
            SQL.Add(' COD_IBGE_CIDADE, SUFRAMA, SEXO, TIPODOC                 ');
            SQL.Add(' )                                              ');
            SQL.Add(' VALUES                                         ');
            SQL.Add(' (                                              ');
            SQL.Add('   :ID_CLIFOR, :RAZAOSOCIAL, :NOMEFANTASIA, :CNPJ, :CPF, :IE, :RG, :IM, :ENDERECO,   ');
            SQL.Add(' :BAIRRO, :CIDADE, :UF, :TELEFONE, :FAX, :CELULAR, :PAIS, :NUMEROCASA, :ATIVO,     ');
            SQL.Add(' :CONTATO, :EMAIL, :SITE, :CEP, :TIPOCLIFOR, :OBSERVACAO, :DTCADASTRO, :DATA_NASC, ');
            SQL.Add(' :COD_IBGE_CIDADE, :SUFRAMA, :SEXO, :TIPODOC             ');
            SQL.Add(' )                                             ');
            ParamByName('ID_CLIFOR').AsInteger := 0;
         end;
      end
      else if vStatus = 'EDITAR' then
      begin
         with qryGravar do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' UPDATE CLIFOR SET RAZAOSOCIAL = :RAZAOSOCIAL, NOMEFANTASIA = :NOMEFANTASIA, CNPJ = :CNPJ, CPF = :CPF, IE = :IE, RG = :RG, IM = :IM, ENDERECO = :ENDERECO,     ');
            SQL.Add(' BAIRRO = :BAIRRO, CIDADE = :CIDADE, UF = :UF, TELEFONE = :TELEFONE, FAX = :FAX, CELULAR = :CELULAR, PAIS = :PAIS, NUMEROCASA = :NUMEROCASA, ATIVO = :ATIVO,     ');
            SQL.Add(' CONTATO = :CONTATO, EMAIL =  :EMAIL, SITE = :SITE, CEP = :CEP, TIPOCLIFOR = :TIPOCLIFOR, OBSERVACAO = :OBSERVACAO,  DTCADASTRO = :DTCADASTRO, DATA_NASC =  :DATA_NASC,        ');
            SQL.Add(' COD_IBGE_CIDADE = :COD_IBGE_CIDADE, SUFRAMA = :SUFRAMA, SEXO = :SEXO, TIPODOC = :TIPODOC             ');
            SQL.Add(' WHERE ID_CLIFOR = :ID_CLIFOR                            ');
            ParamByName('ID_clifor').Value := vID_clifor;
         end;
      end
      else
      begin
         with qryGravar do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' DELETE FROM CLIFOR                ');
            SQL.Add(' WHERE ID_CLIFOR = :ID_CLIFOR ');
            ParamByName('ID_CLIFOR').Value := vID_clifor;
         end;
      end;

      if vStatus <> 'DELETAR' then
      begin
         with qryGravar do
         begin
            case rgTipoPessoa.ItemIndex of
               0 : // FISICA
               begin
                  ParamByName('RAZAOSOCIAL').AsString   := edtRazaoSocia_nome.Text;
                  ParamByName('NOMEFANTASIA').AsString  := edtNfantasia_apelido.Text;
                  ParamByName('CPF').AsString           := fMaskCNPJ_CPF(EdtCNPJ_CPF.Text,1,'S');
                  ParamByName('RG').AsString            := edtIE_RG.Text;
                  ParamByName('CNPJ').AsString          := '';
                  ParamByName('IE').AsString            := '';
                  ParamByName('IM').AsString            := '';
               end;

               1 : // Juridica
               begin
                  ParamByName('RAZAOSOCIAL').AsString   := edtRazaoSocia_nome.Text;
                  ParamByName('NOMEFANTASIA').AsString  := edtNfantasia_apelido.Text;
                  ParamByName('CNPJ').AsString          := fMaskCNPJ_CPF(EdtCNPJ_CPF.Text,0,'S');
                  ParamByName('IM').AsString            := edtIM.Text;
                  ParamByName('IE').AsString            := edtIE_RG.Text;
                  ParamByName('RG').AsString            := '';
                  ParamByName('CPF').AsString           := '';
               end;
            end;
           { else
           if RadioGroup1.ItemIndex = 2 then
           begin
              ParamByName('RAZAOSOCIAL').AsString       := edtRazaoSocia_nome.Text;
              ParamByName('NOMEFANTASIA').AsString      := edtNfantasia_apelido.Text;
              ParamByName('CNPJ').AsString              := EdtCNPJ_CPF.Text;
              ParamByName('IM').AsString                := edtIM.Text;
              ParamByName('IE').AsString                := edtIE_RG.Text;
              ParamByName('RG').AsString                := '';
              ParamByName('CPF').AsString               := '';
           end;}

            ParamByName('ENDERECO').AsString            := edtEndereco.Text;
            ParamByName('BAIRRO').AsString              := EDTBairro.Text;
            ParamByName('CIDADE').AsInteger             := dblCidade.KeyValue;
            ParamByName('UF').AsInteger                 := DBLUF.KeyValue;
            ParamByName('TELEFONE').AsString            := edtTelefone.Text;
            ParamByName('FAX').AsString                 := EDTFax.Text;
            ParamByName('CELULAR').AsString             := EDTCelular.Text;
            ParamByName('PAIS').AsString                := edtPais.Text;
            ParamByName('NUMEROCASA').AsString          := EDTNumero.Text;

            case rgClientetipo.ItemIndex of
               0 : ParamByName('ATIVO').AsString        := 'A';
               1 : ParamByName('ATIVO').AsString        := 'I';
            end;

            ParamByName('CONTATO').AsString             := edtContato.Text;
            ParamByName('EMAIL').AsString               := edtEmail.Text;
            ParamByName('SITE').AsString                := edtSite.Text;
            ParamByName('CEP').AsString                 := EDTCEP.Text;

            case RGTipo.ItemIndex of
               0 : ParamByName('TIPOCLIFOR').AsString   := 'A';
               1 : ParamByName('TIPOCLIFOR').AsString   := 'C';
               2 : ParamByName('TIPOCLIFOR').AsString   := 'F';
            end;

            case rgTipoPessoa.ItemIndex of
               0 : ParamByName('TIPODOC').AsString      := 'F';
               1 : ParamByName('TIPODOC').AsString      := 'J';
            end;

            ParamByName('OBSERVACAO').AsString          := mObservacao.Text;
            ParamByName('DTCADASTRO').AsDate            := DT_Cadastro.DateTime;
            ParamByName('DATA_NASC').AsDate             := DT_Nascimento.DateTime;
            ParamByName('COD_IBGE_CIDADE').AsString     := edtIBGE.Text;
            ParamByName('SUFRAMA').AsString             := edtSuframa.Text;

            case rgsexo.ItemIndex of
               0 : ParamByName('SEXO').AsString         := 'M';
               1 : ParamByName('SEXO').AsString         := 'F';
            end;
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


procedure TfrmCadclifor.pCarregarEdit(vID_clifor : Integer);
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
      SQL.Add('SELECT * FROM CLIFOR              ');
      SQL.Add('WHERE ID_CLIFOR = :ID_CLIFOR ');
      ParamByName('ID_clifor').AsInteger := vID_clifor;
      Open;
      //qryCarregar.FieldByName('CNPJ').EditMask := '00.000.000/0000-99;1;_';

      case AnsiIndexStr(uppercase(FieldByName('TIPOCLIFOR').AsString),['A','C','F']) of
        0 :rgtipo.ItemIndex := 0;
        1 :rgtipo.ItemIndex := 1;
        2 :rgtipo.ItemIndex := 2;
      end;

      if FieldByName('TIPODOC').AsString = 'J' then
      begin
         rgtipopessoa.ItemIndex := 1;
         edtRazaoSocia_nome.Text       := FieldByName('RAZAOSOCIAL').AsString;
         edtNfantasia_apelido.Text     := FieldByName('NOMEFANTASIA').AsString;
         EdtCNPJ_CPF.Text              := fMaskCNPJ_CPF(FieldByName('CNPJ').AsString,0,'N');
         edtIM.Text                    := FieldByName('IM').AsString;
         edtIE_RG.Text                 := FieldByName('RG').AsString;

      end
      else
      begin
         rgtipopessoa.ItemIndex := 0;
         edtRazaoSocia_nome.Text       := FieldByName('RAZAOSOCIAL').AsString;
         edtNfantasia_apelido.Text     := FieldByName('NOMEFANTASIA').AsString;
         EdtCNPJ_CPF.Text              := fMaskCNPJ_CPF(FieldByName('CPF').AsString,1,'N');
         edtIE_RG.Text                 := FieldByName('RG').AsString;
      end;

      edtEndereco.Text             :=  FieldByName('ENDERECO').AsString;
      EDTBairro.Text               :=  FieldByName('BAIRRO').AsString;
      dblCidade.KeyValue           :=  FieldByName('CIDADE').AsString;
      DBLUF.KeyValue               :=  FieldByName('UF').AsString;
      edtTelefone.Text             :=  FieldByName('TELEFONE').AsString;
      EDTFax.TexT                  :=  FieldByName('FAX').AsString;
      EDTCelular.Text              :=  FieldByName('CELULAR').AsString;
      edtPais.Text                 :=  FieldByName('PAIS').AsString;
      EDTNumero.Text               :=  FieldByName('NUMEROCASA').AsString;

      if FieldByName('ATIVO').AsString = 'A' then
         rgClienteTipo.ItemIndex := 0
      else
         rgClienteTipo.ItemIndex := 1;

      edtContato.Text              :=  FieldByName('CONTATO').AsString;
      edtEmail.Text                :=  FieldByName('EMAIL').AsString;
      edtSite.Text                 :=  FieldByName('SITE').AsString;
      EDTCEP.Text                  :=  FieldByName('CEP').AsString;
      mObservacao.Text             :=  FieldByName('OBSERVACAO').AsString;
      DT_Cadastro.Date             :=  FieldByName('DTCADASTRO').AsDateTime;
      DT_Nascimento.Date           :=  FieldByName('DATA_NASC').AsDateTime;
      edtIBGE.Text                 :=  FieldByName('COD_IBGE_CIDADE').AsString;
      edtSuframa.Text              :=  FieldByName('SUFRAMA').AsString;

      if FieldByName('SEXO').AsString = 'M' then
         rgSexo.ItemIndex := 0
      else
         rgSexo.ItemIndex := 1;
    end;

   FreeAndNil(qryCarregar);
end;

procedure TfrmCadClifor.pcGuiaChange(Sender: TObject);
begin
  inherited;
  pAtualizaClifor;
  pCarregarEdit(qrySelect.FieldByName('ID_clifor').AsInteger);
end;

procedure TfrmCadClifor.PesquisaPFPJClick(Sender: TObject);
begin
  inherited;
   if pesquisapfpj.itemindex = 1then
  begin
    label4.caption      := 'Nome';
    Label6.caption      := 'Apelido';
    Label12.caption     := 'CPF';
    gGridPesquisa.Columns[1].Title.Caption :='Nome';
    gGridPesquisa.Columns[2].Title.Caption :='Apelido';
    gGridPesquisa.Columns[3].Title.Caption :='CPF';
    gGridPesquisa.Columns[3].FieldName := 'CPF';
  end
  else
  if pesquisapfpj.itemindex = 2 then
  begin
    label4.caption      := 'Razão Social';
    Label6.caption      := 'Nome Fantasia';
    Label12.caption     := 'CNPJ';
    gGridPesquisa.Columns[1].Title.Caption :='Razão Social';
    gGridPesquisa.Columns[2].Title.Caption :='Nome Fantasia';
    gGridPesquisa.Columns[3].Title.Caption :='CNPJ';
    gGridPesquisa.Columns[3].FieldName     := 'CNPJ';
  end;
  pAtualizaClifor;
end;

procedure TfrmCadClifor.PesquisaPFPJEnter(Sender: TObject);
begin
  inherited;
  if pesquisapfpj.itemindex = 1then
  begin
    label4.caption  := 'Nome';
    Label6.caption  :='Apelido';
    Label12.caption :='CPF';
    gGridPesquisa.Columns[1].Title.Caption :='Nome';
    gGridPesquisa.Columns[2].Title.Caption :='Apelido';
    gGridPesquisa.Columns[3].Title.Caption :='CPF';
  end
  else
  if pesquisapfpj.itemindex = 2 then
  begin
    label4.caption  := 'Razão Social';
    Label6.caption  := 'Nome Fantasia';
    Label12.caption := 'CNPJ';
    gGridPesquisa.Columns[1].Title.Caption :='Razão Social';
    gGridPesquisa.Columns[2].Title.Caption :='Nome Fantasia';
    gGridPesquisa.Columns[3].Title.Caption :='CNPJ';
  end;
  pAtualizaClifor;
end;

procedure TfrmCadClifor.PesquisaPFPJExit(Sender: TObject);
begin
  inherited;
  if pesquisapfpj.itemindex = 1then
  begin
    label4.caption  := 'Nome';
    Label6.caption  :='Apelido';
    Label12.caption :='CPF';
    gGridPesquisa.Columns[1].Title.Caption :='Nome';
    gGridPesquisa.Columns[2].Title.Caption :='Apelido';
    gGridPesquisa.Columns[3].Title.Caption :='CPF';
  end
  else
  if pesquisapfpj.itemindex = 2 then
  begin
    label4.caption  := 'Razão Social';
    Label6.caption  := 'Nome Fantasia';
    Label12.caption  := 'CNPJ';
    gGridPesquisa.Columns[1].Title.Caption :='Razão Social';
    gGridPesquisa.Columns[2].Title.Caption :='Nome Fantasia';
    gGridPesquisa.Columns[3].Title.Caption :='CNPJ';
  end;
  pAtualizaClifor;
end;

procedure TfrmCadClifor.FormShow(Sender: TObject);
begin
  inherited;
   pAtualizaClifor;
   pCarregarEdit(qrySelect.FieldByName('ID_Clifor').AsInteger);
end;

procedure TfrmCadClifor.gGridPesquisaCellClick(Column: TColumn);
begin
  inherited;

   pCarregarEdit(qrySelect.FieldByName('ID_CLIFOR').AsInteger);
end;

procedure TfrmCadClifor.gGridPesquisaDblClick(Sender: TObject);
begin
  inherited;
   panel1.Enabled  := True;
   pcGuia.TabIndex := 1;
   pCarregarEdit(qrySelect.FieldByName('ID_CLIFOR').AsInteger);
end;

procedure TfrmCadClifor.gGridPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   if (key = #13) and (pcGuia.TabIndex = 0) then
   begin
      pCarregarEdit(qrySelect.FieldByName('ID_CLIFOR').AsInteger);
      pcGuia.TabIndex := 1;
   end;
end;

procedure TfrmCadClifor.RGTipoClick(Sender: TObject);
begin
  inherited;

 if RGTipo.ItemIndex = 1 then
  begin
    label3.Caption := 'CPF';
    label5.Caption := 'RG' ;
    Label7.Visible := false;
    edtIM.Visible  := false;
    label1.Caption := 'Nome';
    label2.Caption := 'Apelido';
  end
  else
  if RGTipo.ItemIndex = 2 then
  begin
    label1.Caption := 'Razão Social';
    label2.Caption := 'Nome Fantasia';
    label3.Caption := 'CNPJ';
    Label5.Caption := 'Inscrição Estadual';
    Label7.Visible := true;
    edtIM.Visible  := True;
  end;
end;

procedure TfrmCadClifor.RGTipoEnter(Sender: TObject);
begin
  inherited;
{  if RadioGroup5.ItemIndex = 1 then
  begin
    label3.Caption := 'CPF';
    label5.Caption := 'RG' ;
    Label7.Visible := false;
    edtIM.Visible  := false;
    label1.Caption := 'Nome';
    label2.Caption := 'Apelido';
  end
  else
  if RadioGroup5.ItemIndex = 2 then
  begin
    label1.Caption := 'Razão Social';
    label2.Caption := 'Nome Fantasia';
    label3.Caption := 'CNPJ';
    Label5.Caption := 'Inscrição Estadual';
    Label7.Visible := true;
    edtIM.Visible  := True;
  end;  }
end;

procedure TfrmCadClifor.RGTipoExit(Sender: TObject);
begin
  inherited;
 { if RadioGroup5.ItemIndex = 1 then
  begin
    label3.Caption := 'CPF';
    label5.Caption := 'RG' ;
    Label7.Visible := false;
    edtIM.Visible  := false;
    label1.Caption := 'Nome';
    label2.Caption := 'Apelido';
  end
  else
  if RadioGroup5.ItemIndex = 2 then
  begin
    label1.Caption := 'Razão Social';
    label2.Caption := 'Nome Fantasia';
    label3.Caption := 'CNPJ';
    Label5.Caption := 'Inscrição Estadual';
    Label7.Visible := true;
    edtIM.Visible  := True;
  end;   }
end;

procedure TfrmCadClifor.RadioGroup4Click(Sender: TObject);
begin
  inherited;
  pAtualizaClifor;
end;

procedure TfrmCadClifor.RadioGroup4Enter(Sender: TObject);
begin
  inherited;
  pAtualizaClifor;
end;

procedure TfrmCadClifor.RadioGroup4Exit(Sender: TObject);
begin
  inherited;
  pAtualizaClifor;
end;

procedure TfrmCadClifor.rgTipoPessoaClick(Sender: TObject);
begin
  inherited;
  if rgTipoPessoa.ItemIndex = 0 then
  begin
    label3.Caption    := 'CPF';
    label5.Caption    := 'RG' ;
    Label7.Visible    := false;
    edtIM.Visible     := false;
    label1.Caption    := 'Nome';
    label2.Caption    := 'Apelido';
    {label21.Left      := 266;
    EDTCEP.Left       := 266;
    label8.Left       := 392;
    edtEndereco.Left  := 392;
    edtEndereco.Width := 467; }
  end
  else
  if rgTipoPessoa.ItemIndex = 1 then
  begin
    label1.Caption := 'Razão Social';
    label2.Caption := 'Nome Fantasia';
    label3.Caption := 'CNPJ';
    Label5.Caption := 'Inscrição Estadual';
    Label7.Visible := true;
    edtIM.Visible  := True;
   { EDTCEP.Left       := 392;
    label21.Left      := 392;
    label8.Left       := 518;
    edtEndereco.Left  := 518;
    edtEndereco.Width := 341; }

  end;
end;

procedure TfrmCadClifor.rgTipoPessoaEnter(Sender: TObject);
begin
  inherited;
  if rgTipoPessoa.ItemIndex = 0 then
  begin
    label3.Caption := 'CPF';
    label5.Caption := 'RG' ;
    Label7.Visible := false;
    edtIM.Visible  := false;
    label1.Caption := 'Nome';
    label2.Caption := 'Apelido';
  end
  else
  if rgTipoPessoa.ItemIndex = 1 then
  begin
    label1.Caption := 'Razão Social';
    label2.Caption := 'Nome Fantasia';
    label3.Caption := 'CNPJ';
    Label5.Caption := 'Inscrição Estadual';
    Label7.Visible := true;
    edtIM.Visible  := True;
  end;
end;

procedure TfrmCadClifor.rgTipoPessoaExit(Sender: TObject);
begin
  inherited;
  if rgTipoPessoa.ItemIndex = 0 then
  begin
    label3.Caption := 'CPF';
    label5.Caption := 'RG' ;
    Label7.Visible := false;
    edtIM.Visible  := false;
    label1.Caption := 'Nome';
    label2.Caption := 'Apelido';
  end
  else
  if rgTipoPessoa.ItemIndex = 1 then
  begin
    label1.Caption := 'Razão Social';
    label2.Caption := 'Nome Fantasia';
    label3.Caption := 'CNPJ';
    Label5.Caption := 'Inscrição Estadual';
    Label7.Visible := true;
    edtIM.Visible  := True;
  end;
end;

end.
