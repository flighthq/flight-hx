package flight;

#if hl

typedef BitmapGradientGlowOptions = flight._hl.BitmapGradientGlowOptions;

#elseif cpp

typedef BitmapGradientGlowOptions = flight._cpp.BitmapGradientGlowOptions;

#elseif (js && flight_esm)

typedef BitmapGradientGlowOptions = flight._js.BitmapGradientGlowOptions;

#elseif js

#error "flight.BitmapGradientGlowOptions on js requires flight_esm."

#else

#error "flight.BitmapGradientGlowOptions: no backend for this target."

#end
