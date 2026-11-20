package flight;

#if hl

typedef ParsedProtocolUrl = flight._hl.ParsedProtocolUrl;

#elseif cpp

typedef ParsedProtocolUrl = flight._cpp.ParsedProtocolUrl;

#elseif (js && flight_esm)

typedef ParsedProtocolUrl = flight._js.ParsedProtocolUrl;

#elseif js

#error "flight.ParsedProtocolUrl on js requires flight_esm."

#else

#error "flight.ParsedProtocolUrl: no backend for this target."

#end
