package flight;

#if hl

typedef PerspectiveProjectionOptions = flight._hl.PerspectiveProjectionOptions;

#elseif cpp

typedef PerspectiveProjectionOptions = flight._cpp.PerspectiveProjectionOptions;

#elseif (js && flight_esm)

typedef PerspectiveProjectionOptions = flight._js.PerspectiveProjectionOptions;

#elseif js

#error "flight.PerspectiveProjectionOptions on js requires flight_esm."

#else

#error "flight.PerspectiveProjectionOptions: no backend for this target."

#end
