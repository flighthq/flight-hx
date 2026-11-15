package flight;

#if hl

typedef InnerGlowEffect = flight._hl.InnerGlowEffect;

#elseif cpp

typedef InnerGlowEffect = flight._cpp.InnerGlowEffect;

#elseif (js && flight_esm)

typedef InnerGlowEffect = flight._js.InnerGlowEffect;

#elseif js

#error "flight.InnerGlowEffect on js requires flight_esm."

#else

#error "flight.InnerGlowEffect: no backend for this target."

#end
