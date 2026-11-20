package flight;

#if hl

typedef HostConnectivityStatusCapability = flight._hl.HostConnectivityStatusCapability;

#elseif cpp

typedef HostConnectivityStatusCapability = flight._cpp.HostConnectivityStatusCapability;

#elseif (js && flight_esm)

typedef HostConnectivityStatusCapability = flight._js.HostConnectivityStatusCapability;

#elseif js

#error "flight.HostConnectivityStatusCapability on js requires flight_esm."

#else

#error "flight.HostConnectivityStatusCapability: no backend for this target."

#end
