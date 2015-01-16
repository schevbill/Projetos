unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, xmlintf, xmldom, StdCtrls, msxmldom, XMLDoc;

type
  TForm1 = class(TForm)
    Button1: TButton;
    XMLDocument2: TXMLDocument;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
Var 
   Raiz, Nome, NomeAttrib, SobreNome,
   Filiacao, Pai, Mae, 
   Endereco, Rua, Bairro, Municipio, 
   UF, CEP,
   Ver, PowerBy: IXMLNode;
   XMLDocument1 : TXMLDocument;
begin
     XMLDocument1 := TXMLDocument.Create(nil);     // create tempo de execu��o

     XMLDocument1.FileName := '';
     XMLDocument1.XML.Text := '';
     XMLDocument1.Active := False;
     XMLDocument1.Active := True;
     XMLDocument1.Version := '1.0';
     XMLDocument1.Encoding := 'UTF-8';

     // RAIZ
     Raiz := XMLDocument1.AddChild('RAIZ');

     // POWER BY
     PowerBy := XMLDocument1.CreateNode('POWERBY', ntAttribute);
     PowerBy.Text := 'TESTE';
     Raiz.AttributeNodes.Add(PowerBy);

     // VERS�O
     Ver     := XMLDocument1.CreateNode('VERSION', ntAttribute);
     Ver.Text := '1.0';
     Raiz.AttributeNodes.Add(ver);

     // NOME
     Nome := XMLDocument1.CreateNode('NOME', ntElement);
     Raiz.ChildNodes.Add(Nome);

     // NOME ATRIBUTO
     NomeAttrib := XMLDocument1.CreateNode('NOME', ntAttribute);
     NomeAttrib.Text := 'Johnny Walker Junior';
     Nome.AttributeNodes.Add(NomeAttrib);

     SobreNome := XMLDocument1.CreateNode('SOBRENOME', ntAttribute); 
     SobreNome.Text := 'Walker'; 
     Nome.AttributeNodes.Add(SobreNome); 

     // FILIACAO
     Filiacao := XMLDocument1.CreateNode('FILIACAO', ntElement);
     Nome.ChildNodes.Add(Filiacao); 

     // FILIACAO PAI 
     Pai := XMLDocument1.CreateNode('PAI', ntAttribute); 
     Pai.Text := 'Fulano de Tal j�nior'; 
     Filiacao.AttributeNodes.Add(Pai); 

     // FILIACAO MAE 
     Mae := XMLDocument1.CreateNode('MAE', ntAttribute); 
     Mae.Text := 'Fulaninha de Tal da Silva'; 
     Filiacao.AttributeNodes.Add(Mae); 

     //XMLDocument1.CreateElement('Johnny_Walker', ''); 
     Endereco := XMLDocument1.CreateNode('ENDERECO', ntElement); 
     Raiz.ChildNodes.Add(Endereco); 

     Rua := XMLDocument1.CreateNode('RUA', ntAttribute); 
     Rua.Text := 'Rio Letes, 666'; 
     Endereco.AttributeNodes.Add(Rua); 

     Bairro := XMLDocument1.CreateNode('BAIRRO', ntAttribute); 
     Bairro.Text := 'Fiat Aquae '; 
     Endereco.AttributeNodes.Add(Bairro); 

     Municipio := XMLDocument1.CreateNode('MUNICIPIO', ntAttribute); 
     Municipio.Text := 'Contagem'; 
     Endereco.AttributeNodes.Add(Municipio); 

     UF := XMLDocument1.CreateNode('UF', ntAttribute); 
     UF.Text := 'MG'; 
     Endereco.AttributeNodes.Add(UF); 

     CEP := XMLDocument1.CreateNode('CEP', ntAttribute); 
     CEP.Text := '32.999-999'; 
     Endereco.AttributeNodes.Add(CEP);

     XMLDocument1.SaveToFile('C:\myxmldoc2.xml');
     XMLDocument1.Active := False;

     try
         FreeAndNil(XMLDocument1);
     except

     end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
   xdoc: TXMLDocument;                                  // vari�vel para o documento
//   noraiz, nopai, nofilho: TDOMNode;                    // vari�veis dos n�s
begin
  //cria um documento
//  xdoc := TXMLDocument.create;

  //cria n� raiz
//  noraiz := xdoc.CreateElement('cadastro');
//  Xdoc.Appendchild(noraiz);                           // salva n� raiz

  //cria n� pai
//  noraiz:= xdoc.DocumentElement;
//  nopai := xdoc.CreateElement('usuario');
//  TDOMElement(nopai).SetAttribute('id', '001');       // cria atributo para o n� pai
//  noraiz.Appendchild(nopai);                          // salva o n� pai

  //cria n� filho
//  nopai := xdoc.CreateElement('nome');                // cria o n� filho
  //TDOMElement(nopai).SetAttribute('sexo', 'M');     // cria atributo
//  nofilho := xdoc.CreateTextNode('Fernando');         // insere um valor para o n�
//  nopai.Appendchild(nofilho);                         // salva n�
//  noraiz.ChildNodes.Item[0].AppendChild(nopai);       // insere o n� filho no n� pai correspondente

  //cria n� filho
//  nopai := xdoc.CreateElement('idade');               // cria n� filho
  //TDOMElement(nopai).SetAttribute('ano', '1976');   // cria atributo
//  nofilho := xdoc.CreateTextNode('32');               // coloca um valor ao n�
//  nopai.Appendchild(nofilho);                         // salva o n�
//  noraiz.ChildNodes.Item[0].AppendChild(nopai);       // insere o n� filho no n� pai correspondente

//  writeXMLFile(xDoc,'teste.xml');                     // escreve o XML
  Xdoc.free;                                          // libera mem�ria

end;

