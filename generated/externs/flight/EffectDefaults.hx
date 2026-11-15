package flight;

#if hl

typedef EffectDefaults = flight._hl.EffectDefaults;

#elseif cpp

typedef EffectDefaults = flight._cpp.EffectDefaults;

#elseif (js && flight_esm)

typedef EffectDefaults = flight._js.EffectDefaults;

#elseif js

#error "flight.EffectDefaults on js requires flight_esm."

#else

#error "flight.EffectDefaults: no backend for this target."

#end
