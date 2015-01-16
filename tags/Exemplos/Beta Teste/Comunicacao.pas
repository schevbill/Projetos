unit Comunicacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin, ComCtrls, StrUtils, FunCompCub, Grids, DB,
  DBGrids, DBClient, ADODB;

type
  TFRM_Comunica = class(TForm)
    RGDLL: TRadioGroup;
    PCComunicacao: TPageControl;
    TBSSerial: TTabSheet;
    Label1: TLabel;
    seNum: TSpinEdit;
    bAbreFechaSerial: TButton;
    TBSSocket: TTabSheet;
    Label38: TLabel;
    edtIP: TEdit;
    bConectDesc: TButton;
    gbConsultaEncerrantes: TGroupBox;
    Label25: TLabel;
    cbTipo: TComboBox;
    bConsultaPF: TButton;
    bConsultaSocket: TButton;
    bConsultaSerial: TButton;
    bAtualizar: TButton;
    rgTipoStatus: TRadioGroup;
    lbStatus: TListBox;
    rgStatusBomb: TRadioGroup;
    lbStatusBomb: TListBox;
    TimerStatus: TTimer;
    gbInfo: TGroupBox;
    edtBico: TEdit;
    Label24: TLabel;
    gbOperacao: TGroupBox;
    Label33: TLabel;
    bOperacao: TButton;
    cbOpcaoBLA: TComboBox;
    gbAlteraPreco: TGroupBox;
    Label28: TLabel;
    Label30: TLabel;
    bAlteraPre: TButton;
    edtPreco: TEdit;
    seDecimal: TSpinEdit;
    gbValorMaxBico: TGroupBox;
    Label2: TLabel;
    edtPrecoBombaMax: TEdit;
    bPararPreco: TButton;
    rgClock: TRadioGroup;
    bSetClock: TButton;
    edtDia: TEdit;
    edtHora: TEdit;
    edtMin: TEdit;
    gbClockIdentfid: TGroupBox;
    edtMinIdent: TEdit;
    edtHoraIdent: TEdit;
    edtDiaIden: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    bSetClockIdent: TButton;
    gbVersao: TGroupBox;
    mVersao: TMemo;
    gbLeitura: TGroupBox;
    bLeAbastecimento: TButton;
    bIncrementa: TButton;
    gbLeituraM: TGroupBox;
    mLeituraBM: TMemo;
    Panel1: TPanel;
    edtIndice: TEdit;
    Label6: TLabel;
    bLeEvento: TButton;
    gbLePart: TGroupBox;
    bLePart: TButton;
    Label7: TLabel;
    cbOpcaoPart: TComboBox;
    gbLePPL: TGroupBox;
    bLePPL: TButton;
    edtLePPL: TEdit;
    cdsGravaEnce: TClientDataSet;
    gEncerrante: TDBGrid;
    dtsGravaEnce: TDataSource;
    cdsGravaEnceValue: TBooleanField;
    cdsGravaEnceTotal_Dinheiro: TFloatField;
    cdsGravaEnceTotal_Litros: TFloatField;
    cdsGravaEncePU: TFloatField;
    cdsGravaEnceTempo: TStringField;
    cdsGravaEnceCanal: TStringField;
    cdsGravaEnceData: TStringField;
    cdsGravaEnceHora: TStringField;
    cdsGravaEnceSt_Full: TStringField;
    cdsGravaEnceRegistro: TIntegerField;
    cdsGravaEnceEncerrante: TFloatField;
    cdsGravaEnceIntegridade: TBooleanField;
    cdsGravaEnceChecksum: TBooleanField;
    bLeAbFix: TButton;
    bGerenPosto: TButton;
    bAtivaTimerStatus: TButton;
    bCadastro: TButton;
    cLedPosto: TADOConnection;

    procedure OpcaoObrigatorio;
    procedure pStatusBomba;
    function fErrorToString(Erro : ErrorP) : string;
    procedure pVersao;
    procedure pStatusBombaValor;
    function Armazenar(funcao : String) : Boolean;

    procedure bConectDescClick(Sender: TObject);
    procedure bConsultaSocketClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RGDLLClick(Sender: TObject);
    procedure bAbreFechaSerialClick(Sender: TObject);
    procedure bConsultaPFClick(Sender: TObject);
    procedure bConsultaSerialClick(Sender: TObject);
    procedure bAtualizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bAlteraPreClick(Sender: TObject);
    procedure TimerStatusTimer(Sender: TObject);
    procedure bPararPrecoClick(Sender: TObject);
    procedure bOperacaoClick(Sender: TObject);
    procedure bSetClockClick(Sender: TObject);
    procedure rgClockClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bSetClockIdentClick(Sender: TObject);
    procedure bLeAbastecimentoClick(Sender: TObject);
    procedure bIncrementaClick(Sender: TObject);
    procedure bLeAbFixClick(Sender: TObject);
    procedure bLeEventoClick(Sender: TObject);
    procedure bLePartClick(Sender: TObject);
    procedure bLePPLClick(Sender: TObject);
    procedure bGerenPostoClick(Sender: TObject);
    procedure bAtivaTimerStatusClick(Sender: TObject);
    procedure bCadastroClick(Sender: TObject);
  private
    { Private declarations }
   vConect : Boolean;
   vLinha  : Integer;
   vStatus : Boolean;
  public
    { Public declarations }
  end;

