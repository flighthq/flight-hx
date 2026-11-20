package flight;

#if hl

typedef HostAppExitCapability = flight._hl.HostAppExitCapability;

#elseif cpp

typedef HostAppExitCapability = flight._cpp.HostAppExitCapability;

#elseif (js && flight_esm)

typedef HostAppExitCapability = flight._js.HostAppExitCapability;

#elseif js

#error "flight.HostAppExitCapability on js requires flight_esm."

#else

#error "flight.HostAppExitCapability: no backend for this target."

#end
