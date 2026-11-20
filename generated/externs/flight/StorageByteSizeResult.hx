package flight;

#if hl

typedef StorageByteSizeResult = flight._hl.StorageByteSizeResult;

#elseif cpp

typedef StorageByteSizeResult = flight._cpp.StorageByteSizeResult;

#elseif (js && flight_esm)

typedef StorageByteSizeResult = flight._js.StorageByteSizeResult;

#elseif js

#error "flight.StorageByteSizeResult on js requires flight_esm."

#else

#error "flight.StorageByteSizeResult: no backend for this target."

#end
