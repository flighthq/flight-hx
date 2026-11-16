package flight;

#if hl

typedef WoffChecksumMismatch = flight._hl.WoffChecksumMismatch;

#elseif cpp

typedef WoffChecksumMismatch = flight._cpp.WoffChecksumMismatch;

#elseif (js && flight_esm)

typedef WoffChecksumMismatch = flight._js.WoffChecksumMismatch;

#elseif js

#error "flight.WoffChecksumMismatch on js requires flight_esm."

#else

#error "flight.WoffChecksumMismatch: no backend for this target."

#end
