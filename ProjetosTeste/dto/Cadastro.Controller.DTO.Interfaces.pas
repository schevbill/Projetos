unit Cadastro.Controller.DTO.Interfaces;

interface

uses
  Cadastro.Service.Generic, Cadastro.Model.Entity.Cliente;

  type
    iClienteDTO = interface
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

end.
