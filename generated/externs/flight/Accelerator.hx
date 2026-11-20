package flight;

#if hl

typedef Accelerator = flight._hl.Accelerator;

#elseif cpp

typedef Accelerator = flight._cpp.Accelerator;

#elseif (js && flight_esm)

typedef Accelerator = flight._js.Accelerator;

#elseif js

#error "flight.Accelerator on js requires flight_esm."

#else

#error "flight.Accelerator: no backend for this target."

#end
