package flight;

#if hl

typedef BitmapGlowOptions = flight._hl.BitmapGlowOptions;

#elseif cpp

typedef BitmapGlowOptions = flight._cpp.BitmapGlowOptions;

#elseif (js && flight_esm)

typedef BitmapGlowOptions = flight._js.BitmapGlowOptions;

#elseif js

#error "flight.BitmapGlowOptions on js requires flight_esm."

#else

#error "flight.BitmapGlowOptions: no backend for this target."

#end
