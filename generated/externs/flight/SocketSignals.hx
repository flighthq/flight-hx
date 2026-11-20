package flight;

#if hl

typedef SocketSignals = flight._hl.SocketSignals;

#elseif cpp

typedef SocketSignals = flight._cpp.SocketSignals;

#elseif (js && flight_esm)

typedef SocketSignals = flight._js.SocketSignals;

#elseif js

#error "flight.SocketSignals on js requires flight_esm."

#else

#error "flight.SocketSignals: no backend for this target."

#end
