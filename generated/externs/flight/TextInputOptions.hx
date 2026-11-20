package flight;

#if hl

typedef TextInputOptions = flight._hl.TextInputOptions;

#elseif cpp

typedef TextInputOptions = flight._cpp.TextInputOptions;

#elseif (js && flight_esm)

typedef TextInputOptions = flight._js.TextInputOptions;

#elseif js

#error "flight.TextInputOptions on js requires flight_esm."

#else

#error "flight.TextInputOptions: no backend for this target."

#end
