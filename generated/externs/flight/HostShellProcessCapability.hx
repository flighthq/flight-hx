package flight;

#if hl

typedef HostShellProcessCapability = flight._hl.HostShellProcessCapability;

#elseif cpp

typedef HostShellProcessCapability = flight._cpp.HostShellProcessCapability;

#elseif (js && flight_esm)

typedef HostShellProcessCapability = flight._js.HostShellProcessCapability;

#elseif js

#error "flight.HostShellProcessCapability on js requires flight_esm."

#else

#error "flight.HostShellProcessCapability: no backend for this target."

#end
