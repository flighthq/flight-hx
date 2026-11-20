package flight;

#if hl

typedef HostPowerSuspensionCapability = flight._hl.HostPowerSuspensionCapability;

#elseif cpp

typedef HostPowerSuspensionCapability = flight._cpp.HostPowerSuspensionCapability;

#elseif (js && flight_esm)

typedef HostPowerSuspensionCapability = flight._js.HostPowerSuspensionCapability;

#elseif js

#error "flight.HostPowerSuspensionCapability on js requires flight_esm."

#else

#error "flight.HostPowerSuspensionCapability: no backend for this target."

#end
