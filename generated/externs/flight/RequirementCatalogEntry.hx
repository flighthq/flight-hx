package flight;

#if hl

typedef RequirementCatalogEntry = flight._hl.RequirementCatalogEntry;

#elseif cpp

typedef RequirementCatalogEntry = flight._cpp.RequirementCatalogEntry;

#elseif (js && flight_esm)

typedef RequirementCatalogEntry = flight._js.RequirementCatalogEntry;

#elseif js

#error "flight.RequirementCatalogEntry on js requires flight_esm."

#else

#error "flight.RequirementCatalogEntry: no backend for this target."

#end
