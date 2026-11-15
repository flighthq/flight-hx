package flight;

#if hl

typedef BitmapBoxBlurOptions = flight._hl.BitmapBoxBlurOptions;

#elseif cpp

typedef BitmapBoxBlurOptions = flight._cpp.BitmapBoxBlurOptions;

#elseif (js && flight_esm)

typedef BitmapBoxBlurOptions = flight._js.BitmapBoxBlurOptions;

#elseif js

#error "flight.BitmapBoxBlurOptions on js requires flight_esm."

#else

#error "flight.BitmapBoxBlurOptions: no backend for this target."

#end
