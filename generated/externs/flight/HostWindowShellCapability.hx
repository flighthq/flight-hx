package flight;

#if hl

typedef HostWindowShellCapability = flight._hl.HostWindowShellCapability;

#elseif cpp

typedef HostWindowShellCapability = flight._cpp.HostWindowShellCapability;

#elseif (js && flight_esm)

typedef HostWindowShellCapability = flight._js.HostWindowShellCapability;

#elseif js

#error "flight.HostWindowShellCapability on js requires flight_esm."

#else

#error "flight.HostWindowShellCapability: no backend for this target."

#end
