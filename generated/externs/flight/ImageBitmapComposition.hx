package flight;

#if hl

typedef ImageBitmapComposition = flight._hl.ImageBitmapComposition;

#elseif cpp

typedef ImageBitmapComposition = flight._cpp.ImageBitmapComposition;

#elseif (js && flight_esm)

typedef ImageBitmapComposition = flight._js.ImageBitmapComposition;

#elseif js

#error "flight.ImageBitmapComposition on js requires flight_esm."

#else

#error "flight.ImageBitmapComposition: no backend for this target."

#end
