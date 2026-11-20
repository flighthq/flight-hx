package flight;

#if hl

typedef HostWindowContentProtectionCapability = flight._hl.HostWindowContentProtectionCapability;

#elseif cpp

typedef HostWindowContentProtectionCapability = flight._cpp.HostWindowContentProtectionCapability;

#elseif (js && flight_esm)

typedef HostWindowContentProtectionCapability = flight._js.HostWindowContentProtectionCapability;

#elseif js

#error "flight.HostWindowContentProtectionCapability on js requires flight_esm."

#else

#error "flight.HostWindowContentProtectionCapability: no backend for this target."

#end
