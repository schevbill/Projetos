unit uEXCEL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleServer, Excel2000, ComObj, StdCtrls, Buttons, Grids, ExtCtrls,
  Gauges, DB, ADODB;

type
  TfLedEXCEL = class(TForm)
    pFundo: TPanel;
    StringGrid1: TStringGrid;
    pBaixo: TPanel;
    SPB_LerExecel: TSpeedButton;
    OpenDialog1: TOpenDialog;
    SPB_Gravar: TSpeedButton;
    GGE_Progresso: TGauge;
    LBL_Mensagem: TLabel;
    cLedPrimario: TADOConnection;
    procedure SPB_LerExecelClick(Sender: TObject);
    function StrZero(N: integer; Tamanho: integer): string;
    function ApenasNumerosStr(pStr:String): String;
    function XlsToStringGrid(AGrid: TStringGrid; AXLSFile: string): Boolean;
    function Repl(C: string; Tamanho: integer): string;
    procedure SPB_GravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLedEXCEL: TfLedEXCEL;

implementation

{$R *.dfm}

procedure TfLedEXCEL.SPB_GravarClick(Sender: TObject);
var
   x, Tabelas : Integer;
       vTPExp : Integer;
    qryGravar : TADOQuery;
begin
   GGE_Progresso.MaxValue := (StringGrid1.RowCount - 1);
   Tabelas := (GGE_Progresso.MaxValue div (StringGrid1.RowCount - 1));

   cLedPrimario.Connected        := False;
   cLedPrimario.ConnectionString := '';
   cLedPrimario.ConnectionString := 'Provider=SQLOLEDB.1;Password=Led#Wa4e$;Persist Security Info=True;User ID=sa;Initial Catalog=LEDC0001;Data Source=CPD09\LEDWARE';

   try
      cLedPrimario.Connected     := True;
   except
      Application.Terminate;
   end;

   qryGravar := TADOQuery.Create(Self);
   qryGravar.Connection := cLedPrimario;

   try
      for x := 1 to StringGrid1.RowCount - 1 do
         begin
            GGE_Progresso.AddProgress(Tabelas);
            LBL_Mensagem.Caption := ' NCM : ' + StringGrid1.Cells[0,x];
            LBL_Mensagem.Repaint;

//            if (StringGrid1.Cells[5,x]) = '' then
//               Continue;

            with qryGravar do
               begin
                  Close;
                  SQL.Clear;
                  SQL.Add(' INSERT INTO TB_IBPT_NCM_NBS ');
                  SQL.Add(' (XCODIGO_NCM_NSB, XEX, XTABELA, XALIQ_NAC, XALIQ_IMP) ');
                  SQL.Add(' VALUES ');
                  SQL.Add(' (:XCODIGO_NCM_NSB, :XEX, :XTABELA, :XALIQ_NAC, :XALIQ_IMP) ');

                  if StringGrid1.Cells[0,x] <> '' then
                     Parameters.ParamByName('XCODIGO_NCM_NSB').Value := StringGrid1.Cells[0,x]
                  else
                     Parameters.ParamByName('XCODIGO_NCM_NSB').Value := Null;

                  if StringGrid1.Cells[1,x] <> '' then
                     Parameters.ParamByName('XEX').Value := StringGrid1.Cells[1,x]
                  else
                     Parameters.ParamByName('XEX').Value := Null;

                  if StringGrid1.Cells[2,x] <> '' then
                     Parameters.ParamByName('XTABELA').Value := StrToInt(StringGrid1.Cells[2,x])
                  else
                     Parameters.ParamByName('XTABELA').Value := Null;

                  if StringGrid1.Cells[3,x] <> '' then
                     Parameters.ParamByName('XALIQ_NAC').Value := StrToFloat(StringReplace(Trim(StringGrid1.Cells[3,x]),'.',',', [rfReplaceALL]))
                  else
                     Parameters.ParamByName('XALIQ_NAC').Value := 0.00;

                  if StringGrid1.Cells[4,x] <> '' then
                     Parameters.ParamByName('XALIQ_IMP').Value := StrToFloat(StringReplace(Trim(StringGrid1.Cells[4,x]),'.',',', [rfReplaceALL]))
                  else
                     Parameters.ParamByName('XALIQ_IMP').Value := 0.00;

                  ExecSQL;
               end;
         end;
   finally
      if x = StringGrid1.RowCount then
         LBL_Mensagem.Caption := 'Fim da Importação';
   end;

end;

procedure TfLedEXCEL.SPB_LerExecelClick(Sender: TObject);
var
   i: Integer;
begin
   OpenDialog1.Title := 'Abrir o Excel';
   OpenDialog1.Filter := 'Excel|*.xls';

   if OpenDialog1.Execute then
      XlsToStringGrid(StringGrid1,OpenDialog1.FileName);

   for i:=1 to StringGrid1.RowCount-1 do
      begin
         if (StringGrid1.Cells[2,i] <> '') then
            begin
               StringGrid1.Cells[2,i] := ApenasNumerosStr(StringGrid1.Cells[2,i]);
               if StringGrid1.Cells[2,i] = '' then
                  StringGrid1.Cells[2,i] := '0';
               StringGrid1.Cells[2,i] := StrZero(StrToInt(StringGrid1.Cells[2,i]),8);
            end;
      end;

end;

function TfLedEXCEL.ApenasNumerosStr(pStr:String): String;
Var
   I: Integer;
begin
   Result := '';
   For I := 1 To Length(pStr) do
      If pStr[I] In ['1','2','3','4','5','6','7','8','9','0'] Then
         Result := Result + pStr[I];
end;

function TfLedEXCEL.StrZero(N: integer; Tamanho: integer): string;
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


function TfLedEXCEL.XlsToStringGrid(AGrid: TStringGrid;
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

function TfLedEXCEL.Repl(C: string; Tamanho: integer): string;
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
