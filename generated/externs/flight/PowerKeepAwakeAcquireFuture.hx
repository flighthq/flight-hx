package flight;

#if hl

typedef PowerKeepAwakeAcquireFuture = flight._hl.PowerKeepAwakeAcquireFuture;

#elseif cpp

typedef PowerKeepAwakeAcquireFuture = flight._cpp.PowerKeepAwakeAcquireFuture;

#elseif (js && flight_esm)

typedef PowerKeepAwakeAcquireFuture = flight._js.PowerKeepAwakeAcquireFuture;

#elseif js

#error "flight.PowerKeepAwakeAcquireFuture on js requires flight_esm."

#else

#error "flight.PowerKeepAwakeAcquireFuture: no backend for this target."

#end
