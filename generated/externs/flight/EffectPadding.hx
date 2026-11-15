package flight;

#if hl

typedef EffectPadding = flight._hl.EffectPadding;

#elseif cpp

typedef EffectPadding = flight._cpp.EffectPadding;

#elseif (js && flight_esm)

typedef EffectPadding = flight._js.EffectPadding;

#elseif js

#error "flight.EffectPadding on js requires flight_esm."

#else

#error "flight.EffectPadding: no backend for this target."

#end
