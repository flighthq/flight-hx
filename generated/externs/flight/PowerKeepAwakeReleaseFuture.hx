package flight;

#if hl

typedef PowerKeepAwakeReleaseFuture = flight._hl.PowerKeepAwakeReleaseFuture;

#elseif cpp

typedef PowerKeepAwakeReleaseFuture = flight._cpp.PowerKeepAwakeReleaseFuture;

#elseif (js && flight_esm)

typedef PowerKeepAwakeReleaseFuture = flight._js.PowerKeepAwakeReleaseFuture;

#elseif js

#error "flight.PowerKeepAwakeReleaseFuture on js requires flight_esm."

#else

#error "flight.PowerKeepAwakeReleaseFuture: no backend for this target."

#end
