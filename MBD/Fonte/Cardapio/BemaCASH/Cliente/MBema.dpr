program MBema;

uses
  Forms,
  UNF_MBema in 'UNF_MBema.pas' {FRM_MBema},
  UNF_Bematech in '..\..\Frente V2\UNF_Bematech.pas',
  UNF_DadosECF in '..\..\Frente V2\UNF_DadosECF.pas' {FRM_DadosECF},
  UNF_Daruma32 in '..\..\Frente V2\UNF_Daruma32.pas',
  UNF_DataRegis in '..\..\Frente V2\UNF_DataRegis.pas',
  UNF_Elgin in '..\..\Frente V2\UNF_Elgin.pas',
  UNF_Entrada in '..\..\Frente V2\UNF_Entrada.pas' {FRM_Entrada},
  UNF_Funcoes in 'UNF_Funcoes.pas',
  UNF_FuncoesECF in '..\..\Frente V2\UNF_FuncoesECF.pas',
  UNF_Mensagem in '..\..\Frente V2\UNF_Mensagem.pas' {FRM_Mensagem},
  UNF_MensagemDeErro in '..\..\Frente V2\UNF_MensagemDeErro.pas' {FRM_MensagemDeErro},
  UNF_Modulo in 'UNF_Modulo.pas' {FRM_Modulo: TDataModule},
  UNF_Pergunta in '..\..\Frente V2\UNF_Pergunta.pas' {FRM_Pergunta},
  UNF_Sweda in '..\..\Frente V2\UNF_Sweda.pas',
  UNF_Senha in '..\..\Frente V2\UNF_Senha.pas' {FRM_Senha},
  UNF_LanMesas in '..\..\Frente V2\UNF_LanMesas.pas' {FRM_LanMesas},
  UNF_PesLookUp in '..\..\Retaguarda\UNF_PesLookUp.pas' {FRM_PesLoockUP},
  UNF_AgrupaItens in '..\..\Frente V2\UNF_AgrupaItens.pas' {frm_AgrupaItens},
  UNF_FilImpCartelas in '..\..\Frente V2\UNF_FilImpCartelas.pas' {FRM_FilImpCartelas},
  UNF_FinalizaMesa in '..\..\Frente V2\UNF_FinalizaMesa.pas' {FRM_FinalizaMesa},
  UNF_Imagem in '..\..\Frente V2\UNF_Imagem.pas' {FRM_Imagem},
  UNF_LanComplemento in '..\..\Frente V2\UNF_LanComplemento.pas' {FRM_LanComplemento},
  UNF_MesaLegenda in '..\..\Frente V2\UNF_MesaLegenda.pas' {FRM_MesaLegenda},
  UNF_Observacao in '..\..\Frente V2\UNF_Observacao.pas' {FRM_Observacao},
  UNF_PesProduto in '..\..\Frente V2\UNF_PesProduto.pas' {FRM_PesProduto},
  UNF_TransMesa in '..\..\Frente V2\UNF_TransMesa.pas' {FRM_TransMesa},
  UNF_Frente in 'UNF_Frente.pas' {FRM_Frente: TDataModule},
  UNQ_ImpCartelas in '..\..\Frente V2\UNQ_ImpCartelas.pas' {QRP_ImpCartelas: TQuickRep},
  UNF_MiniImpresora in '..\..\Lib\UNF_MiniImpresora.pas',
  UNF_FilFechaCaixa1Novo in 'UNF_FilFechaCaixa1Novo.Pas' {FRM_FilFechaCaixa1Novo},
  UNF_FechaDia in '..\..\Frente V2\UNF_FechaDia.pas' {FRM_FechaDia},
  UNF_LimpaSujMesa in '..\..\Frente V2\UNF_LimpaSujMesa.pas' {FRM_LimpaSujMesa},
  UNF_AgruparMesas in 'UNF_AgruparMesas.pas' {FRM_AgruparMesas},
  UNF_MesaStatus in '..\..\Frente V2\UNF_MesaStatus.pas' {FRM_MesaStatus},
  UNQ_MesaStatus in '..\..\Frente V2\UNQ_MesaStatus.pas' {QRP_MesaStatus: TQuickRep},
  UNF_Epson in '..\..\Frente V2\UNF_Epson.pas';

{$R *.res}

begin

   FRM_Entrada := TFRM_Entrada.Create(Application);
   FRM_Entrada.Show;
   FRM_Entrada.Refresh;
   Application.Initialize;
   Application.CreateForm(TFRM_MBema, FRM_MBema);
  Application.CreateForm(TFRM_Modulo, FRM_Modulo);
  Application.CreateForm(TFRM_Frente, FRM_Frente);
  Application.CreateForm(TFRM_Mensagem, FRM_Mensagem);
  Application.CreateForm(TFRM_MensagemDeErro, FRM_MensagemDeErro);
  Application.CreateForm(TFRM_Pergunta, FRM_Pergunta);
  Application.CreateForm(TFRM_PesLoockUP, FRM_PesLoockUP);
  Application.CreateForm(TFRM_Senha, FRM_Senha);
  Application.CreateForm(TFRM_FechaDia, FRM_FechaDia);
  Application.CreateForm(TFRM_LimpaSujMesa, FRM_LimpaSujMesa);
  Application.CreateForm(TFRM_AgruparMesas, FRM_AgruparMesas);
  Application.CreateForm(TFRM_MesaStatus, FRM_MesaStatus);
  Application.CreateForm(TQRP_MesaStatus, QRP_MesaStatus);
  FRM_Entrada.Free;
   FRM_Entrada:= nil;
   Application.CreateForm(TFRM_DadosECF, FRM_DadosECF);
   Application.CreateForm(TFRM_Entrada, FRM_Entrada);
   Application.CreateForm(TFRM_Mensagem, FRM_Mensagem);
   Application.CreateForm(TFRM_MensagemDeErro, FRM_MensagemDeErro);
   Application.CreateForm(TFRM_Pergunta, FRM_Pergunta);
   Application.Run;
end.
