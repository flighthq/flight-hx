package flight;

#if hl

typedef SharpenEffect = flight._hl.SharpenEffect;

#elseif cpp

typedef SharpenEffect = flight._cpp.SharpenEffect;

#elseif (js && flight_esm)

typedef SharpenEffect = flight._js.SharpenEffect;

#elseif js

#error "flight.SharpenEffect on js requires flight_esm."

#else

#error "flight.SharpenEffect: no backend for this target."

#end