procedure TForm1.Button3Click(Sender: TObject);
var
   qryConfig   : TADOQuery;
   qryEmpresa  : TADOQuery;
   XMLSATVenda : TXMLDocument;

   Raiz, infCFe, ide, emit  : IXMLNode; // Node Principal
   enderEmit, dest, entrega : IXMLNode; // Node Principal
   det, prod, obsFiscoDet   : IXMLNode; // Node Principal

   imposto                  : IXMLNode; // Node Principal
   ICMS, ICMS00, ICMS40     : IXMLNode; // Node Principal
   ICMSSN102, ICMSSN900     : IXMLNode; // Node Principal

   PIS, PISAliq, PISQtde    : IXMLNode; // Node Principal
   PISNT, PISSN, PISOutr    : IXMLNode; // Node Principal
   PISST                    : IXMLNode; // Node Principal

   COFINS, COFINSAliq       : IXMLNode; // Node Principal
   COFINSQtde, COFINSNT     : IXMLNode; // Node Principal
   COFINSSN, COFINSOutr     : IXMLNode; // Node Principal
   COFINSST                 : IXMLNode; // Node Principal

   ISSQN                    : IXMLNode; // Node Principal

   total                    : IXMLNode; // Node Principal
   ICMSTot, ISSQNtot        : IXMLNode; // Node Principal

   DescAcrEntr              : IXMLNode; // Node Principal

   pgto, MP                 : IXMLNode; // Node Principal

   XML_Write                : IXMLNode; // Sub-Node
begin
   if not DirectoryExists('C:\LedCommerce') then
      begin
         ShowMessage('O diret�rio n�o existe');
         Abort;
      end;

//   if FileExists('C:\LedCommerce\SatVenda.XML'); //barra do windows

   qryConfig := TADOQuery.Create(nil);
   qryConfig.Connection := Modulo.cLedCommerce;

   qryConfig.Close;
   qryConfig.SQL.Clear;
   qryConfig.SQL.Add(' SELECT * FROM TB_CONFIG_SAT ');
   qryConfig.Open;

   qryEmpresa := TADOQuery.Create(nil);
   qryEmpresa.Connection := Modulo.cLedPrimario;

   qryEmpresa.Close;
   qryEmpresa.SQL.Clear;
   qryEmpresa.SQL.Add(' SELECT * FROM TB_EMPRESAS ');
   qryEmpresa.SQL.Add(' WHERE XCD_INT_EMPRESA = :XCD_INT_EMPRESA ');
   qryEmpresa.Parameters.ParamByName('XCD_INT_EMPRESA').Value := frmPrincipal.vID_Empresa;
   qryEmpresa.Open;
//..............................................................................
   XMLSATVenda := TXMLDocument.Create(nil);

   with XMLSATVenda do
      begin
         FileName := '';
         XML.Text := '';
         Active := False;
         Active := True;
         Version := '1.0';
//         Encoding := 'UTF-8';
      end;
//..............................................................................
   // RAIZ CFe
   Raiz := XMLSATVenda.AddChild('CFe');

   // XMLns xmlns="http://www.fazenda.sp.gov.br/sat"
   XML_Write := XMLSATVenda.CreateNode('xmlns', ntAttribute);
   XML_Write.Text  := 'http://www.fazenda.sp.gov.br/sat';
   Raiz.AttributeNodes.Add(XML_Write);

// A - Dados do Cupom Fiscal Eletr�nico.........................................
   // infCFe
   infCFe := XMLSATVenda.CreateNode('infCFe', ntElement);
   Raiz.ChildNodes.Add(infCFe);

   // id
   XML_Write       := XMLSATVenda.CreateNode('id', ntAttribute);
   XML_Write.Text  := '';
   infCFe.AttributeNodes.Add(XML_Write);

   // versao
   XML_Write      := XMLSATVenda.CreateNode('versao', ntAttribute);
   XML_Write.Text := qryConfig.FieldByName('XVERSAO_CFE').AsString;
   infCFe.AttributeNodes.Add(XML_Write);

   // versaoDadosEnt
   XML_Write      := XMLSATVenda.CreateNode('versaoDadosEnt', ntAttribute);
   XML_Write.Text := qryConfig.FieldByName('XVERSAO_DADOS_ENT_AC').AsString;
   infCFe.AttributeNodes.Add(XML_Write);

   // versaoSB
   XML_Write := XMLSATVenda.CreateNode('versaoSB', ntAttribute);
   XML_Write.Text := qryConfig.FieldByName('XVERSAO_SOFTWARE_SAT').AsString;
   infCFe.AttributeNodes.Add(XML_Write);

// B - Identifica��o do Cupom Fiscal Eletr�nico.................................
   // ide
   ide := XMLSATVenda.CreateNode('ide', ntElement);
   infCFe.ChildNodes.Add(ide);

   // UF
   XML_Write      := XMLSATVenda.CreateNode('cUF', ntElement);
   XML_Write.Text := copy(qryEmpresa.FieldByName('XCOD_MUNICIPIO').Value,1,2);
   ide.ChildNodes.Add(XML_Write);

   // cNF
   XML_Write      := XMLSATVenda.CreateNode('cNF', ntElement);
   XML_Write.Text := FormatFloat('000000',Random(999999));
   ide.ChildNodes.Add(XML_Write);

   // mod
   XML_Write      := XMLSATVenda.CreateNode('mod', ntElement);
   XML_Write.Text := '59';
   ide.ChildNodes.Add(XML_Write);

   // nserieSAT
   XML_Write      := XMLSATVenda.CreateNode('nserieSAT', ntElement);
   XML_Write.Text := '000000007'; // ** Acerta
   ide.ChildNodes.Add(XML_Write);

   // nCFe
   XML_Write      := XMLSATVenda.CreateNode('nCFe', ntElement);
   XML_Write.Text := '000003'; // ** Acerta
   ide.ChildNodes.Add(XML_Write);

   // dEmi
   XML_Write      := XMLSATVenda.CreateNode('dEmi', ntElement);
   XML_Write.Text := '20130326'; // ** Acerta
   ide.ChildNodes.Add(XML_Write);

   // hEmi
   XML_Write      := XMLSATVenda.CreateNode('hEmi', ntElement);
   XML_Write.Text := '101216'; // ** Acerta
   ide.ChildNodes.Add(XML_Write);

   // cDV
   XML_Write      := XMLSATVenda.CreateNode('cDV', ntElement);
   XML_Write.Text := '3'; // ** Acerta
   ide.ChildNodes.Add(XML_Write);

   // tpAmb
   XML_Write      := XMLSATVenda.CreateNode('tpAmb', ntElement);
   if qryConfig.FieldByName('XTPAMB').AsBoolean = FALSE THEN // Produ��o
      XML_Write.Text := '1'
   else   // homologa��o
      XML_Write.Text := '2';
   ide.ChildNodes.Add(XML_Write);

   // CNPJ da LEDWARE
   XML_Write      := XMLSATVenda.CreateNode('CNPJ', ntElement);
   XML_Write.Text := '10886933000181';
   ide.ChildNodes.Add(XML_Write);

   // signAC   ( Assinatura de (CNPJ Software House + CNPJ Emitente) que gerou o CF-e )
   XML_Write      := XMLSATVenda.CreateNode('signAC', ntElement);
   XML_Write.Text := '10886933000181' + qryEmpresa.FieldByName('XCNPJ').AsString;
   ide.ChildNodes.Add(XML_Write);

   // assinaturaQRCODE
   XML_Write      := XMLSATVenda.CreateNode('assinaturaQRCODE', ntElement);
   XML_Write.Text := 'CFe3512111111111111111159000000007000003992146320121107105207150';  // ** Acerta
   ide.ChildNodes.Add(XML_Write);

   // numeroCaixa
   XML_Write      := XMLSATVenda.CreateNode('numeroCaixa', ntElement);
   XML_Write.Text := '001';  // ** Acerta
   ide.ChildNodes.Add(XML_Write);

