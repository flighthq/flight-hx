package flight;

#if hl

typedef HostWindowFocusCapability = flight._hl.HostWindowFocusCapability;

#elseif cpp

typedef HostWindowFocusCapability = flight._cpp.HostWindowFocusCapability;

#elseif (js && flight_esm)

typedef HostWindowFocusCapability = flight._js.HostWindowFocusCapability;

#elseif js

#error "flight.HostWindowFocusCapability on js requires flight_esm."

#else

#error "flight.HostWindowFocusCapability: no backend for this target."

#end
