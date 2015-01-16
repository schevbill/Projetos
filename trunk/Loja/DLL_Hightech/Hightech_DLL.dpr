library Hightech_DLL;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  System.SysUtils,
  System.Classes,
  DateUtils;

const
   DateExpire = '30/10/2014'; // Expirar Sistemas

{$R *.res}
{ Função para informar quando expira o sistema }
function fInformaExpirar: String; StdCall;
var
   vDias : Integer;
begin
   Result:= '';

   if StrToDate(DateExpire) > Date() then
   begin
      vDias := DaysBetween(Date(), StrToDate(DateExpire));

      case vDias of
         1:  Result := 'Atenção: Restam apenas '+IntToStr(vDias) +' dia para expirar';
         2:  Result := 'Atenção: Restam apenas '+IntToStr(vDias) +' dias para expirar';
         3:  Result := 'Atenção: Restam apenas '+IntToStr(vDias) +' dias para expirar';
         4:  Result := 'Atenção: Restam apenas '+IntToStr(vDias) +' dias para expirar';
         5:  Result := 'Atenção: Restam apenas '+IntToStr(vDias) +' dias para expirar';
         6:  Result := 'Atenção: Restam apenas '+IntToStr(vDias) +' dias para expirar';
         7:  Result := 'Atenção: Restam apenas '+IntToStr(vDias) +' dias para expirar';
         8:  Result := 'Atenção: Restam apenas '+IntToStr(vDias) +' dias para expirar';
         9:  Result := 'Atenção: Restam apenas '+IntToStr(vDias) +' dias para expirar';
         10: Result := 'Atenção: Restam apenas '+IntToStr(vDias) +' dias para expirar';
      end;
   end
   else
      Result := 'Atenção:O seu Sistema expirou! entre em contato com a Higtech Informática!';
end;

{ Função data de Expirar }
function fDtExpirar : String; StdCall;
begin
   Result := DateExpire;
end;

Exports
   fInformaExpirar, fDtExpirar;

begin
//
end.
