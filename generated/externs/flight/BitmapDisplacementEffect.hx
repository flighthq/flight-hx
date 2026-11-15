package flight;

#if hl

typedef BitmapDisplacementEffect = flight._hl.BitmapDisplacementEffect;

#elseif cpp

typedef BitmapDisplacementEffect = flight._cpp.BitmapDisplacementEffect;

#elseif (js && flight_esm)

typedef BitmapDisplacementEffect = flight._js.BitmapDisplacementEffect;

#elseif js

#error "flight.BitmapDisplacementEffect on js requires flight_esm."

#else

#error "flight.BitmapDisplacementEffect: no backend for this target."

#end
