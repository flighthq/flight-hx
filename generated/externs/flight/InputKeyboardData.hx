package flight;

#if hl

typedef InputKeyboardData = flight._hl.InputKeyboardData;

#elseif cpp

typedef InputKeyboardData = flight._cpp.InputKeyboardData;

#elseif (js && flight_esm)

typedef InputKeyboardData = flight._js.InputKeyboardData;

#elseif js

#error "flight.InputKeyboardData on js requires flight_esm."

#else

#error "flight.InputKeyboardData: no backend for this target."

#end
