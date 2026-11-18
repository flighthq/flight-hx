package flight;

#if hl

typedef ArrayBuffer = flight._hl.ArrayBuffer;

#elseif cpp

typedef ArrayBuffer = flight._cpp.ArrayBuffer;

#elseif (js && flight_esm)

typedef ArrayBuffer = flight._js.ArrayBuffer;

#elseif js

#error "flight.ArrayBuffer on js requires flight_esm."

#else

#error "flight.ArrayBuffer: no backend for this target."

#end
