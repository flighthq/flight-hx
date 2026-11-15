package flight;

#if hl

typedef BitmapDropShadowOptions = flight._hl.BitmapDropShadowOptions;

#elseif cpp

typedef BitmapDropShadowOptions = flight._cpp.BitmapDropShadowOptions;

#elseif (js && flight_esm)

typedef BitmapDropShadowOptions = flight._js.BitmapDropShadowOptions;

#elseif js

#error "flight.BitmapDropShadowOptions on js requires flight_esm."

#else

#error "flight.BitmapDropShadowOptions: no backend for this target."

#end
