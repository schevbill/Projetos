unit uPosto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls, jpeg, ExtCtrls, FunCompCub, uThread,
  ADODB;

type
  TFrmPosto = class(TForm)
    pnlPrincipal: TPanel;
    Image: TImage;
    Cap05: TLabel;
    pFundo: TPanel;
    gEncerrante: TDBGrid;
    Label1: TLabel;
    cdsGravaEnce: TClientDataSet;
    cdsGravaEnceMarcadoSN: TStringField;
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
    dtsGravaEnce: TDataSource;
    Timer: TTimer;
    Label2: TLabel;
    Label3: TLabel;
    lblSub: TLabel;
    Label4: TLabel;

    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gEncerranteDblClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure gEncerranteDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    vSubTotal : Double;
  public
    { Public declarations }
  end;

var
  FrmPosto : TFrmPosto;
  TArmazena : TConcentrador;

implementation

uses Comunicacao;

{$R *.dfm}
procedure TFrmPosto.Button1Click(Sender: TObject);
begin
   Timer.Enabled := False;
end;

procedure TFrmPosto.Button2Click(Sender: TObject);
begin
   Timer.Enabled := True;
end;

procedure TFrmPosto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action   := cafree;
   FrmPosto := nil;
end;

procedure TFrmPosto.FormCreate(Sender: TObject);
begin
   vSubTotal := 0;
end;

procedure TFrmPosto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = Vk_Escape then
      Close;

//   if Key = VK_F1 then
//      Armazenar;

   if Key = VK_F2 then
      Incrementa;

   if key = VK_F3 then
      gEncerranteDblClick(Self);

end;

procedure TFrmPosto.gEncerranteDblClick(Sender: TObject);
begin
   if cdsGravaEnceMarcadoSN.Value = 'S' then
      begin
         cdsGravaEnce.Edit;
         cdsGravaEnceMarcadoSN.Value := 'N';
         cdsGravaEnce.Post;

         vSubTotal := vSubTotal - cdsGravaEnceTotal_Dinheiro.AsFloat;
         lblSub.Caption := 'Sub-Total.:' + formatfloat('R$ ##,###,##0.00',vSubTotal);
      end
   else
      begin
         cdsGravaEnce.Edit;
         cdsGravaEnceMarcadoSN.Value := 'S';
         cdsGravaEnce.Post;

         vSubTotal := vSubTotal + cdsGravaEnceTotal_Dinheiro.AsFloat;
         lblSub.Caption := 'Sub-Total.:' + formatfloat('R$ ##,###,##0.00',vSubTotal);
      end;
end;

procedure TFrmPosto.gEncerranteDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//   if (Column.Field.FieldName = 'MarcadoSN') then    // apenas a coluna que eu quero
//   begin
      if cdsGravaEnce.FieldByName('MarcadoSN').AsString = 'S' then
         begin
            gEncerrante.Canvas.Font.Color := clRed;
            gEncerrante.Canvas.Font.Style := [fsBold];
            gEncerrante.Canvas.FillRect(Rect);
            gEncerrante.DefaultDrawColumnCell(Rect, DataCol, Column, State);
         end
      else
         begin
            gEncerrante.Canvas.Font.Color := clBlue;
            gEncerrante.Canvas.Font.Style := [fsBold];
            gEncerrante.Canvas.FillRect(Rect);
            gEncerrante.DefaultDrawColumnCell(Rect, DataCol, Column, State);
         end;
//   end;
end;

procedure TFrmPosto.TimerTimer(Sender: TObject);
begin
   Try
      TArmazena := TConcentrador.Create(true);
      TArmazena.FreeOnTerminate := true;
      TArmazena.Priority := tpNormal;
      TArmazena.Resume;
   Except
   End;
end;

end.
