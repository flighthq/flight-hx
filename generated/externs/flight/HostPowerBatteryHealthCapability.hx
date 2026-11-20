package flight;

#if hl

typedef HostPowerBatteryHealthCapability = flight._hl.HostPowerBatteryHealthCapability;

#elseif cpp

typedef HostPowerBatteryHealthCapability = flight._cpp.HostPowerBatteryHealthCapability;

#elseif (js && flight_esm)

typedef HostPowerBatteryHealthCapability = flight._js.HostPowerBatteryHealthCapability;

#elseif js

#error "flight.HostPowerBatteryHealthCapability on js requires flight_esm."

#else

#error "flight.HostPowerBatteryHealthCapability: no backend for this target."

#end
