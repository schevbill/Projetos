unit uThread;

interface

uses
  Classes, SysUtils, FunCompCub;

type
  TConcentrador = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    procedure ArmazenarCDS;
  end;

implementation

uses uPosto;


{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TConcentrador.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ Concentrador }

procedure TConcentrador.ArmazenarCDS;
begin
   if LeAbFix.value then
      begin
         with FrmPosto do
            begin
               cdsGravaEnce.Append;
               cdsGravaEnceMarcadoSN.AsString      := 'N';
               cdsGravaEnceValue.AsBoolean         := LeAbFix.value;            // verifica se o valor esta no concentrador se é valido
               cdsGravaEnceTotal_Dinheiro.AsFloat  := LeAbFix.Total_Dinheiro;   // Total que abasteceu na Bomba
               cdsGravaEnceTotal_Litros.AsFloat    := LeAbFix.Total_Litros;     // Total de litros que abasteceu
               cdsGravaEncePU.AsFloat              := LeAbFix.PU;               // Preço Unitario na Bomba
               cdsGravaEnceTempo.AsString          := LeAbFix.Tempo;            // Quanto tempo fico abastecendo
               cdsGravaEnceCanal.AsString          := LeAbFix.Canal;            // Bico  
               cdsGravaEnceData.AsString           := LeAbFix.Data;             // Data do Abastecimento
               cdsGravaEnceHora.AsString           := LeAbFix.Hora;             // Horas do Abastecimento
               cdsGravaEnceSt_Full.AsString        := LeAbFix.St_Full;          // Valor dentro de um String que contem todos os valores
               cdsGravaEnceRegistro.AsInteger      := LeAbFix.Registro;         // Indice no concentrador
               cdsGravaEnceEncerrante.AsFloat      := LeAbFix.Encerrante;       // Encerrante é em Quantidade
               cdsGravaEnceIntegridade.AsBoolean   := LeAbFix.Integridade;
               cdsGravaEnceChecksum.AsBoolean      := LeAbFix.Checksum;
               cdsGravaEnce.Post;
            end;
         Incrementa;
      end;
end;

procedure TConcentrador.Execute;
begin
  { Place thread code here }
  synchronize(ArmazenarCDS);
end;

end.
