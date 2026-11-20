package flight;

#if hl

typedef HostAppQuitCapability = flight._hl.HostAppQuitCapability;

#elseif cpp

typedef HostAppQuitCapability = flight._cpp.HostAppQuitCapability;

#elseif (js && flight_esm)

typedef HostAppQuitCapability = flight._js.HostAppQuitCapability;

#elseif js

#error "flight.HostAppQuitCapability on js requires flight_esm."

#else

#error "flight.HostAppQuitCapability: no backend for this target."

#end
