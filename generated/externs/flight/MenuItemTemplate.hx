package flight;

#if hl

typedef MenuItemTemplate = flight._hl.MenuItemTemplate;

#elseif cpp

typedef MenuItemTemplate = flight._cpp.MenuItemTemplate;

#elseif (js && flight_esm)

typedef MenuItemTemplate = flight._js.MenuItemTemplate;

#elseif js

#error "flight.MenuItemTemplate on js requires flight_esm."

#else

#error "flight.MenuItemTemplate: no backend for this target."

#end