var
  FRM_Comunica: TFRM_Comunica;

implementation

uses uPosto, uCadastro;

//uses FunCompCub;

{$R *.dfm}

function TFRM_Comunica.Armazenar(funcao: String): Boolean;
var
   vResposta: integer;
begin
   if funcao = 'LeAbFix' then
      begin
         if LeAbFix.value then
            begin
               cdsGravaEnce.Append;
               cdsGravaEnceValue.AsBoolean         := LeAbFix.value;
               cdsGravaEnceTotal_Dinheiro.AsFloat  := LeAbFix.Total_Dinheiro;
               cdsGravaEnceTotal_Litros.AsFloat    := LeAbFix.Total_Litros;
               cdsGravaEncePU.AsFloat              := LeAbFix.PU;
               cdsGravaEnceTempo.AsString          := LeAbFix.Tempo;
               cdsGravaEnceCanal.AsString          := LeAbFix.Canal;
               cdsGravaEnceData.AsString           := LeAbFix.Data;
               cdsGravaEnceHora.AsString           := LeAbFix.Hora;
               cdsGravaEnceSt_Full.AsString        := LeAbFix.St_Full;
               cdsGravaEnceRegistro.AsInteger      := LeAbFix.Registro;
               cdsGravaEnceEncerrante.AsFloat      := LeAbFix.Encerrante;
               cdsGravaEnceIntegridade.AsBoolean   := LeAbFix.Integridade;
               cdsGravaEnceChecksum.AsBoolean      := LeAbFix.Checksum;
               cdsGravaEnce.Post;

               vResposta := MessageBox(Handle, pchar('Deseja passar para o proximo registro?') , pchar('Posto'), 36);

               If vResposta = 6 then
                  Incrementa;
            end
         else
            ShowMessage('Já Foi lido todas as informações!!');

         Result := True;
      end
   else
      begin
         cdsGravaEnce.Append;
         cdsGravaEnceValue.AsBoolean         := LeAbastecimento.value;
         cdsGravaEnceTotal_Dinheiro.AsFloat  := LeAbastecimento.Total_Dinheiro;
         cdsGravaEnceTotal_Litros.AsFloat    := LeAbastecimento.Total_Litros;
         cdsGravaEncePU.AsFloat              := LeAbastecimento.PU;
         cdsGravaEnceTempo.AsString          := LeAbastecimento.Tempo;
         cdsGravaEnceCanal.AsString          := LeAbastecimento.Canal;
         cdsGravaEnceData.AsString           := LeAbastecimento.Data;
         cdsGravaEnceHora.AsString           := LeAbastecimento.Hora;
         cdsGravaEnceSt_Full.AsString        := LeAbastecimento.St_Full;
         cdsGravaEnceRegistro.AsInteger      := LeAbastecimento.Registro;
         cdsGravaEnceEncerrante.AsFloat      := LeAbastecimento.Encerrante;
         cdsGravaEnceIntegridade.AsBoolean   := LeAbastecimento.Integridade;
         cdsGravaEnceChecksum.AsBoolean      := LeAbastecimento.Checksum;
         cdsGravaEnce.Post;

         Result := True;
      end;

   mLeituraBM.Clear;
   mLeituraBM.Lines.Add( ' - Value '          + BoolToStr(cdsGravaEnceValue.AsBoolean)                          + #13 + #10 +
                         ' - total_dinheiro ' + formatfloat('##,###,##0.00',cdsGravaEncetotal_dinheiro.AsFloat) + #13 + #10 +
                         ' - total_litros '   + formatfloat('##,###,##0.00',cdsGravaEncetotal_litros.AsFloat)   + #13 + #10 +
                         ' - PU '             + FloatToStr(cdsGravaEncePU.AsFloat)                              + #13 + #10 +
                         ' - tempo '          + cdsGravaEncetempo.AsString                                      + #13 + #10 +
                         ' - canal '          + cdsGravaEncecanal.AsString                                      + #13 + #10 +
                         ' - data '           + cdsGravaEncedata.AsString                                       + #13 + #10 +
                         ' - hora '           + cdsGravaEncehora.AsString                                       + #13 + #10 +
                         ' - st_full '        + cdsGravaEncest_full.AsString                                    + #13 + #10 +
                         ' - registro '       + IntToStr(cdsGravaEnceregistro.AsInteger)                        + #13 + #10 +
                         ' - encerrante '     + formatfloat('##,###,##0.00',cdsGravaEnceencerrante.AsFloat)     + #13 + #10 +
                         ' - integridade '    + BoolToStr(cdsGravaEnceintegridade.AsBoolean)                    + #13 + #10 +
                         ' - checksum '       + BoolToStr(cdsGravaEncechecksum.AsBoolean));
