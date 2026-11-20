package flight;

#if hl

typedef CommandBinding = flight._hl.CommandBinding;

#elseif cpp

typedef CommandBinding = flight._cpp.CommandBinding;

#elseif (js && flight_esm)

typedef CommandBinding = flight._js.CommandBinding;

#elseif js

#error "flight.CommandBinding on js requires flight_esm."

#else

#error "flight.CommandBinding: no backend for this target."

#end
