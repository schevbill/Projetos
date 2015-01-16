unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleServer, Excel2000, ComObj, StdCtrls, Buttons, Grids, ExtCtrls,
  Gauges, DB, ADODB, DBGrids, DBClient, ComCtrls, DBCtrls;

type
  TfEXCEL = class(TForm)
    pBaixo: TPanel;
    SPB_LerExecel: TSpeedButton;
    SPB_Gravar: TSpeedButton;
    GGE_Progresso: TGauge;
    LBL_Mensagem: TLabel;
    AbrirArquivo: TOpenDialog;
    CDSArmazenaJogo: TClientDataSet;
    CDSArmazenaJogoPrimeiraDezena: TIntegerField;
    CDSArmazenaJogoSegundaDezena: TIntegerField;
    CDSArmazenaJogoTerceiraDezena: TIntegerField;
    CDSArmazenaJogoQuartaDezena: TIntegerField;
    CDSArmazenaJogoQuintaDezena: TIntegerField;
    CDSArmazenaJogoSextaDezena: TIntegerField;
    DTSArmazenaJogo: TDataSource;
    PCMega: TPageControl;
    TSExcelJogo: TTabSheet;
    TSArmazenaJogo: TTabSheet;
    TSResultado: TTabSheet;
    SGExcelJogos: TStringGrid;
    GArmazenaJogo: TDBGrid;
    GResultado: TDBGrid;
    CDSOrganizaJogo: TClientDataSet;
    DataSource1: TDataSource;
    procedure LimparCDS;
    function StrZero(N: integer; Tamanho: integer): string;
    function ApenasNumerosStr(pStr:String): String;
    function XlsToStringGrid(AGrid: TStringGrid; AXLSFile: string): Boolean;
    function Repl(C: string; Tamanho: integer): string;
    procedure SPB_LerExecelClick(Sender: TObject);
    procedure SPB_GravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEXCEL: TfEXCEL;

implementation

{$R *.dfm}

procedure TfEXCEL.SPB_GravarClick(Sender: TObject);
var
   x, Tabelas : Integer;
begin
   LimparCDS;
   GGE_Progresso.MaxValue := (SGExcelJogos.RowCount - 1);
   Tabelas := (GGE_Progresso.MaxValue div (SGExcelJogos.RowCount - 1));

   try
      for x := 1 to SGExcelJogos.RowCount - 1 do
         begin
            GGE_Progresso.AddProgress(Tabelas);
            LBL_Mensagem.Caption := SGExcelJogos.Cells[0,x];
            LBL_Mensagem.Repaint;

//            if (StringGrid1.Cells[5,x]) = '' then
//               Continue;

            CDSArmazenaJogo.Append;
            CDSArmazenaJogoPrimeiraDezena.AsInteger := StrToInt(SGExcelJogos.Cells[2,x]);
            CDSArmazenaJogoSegundaDezena.AsInteger  := StrToInt(SGExcelJogos.Cells[3,x]);
            CDSArmazenaJogoTerceiraDezena.AsInteger := StrToInt(SGExcelJogos.Cells[4,x]);
            CDSArmazenaJogoQuartaDezena.AsInteger   := StrToInt(SGExcelJogos.Cells[5,x]);
            CDSArmazenaJogoQuintaDezena.AsInteger   := StrToInt(SGExcelJogos.Cells[6,x]);
            CDSArmazenaJogoSextaDezena.AsInteger    := StrToInt(SGExcelJogos.Cells[7,x]);
            CDSArmazenaJogo.Post;

         end;

      CDSArmazenaJogo.Close;
      CDSArmazenaJogo.Open;
      CDSArmazenaJogo.Last;

      GGE_Progresso.MaxValue := (CDSArmazenaJogo.RecordCount - 1);
      Tabelas := (GGE_Progresso.MaxValue div (CDSArmazenaJogo.RecordCount - 1));

      CDSArmazenaJogo.First;
      while not CDSArmazenaJogo.Eof do
         begin
            for X := 0 to 5 do
               if CDSArmazenaJogo.IndexFields[x].AsInteger then

               
              FAZENDO AQUI ... SMURF VE O QUE VOCE PODE FAZER LER O EXCEL ESTA CERTINHO

         end;



   finally
      if x = SGExcelJogos.RowCount then
         LBL_Mensagem.Caption := 'Fim da Importação';

      CDSArmazenaJogo.Close;
      CDSArmazenaJogo.Open;
   end;

