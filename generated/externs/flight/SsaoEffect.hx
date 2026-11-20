package flight;

#if hl

typedef SsaoEffect = flight._hl.SsaoEffect;

#elseif cpp

typedef SsaoEffect = flight._cpp.SsaoEffect;

#elseif (js && flight_esm)

typedef SsaoEffect = flight._js.SsaoEffect;

#elseif js

#error "flight.SsaoEffect on js requires flight_esm."

#else

#error "flight.SsaoEffect: no backend for this target."

#end
