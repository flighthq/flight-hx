package flight;

#if hl

typedef DecodedImage = flight._hl.DecodedImage;

#elseif cpp

typedef DecodedImage = flight._cpp.DecodedImage;

#elseif (js && flight_esm)

typedef DecodedImage = flight._js.DecodedImage;

#elseif js

#error "flight.DecodedImage on js requires flight_esm."

#else

#error "flight.DecodedImage: no backend for this target."

#end
