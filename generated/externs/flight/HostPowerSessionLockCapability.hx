package flight;

#if hl

typedef HostPowerSessionLockCapability = flight._hl.HostPowerSessionLockCapability;

#elseif cpp

typedef HostPowerSessionLockCapability = flight._cpp.HostPowerSessionLockCapability;

#elseif (js && flight_esm)

typedef HostPowerSessionLockCapability = flight._js.HostPowerSessionLockCapability;

#elseif js

#error "flight.HostPowerSessionLockCapability on js requires flight_esm."

#else

#error "flight.HostPowerSessionLockCapability: no backend for this target."

#end
