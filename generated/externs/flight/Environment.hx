package flight;

#if hl

typedef Environment = flight._hl.Environment;

#elseif cpp

typedef Environment = flight._cpp.Environment;

#elseif (js && flight_esm)

typedef Environment = flight._js.Environment;

#elseif js

#error "flight.Environment on js requires flight_esm."

#else

#error "flight.Environment: no backend for this target."

#end