// C - Identifica��o do Emitente do Cupom Fiscal eletr�nico.....................
   // emit
   emit := XMLSATVenda.CreateNode('emit', ntElement);
   infCFe.ChildNodes.Add(emit);

   // CNPJ
   XML_Write      := XMLSATVenda.CreateNode('CNPJ', ntElement);
   XML_Write.Text := qryEmpresa.FieldByName('XCNPJ').AsString;
   emit.ChildNodes.Add(XML_Write);

   // xNome
   XML_Write      := XMLSATVenda.CreateNode('xNome', ntElement);
   XML_Write.Text := qryEmpresa.FieldByName('XRAZAO').AsString;
   emit.ChildNodes.Add(XML_Write);

   // xFant
   XML_Write      := XMLSATVenda.CreateNode('xFant', ntElement);
   XML_Write.Text := qryEmpresa.FieldByName('XFANTASIA').AsString;
   emit.ChildNodes.Add(XML_Write);

   // enderEmit
   enderEmit := XMLSATVenda.CreateNode('enderEmit', ntElement);
   emit.ChildNodes.Add(enderEmit);

   // xLgr
   XML_Write      := XMLSATVenda.CreateNode('xLgr', ntElement);
   XML_Write.Text := qryEmpresa.FieldByName('XRUA').AsString;
   enderEmit.ChildNodes.Add(XML_Write);

   // nro
   XML_Write      := XMLSATVenda.CreateNode('nro', ntElement);
   XML_Write.Text := qryEmpresa.FieldByName('XNUMERO').AsString;
   enderEmit.ChildNodes.Add(XML_Write);

   // xCpl
   XML_Write      := XMLSATVenda.CreateNode('xCpl', ntElement);
   XML_Write.Text := qryEmpresa.FieldByName('XCOMPLEMENTO').AsString;
   enderEmit.ChildNodes.Add(XML_Write);

   // xBairro
   XML_Write      := XMLSATVenda.CreateNode('xBairro', ntElement);
   XML_Write.Text := qryEmpresa.FieldByName('XBAIRRO').AsString;
   enderEmit.ChildNodes.Add(XML_Write);

   // xMun
   XML_Write      := XMLSATVenda.CreateNode('xMun', ntElement);
   XML_Write.Text := qryEmpresa.FieldByName('XCIDADE').AsString;
   enderEmit.ChildNodes.Add(XML_Write);

   // CEP
   XML_Write      := XMLSATVenda.CreateNode('XCEP', ntElement);
   XML_Write.Text := Trim(StringReplace(qryEmpresa.FieldByName('XCEP').AsString, '-', '', [rfReplaceAll]));
   enderEmit.ChildNodes.Add(XML_Write);

   // IE
   XML_Write      := XMLSATVenda.CreateNode('IE', ntElement);
   XML_Write.Text := qryEmpresa.FieldByName('XIE').AsString;
   emit.ChildNodes.Add(XML_Write);

   // IM
   XML_Write      := XMLSATVenda.CreateNode('IM', ntElement);
   XML_Write.Text := '123123'; // ** Acerta
   emit.ChildNodes.Add(XML_Write);

   // cRegTrib
   XML_Write      := XMLSATVenda.CreateNode('cRegTrib', ntElement);
   if qryEmpresa.FieldByName('XSIMPLES_NACIONAL').AsBoolean then
      XML_Write.Text := '1'
   else
      XML_Write.Text := '3';
   emit.ChildNodes.Add(XML_Write);

   // cRegTribISSQN
   XML_Write      := XMLSATVenda.CreateNode('cRegTribISSQN', ntElement);
   XML_Write.Text := '5'; // ** Acerta  // 1 - Microempresa Municipal; 2 - Estimativa; 3 - Sociedade de Profissionais; 4 - Cooperativa; 5 - Microempres�rio Individual (MEI);
   emit.ChildNodes.Add(XML_Write);

   // indRatISSQN
   XML_Write      := XMLSATVenda.CreateNode('indRatISSQN', ntElement);
   XML_Write.Text := 'N'; // ** Acerta
   emit.ChildNodes.Add(XML_Write);

// E  - Identifica��o do Destinat�rio do Cupom Fiscal eletr�nco.................
   // dest
   dest := XMLSATVenda.CreateNode('dest', ntElement);
   infCFe.ChildNodes.Add(dest);

   // CNPJ
   XML_Write      := XMLSATVenda.CreateNode('CNPJ', ntElement);
   XML_Write.Text := '00000000'; // ** Acerta
   dest.ChildNodes.Add(XML_Write);

   // CPF
   XML_Write      := XMLSATVenda.CreateNode('CPF', ntElement);
   XML_Write.Text := '00000000'; // ** Acerta
   dest.ChildNodes.Add(XML_Write);

   // xNome
   XML_Write      := XMLSATVenda.CreateNode('xNome', ntElement);
   XML_Write.Text := 'teste nome'; // ** Acerta
   dest.ChildNodes.Add(XML_Write);

