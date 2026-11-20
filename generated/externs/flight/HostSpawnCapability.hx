package flight;

#if hl

typedef HostSpawnCapability = flight._hl.HostSpawnCapability;

#elseif cpp

typedef HostSpawnCapability = flight._cpp.HostSpawnCapability;

#elseif (js && flight_esm)

typedef HostSpawnCapability = flight._js.HostSpawnCapability;

#elseif js

#error "flight.HostSpawnCapability on js requires flight_esm."

#else

#error "flight.HostSpawnCapability: no backend for this target."

#end
