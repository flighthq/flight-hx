package flight;

#if hl

typedef ArrayBufferView = flight._hl.ArrayBufferView;

#elseif cpp

typedef ArrayBufferView = flight._cpp.ArrayBufferView;

#elseif (js && flight_esm)

typedef ArrayBufferView = flight._js.ArrayBufferView;

#elseif js

#error "flight.ArrayBufferView on js requires flight_esm."

#else

#error "flight.ArrayBufferView: no backend for this target."

#end
