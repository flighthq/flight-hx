package flight;

#if hl

typedef LensDirtEffect = flight._hl.LensDirtEffect;

#elseif cpp

typedef LensDirtEffect = flight._cpp.LensDirtEffect;

#elseif (js && flight_esm)

typedef LensDirtEffect = flight._js.LensDirtEffect;

#elseif js

#error "flight.LensDirtEffect on js requires flight_esm."

#else

#error "flight.LensDirtEffect: no backend for this target."

#end
