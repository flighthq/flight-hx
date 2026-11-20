package flight;

#if hl

typedef TextInputManager = flight._hl.TextInputManager;

#elseif cpp

typedef TextInputManager = flight._cpp.TextInputManager;

#elseif (js && flight_esm)

typedef TextInputManager = flight._js.TextInputManager;

#elseif js

#error "flight.TextInputManager on js requires flight_esm."

#else

#error "flight.TextInputManager: no backend for this target."

#end
