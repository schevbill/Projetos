unit ULancMaterial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, Grids,
  DBGrids;

type
  TFLancMaterial = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    btnNoovo: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    DBGridLanc: TDBGrid;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtNomeP: TMaskEdit;
    edtCODSUS: TMaskEdit;
    DTInicial: TDateTimePicker;
    DTFinal: TDateTimePicker;
    btnFiltrar: TBitBtn;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label12: TLabel;
    dbeDesc: TDBEdit;
    cbmaterial: TDBLookupComboBox;
    cbcodMaterial: TDBLookupComboBox;
    Label8: TLabel;
    edtQnt: TEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    CBCodigoSus: TDBLookupComboBox;
    Label2: TLabel;
    cbPaciente: TDBLookupComboBox;
    Label4: TLabel;
    DBEndereco: TDBEdit;
    Label3: TLabel;
    DBERG: TDBEdit;
    Label5: TLabel;
    DTCadastro: TDateTimePicker;

    // funcoes e procedimentos
    procedure Alterar_True;
    procedure Alterar_False;

    // fim
    procedure btnNoovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBCodigoSusClick(Sender: TObject);
    procedure CBCodigoSusExit(Sender: TObject);
    procedure CBCodigoSusKeyPress(Sender: TObject; var Key: Char);
    procedure cbPacienteKeyPress(Sender: TObject; var Key: Char);
    procedure cbPacienteClick(Sender: TObject);
    procedure cbPacienteExit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure cbcodMaterialClick(Sender: TObject);
    procedure cbcodMaterialExit(Sender: TObject);
    procedure cbcodMaterialKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Filtrar;
    procedure edtNomePChange(Sender: TObject);
    procedure edtCODSUSChange(Sender: TObject);
    procedure cbmaterialClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLancMaterial: TFLancMaterial;

implementation

uses UDMCAD, UPrincipal, ULogin;

{$R *.dfm}

procedure TFLancMaterial.btnNoovoClick(Sender: TObject);
begin
 if PageControl1.TabIndex = 1 then
  PageControl1.TabIndex :=0;

 DTCadastro.Date :=now;
 Alterar_True;
 CBCodigoSus.KeyValue  := null;
 cbPaciente.KeyValue   := null;
 DBEndereco.DataField  :='';
 DBERG.DataField       :='';
 cbcodMaterial.KeyValue := null;
 cbmaterial.KeyValue    := null;
 edtQnt.Text            :='';
 dbeDesc.DataField      :='';
 CBCodigoSus.SetFocus;
 

end;


procedure TFLancMaterial.Alterar_True;
begin
 CBCodigoSus.Enabled       := not CBCodigoSus.Enabled;
 cbPaciente.enabled        := not cbPaciente.enabled    ;
 cbcodMaterial.Enabled     := not cbcodMaterial.Enabled ;
 cbmaterial.Enabled        := not cbmaterial.Enabled    ;
 edtQnt.Enabled            := not edtQnt.Enabled        ;
 BitBtn4.Enabled           := not BitBtn4.Enabled       ;
 BitBtn5.Enabled           := not BitBtn5.Enabled       ;
end;

procedure TFLancMaterial.Alterar_False;
begin
 CBCodigoSus.Enabled      := false;
 cbPaciente.enabled       := false;
 cbcodMaterial.Enabled    := false;
 cbMaterial.Enabled       := false;
 edtQnt.Enabled           := False;
 BitBtn4.Enabled          := False;
 BitBtn5.Enabled          := False;
end;


procedure TFLancMaterial.FormCreate(Sender: TObject);
begin
 DMCAD.PesquisaPaciente.close;
 DMCAD.PesquisaMaterial.close;
 DMCAD.LancMaterial.Close;
 DMCAD.LancMaterial.Open;
 DMCAD.PesquisaPaciente.open;
 DMCAD.PesquisaMaterial.Open;
 DMCAD.PesquisaMaterial.first;
 DMCAD.PesquisaPaciente.First;
 DBEndereco.DataField  :='';
 DBERG.DataField       :='';
 dbeDesc.DataField     :='';
 DTCadastro.DateTime :=date;
