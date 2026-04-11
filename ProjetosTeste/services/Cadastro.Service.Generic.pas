unit Cadastro.Service.Generic;

interface

uses
  SimpleInterface, SimpleDAO, SimpleAttributes, SimpleQueryFiredac,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Stan.ExprFuncs, FireDAC.UI.Intf,
  FireDAC.Phys, FireDAC.Phys.Intf, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Comp.Client, Data.DB, Cadastro.Resources.Interfaces, Cadastro.Resources.Conexao;

type
  iService<T: class> = interface
    ['{16D4EFD3-E436-49FF-84AE-68D6A731C9A2}']
    function Listar: TDataSet;
    function ListarPorId(aID: Integer): TDataSet;
    function ListarPorFiltro(aKey: string; aValue: Variant): TDataSet;

    function Inserir: iService<T>;
    function Atualizar: iService<T>;
    function Excluir: iService<T>; overload;
    function Excluir(aField: string; aValue: string): iService<T>; overload;
    function DataSource(var aDataSource: TDataSource): iService<T>;
  end;

  TService<T: class, constructor> = class(TInterfacedObject, iService<T>)
    private
      FParent : T;
      FConexao: iconexao;
      FConn: iSimpleQuery;
      FDAO: iSimpleDAO<T>;
      FDataSource: TDataSource;
    public
      constructor Create(Parent: T);
      destructor Destroy; override;
      class function New(Parent: T): iService<T>;

      function Listar: TDataSet;
      function ListarPorId(aID: Integer): TDataSet;
      function ListarPorFiltro(aKey: string; aValue: Variant): TDataSet;

      function Inserir: iService<T>;
      function Atualizar: iService<T>;
      function Excluir: iService<T>; overload;
      function Excluir(aField: string; aValue: string): iService<T>; overload;
      function DataSource(var aDataSource: TDataSource): iService<T>;
  end;

implementation

{ TService<T> }

function TService<T>.Atualizar: iService<T>;
begin
  Result := Self;
  FDAO.Update(FParent);
end;

constructor TService<T>.Create(Parent: T);
begin
  FParent := Parent;
  FDataSource := TDataSource.Create(nil);
  FConexao := TConexao.New;
  FConn := TSimpleQueryFiredac.New(TFDConnection(FConexao.Connect));
  FDAO := TSimpleDAO<T>.New(FConn).DataSource(FDataSource);

end;

function TService<T>.DataSource(var aDataSource: TDataSource): iService<T>;
begin
  Result := Self;
  aDataSource := FDataSource;
end;

destructor TService<T>.Destroy;
begin
  FDataSource.DisposeOf;
  inherited;
end;

function TService<T>.Excluir(aField, aValue: string): iService<T>;
begin
  Result := Self;
  FDAO.Delete(aField, aValue);
end;

function TService<T>.Excluir: iService<T>;
begin
  Result := Self;
  FDAO.Delete(FParent);
end;

function TService<T>.Inserir: iService<T>;
begin
  Result := Self;
  FDAO.Insert(FParent);
end;

function TService<T>.Listar: TDataSet;
begin
  FDAO.Find;
  Result := FDataSource.DataSet;
end;

function TService<T>.ListarPorFiltro(aKey: string; aValue: Variant): TDataSet;
begin
  FDAO.Find(aKey, aValue);
  Result := FDataSource.DataSet;
end;

function TService<T>.ListarPorId(aID: Integer): TDataSet;
begin
  FDAO.Find(aID);
  Result := FDataSource.DataSet;
end;

class function TService<T>.New(Parent: T): iService<T>;
begin
  Result := Self.Create(Parent);
end;

end.
