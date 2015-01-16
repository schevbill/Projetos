unit UCadCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, DB, IBCustomDataSet,
  IBDatabase, IBTable, Buttons, ComCtrls, Grids, DBGrids;

type
  TFCadPaciente = class(TForm)
    Panel2: TPanel;
    btnAlterar: TBitBtn;
    BtnApagar: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBECODIGO: TDBEdit;
    DBENOME: TDBEdit;
    DBEENDERECO: TDBEdit;
    dbnTabela: TDBNavigator;
    DBETELEFONE: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    btFiltrar: TBitBtn;
    edtCODIGO: TMaskEdit;
    edtNome: TMaskEdit;
    btnNovo: TBitBtn;
    BtnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    Label10: TLabel;
    DBERG: TDBEdit;
    Label11: TLabel;
    DBERESPONSAVEL: TDBEdit;
    Label12: TLabel;
    DBETEL_RESP: TDBEdit;
    Label7: TLabel;
    DTCadastro: TDateTimePicker;
    Label13: TLabel;
    // Procedimentos e funções
    procedure Filtrar;
    procedure Alterar_True;
    // Fim

    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormCreate(Sender: TObject);

    procedure GravarClick(Sender: TObject);

    procedure btnAlterarClick(Sender: TObject);
    procedure BtnApagarClick(Sender: TObject);
    procedure btFiltrarClick(Sender: TObject);
    procedure edtCODIGOKeyPress(Sender: TObject; var Key: Char);
    procedure btnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtNomeChange(Sender: TObject);
    procedure edtCODIGOChange(Sender: TObject);
    procedure dbnTabelaClick(Sender: TObject; Button: TNavigateBtn);
    procedure PageControl1Change(Sender: TObject);

   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadPaciente: TFCadPaciente;
  alterar :Boolean;

implementation

uses funcoes,UDMCAD, UPrincipal, UCadProduto, UCadUsuario, ULogin;

{$R *.dfm}

procedure TFCadPaciente.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
 {if DBECODIGO.Text = '' then
 begin
  MessageDlg('Campo Codigo precisa ser preenchido',mtInformation,[mbYes],0);
  exit;
 end;}
end;

procedure TFCadPaciente.dbnTabelaClick(Sender: TObject; Button: TNavigateBtn);
begin
  DTCadastro.DateTime := DMCAD.CADPACIENTEDATA_CADASTRO.AsDateTime;
end;

procedure TFCadPaciente.FormCreate(Sender: TObject);
begin
 DMCAD.CADPACIENTE.Close;
 DMCAD.CADPACIENTE.Open;
 Filtrar;
 DTCadastro.DateTime := DMCAD.CADPACIENTEDATA_CADASTRO.AsDateTime;
end;

procedure TFCadPaciente.GravarClick(Sender: TObject);
var
max :integer;
begin
 DMCAD.CADPACIENTE.Post;
 DMCAD.IBTransaction1.CommitRetaining;
 DMCAD.CADPACIENTE.Close;
 DMCAD.CADPACIENTE.Open;


end;


procedure TFCadPaciente.PageControl1Change(Sender: TObject);
begin
  if (PageControl1.ActivePage = TabSheet1) then
   btnAlterar.Enabled := true;
  if  (DBGrid1.Enabled = False)  then
   btnAlterar.Enabled := false;
end;

procedure TFCadPaciente.btnAlterarClick(Sender: TObject);
begin
 if PageControl1.TabIndex = 1 then
  PageControl1.TabIndex :=0;

 if dbnTabela.DataSource.DataSet.RecordCount = 0 then
 begin
   ShowMessage('Não existe registro a ser editado!');   // Acerta a msg
   Abort;
 end;
 DBNtabela.DataSource.DataSet.Edit;



 //dbnTabela.BtnClick(nbEdit);
 Alterar_True;
end;



