package flight;

#if hl

typedef HostAppOpenFileCapability = flight._hl.HostAppOpenFileCapability;

#elseif cpp

typedef HostAppOpenFileCapability = flight._cpp.HostAppOpenFileCapability;

#elseif (js && flight_esm)

typedef HostAppOpenFileCapability = flight._js.HostAppOpenFileCapability;

#elseif js

#error "flight.HostAppOpenFileCapability on js requires flight_esm."

#else

#error "flight.HostAppOpenFileCapability: no backend for this target."

#end
