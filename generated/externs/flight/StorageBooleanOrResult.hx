package flight;

#if hl

typedef StorageBooleanOrResult = flight._hl.StorageBooleanOrResult;

#elseif cpp

typedef StorageBooleanOrResult = flight._cpp.StorageBooleanOrResult;

#elseif (js && flight_esm)

typedef StorageBooleanOrResult = flight._js.StorageBooleanOrResult;

#elseif js

#error "flight.StorageBooleanOrResult on js requires flight_esm."

#else

#error "flight.StorageBooleanOrResult: no backend for this target."

#end