end;

procedure TFRM_Comunica.bAbreFechaSerialClick(Sender: TObject);
begin
   if RGDLL.ItemIndex = 0 then
      begin
         if vConect = False then
            begin
               LimpaSerial;
               if InicializaSerial(seNum.Value) = True then
                  begin
                     bAbreFechaSerial.Caption := 'Fecha serial';
                     vConect                  := True;
                     seNum.ReadOnly           := True;
                     TBSSocket.TabVisible     := False;
                     ShowMessage('Porta Aberta!!');
                     pStatusBomba;
                     lbStatusBomb.Clear;
                     pVersao;
                  end
               else
                  begin
                     bAbreFechaSerial.Caption := 'Abre serial';
                     vConect                  := False;
                     seNum.ReadOnly           := False;
                     TBSSocket.TabVisible     := True;
                     ShowMessage('Porta Fechada!!');
                  end;
            end
         else
            begin
               if FechaSerial <> 0 then
                  begin
                     ShowMessage('Porta Aberta!!');
                     pStatusBomba;
                     lbStatusBomb.Clear;
                     pVersao;
                  end
               else
                  begin
                     ShowMessage('Porta Fechada!!');
                     bAbreFechaSerial.Caption := 'Conectar';
                     pStatusBomba;
                     vConect                  := False;
                     seNum.ReadOnly           := False;
                     TBSSocket.TabVisible     := True;
                  end;
            end;
      end
   else
   begin
//      ShowMessage('Fazendo implementação!!!');
      if vConect = False then
         begin
            pLEDLimpaSerial(0);
            if fLEDConecta(0,'serial',seNum.Text) = True then
               begin
                  bAbreFechaSerial.Caption := 'Fecha serial';
                  vConect                  := True;
                  seNum.ReadOnly           := True;
                  TBSSocket.TabVisible     := False;
                  ShowMessage('Porta Aberta!!');
               end;
         end;
   end;
