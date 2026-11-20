package flight;

#if hl

typedef TextFieldSignals = flight._hl.TextFieldSignals;

#elseif cpp

typedef TextFieldSignals = flight._cpp.TextFieldSignals;

#elseif (js && flight_esm)

typedef TextFieldSignals = flight._js.TextFieldSignals;

#elseif js

#error "flight.TextFieldSignals on js requires flight_esm."

#else

#error "flight.TextFieldSignals: no backend for this target."

#end
