package flight;

#if hl

typedef Physics2DStepExplanation = flight._hl.Physics2DStepExplanation;

#elseif cpp

typedef Physics2DStepExplanation = flight._cpp.Physics2DStepExplanation;

#elseif (js && flight_esm)

typedef Physics2DStepExplanation = flight._js.Physics2DStepExplanation;

#elseif js

#error "flight.Physics2DStepExplanation on js requires flight_esm."

#else

#error "flight.Physics2DStepExplanation: no backend for this target."

#end
