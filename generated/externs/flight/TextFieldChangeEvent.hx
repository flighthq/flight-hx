package flight;

#if hl

typedef TextFieldChangeEvent = flight._hl.TextFieldChangeEvent;

#elseif cpp

typedef TextFieldChangeEvent = flight._cpp.TextFieldChangeEvent;

#elseif (js && flight_esm)

typedef TextFieldChangeEvent = flight._js.TextFieldChangeEvent;

#elseif js

#error "flight.TextFieldChangeEvent on js requires flight_esm."

#else

#error "flight.TextFieldChangeEvent: no backend for this target."

#end
