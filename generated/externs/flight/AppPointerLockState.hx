package flight;

#if hl

typedef AppPointerLockState = flight._hl.AppPointerLockState;

#elseif cpp

typedef AppPointerLockState = flight._cpp.AppPointerLockState;

#elseif (js && flight_esm)

typedef AppPointerLockState = flight._js.AppPointerLockState;

#elseif js

#error "flight.AppPointerLockState on js requires flight_esm."

#else

#error "flight.AppPointerLockState: no backend for this target."

#end
