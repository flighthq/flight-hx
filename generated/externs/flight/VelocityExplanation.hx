package flight;

#if hl

typedef VelocityExplanation = flight._hl.VelocityExplanation;

#elseif cpp

typedef VelocityExplanation = flight._cpp.VelocityExplanation;

#elseif (js && flight_esm)

typedef VelocityExplanation = flight._js.VelocityExplanation;

#elseif js

#error "flight.VelocityExplanation on js requires flight_esm."

#else

#error "flight.VelocityExplanation: no backend for this target."

#end
