package flight;

#if hl

typedef SocketGuardState = flight._hl.SocketGuardState;

#elseif cpp

typedef SocketGuardState = flight._cpp.SocketGuardState;

#elseif (js && flight_esm)

typedef SocketGuardState = flight._js.SocketGuardState;

#elseif js

#error "flight.SocketGuardState on js requires flight_esm."

#else

#error "flight.SocketGuardState: no backend for this target."

#end
