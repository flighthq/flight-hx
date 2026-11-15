package flight;

#if hl

typedef HslColor = flight._hl.HslColor;

#elseif cpp

typedef HslColor = flight._cpp.HslColor;

#elseif (js && flight_esm)

typedef HslColor = flight._js.HslColor;

#elseif js

#error "flight.HslColor on js requires flight_esm."

#else

#error "flight.HslColor: no backend for this target."

#end
