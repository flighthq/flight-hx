package flight;

#if hl

typedef HostPowerChangeCapability = flight._hl.HostPowerChangeCapability;

#elseif cpp

typedef HostPowerChangeCapability = flight._cpp.HostPowerChangeCapability;

#elseif (js && flight_esm)

typedef HostPowerChangeCapability = flight._js.HostPowerChangeCapability;

#elseif js

#error "flight.HostPowerChangeCapability on js requires flight_esm."

#else

#error "flight.HostPowerChangeCapability: no backend for this target."

#end
