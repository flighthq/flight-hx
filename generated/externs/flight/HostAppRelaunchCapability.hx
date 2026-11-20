package flight;

#if hl

typedef HostAppRelaunchCapability = flight._hl.HostAppRelaunchCapability;

#elseif cpp

typedef HostAppRelaunchCapability = flight._cpp.HostAppRelaunchCapability;

#elseif (js && flight_esm)

typedef HostAppRelaunchCapability = flight._js.HostAppRelaunchCapability;

#elseif js

#error "flight.HostAppRelaunchCapability on js requires flight_esm."

#else

#error "flight.HostAppRelaunchCapability: no backend for this target."

#end
