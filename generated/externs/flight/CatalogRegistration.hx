package flight;

#if hl

typedef CatalogRegistration = flight._hl.CatalogRegistration;

#elseif cpp

typedef CatalogRegistration = flight._cpp.CatalogRegistration;

#elseif (js && flight_esm)

typedef CatalogRegistration = flight._js.CatalogRegistration;

#elseif js

#error "flight.CatalogRegistration on js requires flight_esm."

#else

#error "flight.CatalogRegistration: no backend for this target."

#end
