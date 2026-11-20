package flight;

#if hl

typedef SocketRuntime = flight._hl.SocketRuntime;

#elseif cpp

typedef SocketRuntime = flight._cpp.SocketRuntime;

#elseif (js && flight_esm)

typedef SocketRuntime = flight._js.SocketRuntime;

#elseif js

#error "flight.SocketRuntime on js requires flight_esm."

#else

#error "flight.SocketRuntime: no backend for this target."

#end
