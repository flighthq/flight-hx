package flight;

#if hl

typedef TextFieldScrollEvent = flight._hl.TextFieldScrollEvent;

#elseif cpp

typedef TextFieldScrollEvent = flight._cpp.TextFieldScrollEvent;

#elseif (js && flight_esm)

typedef TextFieldScrollEvent = flight._js.TextFieldScrollEvent;

#elseif js

#error "flight.TextFieldScrollEvent on js requires flight_esm."

#else

#error "flight.TextFieldScrollEvent: no backend for this target."

#end
