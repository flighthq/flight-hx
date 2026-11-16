package flight;

#if hl

typedef FontFaceSourceUrl = flight._hl.FontFaceSourceUrl;

#elseif cpp

typedef FontFaceSourceUrl = flight._cpp.FontFaceSourceUrl;

#elseif (js && flight_esm)

typedef FontFaceSourceUrl = flight._js.FontFaceSourceUrl;

#elseif js

#error "flight.FontFaceSourceUrl on js requires flight_esm."

#else

#error "flight.FontFaceSourceUrl: no backend for this target."

#end