end;

procedure TFRM_Comunica.bAlteraPreClick(Sender: TObject);
var
   erro : errorP;
begin
   OpcaoObrigatorio;
   erro := AlteraPreco(edtBico.text,strtofloat(edtPreco.text),seDecimal.Value);
   ShowMessage(fErrorToString(erro));
end;

function TFRM_Comunica.fErrorToString(Erro : ErrorP) : string;
begin
   if Erro = ErroString then
      result := 'ErroString'
   else
   if Erro = None then
      result := 'Ok'
   else
   if Erro = ErroCodBico then
      result := 'ErroCodBico'
   else
   if Erro = ErroCaracterModo then
      result := 'ErroCaracterModo'
   else
   if Erro = ErroTimeout then
      result := 'ErroTimeout'
   else
   if Erro = ErroResposta then
      result := 'ErroResposta'
   else
      result := 'ErroResposta';
end;

procedure TFRM_Comunica.bAtivaTimerStatusClick(Sender: TObject);
begin
   if vStatus then
   begin
      vStatus := False;
      bAtivaTimerStatus.Caption := 'Fechar o Status B.';
      TimerStatus.Enabled := True;
   end
   else
   begin
      TimerStatus.Enabled := False;
      vStatus := True;
      bAtivaTimerStatus.Caption := 'Ativar o Status B.';
   end;
end;

procedure TFRM_Comunica.bAtualizarClick(Sender: TObject);
begin
   if RGDLL.ItemIndex = 0 then
      begin
         if Comunica then
            ShowMessage('Comunicando!!')
         else
            ShowMessage('Não Comunicando!!')
      end
   else
      ShowMessage('Fazendo implementação!!!');
end;

procedure TFRM_Comunica.bCadastroClick(Sender: TObject);
begin
   if not Assigned(FRMCadastro) then
       Application.CreateForm(TFRMCadastro,FRMCadastro);

   FRMCadastro.ShowModal;
end;

procedure TFRM_Comunica.bConectDescClick(Sender: TObject);
begin
   if RGDLL.ItemIndex = 0 then
      begin
         if vConect = False then
            begin
               if InicializaSocket(edtIP.text) = True then
                  begin
                     bConectDesc.Caption  := 'Desconectar';
                     vConect              := True;
                     edtIP.ReadOnly       := True;
                     TBSSerial.TabVisible := False;
                     ShowMessage('Conectado!!');
                     pStatusBomba;
                     lbStatusBomb.Clear;

                     pVersao;
                  end
               else
                  begin
                     bConectDesc.Caption  := 'Conectar';
                     vConect              := False;
                     edtIP.ReadOnly       := False;
                     TBSSerial.TabVisible := True;
                     mVersao.Clear;
                  end;
            end
         else
            begin
               if FechaSocket then
                  begin
                     ShowMessage('Desconectado!!');
                     bConectDesc.Caption  := 'Conectar';
                     vConect              := False;
                     edtIP.ReadOnly       := False;
                     TBSSerial.TabVisible := True;

                     pVersao;
                  end
               else
                  begin
                     ShowMessage('Conectado!!');
                     pStatusBomba;
                     lbStatusBomb.Clear;
                     mVersao.Clear;
                  end;
            end;
      end
   else
//      ShowMessage('Fazendo implementação!!!');
      begin
         if vConect = False then
            begin
               if fLEDConecta(0,'socket',edtIP.text) = True then
                  begin
                     bConectDesc.Caption  := 'Desconectar';
                     vConect              := True;
                     edtIP.ReadOnly       := True;
                     TBSSerial.TabVisible := False;
                     ShowMessage('Conectado!!');
                     pStatusBomba;
                     lbStatusBomb.Clear;

