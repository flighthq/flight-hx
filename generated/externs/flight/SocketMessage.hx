package flight;

#if hl

typedef SocketMessage = flight._hl.SocketMessage;

#elseif cpp

typedef SocketMessage = flight._cpp.SocketMessage;

#elseif (js && flight_esm)

typedef SocketMessage = flight._js.SocketMessage;

#elseif js

#error "flight.SocketMessage on js requires flight_esm."

#else

#error "flight.SocketMessage: no backend for this target."

#end
