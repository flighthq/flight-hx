package flight;

#if hl

typedef DisplacementEffect = flight._hl.DisplacementEffect;

#elseif cpp

typedef DisplacementEffect = flight._cpp.DisplacementEffect;

#elseif (js && flight_esm)

typedef DisplacementEffect = flight._js.DisplacementEffect;

#elseif js

#error "flight.DisplacementEffect on js requires flight_esm."

#else

#error "flight.DisplacementEffect: no backend for this target."

#end
