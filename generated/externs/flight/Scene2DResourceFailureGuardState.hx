package flight;

#if hl

typedef Scene2DResourceFailureGuardState = flight._hl.Scene2DResourceFailureGuardState;

#elseif cpp

typedef Scene2DResourceFailureGuardState = flight._cpp.Scene2DResourceFailureGuardState;

#elseif (js && flight_esm)

typedef Scene2DResourceFailureGuardState = flight._js.Scene2DResourceFailureGuardState;

#elseif js

#error "flight.Scene2DResourceFailureGuardState on js requires flight_esm."

#else

#error "flight.Scene2DResourceFailureGuardState: no backend for this target."

#end
