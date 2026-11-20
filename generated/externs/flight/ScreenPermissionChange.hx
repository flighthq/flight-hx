package flight;

#if hl

typedef ScreenPermissionChange = flight._hl.ScreenPermissionChange;

#elseif cpp

typedef ScreenPermissionChange = flight._cpp.ScreenPermissionChange;

#elseif (js && flight_esm)

typedef ScreenPermissionChange = flight._js.ScreenPermissionChange;

#elseif js

#error "flight.ScreenPermissionChange on js requires flight_esm."

#else

#error "flight.ScreenPermissionChange: no backend for this target."

#end
