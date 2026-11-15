package flight;

#if hl

typedef HsvColor = flight._hl.HsvColor;

#elseif cpp

typedef HsvColor = flight._cpp.HsvColor;

#elseif (js && flight_esm)

typedef HsvColor = flight._js.HsvColor;

#elseif js

#error "flight.HsvColor on js requires flight_esm."

#else

#error "flight.HsvColor: no backend for this target."

#end
