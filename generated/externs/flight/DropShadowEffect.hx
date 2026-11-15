package flight;

#if hl

typedef DropShadowEffect = flight._hl.DropShadowEffect;

#elseif cpp

typedef DropShadowEffect = flight._cpp.DropShadowEffect;

#elseif (js && flight_esm)

typedef DropShadowEffect = flight._js.DropShadowEffect;

#elseif js

#error "flight.DropShadowEffect on js requires flight_esm."

#else

#error "flight.DropShadowEffect: no backend for this target."

#end
