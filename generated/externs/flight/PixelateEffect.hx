package flight;

#if hl

typedef PixelateEffect = flight._hl.PixelateEffect;

#elseif cpp

typedef PixelateEffect = flight._cpp.PixelateEffect;

#elseif (js && flight_esm)

typedef PixelateEffect = flight._js.PixelateEffect;

#elseif js

#error "flight.PixelateEffect on js requires flight_esm."

#else

#error "flight.PixelateEffect: no backend for this target."

#end
