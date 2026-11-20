package flight;

#if hl

typedef SsrEffect = flight._hl.SsrEffect;

#elseif cpp

typedef SsrEffect = flight._cpp.SsrEffect;

#elseif (js && flight_esm)

typedef SsrEffect = flight._js.SsrEffect;

#elseif js

#error "flight.SsrEffect on js requires flight_esm."

#else

#error "flight.SsrEffect: no backend for this target."

#end
