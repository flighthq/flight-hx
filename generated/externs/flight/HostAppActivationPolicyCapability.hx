package flight;

#if hl

typedef HostAppActivationPolicyCapability = flight._hl.HostAppActivationPolicyCapability;

#elseif cpp

typedef HostAppActivationPolicyCapability = flight._cpp.HostAppActivationPolicyCapability;

#elseif (js && flight_esm)

typedef HostAppActivationPolicyCapability = flight._js.HostAppActivationPolicyCapability;

#elseif js

#error "flight.HostAppActivationPolicyCapability on js requires flight_esm."

#else

#error "flight.HostAppActivationPolicyCapability: no backend for this target."

#end
