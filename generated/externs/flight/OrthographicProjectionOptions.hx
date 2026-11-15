package flight;

#if hl

typedef OrthographicProjectionOptions = flight._hl.OrthographicProjectionOptions;

#elseif cpp

typedef OrthographicProjectionOptions = flight._cpp.OrthographicProjectionOptions;

#elseif (js && flight_esm)

typedef OrthographicProjectionOptions = flight._js.OrthographicProjectionOptions;

#elseif js

#error "flight.OrthographicProjectionOptions on js requires flight_esm."

#else

#error "flight.OrthographicProjectionOptions: no backend for this target."

#end
