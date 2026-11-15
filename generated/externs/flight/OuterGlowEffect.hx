package flight;

#if hl

typedef OuterGlowEffect = flight._hl.OuterGlowEffect;

#elseif cpp

typedef OuterGlowEffect = flight._cpp.OuterGlowEffect;

#elseif (js && flight_esm)

typedef OuterGlowEffect = flight._js.OuterGlowEffect;

#elseif js

#error "flight.OuterGlowEffect on js requires flight_esm."

#else

#error "flight.OuterGlowEffect: no backend for this target."

#end
