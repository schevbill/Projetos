// ************************************************************************ //
// WSDL     : http://www.byjg.com.br/site/webservice.php/ws/cep?WSDL
//  >Import : http://www.byjg.com.br/site/webservice.php/ws/cep?WSDL>0
// ************************************************************************ //

unit funCEP;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  ArrayOfstring = array of string;              { "urn:CEPService"[GblCplx] }

  // ************************************************************************ //
  // Namespace : urn:http://www.byjg.com.br
  // soapAction: urn:CEPServiceAction
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : CEPServiceBinding
  // service   : CEPService
  // port      : CEPServicePort
  // URL       : http://www.byjg.com.br/site/webservice.php/ws/cep
  // ************************************************************************ //
  CEPServicePort = interface(IInvokable)
  ['{EC28595B-95D2-DE51-E5B1-57B81D4826D3}']
    function  obterVersao: string; stdcall;
    function  obterLogradouro(const cep: string): string; stdcall;
    function  obterLogradouroAuth(const cep: string; const usuario: string; const senha: string): string; stdcall;
    function  obterCEP(const logradouro: string; const localidade: string; const UF: string): ArrayOfstring; stdcall;
    function  obterCEPAuth(const logradouro: string; const localidade: string; const UF: string; const usuario: string; const senha: string): ArrayOfstring; stdcall;
  end;

function GetCEPServicePort(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): CEPServicePort;


implementation
  uses SysUtils;

function GetCEPServicePort(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): CEPServicePort;
const
   defWSDL = 'http://www.byjg.com.br/site/webservice.php/ws/cep?WSDL';
   defURL  = 'http://www.byjg.com.br/site/webservice.php/ws/cep';
   defSvc  = 'CEPService';
   defPrt  = 'CEPServicePort';
var
   RIO: THTTPRIO;
begin
   Result := nil;
   if (Addr = '') then
   begin
      if UseWSDL then
         Addr := defWSDL
      else
         Addr := defURL;
   end;
   if HTTPRIO = nil then
      RIO := THTTPRIO.Create(nil)
   else
      RIO := HTTPRIO;
   try
      Result := (RIO as CEPServicePort);
      if UseWSDL then
      begin
         RIO.WSDLLocation := Addr;
         RIO.Service := defSvc;
         RIO.Port := defPrt;
      end
      else
         RIO.URL := Addr;
   finally
      if (Result = nil) and (HTTPRIO = nil) then
         RIO.Free;
   end;
end;


initialization
   InvRegistry.RegisterInterface(TypeInfo(CEPServicePort), 'urn:http://www.byjg.com.br', 'utf-8');
   InvRegistry.RegisterDefaultSOAPAction(TypeInfo(CEPServicePort), 'urn:CEPServiceAction');
   RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfstring), 'urn:CEPService', 'ArrayOfstring');

end.
