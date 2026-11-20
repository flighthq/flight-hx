package flight;

#if hl

typedef ShareResult = flight._hl.ShareResult;

#elseif cpp

typedef ShareResult = flight._cpp.ShareResult;

#elseif (js && flight_esm)

typedef ShareResult = flight._js.ShareResult;

#elseif js

#error "flight.ShareResult on js requires flight_esm."

#else

#error "flight.ShareResult: no backend for this target."

#end
