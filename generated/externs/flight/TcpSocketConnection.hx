package flight;

#if hl

typedef TcpSocketConnection = flight._hl.TcpSocketConnection;

#elseif cpp

typedef TcpSocketConnection = flight._cpp.TcpSocketConnection;

#elseif (js && flight_esm)

typedef TcpSocketConnection = flight._js.TcpSocketConnection;

#elseif js

#error "flight.TcpSocketConnection on js requires flight_esm."

#else

#error "flight.TcpSocketConnection: no backend for this target."

#end
