package flight;

#if hl

typedef ParsedAccelerator = flight._hl.ParsedAccelerator;

#elseif cpp

typedef ParsedAccelerator = flight._cpp.ParsedAccelerator;

#elseif (js && flight_esm)

typedef ParsedAccelerator = flight._js.ParsedAccelerator;

#elseif js

#error "flight.ParsedAccelerator on js requires flight_esm."

#else

#error "flight.ParsedAccelerator: no backend for this target."

#end
