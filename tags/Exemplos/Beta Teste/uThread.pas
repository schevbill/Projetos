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
var
   vAbast : Abast;
begin
//   if LeAbFix.value then

//   vAbast := LeAbFix;

   vAbast := fLEDLeAbastecimento(0,'F');

   if vAbast.value then
      begin
         with FrmPosto do
            begin
               cdsGravaEnce.Append;
               cdsGravaEnceMarcadoSN.AsString      := 'N';
               cdsGravaEnceValue.AsBoolean         := vAbast.value;         //LeAbFix.value;            // verifica se o valor esta no concentrador se é valido
               cdsGravaEnceTotal_Dinheiro.AsFloat  := vAbast.total_dinheiro;//LeAbFix.Total_Dinheiro;   // Total que abasteceu na Bomba
               cdsGravaEnceTotal_Litros.AsFloat    := vAbast.total_litros;  //LeAbFix.Total_Litros;     // Total de litros que abasteceu
               cdsGravaEncePU.AsFloat              := vAbast.PU;            //LeAbFix.PU;               // Preço Unitario na Bomba
               cdsGravaEnceTempo.AsString          := vAbast.tempo;         //LeAbFix.Tempo;            // Quanto tempo fico abastecendo
               cdsGravaEnceCanal.AsString          := vAbast.Canal;         //LeAbFix.Canal;            // Bico
               cdsGravaEnceData.AsString           := vAbast.Data;          //LeAbFix.Data;             // Data do Abastecimento
               cdsGravaEnceHora.AsString           := vAbast.hora;          //LeAbFix.Hora;             // Horas do Abastecimento
               cdsGravaEnceSt_Full.AsString        := vAbast.st_full;       //LeAbFix.St_Full;          // Valor dentro de um String que contem todos os valores
               cdsGravaEnceRegistro.AsInteger      := vAbast.registro;      //LeAbFix.Registro;         // Indice no concentrador
               cdsGravaEnceEncerrante.AsFloat      := vAbast.Encerrante;    //LeAbFix.Encerrante;       // Encerrante é em Quantidade
               cdsGravaEnceIntegridade.AsBoolean   := vAbast.integridade;   //LeAbFix.Integridade;
               cdsGravaEnceChecksum.AsBoolean      := vAbast.checksum;      //LeAbFix.Checksum;
               cdsGravaEnce.Post;
            end;
//         Incrementa;
         pLEDIncrementa(0,'I');
      end;
end;

procedure TConcentrador.Execute;
begin
  { Place thread code here }
  synchronize(ArmazenarCDS);
end;

end.
