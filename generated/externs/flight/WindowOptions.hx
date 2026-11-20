package flight;

#if hl

typedef WindowOptions = flight._hl.WindowOptions;

#elseif cpp

typedef WindowOptions = flight._cpp.WindowOptions;

#elseif (js && flight_esm)

typedef WindowOptions = flight._js.WindowOptions;

#elseif js

#error "flight.WindowOptions on js requires flight_esm."

#else

#error "flight.WindowOptions: no backend for this target."

#end
