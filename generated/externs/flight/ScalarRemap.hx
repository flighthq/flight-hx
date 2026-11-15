package flight;

#if hl

typedef ScalarRemap = flight._hl.ScalarRemap;

#elseif cpp

typedef ScalarRemap = flight._cpp.ScalarRemap;

#elseif (js && flight_esm)

typedef ScalarRemap = flight._js.ScalarRemap;

#elseif js

#error "flight.ScalarRemap on js requires flight_esm."

#else

#error "flight.ScalarRemap: no backend for this target."

#end
