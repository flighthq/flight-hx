package flight;

#if hl

typedef InputManager = flight._hl.InputManager;

#elseif cpp

typedef InputManager = flight._cpp.InputManager;

#elseif (js && flight_esm)

typedef InputManager = flight._js.InputManager;

#elseif js

#error "flight.InputManager on js requires flight_esm."

#else

#error "flight.InputManager: no backend for this target."

#end
