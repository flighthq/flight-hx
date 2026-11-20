package flight;

#if hl

typedef StorageBooleanResult = flight._hl.StorageBooleanResult;

#elseif cpp

typedef StorageBooleanResult = flight._cpp.StorageBooleanResult;

#elseif (js && flight_esm)

typedef StorageBooleanResult = flight._js.StorageBooleanResult;

#elseif js

#error "flight.StorageBooleanResult on js requires flight_esm."

#else

#error "flight.StorageBooleanResult: no backend for this target."

#end