procedure TFCadPaciente.BtnApagarClick(Sender: TObject);
var
vpergunta :integer;
begin
   // VERIFICAR BOTAO APAGAR AO REINICIAR O SISTEMA  O REGISTRO VOLTA

  {colocar em cada formulário por causa da deleção em cascata}
   if dbnTabela.DataSource.DataSet.RecordCount = 0 then
   begin
      ShowMessage('Não há registros no Banco de Dados' + #10 +
                  'para Exclusão !!!');
      Exit;
   end;

   vPergunta := MessageBox(Handle,'Deseja excluir o Registro atual ?','Apagar Registro',MB_YESNO);
   if vPergunta = 6 then
   begin
      //deleção do banco principal
      if dbnTabela.DataSource.DataSet.RecordCount > 0 then
      begin
       //dbnTabela.BtnClick(nbDelete);
       dbnTabela.DataSource.DataSet.Delete;
       DMCAD.IBTransaction1.CommitRetaining;
      end;
   end;

// dbnTabela.BtnClick(nbDelete);
end;

procedure TFCadPaciente.btFiltrarClick(Sender: TObject);
begin
 Filtrar;
 DBGrid1.DataSource := DMCAD.DTSPaciente;
 DBGrid1.Enabled :=TRUE;
 if DBGrid1.DataSource.DataSet.RecordCount > 0 then
 begin
   btnalterar.Enabled := true;
   btnapagar.Enabled  := true;
 end;
end;

procedure TFCadPaciente.Filtrar;

begin
 with DMCAD do
 begin

  DMCAD.CADPACIENTE.SelectSQL.Clear;
  DMCAD.CadPaciente.SelectSQL.Add('select CADPACIENTE.CODIGO_SUS');
  DMCAD.CadPaciente.SelectSQL.Add('      ,CADPACIENTE.ID_PACIENTE');
  DMCAD.CadPaciente.SelectSQL.Add('      ,CADPACIENTE.NOME');
  DMCAD.CadPaciente.SelectSQL.Add('      ,CADPACIENTE.RG');
  DMCAD.CadPaciente.SelectSQL.Add('      ,CADPACIENTE.RESPONSAVEL');
  DMCAD.CadPaciente.SelectSQL.Add('      ,CADPACIENTE.TELEFONE_RESP');
  DMCAD.CadPaciente.SelectSQL.Add('      ,CADPACIENTE.ENDERECO');
  DMCAD.CadPaciente.SelectSQL.Add('      ,CADPACIENTE.TELEFONE');
  DMCAD.CadPaciente.SelectSQL.Add('      ,CADPACIENTE.DATA_CADASTRO');
  DMCAD.CadPaciente.SelectSQL.Add('from CADPACIENTE');

  DMCAD.CadPaciente.SelectSQL.Add('where (1=1)');

  if edtCODIGO.Text <> '' then
   DMCAD.CadPaciente.SelectSQL.Add('and (CADPACIENTE.CODIGO_SUS=:CODIGO)');

  if edtNOME.Text <> '' then
   DMCAD.CadPaciente.SelectSQL.Add('and (upper(CADPACIENTE.NOME) like upper(:NOME))');
   
{  if edtENDERECO.Text <> '' then
   DMCAD.CadPaciente.SelectSQL.Add('and (upper(CADPACIENTE.ENDERECO)like upper(:ENDERECO))');

  if edtTELEFONE.Text <> '' then
   DMCAD.CadPaciente.SelectSQL.Add('and (CADPACIENTE.TELEFONE=:TELEFONE)');}

  DMCAD.CadPaciente.SelectSQL.Add('ORDER BY');
  DMCAD.CadPaciente.SelectSQL.Add('CADPACIENTE.NOME');

  if edtCODIGO.Text <> '' then
   DMCAD.CadPaciente.ParamByName('CODIGO').AsString := edtCODIGO.Text;

  if edtNOME.Text <> '' then
   DMCAD.CadPaciente.ParamByName('NOME').AsString := '%'+edtNOME.Text+'%';

  {if edtENDERECO.Text <> '' then
   DMCAD.CadPaciente.ParamByName('ENDERECO').AsString := '%'+edtENDERECO.Text+'%';}