//                     pVersao;
                  end;
            end;
      end;
end;

procedure TFRM_Comunica.bConsultaSerialClick(Sender: TObject);
begin
   if RGDLL.ItemIndex = 0 then
      begin
         if PortOpen then
            begin
               ShowMessage('Porta Aberta!!');
               pStatusBomba;
            end
         else
            ShowMessage('Porta Fechada!!');
      end
   else
      ShowMessage('Fazendo implementação!!!');
end;

procedure TFRM_Comunica.bConsultaSocketClick(Sender: TObject);
begin
   if SocketOpen then
      begin
         ShowMessage('Conectado!!!');
         pStatusBomba;
         pVersao;
      end
   else
      ShowMessage('Desconectado!!!');
end;

procedure TFRM_Comunica.bGerenPostoClick(Sender: TObject);
begin
//   Application.CreateForm(TFrmPosto, FrmPosto);
//   FrmPosto.ShowModal;
//   FreeAndNil(FrmPosto);

   if not Assigned(FrmPosto) then
       Application.CreateForm(TFrmPosto,FrmPosto);

   FrmPosto.ShowModal;
end;

procedure TFRM_Comunica.bIncrementaClick(Sender: TObject);
begin
   //ponteiro da grid no emulador do buffer de armazenamento
   //p.read
   //ele Marca como já lido e passa para o proximo sem ter o retorno
   Incrementa;
end;

procedure TFRM_Comunica.bOperacaoClick(Sender: TObject);
var
   erro : ErrorP;
begin
   if RGDLL.ItemIndex = 0 then
      begin
         erro := None;

         case AnsiIndexStr(cbOpcaoBLA.Text[1],['L','B','A']) of
            0 : erro := AutoLibera(edtBico.Text);
            1 : erro := BloqueiaBico(edtBico.text);
            2 : erro := AutorizaAbast(edtBico.text);
         end;

         ShowMessage(fErrorToString(erro));
      end
   else
      begin
//         case AnsiIndexStr(cbOpcaoBLA.Text[1],['L','B','A']) of
//            0 : ShowMessage('Não tem função de Liberação');
//            1 : ShowMessage(IntToStr(CUBDesautorizarBomba(StrToInt(edtBico.Text))));
//            2 : ShowMessage(IntToStr(CUBAutorizarBomba(StrToInt(edtBico.Text))));
//         end;
         fLEDAutoLiberaBloqueiaAutoriza(0,cbOpcaoBLA.Text[1],edtBico.Text);
      end;
end;

procedure TFRM_Comunica.bSetClockClick(Sender: TObject);
begin
   if rgClock.ItemIndex = 0 then
      begin
         if SetClock('AUTO') = True then
            ShowMessage('Comando executado com sucesso')
         else
            ShowMessage('Falhou ao atualizar relógio');
      end
   else
      begin
         if SetClock(edtDia.Text + edtHora.Text + edtMin.Text) = True then
            ShowMessage('Comando executado com sucesso')
         else
            ShowMessage('Falhou ao atualizar relógio');
      end;
end;

procedure TFRM_Comunica.bSetClockIdentClick(Sender: TObject);
begin
   if FidSetClock(strtoint(edtDiaIden.text),
                  strtoint(edtHoraIdent.text),
                  strtoint(edtMinIdent.text)) = 1 then
      begin
         ShowMessage('Comando executado com sucesso');
      end
   else
      begin
         ShowMessage('Falhou ao atualizar relógio');
      end;
end;

procedure TFRM_Comunica.bLePartClick(Sender: TObject);
begin
   mLeituraBM.Clear;
   mLeituraBM.Lines.Add(LePart(cbOpcaoPart.text[1]));
end;

procedure TFRM_Comunica.bLePPLClick(Sender: TObject);
begin
   OpcaoObrigatorio;
   edtLePPL.Text := FloatToStr(LePPL(edtBico.Text));
end;

