package flight;

#if hl

typedef EffectRef = flight._hl.EffectRef;

#elseif cpp

typedef EffectRef = flight._cpp.EffectRef;

#elseif (js && flight_esm)

typedef EffectRef = flight._js.EffectRef;

#elseif js

#error "flight.EffectRef on js requires flight_esm."

#else

#error "flight.EffectRef: no backend for this target."

#end
