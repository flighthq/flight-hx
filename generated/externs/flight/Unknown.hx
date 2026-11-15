package flight;

#if hl

typedef Unknown = flight._hl.Unknown;

#elseif cpp

typedef Unknown = flight._cpp.Unknown;

#elseif (js && flight_esm)

typedef Unknown = flight._js.Unknown;

#elseif js

#error "flight.Unknown on js requires flight_esm."

#else

#error "flight.Unknown: no backend for this target."

#end