// G - Identifica��o do Local de Entrega........................................
   // entrega
   entrega := XMLSATVenda.CreateNode('entrega', ntElement);
   infCFe.ChildNodes.Add(entrega);

   // xLgr
   XML_Write      := XMLSATVenda.CreateNode('xLgr', ntElement);
   XML_Write.Text := 'teste Lgr'; // ** Acerta
   entrega.ChildNodes.Add(XML_Write);

   // nro
   XML_Write      := XMLSATVenda.CreateNode('nro', ntElement);
   XML_Write.Text := 'teste nro'; // ** Acerta
   entrega.ChildNodes.Add(XML_Write);

   // xCpl
   XML_Write      := XMLSATVenda.CreateNode('xCpl', ntElement);
   XML_Write.Text := 'teste xCpl'; // ** Acerta
   entrega.ChildNodes.Add(XML_Write);

   // xBairro
   XML_Write      := XMLSATVenda.CreateNode('xBairro', ntElement);
   XML_Write.Text := 'teste xBairro'; // ** Acerta
   entrega.ChildNodes.Add(XML_Write);

   // xMun
   XML_Write      := XMLSATVenda.CreateNode('xMun', ntElement);
   XML_Write.Text := 'teste xMun'; // ** Acerta
   entrega.ChildNodes.Add(XML_Write);

   // UF
   XML_Write      := XMLSATVenda.CreateNode('UF', ntElement);
   XML_Write.Text := 'teste UF'; // ** Acerta
   entrega.ChildNodes.Add(XML_Write);

// H - Detalhamento de Produtos e Servi�os do CF-e..............................
   // det
   det := XMLSATVenda.CreateNode('det', ntElement);
   infCFe.ChildNodes.Add(det);

   // nItem
   XML_Write      := XMLSATVenda.CreateNode('nItem', ntAttribute);
   XML_Write.Text := '1';   // ** Acerta com While quantidade de produto - N�mero do item (1-500)
   det.AttributeNodes.Add(XML_Write);