{  if edtTELEFONE.Text <> '' then
   DMCAD.CadPaciente.ParamByName('TELEFONE').AsString := edtTELEFONE.Text;}

  DMCAD.CadPaciente.Open;
 end;
end;



procedure TFCadPaciente.edtCODIGOChange(Sender: TObject);
begin
  Filtrar;
end;

procedure TFCadPaciente.edtCODIGOKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      edtCodigo.SelectAll;

      if edtCodigo.Text <> '' then
      begin
         edtCODIGO.Clear;
         edtNome.Clear;
         //edtendereco.Clear;
         //edtTelefone.Clear;
      end;

      Filtrar;
   end;
end;

procedure TFCadPaciente.edtNomeChange(Sender: TObject);
begin
  Filtrar;
end;

procedure TFCadPaciente.btnNovoClick(Sender: TObject);
begin
 if PageControl1.TabIndex = 1 then
  PageControl1.TabIndex :=0;

 dbnTabela.BtnClick(nbInsert);
 DTCadastro.Date :=now;
 Alterar_True;
 DBECODIGO.SetFocus;

end;

procedure TFCadPaciente.BtnGravarClick(Sender: TObject);
var
max :integer;
begin
  if DBECODIGO.Text  = '' then
  begin
    ShowMessage('O campo Código SUS deve ser preenchido!');
    dbecodigo.SetFocus;
    Exit;
  end;

  if DBENOME.Text  = '' then
  begin
    ShowMessage('O campo Nome deve ser preenchido!');
    DBENOME.SetFocus;
    Exit;
  end;

  if DBERG.Text  = '' then
  begin
    ShowMessage('O campo RG deve ser preenchido!');
    DBERG.SetFocus;
    Exit;
  end;

  if DBEENDERECO.Text  = '' then
  begin
    ShowMessage('O campo Endereço deve ser preenchido!');
    DBEENDERECO.SetFocus;
    Exit;
  end;



 DMCAD.CadPacienteDATA_CADASTRO.AsDateTime :=DTCadastro.DateTime;
 DMCAD.CadPaciente.Post;
 DMCAD.IBTransaction1.CommitRetaining;
 Alterar_True;
 Filtrar;
end;

procedure TFCadPaciente.btnCancelarClick(Sender: TObject);
begin

 dbnTabela.BtnClick(nbCancel);
 Alterar_True;

end;


procedure TFCadPaciente.Alterar_True;
begin
 DBECODIGO.Enabled      := not     DBECODIGO.Enabled      ;   //        true;
 DBENOME.Enabled        := not     DBENOME.Enabled        ;   //        true;
 DBERG.Enabled          := not     DBERG.Enabled          ;   //        True;
 DBEENDERECO.Enabled    := not     DBEENDERECO.Enabled    ;   //        true;
 DBETELEFONE.Enabled    := not     DBETELEFONE.Enabled    ;   //        true;
 DBERESPONSAVEL.Enabled := not     DBERESPONSAVEL.Enabled ;   //        True;
 DBETEL_RESP.Enabled    := not     DBETEL_RESP.Enabled    ;   //        True;
 BtnGravar.Enabled      := not     BtnGravar.Enabled      ;   //        true;
 btnCancelar.Enabled    := not     btnCancelar.Enabled    ;   //        true;
 DTCadastro.Enabled     := not     DTCadastro.Enabled     ;  //         TRUE;
 btnNovo.Enabled        := not     btnnovo.Enabled        ;
 btnalterar.enabled     := not     btnalterar.Enabled     ;
end;

procedure TFCadPaciente.DBGrid1DblClick(Sender: TObject);
begin
 if PageControl1.TabIndex = 1 then
  PageControl1.TabIndex :=0;

 dbnTabela.BtnClick(nbEdit);
 Alterar_True;
 DBECODIGO.SetFocus;
end;

end.
