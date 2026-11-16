package flight;

#if hl

typedef FontFace = flight._hl.FontFace;

#elseif cpp

typedef FontFace = flight._cpp.FontFace;

#elseif (js && flight_esm)

typedef FontFace = flight._js.FontFace;

#elseif js

#error "flight.FontFace on js requires flight_esm."

#else

#error "flight.FontFace: no backend for this target."

#end