procedure TFRM_Comunica.bLeAbastecimentoClick(Sender: TObject);
begin
   if Armazenar('LeAbastecimento') then
      ShowMessage('Gravado com sucesso!!')
   else
      ShowMessage('Falha ao gravar!!');
end;

procedure TFRM_Comunica.bLeAbFixClick(Sender: TObject);
begin
   if Armazenar('LeAbFix') then
      ShowMessage('Gravado com sucesso!!')
   else
      ShowMessage('Falha ao gravar!!');
end;

procedure TFRM_Comunica.bLeEventoClick(Sender: TObject);  //BUSCA INFORMAÇÃO PERDIDA
var
   LeReg : Abast;
begin
   mLeituraBM.Clear;
   LeReg := LeRegistro(StrToInt(edtIndice.Text));

   mLeituraBM.Lines.Add('value '          + BoolToStr(LeReg.value));
   mLeituraBM.Lines.Add('Total_Dinheiro ' + formatfloat('##,###,##0.00',LeReg.Total_Dinheiro));
   mLeituraBM.Lines.Add('Total_Litros '   + FloatToStr(LeReg.Total_Litros));
   mLeituraBM.Lines.Add('PU '             + formatfloat('##,###,##0.00',LeReg.PU));
   mLeituraBM.Lines.Add('Tempo '          + LeReg.tempo);
   mLeituraBM.Lines.Add('Canal '          + LeReg.Canal);
   mLeituraBM.Lines.Add('Data '           + LeReg.Data);
   mLeituraBM.Lines.Add('Hora '           + LeReg.hora);
   mLeituraBM.Lines.Add('St_Full '        + LeReg.St_Full);
   mLeituraBM.Lines.Add('Registro '       + IntToStr(LeReg.Registro));
   mLeituraBM.Lines.Add('Encerrante '     + FloatToStr(LeReg.encerrante));
   mLeituraBM.Lines.Add('Integridade '    + BoolToStr(LeReg.Integridade));
   mLeituraBM.Lines.Add('Checksum '       + BoolToStr(LeReg.Checksum));
end;

procedure TFRM_Comunica.bPararPrecoClick(Sender: TObject);
var
   erro : errorP;
begin
   OpcaoObrigatorio;
   erro := Preset(edtBico.Text,strtofloat(edtPrecoBombaMax.text));
   ShowMessage(fErrorToString(erro));

 //  ParaBomba(bico:string):Error
end;

procedure TFRM_Comunica.bConsultaPFClick(Sender: TObject);
var
   st : encerrante;
begin
   OpcaoObrigatorio;
   st := ConsultaEncerrante(cbTipo.text[1],edtBico.text);
   ShowMessage('Bico: ' + st.Bico + ' Total: ' + floattostr(st.valor));
   pStatusBomba;
end;

procedure TFRM_Comunica.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if RGDLL.ItemIndex = 0 then
      begin
         if vConect = True then
            begin
               FechaSocket;
               FechaSerial;
            end;
      end
   else
      ShowMessage('Fazendo implementação!!!');

   action       := caFree;
   FRM_Comunica := nil;
end;

procedure TFRM_Comunica.FormCreate(Sender: TObject);
begin
   with cLedPosto do
   begin
      Connected         := False;
      ConnectionString  := 'Provider=SQLOLEDB.1;Password=Led#Wa4e$;Persist Security Info=False;User ID=sa;Data Source=CPD09\LEDWARE';
      DefaultDatabase   := 'LEDC0001';
      Connected         := True;
   end;

   vStatus := True;
   vConect := False;
   vLinha := 0;
   cdsGravaEnce.EmptyDataSet;
end;

procedure TFRM_Comunica.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If key = #13 then
      begin
         Key := #0;
         Perform(Wm_NextDlgCtl,0,0);
      end;
end;

procedure TFRM_Comunica.OpcaoObrigatorio;
begin
   if edtBico.Text = '' then
      begin
         ShowMessage('Marque o Numero do Bico!');
         edtBico.SetFocus;
         Abort;
      end;
