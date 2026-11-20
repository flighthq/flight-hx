package flight;

#if hl

typedef HostAppSingleInstanceCapability = flight._hl.HostAppSingleInstanceCapability;

#elseif cpp

typedef HostAppSingleInstanceCapability = flight._cpp.HostAppSingleInstanceCapability;

#elseif (js && flight_esm)

typedef HostAppSingleInstanceCapability = flight._js.HostAppSingleInstanceCapability;

#elseif js

#error "flight.HostAppSingleInstanceCapability on js requires flight_esm."

#else

#error "flight.HostAppSingleInstanceCapability: no backend for this target."

#end
