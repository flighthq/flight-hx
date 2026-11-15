package flight;

#if hl

typedef RimModifier = flight._hl.RimModifier;

#elseif cpp

typedef RimModifier = flight._cpp.RimModifier;

#elseif (js && flight_esm)

typedef RimModifier = flight._js.RimModifier;

#elseif js

#error "flight.RimModifier on js requires flight_esm."

#else

#error "flight.RimModifier: no backend for this target."

#end
