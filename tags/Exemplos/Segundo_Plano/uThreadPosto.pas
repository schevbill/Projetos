unit uThreadPosto;

interface

uses
  Classes, SysUtils, ADODB;

Type
   Abast = record
      value          : boolean;
      total_dinheiro : currency;
      total_litros   : double;
      PU             : currency;
      tempo          : string[8];
      canal          : string[2];
      data           : string[10];
      hora           : string[5];
      st_full        : string[55];
      registro       : integer;
      encerrante     : real;
      integridade    : boolean;
      checksum       : boolean;
end;

type
  TConcentrador = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    procedure ArmazenarBD;
  end;

  function fLEDLeAbastecimento(Concentrador : Integer; Opcao_A_F : Char) : Abast; StdCall; external 'LedPosto.DLL';
  Procedure pLEDIncrementa(Concentrador : Integer; Opcao_F_I : char); StdCall; external 'LedPosto.DLL';

implementation

uses Principal;


{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TConcentrador.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TConcentrador }

procedure TConcentrador.ArmazenarBD;
var
   qryGravar : TADOQuery;
begin
   if fLEDLeAbastecimento(0,'F').value then
      begin
         qryGravar := TADOQuery.Create(nil);
         qryGravar.Connection := frmPrincipal.cLedCommerce;

         qryGravar.Close;
         qryGravar.SQL.Clear;
         qryGravar.SQL.Add(' INSERT INTO TB_POSTO_GERENCIADOR ');
         qryGravar.SQL.Add(' (XMARCADOSN, XVALUE, XTOTAL_DINHEIRO, XTOTAL_LITROS, XPU, XTEMPO, XCANAL, XDATA, XHORA, XST_FULL, XREGISTRO, XENCERRANTE, XINTEGRIDADE, XCHECKSUM, XBAIXA) ');
         qryGravar.SQL.Add(' VALUES ');
         qryGravar.SQL.Add(' (:XMARCADOSN, :XVALUE, :XTOTAL_DINHEIRO, :XTOTAL_LITROS, :XPU, :XTEMPO, :XCANAL, :XDATA, :XHORA, :XST_FULL, :XREGISTRO, :XENCERRANTE, :XINTEGRIDADE, :XCHECKSUM, :XBAIXA) ');

         qryGravar.Parameters.ParamByName('XMARCADOSN').Value      := 'N';                                         // Função utilizada "LeAbFix"
         qryGravar.Parameters.ParamByName('XVALUE').Value          := fLEDLeAbastecimento(0,'F').value;            // verifica se o valor esta no concentrador se é valido
         qryGravar.Parameters.ParamByName('XTOTAL_DINHEIRO').Value := fLEDLeAbastecimento(0,'F').total_dinheiro;   // Total que abasteceu na Bomba
         qryGravar.Parameters.ParamByName('XTOTAL_LITROS').Value   := fLEDLeAbastecimento(0,'F').total_litros;     // Total de litros que abasteceu
         qryGravar.Parameters.ParamByName('XPU').Value             := fLEDLeAbastecimento(0,'F').PU;               // Preço Unitario na Bomba
         qryGravar.Parameters.ParamByName('XTEMPO').Value          := fLEDLeAbastecimento(0,'F').tempo;            // Quanto tempo fico abastecendo
         qryGravar.Parameters.ParamByName('XCANAL').Value          := fLEDLeAbastecimento(0,'F').canal;            // Bico
         qryGravar.Parameters.ParamByName('XDATA').Value           := fLEDLeAbastecimento(0,'F').data;             // Data do Abastecimento
         qryGravar.Parameters.ParamByName('XHORA').Value           := fLEDLeAbastecimento(0,'F').hora;             // Horas do Abastecimento
         qryGravar.Parameters.ParamByName('XST_FULL').Value        := fLEDLeAbastecimento(0,'F').st_full;          // Valor dentro de um String que contem todos os valores
         qryGravar.Parameters.ParamByName('XREGISTRO').Value       := fLEDLeAbastecimento(0,'F').registro;         // Indice no concentrador
         qryGravar.Parameters.ParamByName('XENCERRANTE').Value     := fLEDLeAbastecimento(0,'F').encerrante;       // Encerrante é em Quantidade
         qryGravar.Parameters.ParamByName('XINTEGRIDADE').Value    := fLEDLeAbastecimento(0,'F').integridade;
         qryGravar.Parameters.ParamByName('XCHECKSUM').Value       := fLEDLeAbastecimento(0,'F').checksum;
         qryGravar.Parameters.ParamByName('XBAIXA').Value          := False;

         qryGravar.ExecSQL;

         pLEDIncrementa(0,'I');
      end
   else
      begin
         if Assigned(qryGravar) then
            FreeAndNil(qryGravar);
      end;
end;

procedure TConcentrador.Execute;
begin
  { Place thread code here }
   synchronize(ArmazenarBD);
end;

end.