end;

procedure TFRM_Comunica.rgClockClick(Sender: TObject);
begin
   if rgClock.ItemIndex = 0 then
      begin
         edtDia.Enabled  := False;
         edtHora.Enabled := False;
         edtMin.Enabled  := False;
      end
   else
      begin
         edtDia.Enabled  := True;
         edtHora.Enabled := True;
         edtMin.Enabled  := True;

         edtDia.SetFocus;
         edtDia.Text     := formatdatetime('dd',Date);
         edtHora.Text    := formatdatetime('HH',Time);
         edtMin.Text     := formatdatetime('nn',Time);
      end;
end;

procedure TFRM_Comunica.RGDLLClick(Sender: TObject);
begin
//   if RGDLL.ItemIndex = 0 then
//      TBSSocket.TabVisible := True
//   else
//      TBSSocket.TabVisible := False;
end;

procedure TFRM_Comunica.pStatusBombaValor;
var
   ol : online;
   a  : byte;
begin
   lbStatusBomb.Clear;

   if rgStatusBomb.ItemIndex = 0 then
      begin
         ol := LeVisualizacao;

         for a := 1 to 48 do
            lbStatusBomb.Items.Add(ol.Bico[a] + ' - ' + floattostr(ol.Litragem[a]));
      end;
end;

procedure TFRM_Comunica.pStatusBomba;
var
   ms : multistatus;
   a  : byte;
begin
   lbStatus.Clear;

   if rgTipoStatus.ItemIndex = 0 then
      begin
         ms := LeStatus;

         for a := 1 to 32 do
            begin
               case ms.Status[a] of
                  Livre       : lbStatus.Items.Add(inttostr(a) + ' (L) - Livre');
                  Pronta      : lbStatus.Items.Add(inttostr(a) + ' (P) - Pronto');
                  Falha       : lbStatus.Items.Add(inttostr(a) + ' (F) - Falha');
                  Concluiu    : lbStatus.Items.Add(inttostr(a) + ' (C) - Concluiu');
                  Abastecendo : lbStatus.Items.Add(inttostr(a) + ' (A) - Abastecimento');
                  Bloqueada   : lbStatus.Items.Add(inttostr(a) + ' (B) - Bloqueado');
                  SolicitaLib : lbStatus.Items.Add(inttostr(a) + ' (E) - Espera');
               end;
            end;
      end
   else
      begin
         ms := LeStatusFid;

         for a := 1 to 32 do
            begin
               case ms.Status[a] of
                  Livre       : lbStatus.Items.Add(inttostr(a) + ' (L) - Livre');
                  Pronta      : lbStatus.Items.Add(inttostr(a) + ' (P) - Pronto');
                  Falha       : lbStatus.Items.Add(inttostr(a) + ' (F) - Falha');
                  Concluiu    : lbStatus.Items.Add(inttostr(a) + ' (C) - Concluiu');
                  Abastecendo : lbStatus.Items.Add(inttostr(a) + ' (A) - Abastecimento');
                  Bloqueada   : lbStatus.Items.Add(inttostr(a) + ' (B) - Bloqueado');
                  SolicitaLib : lbStatus.Items.Add(inttostr(a) + ' (E) - Espera');
               end;
            end;
      end;
end;

procedure TFRM_Comunica.pVersao;
var
   vVersao : info;
begin
   mVersao.Clear;
   Ver(vVersao);
   mVersao.Lines.Add(' - Titulo.: ' + vVersao.titulo + #13 + #10 +
                     ' - Versão.: ' + vVersao.versao + #13 + #10 +
                     ' - Data.: '   + vVersao.data   + #13 + #10 +
                     ' - Autor.: '  + vVersao.autor);
end;

procedure TFRM_Comunica.TimerStatusTimer(Sender: TObject);
begin
   if vConect then
      begin
         pStatusBombaValor;
         pStatusBomba;
      end;
end;

end.
