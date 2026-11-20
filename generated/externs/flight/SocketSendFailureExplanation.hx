package flight;

#if hl

typedef SocketSendFailureExplanation = flight._hl.SocketSendFailureExplanation;

#elseif cpp

typedef SocketSendFailureExplanation = flight._cpp.SocketSendFailureExplanation;

#elseif (js && flight_esm)

typedef SocketSendFailureExplanation = flight._js.SocketSendFailureExplanation;

#elseif js

#error "flight.SocketSendFailureExplanation on js requires flight_esm."

#else

#error "flight.SocketSendFailureExplanation: no backend for this target."

#end
