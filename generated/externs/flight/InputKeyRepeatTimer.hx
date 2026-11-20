package flight;

#if hl

typedef InputKeyRepeatTimer = flight._hl.InputKeyRepeatTimer;

#elseif cpp

typedef InputKeyRepeatTimer = flight._cpp.InputKeyRepeatTimer;

#elseif (js && flight_esm)

typedef InputKeyRepeatTimer = flight._js.InputKeyRepeatTimer;

#elseif js

#error "flight.InputKeyRepeatTimer on js requires flight_esm."

#else

#error "flight.InputKeyRepeatTimer: no backend for this target."

#end