end;

procedure TfEXCEL.SPB_LerExecelClick(Sender: TObject);
var
   i: Integer;
begin
   AbrirArquivo.Title := 'Abrir o Excel';
   AbrirArquivo.Filter := 'Excel|*.xls';

   if AbrirArquivo.Execute then
      XlsToStringGrid(SGExcelJogos,AbrirArquivo.FileName);

   for i:=1 to SGExcelJogos.RowCount-1 do
      begin
         if (SGExcelJogos.Cells[2,i] <> '') then
            begin
               SGExcelJogos.Cells[2,i] := ApenasNumerosStr(SGExcelJogos.Cells[2,i]);
               if SGExcelJogos.Cells[2,i] = '' then
                  SGExcelJogos.Cells[2,i] := '0';
               SGExcelJogos.Cells[2,i] := StrZero(StrToInt(SGExcelJogos.Cells[2,i]),8);
            end;
      end;
end;


function TfEXCEL.ApenasNumerosStr(pStr:String): String;
Var
   I: Integer;
begin
   Result := '';
   For I := 1 To Length(pStr) do
      If pStr[I] In ['1','2','3','4','5','6','7','8','9','0'] Then
         Result := Result + pStr[I];
end;

function TfEXCEL.StrZero(N: integer; Tamanho: integer): string;
var
   Conteudo: string;
   Diferenca: Integer;
begin
   Conteudo := IntToStr( N );
   Diferenca := Tamanho - Length( Conteudo );
   if Diferenca > 0 then
      Conteudo := Repl( '0', Diferenca ) + Conteudo;
   StrZero := Conteudo;
end;


function TfEXCEL.XlsToStringGrid(AGrid: TStringGrid;
  AXLSFile: string): Boolean;
const
   xlCellTypeLastCell = $0000000B;
var
   XLApp, Sheet: OLEVariant;
   RangeMatrix: Variant;
   x, y, k, r: Integer;
begin
   Result := False;

   //Cria Excel- OLE Object
   XLApp := CreateOleObject('Excel.Application');
   try
      //Esconde Excel
      XLApp.Visible := False;

      //Abre o Workbook
      XLApp.Workbooks.Open(AXLSFile);
      Sheet := XLApp.Workbooks[ExtractFileName(AXLSFile)].WorkSheets[1];
      Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;

      //Pegar o número da última linha
      x := XLApp.ActiveCell.Row;

      //Pegar o número da última coluna
      y := XLApp.ActiveCell.Column;

      //Seta Stringgrid linha e coluna
      AGrid.RowCount := x;
      AGrid.ColCount := y;

      //Associaca a variant WorkSheet com a variant do Delphi
      RangeMatrix := XLApp.Range['A1', XLApp.Cells.Item[X, Y]].Value;

      //Cria o loop para listar os registros no TStringGrid
      k := 1;
      repeat
         for r := 1 to y do
            AGrid.Cells[(r - 1), (k - 1)] := RangeMatrix[K, R];

         Inc(k, 1);
      until
         k > x;

      RangeMatrix := Unassigned;
   finally
      //Fecha o Excel
      if not VarIsEmpty(XLApp) then
         begin
            XLApp.Quit;
            XLAPP := Unassigned;
            Sheet := Unassigned;
            Result := True;
         end;
   end;
end;

procedure TfEXCEL.FormShow(Sender: TObject);
begin
   LimparCDS;
end;

procedure TfEXCEL.LimparCDS;
begin
   CDSArmazenaJogo.EmptyDataSet;
   CDSOrganizaJogo.EmptyDataSet;
end;

function TfEXCEL.Repl(C: string; Tamanho: integer): string;
var
   Conteudo: string;
   Contar: integer;
begin
   Conteudo := '';
   for Contar := 1 to Tamanho do
      begin
         Conteudo := Conteudo + C;
         Application.ProcessMessages;
      end;
   Repl := Conteudo;
end;

end.
