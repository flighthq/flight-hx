package flight;

#if hl

typedef CollatorOptions = flight._hl.CollatorOptions;

#elseif cpp

typedef CollatorOptions = flight._cpp.CollatorOptions;

#elseif (js && flight_esm)

typedef CollatorOptions = flight._js.CollatorOptions;

#elseif js

#error "flight.CollatorOptions on js requires flight_esm."

#else

#error "flight.CollatorOptions: no backend for this target."

#end
