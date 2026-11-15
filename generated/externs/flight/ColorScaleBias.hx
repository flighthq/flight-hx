package flight;

#if hl

typedef ColorScaleBias = flight._hl.ColorScaleBias;

#elseif cpp

typedef ColorScaleBias = flight._cpp.ColorScaleBias;

#elseif (js && flight_esm)

typedef ColorScaleBias = flight._js.ColorScaleBias;

#elseif js

#error "flight.ColorScaleBias on js requires flight_esm."

#else

#error "flight.ColorScaleBias: no backend for this target."

#end
