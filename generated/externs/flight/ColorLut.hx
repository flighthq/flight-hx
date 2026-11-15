package flight;

#if hl

typedef ColorLut = flight._hl.ColorLut;

#elseif cpp

typedef ColorLut = flight._cpp.ColorLut;

#elseif (js && flight_esm)

typedef ColorLut = flight._js.ColorLut;

#elseif js

#error "flight.ColorLut on js requires flight_esm."

#else

#error "flight.ColorLut: no backend for this target."

#end
