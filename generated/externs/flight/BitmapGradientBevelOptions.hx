package flight;

#if hl

typedef BitmapGradientBevelOptions = flight._hl.BitmapGradientBevelOptions;

#elseif cpp

typedef BitmapGradientBevelOptions = flight._cpp.BitmapGradientBevelOptions;

#elseif (js && flight_esm)

typedef BitmapGradientBevelOptions = flight._js.BitmapGradientBevelOptions;

#elseif js

#error "flight.BitmapGradientBevelOptions on js requires flight_esm."

#else

#error "flight.BitmapGradientBevelOptions: no backend for this target."

#end
