package flight;

#if hl

typedef SocketOptions = flight._hl.SocketOptions;

#elseif cpp

typedef SocketOptions = flight._cpp.SocketOptions;

#elseif (js && flight_esm)

typedef SocketOptions = flight._js.SocketOptions;

#elseif js

#error "flight.SocketOptions on js requires flight_esm."

#else

#error "flight.SocketOptions: no backend for this target."

#end
