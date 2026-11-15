package flight;

#if hl

typedef EntityRuntimeWriteGuard = flight._hl.EntityRuntimeWriteGuard;

#elseif cpp

typedef EntityRuntimeWriteGuard = flight._cpp.EntityRuntimeWriteGuard;

#elseif (js && flight_esm)

typedef EntityRuntimeWriteGuard = flight._js.EntityRuntimeWriteGuard;

#elseif js

#error "flight.EntityRuntimeWriteGuard on js requires flight_esm."

#else

#error "flight.EntityRuntimeWriteGuard: no backend for this target."

#end
