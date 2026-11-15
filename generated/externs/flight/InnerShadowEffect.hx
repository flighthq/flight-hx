package flight;

#if hl

typedef InnerShadowEffect = flight._hl.InnerShadowEffect;

#elseif cpp

typedef InnerShadowEffect = flight._cpp.InnerShadowEffect;

#elseif (js && flight_esm)

typedef InnerShadowEffect = flight._js.InnerShadowEffect;

#elseif js

#error "flight.InnerShadowEffect on js requires flight_esm."

#else

#error "flight.InnerShadowEffect: no backend for this target."

#end
