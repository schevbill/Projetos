unit Cadastro.Controller;

interface

uses
  Cadastro.Controller.DTO.Interfaces, Cadastro.Controller.DTO.Cliente;

type
  iController = interface
      function Cliente: iClienteDTO;
  end;

  TController = class(TInterfacedObject, iController)
    private
      FCliente: iClienteDTO;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iController;
      function Cliente: iClienteDTO;
  end;

implementation

{ TController }

function TController.Cliente: iClienteDTO;
begin
  Result := FCliente;
end;

constructor TController.Create;
begin
  if not Assigned(FCliente) then
    FCliente := TClienteDTO.New;
end;

destructor TController.Destroy;
begin

  inherited;
end;

class function TController.New: iController;
begin
  Result := Self.Create;
end;

end.
