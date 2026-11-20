package flight.esm.types.sdk_requirement_catalog;

#if (js && flight_esm)
typedef RequirementBackend = flight.esm.types.requirement_catalog.Types.RequirementBackend;

typedef RequirementCatalog = flight.esm.types.requirement_catalog.Types.RequirementCatalog;

typedef RequirementCatalogEntry = flight.esm.types.requirement_catalog.Types.RequirementCatalogEntry;

typedef RequirementDisposition = flight.esm.types.requirement_catalog.Types.RequirementDisposition;

typedef RequirementTranslation = flight.esm.types.requirement_catalog.Types.RequirementTranslation;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
