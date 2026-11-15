package flight;

#if hl

typedef FogModifier = flight._hl.FogModifier;

#elseif cpp

typedef FogModifier = flight._cpp.FogModifier;

#elseif (js && flight_esm)

typedef FogModifier = flight._js.FogModifier;

#elseif js

#error "flight.FogModifier on js requires flight_esm."

#else

#error "flight.FogModifier: no backend for this target."

#end
