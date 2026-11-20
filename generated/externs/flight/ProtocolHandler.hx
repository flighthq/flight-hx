package flight;

#if hl

typedef ProtocolHandler = flight._hl.ProtocolHandler;

#elseif cpp

typedef ProtocolHandler = flight._cpp.ProtocolHandler;

#elseif (js && flight_esm)

typedef ProtocolHandler = flight._js.ProtocolHandler;

#elseif js

#error "flight.ProtocolHandler on js requires flight_esm."

#else

#error "flight.ProtocolHandler: no backend for this target."

#end
