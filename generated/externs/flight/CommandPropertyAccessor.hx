package flight;

#if hl

typedef CommandPropertyAccessor = flight._hl.CommandPropertyAccessor;

#elseif cpp

typedef CommandPropertyAccessor = flight._cpp.CommandPropertyAccessor;

#elseif (js && flight_esm)

typedef CommandPropertyAccessor = flight._js.CommandPropertyAccessor;

#elseif js

#error "flight.CommandPropertyAccessor on js requires flight_esm."

#else

#error "flight.CommandPropertyAccessor: no backend for this target."

#end
