package flight;

#if hl

typedef StatusBarStyleEntry = flight._hl.StatusBarStyleEntry;

#elseif cpp

typedef StatusBarStyleEntry = flight._cpp.StatusBarStyleEntry;

#elseif (js && flight_esm)

typedef StatusBarStyleEntry = flight._js.StatusBarStyleEntry;

#elseif js

#error "flight.StatusBarStyleEntry on js requires flight_esm."

#else

#error "flight.StatusBarStyleEntry: no backend for this target."

#end
