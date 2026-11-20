package flight;

#if hl

typedef HostScreenPermissionChangeCapability = flight._hl.HostScreenPermissionChangeCapability;

#elseif cpp

typedef HostScreenPermissionChangeCapability = flight._cpp.HostScreenPermissionChangeCapability;

#elseif (js && flight_esm)

typedef HostScreenPermissionChangeCapability = flight._js.HostScreenPermissionChangeCapability;

#elseif js

#error "flight.HostScreenPermissionChangeCapability on js requires flight_esm."

#else

#error "flight.HostScreenPermissionChangeCapability: no backend for this target."

#end
