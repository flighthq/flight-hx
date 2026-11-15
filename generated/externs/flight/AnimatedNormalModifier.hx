package flight;

#if hl

typedef AnimatedNormalModifier = flight._hl.AnimatedNormalModifier;

#elseif cpp

typedef AnimatedNormalModifier = flight._cpp.AnimatedNormalModifier;

#elseif (js && flight_esm)

typedef AnimatedNormalModifier = flight._js.AnimatedNormalModifier;

#elseif js

#error "flight.AnimatedNormalModifier on js requires flight_esm."

#else

#error "flight.AnimatedNormalModifier: no backend for this target."

#end
