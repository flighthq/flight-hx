package flight;

#if hl

typedef StatusBarInfo = flight._hl.StatusBarInfo;

#elseif cpp

typedef StatusBarInfo = flight._cpp.StatusBarInfo;

#elseif (js && flight_esm)

typedef StatusBarInfo = flight._js.StatusBarInfo;

#elseif js

#error "flight.StatusBarInfo on js requires flight_esm."

#else

#error "flight.StatusBarInfo: no backend for this target."

#end
