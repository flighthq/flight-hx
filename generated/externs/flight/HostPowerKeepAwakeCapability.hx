package flight;

#if hl

typedef HostPowerKeepAwakeCapability = flight._hl.HostPowerKeepAwakeCapability;

#elseif cpp

typedef HostPowerKeepAwakeCapability = flight._cpp.HostPowerKeepAwakeCapability;

#elseif (js && flight_esm)

typedef HostPowerKeepAwakeCapability = flight._js.HostPowerKeepAwakeCapability;

#elseif js

#error "flight.HostPowerKeepAwakeCapability on js requires flight_esm."

#else

#error "flight.HostPowerKeepAwakeCapability: no backend for this target."

#end
