package flight;

#if hl

typedef HostInputFocusCapability = flight._hl.HostInputFocusCapability;

#elseif cpp

typedef HostInputFocusCapability = flight._cpp.HostInputFocusCapability;

#elseif (js && flight_esm)

typedef HostInputFocusCapability = flight._js.HostInputFocusCapability;

#elseif js

#error "flight.HostInputFocusCapability on js requires flight_esm."

#else

#error "flight.HostInputFocusCapability: no backend for this target."

#end