end;

procedure TFLancMaterial.CBCodigoSusClick(Sender: TObject);
begin
 cbPaciente.KeyValue   := CBCodigoSus.KeyValue;
 DBEndereco.DataField  :='ENDERECO';
 DBERG.DataField       :='RG';

end;

procedure TFLancMaterial.CBCodigoSusExit(Sender: TObject);
begin
 cbPaciente.KeyValue := CBCodigoSus.KeyValue;
 DBEndereco.DataField  :='ENDERECO';
 DBERG.DataField       :='RG';
end;

procedure TFLancMaterial.CBCodigoSusKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #8 then
 begin
  CBCodigoSus.KeyValue  := null;
  cbPaciente.KeyValue   := null;
  DBEndereco.DataField  :='';
  DBERG.DataField       :='';
 end;

end;

procedure TFLancMaterial.cbPacienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #8 then
 begin
  CBCodigoSus.KeyValue := null;
  cbPaciente.KeyValue := null;
  DBEndereco.DataField  :='';
  DBERG.DataField       :='';
 end;
end;

procedure TFLancMaterial.edtCODSUSChange(Sender: TObject);
begin
  Filtrar;
end;

procedure TFLancMaterial.edtNomePChange(Sender: TObject);
begin
 filtrar;
end;

procedure TFLancMaterial.cbPacienteClick(Sender: TObject);
begin
 CBCodigoSus.KeyValue := cbPaciente.KeyValue;
 DBEndereco.DataField  :='ENDERECO';
 DBERG.DataField       :='RG';
end;

procedure TFLancMaterial.cbPacienteExit(Sender: TObject);
begin
 CBCodigoSus.KeyValue := cbPaciente.KeyValue;
 DBEndereco.DataField  :='ENDERECO';
 DBERG.DataField       :='RG';
end;

procedure TFLancMaterial.BitBtn5Click(Sender: TObject);
begin
 Alterar_true;
 DBEndereco.DataField  :='';
 DBERG.DataField       :='';
end;

procedure TFLancMaterial.cbcodMaterialClick(Sender: TObject);
begin
 cbmaterial.KeyValue := cbcodMaterial.KeyValue;
 dbeDesc.DataField   := 'DESCRICAO';
 
end;

procedure TFLancMaterial.cbcodMaterialExit(Sender: TObject);
begin
 cbmaterial.KeyValue := cbcodMaterial.KeyValue;
end;

procedure TFLancMaterial.cbcodMaterialKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #8 then
 begin
  cbcodMaterial.KeyValue := null;
  cbmaterial.KeyValue    := null;
  edtQnt.Text            :='';
  dbeDesc.DataField      :='';
 end;
end;

procedure TFLancMaterial.cbmaterialClick(Sender: TObject);
begin
  cbcodMaterial.KeyValue := cbmaterial.KeyValue;
  dbeDesc.DataField   := 'DESCRICAO';
end;

procedure TFLancMaterial.btnAddClick(Sender: TObject);
begin
  with DMCAD do
  begin
   LancMaterial.Close;
   LancMaterial.Open;
   //LancMaterial.Edit;
   LancMaterial.Insert;

   LancMaterialDATA_SAIDA.AsDateTime := DTCadastro.DateTime;
   LancMaterialID_ITEM.AsInteger     := cbcodMaterial.KeyValue;
   LancMaterialID_PACIENTE.AsInteger := CBCodigoSus.KeyValue;
   LancMaterialQUANTIDADE.AsInteger  := StrToInt(edtQnt.text);
   LancMaterialUSUARIO.AsString      := FLogin.edtUsuario.Text;
   LancMaterial.Post;
   IBTransaction1.CommitRetaining;
  end;
end;

procedure TFLancMaterial.btnFiltrarClick(Sender: TObject);
  var choix: integer;
