package flight;

#if hl

typedef Awd2ParsedJoint = flight._hl.Awd2ParsedJoint;

#elseif cpp

typedef Awd2ParsedJoint = flight._cpp.Awd2ParsedJoint;

#elseif (js && flight_esm)

typedef Awd2ParsedJoint = flight._js.Awd2ParsedJoint;

#elseif js

#error "flight.Awd2ParsedJoint on js requires flight_esm."

#else

#error "flight.Awd2ParsedJoint: no backend for this target."

#end
