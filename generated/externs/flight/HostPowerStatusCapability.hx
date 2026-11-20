package flight;

#if hl

typedef HostPowerStatusCapability = flight._hl.HostPowerStatusCapability;

#elseif cpp

typedef HostPowerStatusCapability = flight._cpp.HostPowerStatusCapability;

#elseif (js && flight_esm)

typedef HostPowerStatusCapability = flight._js.HostPowerStatusCapability;

#elseif js

#error "flight.HostPowerStatusCapability on js requires flight_esm."

#else

#error "flight.HostPowerStatusCapability: no backend for this target."

#end
