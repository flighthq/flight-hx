package flight;

#if hl

typedef ToonModifier = flight._hl.ToonModifier;

#elseif cpp

typedef ToonModifier = flight._cpp.ToonModifier;

#elseif (js && flight_esm)

typedef ToonModifier = flight._js.ToonModifier;

#elseif js

#error "flight.ToonModifier on js requires flight_esm."

#else

#error "flight.ToonModifier: no backend for this target."

#end
