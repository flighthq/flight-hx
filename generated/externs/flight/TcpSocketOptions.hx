package flight;

#if hl

typedef TcpSocketOptions = flight._hl.TcpSocketOptions;

#elseif cpp

typedef TcpSocketOptions = flight._cpp.TcpSocketOptions;

#elseif (js && flight_esm)

typedef TcpSocketOptions = flight._js.TcpSocketOptions;

#elseif js

#error "flight.TcpSocketOptions on js requires flight_esm."

#else

#error "flight.TcpSocketOptions: no backend for this target."

#end
