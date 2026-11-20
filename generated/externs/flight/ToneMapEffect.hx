package flight;

#if hl

typedef ToneMapEffect = flight._hl.ToneMapEffect;

#elseif cpp

typedef ToneMapEffect = flight._cpp.ToneMapEffect;

#elseif (js && flight_esm)

typedef ToneMapEffect = flight._js.ToneMapEffect;

#elseif js

#error "flight.ToneMapEffect on js requires flight_esm."

#else

#error "flight.ToneMapEffect: no backend for this target."

#end
