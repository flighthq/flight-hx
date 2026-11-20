package flight;

#if hl

typedef HostPreferencesChangeCapability = flight._hl.HostPreferencesChangeCapability;

#elseif cpp

typedef HostPreferencesChangeCapability = flight._cpp.HostPreferencesChangeCapability;

#elseif (js && flight_esm)

typedef HostPreferencesChangeCapability = flight._js.HostPreferencesChangeCapability;

#elseif js

#error "flight.HostPreferencesChangeCapability on js requires flight_esm."

#else

#error "flight.HostPreferencesChangeCapability: no backend for this target."

#end
