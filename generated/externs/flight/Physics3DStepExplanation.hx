package flight;

#if hl

typedef Physics3DStepExplanation = flight._hl.Physics3DStepExplanation;

#elseif cpp

typedef Physics3DStepExplanation = flight._cpp.Physics3DStepExplanation;

#elseif (js && flight_esm)

typedef Physics3DStepExplanation = flight._js.Physics3DStepExplanation;

#elseif js

#error "flight.Physics3DStepExplanation on js requires flight_esm."

#else

#error "flight.Physics3DStepExplanation: no backend for this target."

#end
