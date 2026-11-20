package flight;

#if hl

typedef HostConnectivityChangeCapability = flight._hl.HostConnectivityChangeCapability;

#elseif cpp

typedef HostConnectivityChangeCapability = flight._cpp.HostConnectivityChangeCapability;

#elseif (js && flight_esm)

typedef HostConnectivityChangeCapability = flight._js.HostConnectivityChangeCapability;

#elseif js

#error "flight.HostConnectivityChangeCapability on js requires flight_esm."

#else

#error "flight.HostConnectivityChangeCapability: no backend for this target."

#end
