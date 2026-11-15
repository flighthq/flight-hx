package flight;

#if hl

typedef ListFormatOptions = flight._hl.ListFormatOptions;

#elseif cpp

typedef ListFormatOptions = flight._cpp.ListFormatOptions;

#elseif (js && flight_esm)

typedef ListFormatOptions = flight._js.ListFormatOptions;

#elseif js

#error "flight.ListFormatOptions on js requires flight_esm."

#else

#error "flight.ListFormatOptions: no backend for this target."

#end
