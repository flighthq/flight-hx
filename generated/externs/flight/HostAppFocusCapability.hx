package flight;

#if hl

typedef HostAppFocusCapability = flight._hl.HostAppFocusCapability;

#elseif cpp

typedef HostAppFocusCapability = flight._cpp.HostAppFocusCapability;

#elseif (js && flight_esm)

typedef HostAppFocusCapability = flight._js.HostAppFocusCapability;

#elseif js

#error "flight.HostAppFocusCapability on js requires flight_esm."

#else

#error "flight.HostAppFocusCapability: no backend for this target."

#end
