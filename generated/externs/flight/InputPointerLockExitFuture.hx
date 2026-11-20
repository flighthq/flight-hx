package flight;

#if hl

typedef InputPointerLockExitFuture = flight._hl.InputPointerLockExitFuture;

#elseif cpp

typedef InputPointerLockExitFuture = flight._cpp.InputPointerLockExitFuture;

#elseif (js && flight_esm)

typedef InputPointerLockExitFuture = flight._js.InputPointerLockExitFuture;

#elseif js

#error "flight.InputPointerLockExitFuture on js requires flight_esm."

#else

#error "flight.InputPointerLockExitFuture: no backend for this target."

#end
