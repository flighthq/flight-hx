package flight;

#if hl

typedef HalftoneEffect = flight._hl.HalftoneEffect;

#elseif cpp

typedef HalftoneEffect = flight._cpp.HalftoneEffect;

#elseif (js && flight_esm)

typedef HalftoneEffect = flight._js.HalftoneEffect;

#elseif js

#error "flight.HalftoneEffect on js requires flight_esm."

#else

#error "flight.HalftoneEffect: no backend for this target."

#end
