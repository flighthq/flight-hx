package flight;

#if hl

typedef BackendOperationExplanation = flight._hl.BackendOperationExplanation;

#elseif cpp

typedef BackendOperationExplanation = flight._cpp.BackendOperationExplanation;

#elseif (js && flight_esm)

typedef BackendOperationExplanation = flight._js.BackendOperationExplanation;

#elseif js

#error "flight.BackendOperationExplanation on js requires flight_esm."

#else

#error "flight.BackendOperationExplanation: no backend for this target."

#end
