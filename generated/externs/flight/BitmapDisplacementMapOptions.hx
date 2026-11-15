package flight;

#if hl

typedef BitmapDisplacementMapOptions = flight._hl.BitmapDisplacementMapOptions;

#elseif cpp

typedef BitmapDisplacementMapOptions = flight._cpp.BitmapDisplacementMapOptions;

#elseif (js && flight_esm)

typedef BitmapDisplacementMapOptions = flight._js.BitmapDisplacementMapOptions;

#elseif js

#error "flight.BitmapDisplacementMapOptions on js requires flight_esm."

#else

#error "flight.BitmapDisplacementMapOptions: no backend for this target."

#end
