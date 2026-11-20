package flight;

#if hl

typedef TextInputDisposer = flight._hl.TextInputDisposer;

#elseif cpp

typedef TextInputDisposer = flight._cpp.TextInputDisposer;

#elseif (js && flight_esm)

typedef TextInputDisposer = flight._js.TextInputDisposer;

#elseif js

#error "flight.TextInputDisposer on js requires flight_esm."

#else

#error "flight.TextInputDisposer: no backend for this target."

#end
