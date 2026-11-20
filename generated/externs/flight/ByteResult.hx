package flight;

#if hl

typedef ByteResult = flight._hl.ByteResult;

#elseif cpp

typedef ByteResult = flight._cpp.ByteResult;

#elseif (js && flight_esm)

typedef ByteResult = flight._js.ByteResult;

#elseif js

#error "flight.ByteResult on js requires flight_esm."

#else

#error "flight.ByteResult: no backend for this target."

#end
