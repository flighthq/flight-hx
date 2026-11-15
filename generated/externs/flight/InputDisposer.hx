package flight;

#if hl

typedef InputDisposer = flight._hl.InputDisposer;

#elseif cpp

typedef InputDisposer = flight._cpp.InputDisposer;

#elseif (js && flight_esm)

typedef InputDisposer = flight._js.InputDisposer;

#elseif js

#error "flight.InputDisposer on js requires flight_esm."

#else

#error "flight.InputDisposer: no backend for this target."

#end
