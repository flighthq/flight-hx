package flight;

#if hl

typedef SoftKeyboard = flight._hl.SoftKeyboard;

#elseif cpp

typedef SoftKeyboard = flight._cpp.SoftKeyboard;

#elseif (js && flight_esm)

typedef SoftKeyboard = flight._js.SoftKeyboard;

#elseif js

#error "flight.SoftKeyboard on js requires flight_esm."

#else

#error "flight.SoftKeyboard: no backend for this target."

#end
