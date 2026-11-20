package flight;

#if hl

typedef DialogImage = flight._hl.DialogImage;

#elseif cpp

typedef DialogImage = flight._cpp.DialogImage;

#elseif (js && flight_esm)

typedef DialogImage = flight._js.DialogImage;

#elseif js

#error "flight.DialogImage on js requires flight_esm."

#else

#error "flight.DialogImage: no backend for this target."

#end
