unit UCadProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, DBCtrls, Grids,
  DBGrids;

type
  TFCadProduto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnNovo: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnApagar: TBitBtn;
    BtnGravar: TBitBtn;
    BtnCancelar: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    DBCodigo: TDBEdit;
    Label1: TLabel;
    DBProduto: TDBEdit;
    DBComplemento: TDBEdit;
    Label3: TLabel;
    DBNavigator1: TDBNavigator;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    Label6: TLabel;
    Label5: TLabel;
    edtCODIGO: TMaskEdit;
    Label7: TLabel;
    edtNome: TMaskEdit;
    BtnFiltrar: TBitBtn;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    DTCadastro: TDateTimePicker;
    Label4: TLabel;
    // funcoes e procedimentos
    procedure Alterar_True;

    procedure Filtrar;

    //Fim

    procedure btnNovoClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnApagarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnFiltrarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadProduto: TFCadProduto;
  Alterar :Boolean;

implementation

uses UDMCAD;

{$R *.dfm}

procedure TFCadProduto.btnNovoClick(Sender: TObject);
begin
 if PageControl1.TabIndex = 1 then
  PageControl1.TabIndex :=0;

 DBNavigator1.BtnClick(nbInsert);
 Alterar_True;
 DTCadastro.Date :=now;
 DBCodigo.SetFocus;

end;

procedure TFCadProduto.BtnAlterarClick(Sender: TObject);
begin
 if PageControl1.TabIndex = 1 then
  PageControl1.TabIndex :=0;

 if DBNavigator1.DataSource.DataSet.RecordCount = 0 then
 begin
   ShowMessage('Não existe registro a ser editado!');   // Acerta a msg
   Abort;
 end;
 DBNavigator1.DataSource.DataSet.Edit;

 //DBNavigator1.BtnClick(nbEdit);
 Alterar_True;
end;

procedure TFCadProduto.BtnApagarClick(Sender: TObject);
var
vPergunta :integer;
begin
  if DBNavigator1.DataSource.DataSet.RecordCount = 0 then
  begin
     ShowMessage('Não há registros no Banco de Dados' + #10 +
                  'para Exclusão !!!');
     Exit;
  end;

  vPergunta := MessageBox(Handle,'Deseja excluir o Registro atual ?','Apagar Registro',MB_YESNO);
  if vPergunta = 6 then
  begin
     //apagando do banco principal
     if DBNavigator1.DataSource.DataSet.RecordCount > 0 then
     begin
       DBNavigator1.DataSource.DataSet.Delete;
       DMCAD.IBTransaction1.CommitRetaining;
     end;
  end;


 //DBNavigator1.BtnClick(nbDelete);



end;

procedure TFCadProduto.BtnGravarClick(Sender: TObject);
var
max :integer;
begin
 if DBCODIGO.Text  = '' then
  begin
    ShowMessage('O campo Código deve ser preenchido!');
    dbcodigo.SetFocus;
    Exit;
  end;

  if DBPRODUTO.Text  = '' then
  begin
    ShowMessage('O campo Material deve ser preenchido!');
    DBPRODUTO.SetFocus;
    Exit;
  end;

 DMCAD.CadItemDATA_CADASTRO.AsDateTime := DTCadastro.Date;
 DBNavigator1.BtnClick(nbPost);
 DMCAD.IBTransaction1.CommitRetaining;
 Alterar_True;


end;

procedure TFCadProduto.BtnCancelarClick(Sender: TObject);
begin
 DBNavigator1.BtnClick(nbCancel);
 Alterar_True;


end;


procedure TFCadProduto.Alterar_True;
begin
 DBCODIGO.Enabled       := not DBCODIGO.Enabled;
 DBProduto.Enabled      := not DBProduto.Enabled;
 DBComplemento.Enabled  := not DBComplemento.Enabled;
 DTCadastro.Enabled     := not DTCadastro.Enabled;

 BtnGravar.Enabled      := not BtnGravar.Enabled;
 BtnCancelar.Enabled    := not BtnCancelar.Enabled;
end;



procedure TFCadProduto.Filtrar;
begin
 with DMCAD do
 begin

  DMCAD.CadItem.SelectSQL.Clear;
  DMCAD.CadItem.SelectSQL.Add('select ESTOQUE.CODIGO');
  DMCAD.CadItem.SelectSQL.Add('      ,ESTOQUE.ID_ITEM');
  DMCAD.CadItem.SelectSQL.Add('      ,ESTOQUE.ITEM');
  DMCAD.CadItem.SelectSQL.Add('      ,ESTOQUE.DESCRICAO');
  DMCAD.CadItem.SelectSQL.Add('      ,ESTOQUE.DATA_CADASTRO');
  DMCAD.CadItem.SelectSQL.Add('from ESTOQUE');

  DMCAD.CadItem.SelectSQL.Add('where (1=1)');

  if edtCODIGO.Text <> '' then
   DMCAD.CadItem.SelectSQL.Add('and (ESTOQUE.CODIGO=:CODIGO)');

  if edtNOME.Text <> '' then
   DMCAD.CadItem.SelectSQL.Add('and(UPPER (ESTOQUE.ITEM)LIKE UPPER(:NOME)) ');


  DMCAD.CadItem.SelectSQL.Add('ORDER BY');
  DMCAD.CadItem.SelectSQL.Add('ESTOQUE.ITEM');

  if edtCODIGO.Text <> '' then
   DMCAD.CadItem.ParamByName('CODIGO').AsString := edtCODIGO.Text;

  if edtNOME.Text <> '' then
   DMCAD.CadItem.ParamByName('NOME').AsString := '%'+edtNOME.Text+'%';

  DMCAD.CadItem.Open;
 end;
end;

procedure TFCadProduto.FormCreate(Sender: TObject);
begin
 DMCAD.CadItem.Close;
 DMCAD.CadItem.Open;
 Filtrar;
 DTCadastro.DateTime := DMCAD.CadItemDATA_CADASTRO.AsDateTime;
end;



procedure TFCadProduto.PageControl1Change(Sender: TObject);
begin
    if (PageControl1.ActivePage = TabSheet1) then
   btnAlterar.Enabled := true;
  if  (DBGrid1.Enabled = False)  then
   btnAlterar.Enabled := false;
end;

procedure TFCadProduto.BtnFiltrarClick(Sender: TObject);
begin
  Filtrar;

 DBGrid1.DataSource := DMCAD.DTSitem;
 DBGrid1.Enabled :=TRUE;
end;

procedure TFCadProduto.DBGrid1DblClick(Sender: TObject);
begin
 if PageControl1.TabIndex = 1 then
  PageControl1.TabIndex :=0;

 DBNavigator1.BtnClick(nbEdit);
 Alterar_True;
end;

end.
