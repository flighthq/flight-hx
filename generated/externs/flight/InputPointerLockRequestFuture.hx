package flight;

#if hl

typedef InputPointerLockRequestFuture = flight._hl.InputPointerLockRequestFuture;

#elseif cpp

typedef InputPointerLockRequestFuture = flight._cpp.InputPointerLockRequestFuture;

#elseif (js && flight_esm)

typedef InputPointerLockRequestFuture = flight._js.InputPointerLockRequestFuture;

#elseif js

#error "flight.InputPointerLockRequestFuture on js requires flight_esm."

#else

#error "flight.InputPointerLockRequestFuture: no backend for this target."

#end
