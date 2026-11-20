package flight;

#if hl

typedef SocketMessageData = flight._hl.SocketMessageData;

#elseif cpp

typedef SocketMessageData = flight._cpp.SocketMessageData;

#elseif (js && flight_esm)

typedef SocketMessageData = flight._js.SocketMessageData;

#elseif js

#error "flight.SocketMessageData on js requires flight_esm."

#else

#error "flight.SocketMessageData: no backend for this target."

#end
