package flight;

#if hl

typedef StatusBarStyleEntryHandle = flight._hl.StatusBarStyleEntryHandle;

#elseif cpp

typedef StatusBarStyleEntryHandle = flight._cpp.StatusBarStyleEntryHandle;

#elseif (js && flight_esm)

typedef StatusBarStyleEntryHandle = flight._js.StatusBarStyleEntryHandle;

#elseif js

#error "flight.StatusBarStyleEntryHandle on js requires flight_esm."

#else

#error "flight.StatusBarStyleEntryHandle: no backend for this target."

#end
