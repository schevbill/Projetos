unit Cadastro.Resources.Interfaces;

interface

uses
  Data.DB;

type
  iConexao = interface
    ['{12914D80-61FA-4D93-8E13-E876496821E8}']
    function Connect: TCustomConnection;
  end;

implementation

end.
