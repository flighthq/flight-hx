package flight;

#if hl

typedef SocketCloseInfo = flight._hl.SocketCloseInfo;

#elseif cpp

typedef SocketCloseInfo = flight._cpp.SocketCloseInfo;

#elseif (js && flight_esm)

typedef SocketCloseInfo = flight._js.SocketCloseInfo;

#elseif js

#error "flight.SocketCloseInfo on js requires flight_esm."

#else

#error "flight.SocketCloseInfo: no backend for this target."

#end
