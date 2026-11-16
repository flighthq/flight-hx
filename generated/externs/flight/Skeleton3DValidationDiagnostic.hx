package flight;

#if hl

typedef Skeleton3DValidationDiagnostic = flight._hl.Skeleton3DValidationDiagnostic;

#elseif cpp

typedef Skeleton3DValidationDiagnostic = flight._cpp.Skeleton3DValidationDiagnostic;

#elseif (js && flight_esm)

typedef Skeleton3DValidationDiagnostic = flight._js.Skeleton3DValidationDiagnostic;

#elseif js

#error "flight.Skeleton3DValidationDiagnostic on js requires flight_esm."

#else

#error "flight.Skeleton3DValidationDiagnostic: no backend for this target."

#end
