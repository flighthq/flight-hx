package flight;

#if hl

typedef UserAgentPointerWidth = flight._hl.UserAgentPointerWidth;

#elseif cpp

typedef UserAgentPointerWidth = flight._cpp.UserAgentPointerWidth;

#elseif (js && flight_esm)

typedef UserAgentPointerWidth = flight._js.UserAgentPointerWidth;

#elseif js

#error "flight.UserAgentPointerWidth on js requires flight_esm."

#else

#error "flight.UserAgentPointerWidth: no backend for this target."

#end
