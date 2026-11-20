package flight;

#if hl

typedef HostShellBeepCapability = flight._hl.HostShellBeepCapability;

#elseif cpp

typedef HostShellBeepCapability = flight._cpp.HostShellBeepCapability;

#elseif (js && flight_esm)

typedef HostShellBeepCapability = flight._js.HostShellBeepCapability;

#elseif js

#error "flight.HostShellBeepCapability on js requires flight_esm."

#else

#error "flight.HostShellBeepCapability: no backend for this target."

#end
