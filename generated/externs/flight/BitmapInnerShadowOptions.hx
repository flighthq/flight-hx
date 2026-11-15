package flight;

#if hl

typedef BitmapInnerShadowOptions = flight._hl.BitmapInnerShadowOptions;

#elseif cpp

typedef BitmapInnerShadowOptions = flight._cpp.BitmapInnerShadowOptions;

#elseif (js && flight_esm)

typedef BitmapInnerShadowOptions = flight._js.BitmapInnerShadowOptions;

#elseif js

#error "flight.BitmapInnerShadowOptions on js requires flight_esm."

#else

#error "flight.BitmapInnerShadowOptions: no backend for this target."

#end
