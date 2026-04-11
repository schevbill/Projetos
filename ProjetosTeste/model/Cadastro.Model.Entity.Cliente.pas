unit Cadastro.Model.Entity.Cliente;

interface

uses
  SimpleAttributes;

type
  [Tabela('CLIENTE')]
  TCliente = class
  private
    Fid: Integer;
    FIdade: Integer;
    FData_Nascimento: TDate;
    FNome: string;
    procedure SetData_Nascimento(const Value: TDate);
    procedure Setid(const Value: Integer);
    procedure SetIdade(const Value: Integer);
    procedure SetNome(const Value: string);
  public
    [Campo('ID'), PK, AutoInc]
    property id: Integer read Fid write Setid;
    [Campo('NOME')]
    property Nome: string read FNome write SetNome;
    [Campo('IDADE'), NumberOnly]
    property Idade: Integer read FIdade write SetIdade;
    [Campo('DATA_NASCIMENTO')]
    property Data_Nascimento: TDate read FData_Nascimento write SetData_Nascimento;

  end;

implementation

{ TCliente }

procedure TCliente.SetData_Nascimento(const Value: TDate);
begin
  FData_Nascimento := Value;
end;

procedure TCliente.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TCliente.SetIdade(const Value: Integer);
begin
  FIdade := Value;
end;

procedure TCliente.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
