package flight;

#if hl

typedef HostInputTargetCapability = flight._hl.HostInputTargetCapability;

#elseif cpp

typedef HostInputTargetCapability = flight._cpp.HostInputTargetCapability;

#elseif (js && flight_esm)

typedef HostInputTargetCapability = flight._js.HostInputTargetCapability;

#elseif js

#error "flight.HostInputTargetCapability on js requires flight_esm."

#else

#error "flight.HostInputTargetCapability: no backend for this target."

#end
