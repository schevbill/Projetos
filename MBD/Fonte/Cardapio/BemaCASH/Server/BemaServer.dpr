program BemaServer;

uses
  Forms,
  UNF_Principal in 'UNF_Principal.pas' {FRM_Principal},
  UNF_Modulo in 'UNF_Modulo.pas' {FRM_Modulo: TDataModule},
  UNF_Entrada in 'UNF_Entrada.pas' {FRM_Entrada},
  UNF_Funcoes in 'UNF_Funcoes.pas',
  UNF_NLogin in 'UNF_NLogin.pas' {FRM_NLogin},
  IBErros in '..\..\..\Lib\NomedoProjeto\IBErros.pas',
  UNF_Mensagem in '..\..\..\Lib\NomedoProjeto\UNF_Mensagem.pas' {FRM_Mensagem},
  UNF_MensagemDeErro in '..\..\..\Lib\NomedoProjeto\UNF_MensagemDeErro.pas' {FRM_MensagemDeErro},
  UNF_Pergunta in '..\..\..\Lib\NomedoProjeto\UNF_Pergunta.pas' {FRM_Pergunta},
  UNF_PesLookUp in '..\..\..\Lib\NomedoProjeto\UNF_PesLookUp.pas' {FRM_PesLoockUP},
  UNF_Exportacao in 'UNF_Exportacao.pas' {FRM_Exportacao};

{$R *.res}

begin
  FRM_Entrada := TFRM_Entrada.Create(Application);
  FRM_Entrada.Show;
  FRM_Entrada.Refresh;
  Application.Initialize;
  Application.Title := 'BemaServer';
  Application.CreateForm(TFRM_Principal, FRM_Principal);
  Application.CreateForm(TFRM_Modulo, FRM_Modulo);
  Application.CreateForm(TFRM_Mensagem, FRM_Mensagem);
  Application.CreateForm(TFRM_MensagemDeErro, FRM_MensagemDeErro);
  Application.CreateForm(TFRM_Pergunta, FRM_Pergunta);
  Application.CreateForm(TFRM_PesLoockUP, FRM_PesLoockUP);
  FRM_Entrada.Refresh;
  FRM_Entrada.Refresh;
  FRM_Entrada.Free;
  FRM_Entrada:= nil;
  Application.Run;
end.
