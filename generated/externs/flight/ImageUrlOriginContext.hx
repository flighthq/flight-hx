package flight;

#if hl

typedef ImageUrlOriginContext = flight._hl.ImageUrlOriginContext;

#elseif cpp

typedef ImageUrlOriginContext = flight._cpp.ImageUrlOriginContext;

#elseif (js && flight_esm)

typedef ImageUrlOriginContext = flight._js.ImageUrlOriginContext;

#elseif js

#error "flight.ImageUrlOriginContext on js requires flight_esm."

#else

#error "flight.ImageUrlOriginContext: no backend for this target."

#end
