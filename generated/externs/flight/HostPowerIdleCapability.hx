package flight;

#if hl

typedef HostPowerIdleCapability = flight._hl.HostPowerIdleCapability;

#elseif cpp

typedef HostPowerIdleCapability = flight._cpp.HostPowerIdleCapability;

#elseif (js && flight_esm)

typedef HostPowerIdleCapability = flight._js.HostPowerIdleCapability;

#elseif js

#error "flight.HostPowerIdleCapability on js requires flight_esm."

#else

#error "flight.HostPowerIdleCapability: no backend for this target."

#end
