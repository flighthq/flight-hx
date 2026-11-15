package flight;

#if hl

typedef EntityRuntimeWriteExplanation = flight._hl.EntityRuntimeWriteExplanation;

#elseif cpp

typedef EntityRuntimeWriteExplanation = flight._cpp.EntityRuntimeWriteExplanation;

#elseif (js && flight_esm)

typedef EntityRuntimeWriteExplanation = flight._js.EntityRuntimeWriteExplanation;

#elseif js

#error "flight.EntityRuntimeWriteExplanation on js requires flight_esm."

#else

#error "flight.EntityRuntimeWriteExplanation: no backend for this target."

#end
