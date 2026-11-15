package flight;

#if hl

typedef SpringConfig = flight._hl.SpringConfig;

#elseif cpp

typedef SpringConfig = flight._cpp.SpringConfig;

#elseif (js && flight_esm)

typedef SpringConfig = flight._js.SpringConfig;

#elseif js

#error "flight.SpringConfig on js requires flight_esm."

#else

#error "flight.SpringConfig: no backend for this target."

#end
