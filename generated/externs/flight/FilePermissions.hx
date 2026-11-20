package flight;

#if hl

typedef FilePermissions = flight._hl.FilePermissions;

#elseif cpp

typedef FilePermissions = flight._cpp.FilePermissions;

#elseif (js && flight_esm)

typedef FilePermissions = flight._js.FilePermissions;

#elseif js

#error "flight.FilePermissions on js requires flight_esm."

#else

#error "flight.FilePermissions: no backend for this target."

#end
