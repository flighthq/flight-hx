package flight;

#if hl

typedef HostAppRecentDocumentsCapability = flight._hl.HostAppRecentDocumentsCapability;

#elseif cpp

typedef HostAppRecentDocumentsCapability = flight._cpp.HostAppRecentDocumentsCapability;

#elseif (js && flight_esm)

typedef HostAppRecentDocumentsCapability = flight._js.HostAppRecentDocumentsCapability;

#elseif js

#error "flight.HostAppRecentDocumentsCapability on js requires flight_esm."

#else

#error "flight.HostAppRecentDocumentsCapability: no backend for this target."

#end
