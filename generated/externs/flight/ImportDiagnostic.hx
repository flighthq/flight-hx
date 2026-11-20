package flight;

#if hl

typedef ImportDiagnostic = flight._hl.ImportDiagnostic;

#elseif cpp

typedef ImportDiagnostic = flight._cpp.ImportDiagnostic;

#elseif (js && flight_esm)

typedef ImportDiagnostic = flight._js.ImportDiagnostic;

#elseif js

#error "flight.ImportDiagnostic on js requires flight_esm."

#else

#error "flight.ImportDiagnostic: no backend for this target."

#end
