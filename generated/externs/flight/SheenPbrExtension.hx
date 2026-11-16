package flight;

#if hl

typedef SheenPbrExtension = flight._hl.SheenPbrExtension;

#elseif cpp

typedef SheenPbrExtension = flight._cpp.SheenPbrExtension;

#elseif (js && flight_esm)

typedef SheenPbrExtension = flight._js.SheenPbrExtension;

#elseif js

#error "flight.SheenPbrExtension on js requires flight_esm."

#else

#error "flight.SheenPbrExtension: no backend for this target."

#end
