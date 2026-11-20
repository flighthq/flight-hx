package flight;

#if hl

typedef HostPowerThermalCapability = flight._hl.HostPowerThermalCapability;

#elseif cpp

typedef HostPowerThermalCapability = flight._cpp.HostPowerThermalCapability;

#elseif (js && flight_esm)

typedef HostPowerThermalCapability = flight._js.HostPowerThermalCapability;

#elseif js

#error "flight.HostPowerThermalCapability on js requires flight_esm."

#else

#error "flight.HostPowerThermalCapability: no backend for this target."

#end
