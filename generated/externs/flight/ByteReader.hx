package flight;

#if hl

typedef ByteReader = flight._hl.ByteReader;

#elseif cpp

typedef ByteReader = flight._cpp.ByteReader;

#elseif (js && flight_esm)

typedef ByteReader = flight._js.ByteReader;

#elseif js

#error "flight.ByteReader on js requires flight_esm."

#else

#error "flight.ByteReader: no backend for this target."

#end
