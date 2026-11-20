package flight;

#if hl

typedef InputState = flight._hl.InputState;

#elseif cpp

typedef InputState = flight._cpp.InputState;

#elseif (js && flight_esm)

typedef InputState = flight._js.InputState;

#elseif js

#error "flight.InputState on js requires flight_esm."

#else

#error "flight.InputState: no backend for this target."

#end
