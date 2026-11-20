package flight;

#if hl

typedef AppLoginItem = flight._hl.AppLoginItem;

#elseif cpp

typedef AppLoginItem = flight._cpp.AppLoginItem;

#elseif (js && flight_esm)

typedef AppLoginItem = flight._js.AppLoginItem;

#elseif js

#error "flight.AppLoginItem on js requires flight_esm."

#else

#error "flight.AppLoginItem: no backend for this target."

#end
