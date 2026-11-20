package flight;

#if hl

typedef HostPreferencesCapability = flight._hl.HostPreferencesCapability;

#elseif cpp

typedef HostPreferencesCapability = flight._cpp.HostPreferencesCapability;

#elseif (js && flight_esm)

typedef HostPreferencesCapability = flight._js.HostPreferencesCapability;

#elseif js

#error "flight.HostPreferencesCapability on js requires flight_esm."

#else

#error "flight.HostPreferencesCapability: no backend for this target."

#end
