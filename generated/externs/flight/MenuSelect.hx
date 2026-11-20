package flight;

#if hl

typedef MenuSelect = flight._hl.MenuSelect;

#elseif cpp

typedef MenuSelect = flight._cpp.MenuSelect;

#elseif (js && flight_esm)

typedef MenuSelect = flight._js.MenuSelect;

#elseif js

#error "flight.MenuSelect on js requires flight_esm."

#else

#error "flight.MenuSelect: no backend for this target."

#end
