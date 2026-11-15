package flight;

#if hl

typedef BitmapInnerGlowOptions = flight._hl.BitmapInnerGlowOptions;

#elseif cpp

typedef BitmapInnerGlowOptions = flight._cpp.BitmapInnerGlowOptions;

#elseif (js && flight_esm)

typedef BitmapInnerGlowOptions = flight._js.BitmapInnerGlowOptions;

#elseif js

#error "flight.BitmapInnerGlowOptions on js requires flight_esm."

#else

#error "flight.BitmapInnerGlowOptions: no backend for this target."

#end
