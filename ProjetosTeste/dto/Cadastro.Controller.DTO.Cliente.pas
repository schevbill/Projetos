unit Cadastro.Controller.DTO.Cliente;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Stan.ExprFuncs, FireDAC.UI.Intf,
  FireDAC.Phys, FireDAC.Phys.Intf, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Comp.Client, Data.DB, Cadastro.Controller.DTO.Interfaces,
  Cadastro.Service.Generic, Cadastro.Model.Entity.Cliente;

type
  TClienteDTO = class(TInterfacedObject, iClienteDTO)
  private
    FCliente: TCliente;
    FService: iService<TCliente>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iClienteDTO;

    function ID(Value: Integer): iClienteDTO; overload;
    function ID: Integer; overload;
    function Nome(Value: string): iClienteDTO; overload;
    function Nome: string; overload;
    function Idade(Value: Integer): iClienteDTO; overload;
    function Idade: Integer; overload;
    function Data_Nascimento(Value: TDate): iClienteDTO; overload;
    function Data_Nascimento: TDate; overload;
    function Build: iService<TCliente>;
  end;

implementation

{ TClienteDTO }

function TClienteDTO.Build: iService<TCliente>;
begin
  Result := FService;
end;

constructor TClienteDTO.Create;
begin
  FCliente := TCliente.Create;
  FService := TService<TCliente>.New(FCliente);
end;

function TClienteDTO.Data_Nascimento: TDate;
begin
  Result := FCliente.Data_Nascimento;
end;

function TClienteDTO.Data_Nascimento(Value: TDate): iClienteDTO;
begin
  Result := Self;
  FCliente.Data_Nascimento := Value;
end;

destructor TClienteDTO.Destroy;
begin
  FCliente.Free;
  inherited;
end;

function TClienteDTO.ID: Integer;
begin
  Result := FCliente.id;
end;

function TClienteDTO.ID(Value: Integer): iClienteDTO;
begin
  Result := Self;
  FCliente.id := Value;
end;

function TClienteDTO.Idade(Value: Integer): iClienteDTO;
begin
  Result := Self;
  FCliente.Idade := Value;
end;

function TClienteDTO.Idade: Integer;
begin
  Result := FCliente.Idade;
end;

class function TClienteDTO.New: iClienteDTO;
begin
  Result := Self.Create;
end;

function TClienteDTO.Nome(Value: string): iClienteDTO;
begin
  Result := Self;
  FCliente.Nome := Value;
end;

function TClienteDTO.Nome: string;
begin
  Result := FCliente.Nome;
end;

end.
