package flight;

#if hl

typedef AnimationTrackValidationDiagnostic = flight._hl.AnimationTrackValidationDiagnostic;

#elseif cpp

typedef AnimationTrackValidationDiagnostic = flight._cpp.AnimationTrackValidationDiagnostic;

#elseif (js && flight_esm)

typedef AnimationTrackValidationDiagnostic = flight._js.AnimationTrackValidationDiagnostic;

#elseif js

#error "flight.AnimationTrackValidationDiagnostic on js requires flight_esm."

#else

#error "flight.AnimationTrackValidationDiagnostic: no backend for this target."

#end
