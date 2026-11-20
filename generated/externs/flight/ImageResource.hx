package flight;

#if hl

typedef ImageResource = flight._hl.ImageResource;

#elseif cpp

typedef ImageResource = flight._cpp.ImageResource;

#elseif (js && flight_esm)

typedef ImageResource = flight._js.ImageResource;

#elseif js

#error "flight.ImageResource on js requires flight_esm."

#else

#error "flight.ImageResource: no backend for this target."

#end
