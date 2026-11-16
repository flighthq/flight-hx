package flight;

#if hl

typedef Scene3DGuardState = flight._hl.Scene3DGuardState;

#elseif cpp

typedef Scene3DGuardState = flight._cpp.Scene3DGuardState;

#elseif (js && flight_esm)

typedef Scene3DGuardState = flight._js.Scene3DGuardState;

#elseif js

#error "flight.Scene3DGuardState on js requires flight_esm."

#else

#error "flight.Scene3DGuardState: no backend for this target."

#end
