package flight;

#if hl

typedef TextInputState = flight._hl.TextInputState;

#elseif cpp

typedef TextInputState = flight._cpp.TextInputState;

#elseif (js && flight_esm)

typedef TextInputState = flight._js.TextInputState;

#elseif js

#error "flight.TextInputState on js requires flight_esm."

#else

#error "flight.TextInputState: no backend for this target."

#end
