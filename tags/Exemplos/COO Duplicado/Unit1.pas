unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ComCtrls, Grids, DBGrids, JvExComCtrls,
  JvProgressBar;

type
  TFrmDuplicidadeC460 = class(TForm)
    btnGerar: TButton;
    Connection: TADOConnection;
    qry: TADOQuery;
    qry2: TADOQuery;
    ProgressBar1: TProgressBar;
    mDuplicador: TMemo;
    btnConectar: TButton;
    edtNomePC: TEdit;
    DtInicial: TDateTimePicker;
    DtFinal: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    qryDel_Desativa: TADOQuery;
    QrySelecao: TADOQuery;
    gVenda: TDBGrid;
    gItem: TDBGrid;
    dtsVenda: TDataSource;
    dtsItem: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnSair: TButton;
    qryItem: TADOQuery;
    qrySel_Item: TADOQuery;
    procedure btnGerarClick(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    function FNomePC : string;
    procedure FormShow(Sender: TObject);
    procedure pAtivaDesativaTrigger(ENABLE_DISABLE : String);
    procedure btnSairClick(Sender: TObject);
    procedure pSelecaoItem(ID_Venda : Integer);
    procedure gVendaDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDuplicidadeC460: TFrmDuplicidadeC460;

implementation

{$R *.dfm}

procedure TFrmDuplicidadeC460.btnGerarClick(Sender: TObject);
var
   xcoo, vPergunta : Integer;
begin
   vPergunta := MessageBox(Handle, pchar('O uso deste sistema é de responsabilidade do mesmo,'     + #13 +
                                         'pois quaisquer percas ou danos na tentativa de correção' + #13 +
                                         'é de sua responsabilidade. Deseja Utilizar?' ) ,
                                   pchar('Ledware - Duplicidade C460'), 52);
   if vPergunta = 6 then
      begin
         btnConectar.Enabled := False;
         btnSair.Enabled     := False;

         mDuplicador.Lines.Clear;
         ProgressBar1.Position := 0;
         with qry do
            begin
               Close;
               SQL.Clear;
               SQL.Add(' SELECT * FROM TB_VENDAS_ECF ');
               SQL.Add(' WHERE XDT_VENDA BETWEEN :dt_inicial AND :dt_Final ');

               Parameters.ParamByName('dt_inicial').Value := DtInicial.Date;
               Parameters.ParamByName('dt_Final').Value   := DtFinal.Date;

               Open;

               if Not IsEmpty then
                  begin
                     qry.First;
                     ProgressBar1.Max:= qry.RecordCount;

                     while not qry.eof do
                        begin
                           xcoo := qry.FieldByName('XCOO').AsInteger;

                           with qry2 do
                           begin
                              close;
                              SQL.Clear;
                              SQL.Add('select count(*) as total from tb_vendas_ecf');
                              SQL.Add('where xcoo = :xcoo');
                              Parameters.ParamByName('xcoo').Value := xcoo;
                              Open;
                           end;

                           if qry2.FieldByName('total').AsInteger >= 2 then
                              begin
                                 Application.ProcessMessages;
                                 mDuplicador.Lines.Add(inttostr(xcoo));
                                 Application.ProcessMessages;

                                 pAtivaDesativaTrigger('DISABLE');

                                 dtsVenda.DataSet := QrySelecao;

                                 with QrySelecao do  // exibir na grid as informações da Vendas
                                    begin
                                       Close;
                                       SQL.Clear;
                                       SQL.Add(' SELECT * FROM TB_VENDAS_ECF ');
                                       SQL.Add(' WHERE  XCOO = :XCOO ');
                                       Parameters.ParamByName('XCOO').Value := xcoo;
                                       Open;
                                       First;
                                    end;

                                 dtsItem.DataSet := qryItem;

                                 with qryItem do     // exibir na grid as informações do produto
                                    begin
                                       Close;
                                       SQL.Clear;
                                       SQL.Add(' SELECT * FROM TB_VENDAS_ECF_ITENS ');
                                       SQL.Add(' WHERE XCD_INT_VENDA in (' + IntToStr(QrySelecao.FieldByName('XCD_INT_VENDA').AsInteger));

                                       QrySelecao.Next;
                                       while not QrySelecao.Eof do
                                          begin
                                             SQL.Add(' ,' + IntToStr(QrySelecao.FieldByName('XCD_INT_VENDA').AsInteger) );
                                             QrySelecao.Next;
                                          end;

                                       SQL.Add(')');

                                       Open;
                                    end;

                                 QrySelecao.Close;
                                 QrySelecao.Open;
                                 QrySelecao.Last;

                                 with qryDel_Desativa do
                                    begin
                                       Close;
                                       SQL.Clear;
                                       SQL.Add(' DELETE FROM TB_CONTAS_RECEBER_ECF ');
                                       SQL.Add(' WHERE XCD_INT_VENDA = :XCD_INT_VENDA ');
                                       Parameters.ParamByName('XCD_INT_VENDA').Value := QrySelecao.FieldByName('XCD_INT_VENDA').AsInteger;
                                       ExecSQL;

                                       Close;
                                       SQL.Clear;
                                       SQL.Add(' DELETE FROM TB_COMISSAO_VENDEDOR_ECF ');
                                       SQL.Add(' WHERE XCD_INT_VENDA = :XCD_INT_VENDA ');
                                       Parameters.ParamByName('XCD_INT_VENDA').Value := QrySelecao.FieldByName('XCD_INT_VENDA').AsInteger;
                                       ExecSQL;

                                       Close;
                                       SQL.Clear;
                                       SQL.Add(' DELETE FROM TB_VENDAS_ECF_ITENS ');
                                       SQL.Add(' WHERE XCD_INT_VENDA = :XCD_INT_VENDA ');
                                       Parameters.ParamByName('XCD_INT_VENDA').Value := QrySelecao.FieldByName('XCD_INT_VENDA').AsInteger;
                                       ExecSQL;

                                       Close;
                                       SQL.Clear;
                                       SQL.Add(' DELETE FROM TB_VENDAS_ECF ');
                                       SQL.Add(' WHERE XCD_INT_VENDA = :XCD_INT_VENDA ');
                                       Parameters.ParamByName('XCD_INT_VENDA').Value := QrySelecao.FieldByName('XCD_INT_VENDA').AsInteger;
                                       ExecSQL;
                                    end;

                                 pAtivaDesativaTrigger('ENABLE');
                                 qry.next;
                              end
                           else
                              begin
                                 ProgressBar1.Position := ProgressBar1.Position +1;
                                 qry.next;
                              end;
                        end;
                  end
               else
                  begin
                     MessageBox(Handle, pchar('Não Existe Registro !!') , pchar('Ledware - Duplicidade C460'), 48);
                     Application.Terminate;
                  end;
            end;
         btnConectar.Enabled := True;
         btnSair.Enabled     := True;

         MessageBox(Handle, pchar('Geração efetuada com sucesso!!!') , pchar('Ledware - Duplicidade C460'), 64);
         ProgressBar1.Position := 0;

         dtsVenda.DataSet := qry;
         qry.Close;
         qry.Open;
         qry.First;

         dtsItem.DataSet := qrySel_Item;
         with qrySel_Item do
            begin
               Close;
               SQL.Clear;
               SQL.Add(' SELECT IT.* FROM TB_VENDAS_ECF_ITENS IT ');
               SQL.Add(' WHERE XCD_INT_VENDA = :XCD_INT_VENDA ');

               Parameters.ParamByName('XCD_INT_VENDA').Value := qry.FieldByName('XCD_INT_VENDA').AsInteger;
               Open;
            end;
      end;
end;

procedure TFrmDuplicidadeC460.btnSairClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TFrmDuplicidadeC460.btnConectarClick(Sender: TObject);
begin
   Connection.Connected := False;
   Connection.ConnectionString := '';
   Connection.ConnectionString := 'Provider=SQLOLEDB.1;Password=Led#Wa4e$;Persist Security Info=True;User ID=sa;Initial Catalog=ledc0001;Data Source=' + edtNomePC.Text + '\ledware';

   Try
      Connection.Connected:=True;
   Except
   End;

   if Connection.Connected then
      begin
         MessageBox(Handle, pchar('Conexão efetuada com sucesso!!') , pchar('Ledware - Duplicidade C460'), 64);
         btnConectar.Enabled := False;
         btnGerar.Enabled    := True;
      end
   else
      begin
         MessageBox(Handle, pchar('Não foi possivel conectar!') , pchar('Ledware - Duplicidade C460'), 64);
         btnConectar.Enabled := True;
         btnGerar.Enabled    := False;
      end;

   dtsVenda.DataSet := qry;

   with qry do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT * FROM TB_VENDAS_ECF ');
         SQL.Add(' WHERE XDT_VENDA BETWEEN :dt_inicial AND :dt_Final ');
         Parameters.ParamByName('dt_inicial').Value := DtInicial.Date;
         Parameters.ParamByName('dt_Final').Value   := DtFinal.Date;
         Open;
         First;
      end;

   dtsItem.DataSet := qrySel_Item;
   with qrySel_Item do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT IT.* FROM TB_VENDAS_ECF_ITENS IT ');
         SQL.Add(' WHERE XCD_INT_VENDA = :XCD_INT_VENDA ');

         Parameters.ParamByName('XCD_INT_VENDA').Value := qry.FieldByName('XCD_INT_VENDA').AsInteger;
         Open;
      end;
end;

function TFrmDuplicidadeC460.FNomePC : string;
var
   lpBuffer : Array[0..20] of Char;
   nSize    : DWORD;
   mRet     : Boolean;
   erro     : DWORD;
begin
   nSize := 120;
   mRet  := GetComputerName(lpBuffer,nSize);
   if mRet then
      Result := lpBuffer
   else
   begin
      erro := GetLastError();
      MessageDlg('Ocorreu o erro ' + IntToStr(erro) + ' ao procurar o nome do computador.',
      mtError, [mbOk], 0);
      Result := '';
   end;
end;
procedure TFrmDuplicidadeC460.FormShow(Sender: TObject);
begin
   edtNomePC.Text := FNomePC;
end;

procedure TFrmDuplicidadeC460.gVendaDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   pSelecaoItem(qry.FieldByName('XCD_INT_VENDA').AsInteger);
end;

procedure TFrmDuplicidadeC460.pAtivaDesativaTrigger(ENABLE_DISABLE: String);
begin
   with qryDel_Desativa do
      begin
         Close;
         SQL.Clear;
         SQL.Add( ENABLE_DISABLE + ' TRIGGER trg_homologacao_VENDAS_ECF_ITENS_delete ON TB_VENDAS_ECF_ITENS ');
         ExecSQL;

         Close;
         SQL.Clear;
         SQL.Add( ENABLE_DISABLE + ' TRIGGER trg_homologacao_VENDAS_ECF_ITENS_edit ON TB_VENDAS_ECF_ITENS ');
         ExecSQL;

         Close;
         SQL.Clear;
         SQL.Add( ENABLE_DISABLE + ' TRIGGER trg_homologacao_VENDAS_ECF_delete ON TB_VENDAS_ECF ');
         ExecSQL;

         Close;
         SQL.Clear;
         SQL.Add( ENABLE_DISABLE + ' TRIGGER trg_homologacao_VENDAS_ECF_edit ON TB_VENDAS_ECF ');
         ExecSQL;
      end;
end;

procedure TFrmDuplicidadeC460.pSelecaoItem(ID_Venda: Integer);
begin
   with qrySel_Item do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT IT.* FROM TB_VENDAS_ECF_ITENS IT ');
         SQL.Add(' WHERE XCD_INT_VENDA = :XCD_INT_VENDA ');
         Parameters.ParamByName('XCD_INT_VENDA').Value := ID_Venda;
         Open;
      end;
end;

end.

