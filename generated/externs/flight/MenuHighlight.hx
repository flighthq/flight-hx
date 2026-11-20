package flight;

#if hl

typedef MenuHighlight = flight._hl.MenuHighlight;

#elseif cpp

typedef MenuHighlight = flight._cpp.MenuHighlight;

#elseif (js && flight_esm)

typedef MenuHighlight = flight._js.MenuHighlight;

#elseif js

#error "flight.MenuHighlight on js requires flight_esm."

#else

#error "flight.MenuHighlight: no backend for this target."

#end