// I - Produtos e Servi�os do CF-e..............................................
   // prod
   prod := XMLSATVenda.CreateNode('prod', ntElement);
   det.ChildNodes.Add(prod);

   // cProd
   XML_Write      := XMLSATVenda.CreateNode('cProd', ntElement);
   XML_Write.Text := '06'; // ** Acerta com While quantidade de produto - C�digo do produto
   prod.ChildNodes.Add(XML_Write);

   // cEAN
   XML_Write      := XMLSATVenda.CreateNode('cEAN', ntElement);
   XML_Write.Text := '7894561230'; // ** Acerta com While
   prod.ChildNodes.Add(XML_Write);

   // xProd
   XML_Write      := XMLSATVenda.CreateNode('xProd', ntElement);
   XML_Write.Text := 'Produto teste'; // ** Acerta com While
   prod.ChildNodes.Add(XML_Write);

   // NCM
   XML_Write      := XMLSATVenda.CreateNode('NCM', ntElement);
   XML_Write.Text := '12345678'; // ** Acerta com While - C�digo NCM com 8 d�gitos ou 2 d�gitos (g�nero) - Em caso de servi�o informar o c�digo 99
   prod.ChildNodes.Add(XML_Write);

   // CFOP
   XML_Write      := XMLSATVenda.CreateNode('CFOP', ntElement);
   XML_Write.Text := '5102'; // ** Acerta com While
   prod.ChildNodes.Add(XML_Write);

   // uCom
   XML_Write      := XMLSATVenda.CreateNode('uCom', ntElement);
   XML_Write.Text := 'KG'; // ** Acerta com While
   prod.ChildNodes.Add(XML_Write);

   // qCom
   XML_Write      := XMLSATVenda.CreateNode('qCom', ntElement);
   XML_Write.Text := '1.0000'; // ** Acerta com While
   prod.ChildNodes.Add(XML_Write);

   // vUnCom
   XML_Write      := XMLSATVenda.CreateNode('vUnCom', ntElement);
   XML_Write.Text := '1.500'; // ** Acerta com While
   prod.ChildNodes.Add(XML_Write);

   // vProd
   XML_Write      := XMLSATVenda.CreateNode('vProd', ntElement);
   XML_Write.Text := '1.50'; // ** Acerta com While - (vProd = qCom * vUnCom)
   prod.ChildNodes.Add(XML_Write);

   // indRegra
   XML_Write      := XMLSATVenda.CreateNode('indRegra', ntElement);
   XML_Write.Text := 'A'; // ** Acerta com While - A - Arredondamento T - Truncamento
   prod.ChildNodes.Add(XML_Write);

   // vDesc
   XML_Write      := XMLSATVenda.CreateNode('vDesc', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta com While
   prod.ChildNodes.Add(XML_Write);

   // vOutro
   XML_Write      := XMLSATVenda.CreateNode('vOutro', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta com While
   prod.ChildNodes.Add(XML_Write);

   // vItem
   XML_Write      := XMLSATVenda.CreateNode('vItem', ntElement);
   XML_Write.Text := '1.50'; // ** Acerta com While - (vItem = vProd - vDesc + vOutro - vRatDesc + vRatAcr)
   prod.ChildNodes.Add(XML_Write);

   // vRatDesc
   XML_Write      := XMLSATVenda.CreateNode('vRatDesc', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta com While - Rateio incidir� sobre os itens sujeitos ao ISSQN somente se o campo indRatISSQN = 'S'.
   prod.ChildNodes.Add(XML_Write);

   // vRatAcr
   XML_Write      := XMLSATVenda.CreateNode('vRatAcr', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta com While -
   prod.ChildNodes.Add(XML_Write);

   // obsFiscoDet
   obsFiscoDet := XMLSATVenda.CreateNode('obsFiscoDet', ntElement);
   prod.ChildNodes.Add(obsFiscoDet);

   // xCampoDet
   XML_Write      := XMLSATVenda.CreateNode('xCampoDet', ntElement);
   XML_Write.Text := ''; // ** Acerta com While
   obsFiscoDet.ChildNodes.Add(XML_Write);

   // xTextoDet
   XML_Write      := XMLSATVenda.CreateNode('xTextoDet', ntElement);
   XML_Write.Text := ''; // ** Acerta com While
   obsFiscoDet.ChildNodes.Add(XML_Write);

// M - Tributos incidentes no Produto ou Servi�o................................
   // imposto
   imposto := XMLSATVenda.CreateNode('imposto', ntElement);
   det.ChildNodes.Add(imposto);

   // vItem12741
   XML_Write      := XMLSATVenda.CreateNode('vItem12741', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta opcional este campo
   imposto.ChildNodes.Add(XML_Write);

// N - ICMS Normal e ST.........................................................
   // ICMS
   ICMS := XMLSATVenda.CreateNode('ICMS', ntElement);
   imposto.ChildNodes.Add(ICMS);
                                     
   // ICMS00  <-- ICMS 00, 20, 90
   ICMS00 := XMLSATVenda.CreateNode('ICMS00', ntElement);  // Tributa��o do ICMS: 00 � Tributada integralmente 20 - Com redu��o de base de c�lculo 90 - Outros
   ICMS.ChildNodes.Add(ICMS00);

   // Orig
   XML_Write      := XMLSATVenda.CreateNode('Orig', ntElement);
   XML_Write.Text := '0'; // ** Acerta - Origem da mercadoria
   ICMS00.ChildNodes.Add(XML_Write);

   // CST
   XML_Write      := XMLSATVenda.CreateNode('CST', ntElement);
   XML_Write.Text := '00'; // ** Acerta - 00 � Tributada integralmente - 20 - Com redu��o de base de c�lculo - 90 - Outros
   ICMS00.ChildNodes.Add(XML_Write);

   // pICMS
   XML_Write      := XMLSATVenda.CreateNode('pICMS', ntElement);
   XML_Write.Text := '18'; // ** Acerta - Origem da mercadoria
   ICMS00.ChildNodes.Add(XML_Write);

   // vICMS
   XML_Write      := XMLSATVenda.CreateNode('vICMS', ntElement);
   XML_Write.Text := '00'; // ** Acerta - vICMS = vItem * pICMS / 100
   ICMS00.ChildNodes.Add(XML_Write);

   // ICMS40  <-- ICMS 40, 41, 50, 60
   ICMS40 := XMLSATVenda.CreateNode('ICMS40', ntElement);  // Tributa��o do ICMS: 40 - Isenta 41 - N�o tributada 50 - Suspens�o 60 - ICMS cobrado anteriormente por substitui��o tribut�ria
   ICMS.ChildNodes.Add(ICMS40);

   // Orig
   XML_Write      := XMLSATVenda.CreateNode('Orig', ntElement);
   XML_Write.Text := '0'; // ** Acerta - Origem da mercadoria
   ICMS40.ChildNodes.Add(XML_Write);

   // CST
   XML_Write      := XMLSATVenda.CreateNode('CST', ntElement);
   XML_Write.Text := '40'; // ** Acerta - 40 - Isenta - 41 - N�o tributada - 50 - Suspens�o - 60 - ICMS cobrado anteriormente por substitui��o tribut�ria
   ICMS40.ChildNodes.Add(XML_Write);

   // ICMSSN102  <-- pelo SIMPLES NACIONAL e CSOSN = 102, 300, 500
   ICMSSN102 := XMLSATVenda.CreateNode('ICMSSN102', ntElement);  // Tributa��o do ICMS: pelo SIMPLES NACIONAL e CSOSN=102, 300, 500
   ICMS.ChildNodes.Add(ICMSSN102);

   // Orig
   XML_Write      := XMLSATVenda.CreateNode('Orig', ntElement);
   XML_Write.Text := '0'; // ** Acerta - Origem da mercadoria
   ICMSSN102.ChildNodes.Add(XML_Write);

   // CSOSN
   XML_Write      := XMLSATVenda.CreateNode('CSOSN', ntElement);
   XML_Write.Text := '0'; // ** Acerta - 102- Tributada pelo Simples Nacional sem permiss�o de cr�dito. 300 � Imune 500 � ICMS cobrado anteriormente por substitui��o tribut�ria (substitu�do) ou por antecipa��o
   ICMSSN102.ChildNodes.Add(XML_Write);

   // ICMSSN900  <-- pelo SIMPLES NACIONAL e CSOSN = 900
   ICMSSN900 := XMLSATVenda.CreateNode('ICMSSN900', ntElement);  // Tributa��o do ICMS: pelo SIMPLES NACIONAL e CSOSN=900
   ICMS.ChildNodes.Add(ICMSSN900);

   // Orig
   XML_Write      := XMLSATVenda.CreateNode('Orig', ntElement);
   XML_Write.Text := '0'; // ** Acerta - Origem da mercadoria
   ICMSSN900.ChildNodes.Add(XML_Write);

   // CSOSN
   XML_Write      := XMLSATVenda.CreateNode('CSOSN', ntElement);
   XML_Write.Text := '0'; // ** Acerta - 900 - Outros
   ICMSSN900.ChildNodes.Add(XML_Write);

   // pICMS
   XML_Write      := XMLSATVenda.CreateNode('pICMS', ntElement);
   XML_Write.Text := '18'; // ** Acerta
   ICMSSN900.ChildNodes.Add(XML_Write);

   // vICMS
   XML_Write      := XMLSATVenda.CreateNode('vICMS', ntElement);
   XML_Write.Text := '0'; // ** Acerta - Calculado pelo SAT: vICMS = vItem * pICMS/100
   ICMSSN900.ChildNodes.Add(XML_Write);

// Q � PIS......................................................................
   // PIS
   PIS := XMLSATVenda.CreateNode('PIS', ntElement);
   imposto.ChildNodes.Add(PIS);                    

   // PISAliq  <-- CST = 01 e 02
   PISAliq := XMLSATVenda.CreateNode('PISAliq', ntElement);
   PIS.ChildNodes.Add(PISAliq);

   // CST - 01 � Opera��o Tribut�vel (base de c�lculo = valor da opera��o al�quota normal (cumulativo/n�o cumulativo)); 02 - Opera��o Tribut�vel (base de c�lculo = valor da opera��o(al�quota diferenciada));
   XML_Write      := XMLSATVenda.CreateNode('CST', ntElement);
   XML_Write.Text := '18'; // ** Acerta
   PISAliq.ChildNodes.Add(XML_Write);

   // vBC
   XML_Write      := XMLSATVenda.CreateNode('vBC', ntElement);
   XML_Write.Text := '18'; // ** Acerta
   PISAliq.ChildNodes.Add(XML_Write);

   // pPIS
   XML_Write      := XMLSATVenda.CreateNode('pPIS', ntElement);
   XML_Write.Text := '18'; // ** Acerta
   PISAliq.ChildNodes.Add(XML_Write);

   // vPIS
   XML_Write      := XMLSATVenda.CreateNode('vPIS', ntElement);
   XML_Write.Text := '18'; // ** Acerta
   PISAliq.ChildNodes.Add(XML_Write);

   // PISQtde  <-- CST = 03
   PISQtde := XMLSATVenda.CreateNode('PISQtde', ntElement);
   PIS.ChildNodes.Add(PISQtde);

   // CST - 03 - Opera��o Tribut�vel (base de c�lculo = quantidade vendida x al�quota por unidade de produto);
   XML_Write      := XMLSATVenda.CreateNode('CST', ntElement);
   XML_Write.Text := '03'; // ** Acerta
   PISQtde.ChildNodes.Add(XML_Write);

   // qBCProd
   XML_Write      := XMLSATVenda.CreateNode('qBCProd', ntElement);
   XML_Write.Text := '0'; // ** Acerta
   PISQtde.ChildNodes.Add(XML_Write);

   // vAliqProd
   XML_Write      := XMLSATVenda.CreateNode('vAliqProd', ntElement);
   XML_Write.Text := '0'; // ** Acerta
   PISQtde.ChildNodes.Add(XML_Write);

   // vPIS
   XML_Write      := XMLSATVenda.CreateNode('vPIS', ntElement);
   XML_Write.Text := '0'; // ** Acerta - (vPIS = qBCProd * vAliqProd)
   PISQtde.ChildNodes.Add(XML_Write);

   // PISNT  <-- CST = 04, 06, 07, 08 ou 09
   PISNT := XMLSATVenda.CreateNode('PISNT', ntElement);
   PIS.ChildNodes.Add(PISNT);

   // CST - 04 - Opera��o Tribut�vel(tributa��o monof�sica (al�quota zero)); 06 - Opera��o Tribut�vel(al�quota zero); 07 - Opera��o Isenta da Contribui��o; 08 - Opera��o Sem Incid�ncia da Contribui��o; 09 - Opera��o com Suspens�o da Contribui��o;
   XML_Write      := XMLSATVenda.CreateNode('CST', ntElement);
   XML_Write.Text := '04'; // ** Acerta
   PISNT.ChildNodes.Add(XML_Write);

   // PISSN  <-- CST = 49
   PISSN := XMLSATVenda.CreateNode('PISSN', ntElement);
   PIS.ChildNodes.Add(PISSN);

   // CST - 49 - Outras Opera��es de sa�da;
   XML_Write      := XMLSATVenda.CreateNode('CST', ntElement);
   XML_Write.Text := '49'; // ** Acerta
   PISSN.ChildNodes.Add(XML_Write);

   // PISOutr  <-- CST = 99
   PISOutr := XMLSATVenda.CreateNode('PISOutr', ntElement);
   PIS.ChildNodes.Add(PISOutr);

   //CST - 99 - Outras Opera��es;
   XML_Write      := XMLSATVenda.CreateNode('CST', ntElement);
   XML_Write.Text := '99'; // ** Acerta
   PISOutr.ChildNodes.Add(XML_Write);

   // vBC
   XML_Write      := XMLSATVenda.CreateNode('vBC', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   PISOutr.ChildNodes.Add(XML_Write);

   // pPIS
   XML_Write      := XMLSATVenda.CreateNode('pPIS', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   PISOutr.ChildNodes.Add(XML_Write);

   // qBCProd
   XML_Write      := XMLSATVenda.CreateNode('qBCProd', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   PISOutr.ChildNodes.Add(XML_Write);

   // vAliqProd
   XML_Write      := XMLSATVenda.CreateNode('vAliqProd', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   PISOutr.ChildNodes.Add(XML_Write);

   // vPIS
   XML_Write      := XMLSATVenda.CreateNode('vPIS', ntElement);
   XML_Write.Text := '00'; // ** Acerta - Se informados vPIS = vBC * pPIS Se informados vPIS = qBCProd * vAliqProd
   PISOutr.ChildNodes.Add(XML_Write);

// R � PIS ST...................................................................
   // PISST
   PISST := XMLSATVenda.CreateNode('PISST', ntElement);
   imposto.ChildNodes.Add(PISST);

   // vBC
   XML_Write      := XMLSATVenda.CreateNode('vBC', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   PISST.ChildNodes.Add(XML_Write);

   // pPIS
   XML_Write      := XMLSATVenda.CreateNode('pPIS', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   PISST.ChildNodes.Add(XML_Write);

   // qBCProd
   XML_Write      := XMLSATVenda.CreateNode('qBCProd', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   PISST.ChildNodes.Add(XML_Write);

   // vAliqProd
   XML_Write      := XMLSATVenda.CreateNode('vAliqProd', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   PISST.ChildNodes.Add(XML_Write);

   // vPIS
   XML_Write      := XMLSATVenda.CreateNode('vPIS', ntElement);
   XML_Write.Text := '00'; // ** Acerta - Se informados vPIS = vBC * pPIS Se informados vPIS = qBCProd * vAliqProd
   PISST.ChildNodes.Add(XML_Write);

// S � COFINS...................................................................
   // COFINS
   COFINS := XMLSATVenda.CreateNode('COFINS', ntElement);
   imposto.ChildNodes.Add(COFINS);

   // COFINSAliq  <-- CST = 01 ou 02
   COFINSAliq := XMLSATVenda.CreateNode('COFINSAliq', ntElement);
   COFINS.ChildNodes.Add(COFINSAliq);

   // CST - 01 � Opera��o Tribut�vel (basede c�lculo = valor da opera��o al�quota normal (cumulativo/n�o cumulativo)); 02 - Opera��o Tribut�vel (base de c�lculo = valor da opera��o (al�quota diferenciada));
   XML_Write      := XMLSATVenda.CreateNode('CST', ntElement);
   XML_Write.Text := '01'; // ** Acerta
   COFINSAliq.ChildNodes.Add(XML_Write);

   // vBC
   XML_Write      := XMLSATVenda.CreateNode('vBC', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   COFINSAliq.ChildNodes.Add(XML_Write);

   // pCOFINS
   XML_Write      := XMLSATVenda.CreateNode('pCOFINS', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   COFINSAliq.ChildNodes.Add(XML_Write);

   // vCOFINS
   XML_Write      := XMLSATVenda.CreateNode('vCOFINS', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   COFINSAliq.ChildNodes.Add(XML_Write);

   // COFINSQtde  <-- CST = 03
   COFINSQtde := XMLSATVenda.CreateNode('COFINSQtde', ntElement);
   COFINS.ChildNodes.Add(COFINSQtde);

   // CST - 03 - Opera��o Tribut�vel (base de c�lculo = quantidade vendida x al�quota por unidade de produto);
   XML_Write      := XMLSATVenda.CreateNode('CST', ntElement);
   XML_Write.Text := '03'; // ** Acerta
   COFINSQtde.ChildNodes.Add(XML_Write);

   // qBCProd
   XML_Write      := XMLSATVenda.CreateNode('qBCProd', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   COFINSQtde.ChildNodes.Add(XML_Write);

   // vAliqProd
   XML_Write      := XMLSATVenda.CreateNode('vAliqProd', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   COFINSQtde.ChildNodes.Add(XML_Write);

   // vCOFINS
   XML_Write      := XMLSATVenda.CreateNode('vCOFINS', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   COFINSQtde.ChildNodes.Add(XML_Write);

   // COFINSNT  <-- CST = 04, 06, 07, 08 ou 09
   COFINSNT := XMLSATVenda.CreateNode('COFINSNT', ntElement);
   COFINS.ChildNodes.Add(COFINSNT);

   // CST - 04 - Opera��o Tribut�vel (tributa��o monof�sica (al�quota zero)); 06 - Opera��o Tribut�vel (al�quota zero); 07 - Opera��o Isenta da Contribui��o; 08 - Opera��o Sem Incid�ncia da Contribui��o; 09 - Opera��o com Suspens�o da Contribui��o;
   XML_Write      := XMLSATVenda.CreateNode('CST', ntElement);
   XML_Write.Text := '04'; // ** Acerta
   COFINSNT.ChildNodes.Add(XML_Write);

   // COFINSSN  <-- CST = 49
   COFINSSN := XMLSATVenda.CreateNode('COFINSSN', ntElement);
   COFINS.ChildNodes.Add(COFINSSN);

   // CST - 49 - Outras Opera��es de sa�da;
   XML_Write      := XMLSATVenda.CreateNode('CST', ntElement);
   XML_Write.Text := '49'; // ** Acerta
   COFINSSN.ChildNodes.Add(XML_Write);

   // COFINSOutr  <-- CST = 99 Informar campos para c�lculo da COFINS com aliquota em percentual ou campos para COFINS com aliquota em valor.
   COFINSOutr := XMLSATVenda.CreateNode('COFINSOutr', ntElement);
   COFINS.ChildNodes.Add(COFINSOutr);

   // CST - 99 - Outras Opera��es;
   XML_Write      := XMLSATVenda.CreateNode('CST', ntElement);
   XML_Write.Text := '99'; // ** Acerta
   COFINSOutr.ChildNodes.Add(XML_Write);

   // vBC
   XML_Write      := XMLSATVenda.CreateNode('vBC', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   COFINSOutr.ChildNodes.Add(XML_Write);

   // pCOFINS
   XML_Write      := XMLSATVenda.CreateNode('pCOFINS', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   COFINSOutr.ChildNodes.Add(XML_Write);

   // qBCProd
   XML_Write      := XMLSATVenda.CreateNode('qBCProd', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   COFINSOutr.ChildNodes.Add(XML_Write);

   // vAliqProd
   XML_Write      := XMLSATVenda.CreateNode('vAliqProd', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   COFINSOutr.ChildNodes.Add(XML_Write);

   // vCOFINS
   XML_Write      := XMLSATVenda.CreateNode('vCOFINS', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   COFINSOutr.ChildNodes.Add(XML_Write);

// T - COFINS ST................................................................
   // COFINSST
   COFINSST := XMLSATVenda.CreateNode('COFINSST', ntElement);
   imposto.ChildNodes.Add(COFINSST);

   // vBC
   XML_Write      := XMLSATVenda.CreateNode('vBC', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   COFINSST.ChildNodes.Add(XML_Write);

   // pCOFINS
   XML_Write      := XMLSATVenda.CreateNode('pCOFINS', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   COFINSST.ChildNodes.Add(XML_Write);

   // qBCProd
   XML_Write      := XMLSATVenda.CreateNode('qBCProd', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   COFINSST.ChildNodes.Add(XML_Write);

   // vAliqProd
   XML_Write      := XMLSATVenda.CreateNode('vAliqProd', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   COFINSST.ChildNodes.Add(XML_Write);

   // vCOFINS
   XML_Write      := XMLSATVenda.CreateNode('vCOFINS', ntElement);
   XML_Write.Text := '00'; // ** Acerta - Se informados vCOFINS = vBC * pCOFINS - Se informados vCOFINS = qBCProd * vAliqProd
   COFINSST.ChildNodes.Add(XML_Write);

// U - ISSQN....................................................................
   // ISSQN
   ISSQN := XMLSATVenda.CreateNode('ISSQN', ntElement);
   imposto.ChildNodes.Add(ISSQN);

   // vDeducISSQN
   XML_Write      := XMLSATVenda.CreateNode('vDeducISSQN', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   ISSQN.ChildNodes.Add(XML_Write);

   // vBC
   XML_Write      := XMLSATVenda.CreateNode('vBC', ntElement);
   XML_Write.Text := '00'; // ** Acerta - vBC = vItem - vDeducISSQN
   ISSQN.ChildNodes.Add(XML_Write);

   // vAliq
   XML_Write      := XMLSATVenda.CreateNode('vAliq', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   ISSQN.ChildNodes.Add(XML_Write);

   // vISSQN
   XML_Write      := XMLSATVenda.CreateNode('vISSQN', ntElement);
   XML_Write.Text := '00'; // ** Acerta - vISSQN = vBC * vAliq / 100
   ISSQN.ChildNodes.Add(XML_Write);

   // cMunFG
   XML_Write      := XMLSATVenda.CreateNode('cMunFG', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   ISSQN.ChildNodes.Add(XML_Write);

   // cListServ
   XML_Write      := XMLSATVenda.CreateNode('cListServ', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   ISSQN.ChildNodes.Add(XML_Write);

   // cServTribMun
   XML_Write      := XMLSATVenda.CreateNode('cServTribMun', ntElement);
   XML_Write.Text := '00'; // ** Acerta
   ISSQN.ChildNodes.Add(XML_Write);

   // cNatOp
   XML_Write      := XMLSATVenda.CreateNode('cNatOp', ntElement);
   XML_Write.Text := '00'; // ** Acerta - 1 - Tributa��o no munic�pio; 2 -Tributa��o fora do munic�pio; 3 -Isen��o; 4  - Imune; 5 -Exigibilidade suspensa por decis�o judicial 6 - Exigibilidade suspensa por procedimento administrativo; 7 - N�o tribut�vel ou n�o incid�ncia; 8 -Exporta��o de Servi�o.
   ISSQN.ChildNodes.Add(XML_Write);

   // indIncFisc
   XML_Write      := XMLSATVenda.CreateNode('indIncFisc', ntElement);
   XML_Write.Text := 'N'; // ** Acerta
   ISSQN.ChildNodes.Add(XML_Write);

// V - Informa��es adicionais...................................................
   // infAdProd - informa��es complementares
   XML_Write      := XMLSATVenda.CreateNode('infAdProd', ntElement);
   XML_Write.Text := 'N'; // ** Acerta
   det.ChildNodes.Add(XML_Write);

// W - Valores Totais do CF-e...................................................
   // total
   total := XMLSATVenda.CreateNode('total', ntElement);
   infCFe.ChildNodes.Add(total);

   // ICMSTot
   ICMSTot := XMLSATVenda.CreateNode('ICMSTot', ntElement);
   total.ChildNodes.Add(ICMSTot);

   // vICMS
   XML_Write      := XMLSATVenda.CreateNode('vICMS', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta
   ICMSTot.ChildNodes.Add(XML_Write);

   // vProd
   XML_Write      := XMLSATVenda.CreateNode('vProd', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta
   ICMSTot.ChildNodes.Add(XML_Write);

   // vDesc
   XML_Write      := XMLSATVenda.CreateNode('vDesc', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta
   ICMSTot.ChildNodes.Add(XML_Write);

   // vPIS
   XML_Write      := XMLSATVenda.CreateNode('vPIS', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta
   ICMSTot.ChildNodes.Add(XML_Write);

   // vCOFINS
   XML_Write      := XMLSATVenda.CreateNode('vCOFINS', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta
   ICMSTot.ChildNodes.Add(XML_Write);

   // vPISST
   XML_Write      := XMLSATVenda.CreateNode('vPISST', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta
   ICMSTot.ChildNodes.Add(XML_Write);

   // vCOFINSST
   XML_Write      := XMLSATVenda.CreateNode('vCOFINSST', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta
   ICMSTot.ChildNodes.Add(XML_Write);

   // vOutro
   XML_Write      := XMLSATVenda.CreateNode('vOutro', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta
   ICMSTot.ChildNodes.Add(XML_Write);

   // vCFe
   XML_Write      := XMLSATVenda.CreateNode('vCFe', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta
   total.ChildNodes.Add(XML_Write);

   // ISSQNtot
   ISSQNtot := XMLSATVenda.CreateNode('ISSQNtot', ntElement);
   total.ChildNodes.Add(ISSQNtot);

   // vBC
   XML_Write      := XMLSATVenda.CreateNode('vBC', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta
   ISSQNtot.ChildNodes.Add(XML_Write);

   // vISS
   XML_Write      := XMLSATVenda.CreateNode('vISS', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta
   ISSQNtot.ChildNodes.Add(XML_Write);

   // vPIS
   XML_Write      := XMLSATVenda.CreateNode('vPIS', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta
   ISSQNtot.ChildNodes.Add(XML_Write);

   // vCOFINS
   XML_Write      := XMLSATVenda.CreateNode('vCOFINS', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta
   ISSQNtot.ChildNodes.Add(XML_Write);

   // vPISST
   XML_Write      := XMLSATVenda.CreateNode('vPISST', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta
   ISSQNtot.ChildNodes.Add(XML_Write);

   // vCOFINSST
   XML_Write      := XMLSATVenda.CreateNode('vCOFINSST', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta
   ISSQNtot.ChildNodes.Add(XML_Write);

   // DescAcrEntr
   DescAcrEntr := XMLSATVenda.CreateNode('DescAcrEntr', ntElement);
   total.ChildNodes.Add(DescAcrEntr);

   // vDescSubtot
   XML_Write      := XMLSATVenda.CreateNode('vDescSubtot', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta
   DescAcrEntr.ChildNodes.Add(XML_Write);

   // vAcresSubtot
   XML_Write      := XMLSATVenda.CreateNode('vAcresSubtot', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta
   DescAcrEntr.ChildNodes.Add(XML_Write);

   // vCFeLei12741
   XML_Write      := XMLSATVenda.CreateNode('vCFeLei12741', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta
   total.ChildNodes.Add(XML_Write);

// WA - Informa��es sobre Pagamento.............................................
   // pgto
   pgto := XMLSATVenda.CreateNode('pgto', ntElement);
   infCFe.ChildNodes.Add(pgto);

   // MP
   MP := XMLSATVenda.CreateNode('MP', ntElement);
   pgto.ChildNodes.Add(MP);

   // cMP
   XML_Write      := XMLSATVenda.CreateNode('cMP', ntElement);
   XML_Write.Text := '01'; // ** Acerta - 01 - Dinheiro 02 - Cheque 03 - Cart�o de Cr�dito 04 - Cart�o de D�bito 05 - Cr�dito Loja 10 - Vale Alimenta��o 11 - Vale Refei��o 12 - Vale Presente 13 - Vale Combust�vel 99 - Outros
   MP.ChildNodes.Add(XML_Write);

   // vMP
   XML_Write      := XMLSATVenda.CreateNode('vMP', ntElement);
   XML_Write.Text := '1.00'; // ** Acerta - Valor do Meio de Pagamento
   MP.ChildNodes.Add(XML_Write);

   // cAdmC
   XML_Write      := XMLSATVenda.CreateNode('cAdmC', ntElement);
   XML_Write.Text := '001'; // ** Acerta
   MP.ChildNodes.Add(XML_Write);

   // vTroco
   XML_Write      := XMLSATVenda.CreateNode('vTroco', ntElement);
   XML_Write.Text := '0.00'; // ** Acerta - vTroco = soma(vMP) - vCFe
   pgto.ChildNodes.Add(XML_Write);

// Z - Informa��es Adicionais do CF -e..........................................









   // Salvando o XML
   XMLSATVenda.SaveToFile('C:\LedCommerce\SatVenda.XML');
   XMLSATVenda.Active := False;

   FreeAndNil(qryConfig);
   FreeAndNil(qryEmpresa);

//    * fazer os COPY no resultado para nao estourar o Limite de caracter
//    * Casa decimais acerta tbm
//    * Acerta os ICMS quando for de cada Grupo, e qdo for Simples Nacional tbm


   try
      FreeAndNil(XMLSATVenda);
   except
   end;

end;

end.
