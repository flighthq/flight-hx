package flight;

#if hl

typedef SpritesheetValidationDiagnostic = flight._hl.SpritesheetValidationDiagnostic;

#elseif cpp

typedef SpritesheetValidationDiagnostic = flight._cpp.SpritesheetValidationDiagnostic;

#elseif (js && flight_esm)

typedef SpritesheetValidationDiagnostic = flight._js.SpritesheetValidationDiagnostic;

#elseif js

#error "flight.SpritesheetValidationDiagnostic on js requires flight_esm."

#else

#error "flight.SpritesheetValidationDiagnostic: no backend for this target."

#end