begin
  if DTInicial.Date > DTFinal.Date then
  begin
   choix:=MessageBox(Handle, pchar('Data inicial é maior que a Data final') , pchar('Hightech System - Gerenciador de Material'), 48);

   if choix=1 then
     begin

     end;
  end
  else
   Filtrar;


end;

procedure TFLancMaterial.BitBtn4Click(Sender: TObject);
begin

   with DMCAD do
   begin
    LancMaterial.Close;
    LancMaterial.Open;
    //LancMaterial.Edit;
    LancMaterial.Insert;


    LancMaterialDATA_SAIDA.AsDateTime := DTCadastro.DateTime;
    LancMaterialID_ITEM.AsInteger     := cbcodMaterial.KeyValue;
    LancMaterialID_PACIENTE.AsInteger := CBCodigoSus.KeyValue;
    LancMaterialQUANTIDADE.AsInteger  := StrToInt(edtQnt.text);
    LancMaterialUSUARIO.AsString      := FLogin.edtUsuario.Text;
    LancMaterial.Post;
    IBTransaction1.CommitRetaining;
    Alterar_False;
   end;

end;
procedure TFLancMaterial.Filtrar;
begin

  DMCAD.PesquisaLancamento.SelectSQL.Clear;
  DMCAD.PesquisaLancamento.SelectSQL.Add('select SE.DATA_SAIDA,');
  DMCAD.PesquisaLancamento.SelectSQL.Add('      SE.ID_ITEM,');
  DMCAD.PesquisaLancamento.SelectSQL.Add('      SE.ID_PACIENTE,');
  DMCAD.PesquisaLancamento.SelectSQL.Add('      SE.ID_SAIDAESTOQUE,');
  DMCAD.PesquisaLancamento.SelectSQL.Add('      SE.QUANTIDADE,');
  DMCAD.PesquisaLancamento.SelectSQL.Add('      SE.USUARIO,');
  DMCAD.PesquisaLancamento.SelectSQL.Add('      ES.item,');
  DMCAD.PesquisaLancamento.SelectSQL.Add('      ES.descricao,');
  DMCAD.PesquisaLancamento.SelectSQL.Add('      CP.nome,');
  DMCAD.PesquisaLancamento.SelectSQL.Add('      CP.CODIGO_SUS');
  DMCAD.PesquisaLancamento.SelectSQL.Add('from saidaestoque SE');

  DMCAD.PesquisaLancamento.SelectSQL.Add('Left join estoque ES on (se.id_item = es.id_item)');
  DMCAD.PesquisaLancamento.SelectSQL.Add('Left join cadpaciente CP on (SE.id_paciente = CP.id_paciente)');

  DMCAD.PesquisaLancamento.SelectSQL.Add('where (1=1)');

  if edtCODSUS.Text <> '' then
   DMCAD.PesquisaLancamento.SelectSQL.Add('and (CP.CODIGO_SUS=:CODIGO)');

  if edtNomeP.Text <> '' then
   DMCAD.PesquisaLancamento.SelectSQL.Add('and (upper(CP.NOME) like upper(:NOME))');


  DMCAD.PesquisaLancamento.SelectSQL.Add('and (SE.DATA_SAIDA between :DATA_INICIAL and :DATA_FINAL )');

  DMCAD.PesquisaLancamento.SelectSQL.Add('ORDER BY');
  DMCAD.PesquisaLancamento.SelectSQL.Add('SE.DATA_SAIDA');

  if edtCODSUS.Text <> '' then
   DMCAD.PesquisaLancamento.ParamByName('CODIGO').AsString := edtCODSUS.Text;

  if edtNOMEP.Text <> '' then
   DMCAD.PesquisaLancamento.ParamByName('NOME').AsString := '%'+edtNOMEp.Text+'%';


  DMCAD.PesquisaLancamento.ParamByName('DATA_INICIAL').AsDateTime := DTInicial.DateTime;
  DMCAD.PesquisaLancamento.ParamByName('DATA_FINAL').AsDateTime := DTFinal.DateTime;

  DMCAD.PesquisaLancamento.Open;
end;

end.
