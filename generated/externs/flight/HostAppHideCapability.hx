package flight;

#if hl

typedef HostAppHideCapability = flight._hl.HostAppHideCapability;

#elseif cpp

typedef HostAppHideCapability = flight._cpp.HostAppHideCapability;

#elseif (js && flight_esm)

typedef HostAppHideCapability = flight._js.HostAppHideCapability;

#elseif js

#error "flight.HostAppHideCapability on js requires flight_esm."

#else

#error "flight.HostAppHideCapability: no backend for this target."

#end
