package flight;

#if hl

typedef ProtocolUrlParts = flight._hl.ProtocolUrlParts;

#elseif cpp

typedef ProtocolUrlParts = flight._cpp.ProtocolUrlParts;

#elseif (js && flight_esm)

typedef ProtocolUrlParts = flight._js.ProtocolUrlParts;

#elseif js

#error "flight.ProtocolUrlParts on js requires flight_esm."

#else

#error "flight.ProtocolUrlParts: no backend for this target."

#end
