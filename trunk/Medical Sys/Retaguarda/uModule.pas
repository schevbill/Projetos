unit uModule;

interface

uses
  System.SysUtils, System.Classes, IBDatabaseINI, IBDatabaseInfo, IBDatabase,
  Data.DB, IniFileS, Winapi.Windows, Vcl.Forms, Vcl.Controls, Vcl.Dialogs,
  IBQuery, IBCustomDataSet, IBTable;

type
  TModule = class(TDataModule)
    IBMedical: TIBDatabase;
    IBTransaction: TIBTransaction;
    qryUF: TIBQuery;
    dtsUF: TDataSource;
    qryUFID_UF: TIntegerField;
    qryUFESTADO: TIBStringField;
    qryUFCODIGO_IBGE: TIntegerField;
    qryCidade: TIBQuery;
    dtsCidade: TDataSource;
    qryCidadeID_CIDADE: TIntegerField;
    qryCidadeDESCRICAO: TIBStringField;
    qryCidadeCODIGO_IBGE: TIntegerField;
    qryCidadeID_UF: TIntegerField;
    Procedure _IBCommit( DataSet: TDataSet );
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Module: TModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ufrmEntrada, uFuncoes, ufrmModeloCad;

{$R *.dfm}

procedure TModule.DataModuleCreate(Sender: TObject);
var
    VarUser_Name, VarPassword : string;
                          Ini : TIniFile;
   _Local,_Server,_Path,_Base : String;
                     qryCount : TIBQuery;
begin
      {Senha IB}
   VarUser_Name := 'sysdba';
   VarPassword  := 'htsys';

   Try
      if IBMedical.Connected = True then
         IBMedical.Connected := False;

      if IBMedical.Connected = False then
         _app    := GetCurrentDir;

      Ini      := TIniFile.Create( _app+'\HSCONF.INI' );
      _Local   := Ini.ReadString( 'CONFBD', 'LOCAL' , '' );
      _Server  := Ini.ReadString( 'CONFBD', 'SERVER', '' );
      _Path    := Ini.ReadString( 'CONFBD', 'PATH'  , '' );
      _Base    := Ini.ReadString( 'CONFBD', 'BASE'  , '' );

      if UpperCase(_Local) = 'FALSE' then
         IBMedical.DatabaseName := _Server+':'+_Path+_Base
      else
         IBMedical.DatabaseName := _Path+_Base;

      IBMedical.Params.Clear;
      IBMedical.Params.Add('user_name='+VarUser_Name);
      IBMedical.Params.Add('password='+VarPassword);
      IBMedical.Connected;
      IBMedical.Open;

      IBTransaction.Active := true;

      Ini.Free;
   except
      if _Base = '' then
         ShowMessage('Arquivo HSCONF.ini não encontrado.'+#13+#10+
                     'Seu sistema será fechado!!!')
      else
         ShowMessage('Ocorreu um erro na Abertura da Base'+#13+#10+
                     'Seu sistema será fechado!!!');

      Application.Terminate;
      Exit;
   end;

   qryCount := TIBQuery.Create(Self);

   with qryCount do
   begin
      Database    := Module.IBMedical;
      Transaction := Module.IBTransaction;

      //ACERTAR AQUI EM BAIXO

      Close;
      SQL.Clear;
      SQL.Add('select Count(distinct(rdb$relation_name)) as QTD_Tabela ');
      SQL.Add('from rdb$relation_fields');
      Open;

      frmEntrada.GGEProgresso.MaxValue := qryCount.FieldByName('QTD_Tabela').AsInteger;

      Close;
      SQL.Clear;
      SQL.Add('select distinct rdb$relation_name from rdb$relation_fields');
      Open;

      First;
      while not Eof do
      begin
         frmEntrada.Label1.Caption := 'Tabela ' + FieldByName('rdb$relation_name').AsString;
         frmEntrada.Label1.Repaint;
         frmEntrada.GGEProgresso.Progress := frmEntrada.GGEProgresso.Progress + 1;

         Next;
      end;
   end;

   qryUF.Close;
   qryCidade.Close;
   qryUF.Open;
   qryCidade.Open;

end;

Procedure TModule._IBCommit( DataSet: TDataSet );
begin
   with IBMedical, IBTransaction Do
   begin
      try
         ApplyUpdates(DataSet);
         CommitRetaining;
      except
         ShowMessage('Transação não efetuada, será revertida.'+#13+#10+
                     'Favor tentar novamente.');
         RollbackRetaining;
         raise;
      end;
   end;
end;

end.
