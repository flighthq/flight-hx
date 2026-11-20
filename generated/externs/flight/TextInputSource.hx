package flight;

#if hl

typedef TextInputSource = flight._hl.TextInputSource;

#elseif cpp

typedef TextInputSource = flight._cpp.TextInputSource;

#elseif (js && flight_esm)

typedef TextInputSource = flight._js.TextInputSource;

#elseif js

#error "flight.TextInputSource on js requires flight_esm."

#else

#error "flight.TextInputSource: no backend for this target."

#end
