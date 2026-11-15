package flight;

#if hl

typedef BitmapSharpenOptions = flight._hl.BitmapSharpenOptions;

#elseif cpp

typedef BitmapSharpenOptions = flight._cpp.BitmapSharpenOptions;

#elseif (js && flight_esm)

typedef BitmapSharpenOptions = flight._js.BitmapSharpenOptions;

#elseif js

#error "flight.BitmapSharpenOptions on js requires flight_esm."

#else

#error "flight.BitmapSharpenOptions: no backend for this target."

#end
