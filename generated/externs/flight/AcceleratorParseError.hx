package flight;

#if hl

typedef AcceleratorParseError = flight._hl.AcceleratorParseError;

#elseif cpp

typedef AcceleratorParseError = flight._cpp.AcceleratorParseError;

#elseif (js && flight_esm)

typedef AcceleratorParseError = flight._js.AcceleratorParseError;

#elseif js

#error "flight.AcceleratorParseError on js requires flight_esm."

#else

#error "flight.AcceleratorParseError: no backend for this target."

#end
