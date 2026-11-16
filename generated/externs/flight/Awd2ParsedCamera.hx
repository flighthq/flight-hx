package flight;

#if hl

typedef Awd2ParsedCamera = flight._hl.Awd2ParsedCamera;

#elseif cpp

typedef Awd2ParsedCamera = flight._cpp.Awd2ParsedCamera;

#elseif (js && flight_esm)

typedef Awd2ParsedCamera = flight._js.Awd2ParsedCamera;

#elseif js

#error "flight.Awd2ParsedCamera on js requires flight_esm."

#else

#error "flight.Awd2ParsedCamera: no backend for this target."

#end
