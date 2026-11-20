package flight.esm.types.requirement_catalog;

#if (js && flight_esm)
typedef RequirementBackend = { infrastructureImport:String, infrastructureSymbol:String, name:String };

typedef RequirementCatalog = { entries:Array<flight.esm.types.requirement_catalog.Types.RequirementCatalogEntry>, ?backends:Null<Array<flight.esm.types.requirement_catalog.Types.RequirementBackend>>, ?dispositions:Null<Array<flight.esm.types.requirement_catalog.Types.RequirementDisposition>>, ?translations:Null<Array<flight.esm.types.requirement_catalog.Types.RequirementTranslation>> };

typedef RequirementCatalogEntry = { backend:String, facet:flight.esm.types.requirement.Types.RequirementFacet, implementationImport:String, implementationSymbol:String, kind:String, ?familyOrder:Null<Float>, ?parserField:Null<String>, ?parserExport:Null<String>, ?contentParserInputKind:Null<String>, ?registrarImport:Null<String>, ?registrarSymbol:Null<String> };

typedef RequirementDisposition = { backend:String, facet:flight.esm.types.requirement.Types.RequirementFacet, kind:String, reason:String };

typedef RequirementTranslation = { from:flight.esm.types.requirement.Types.Requirement, to:Array<flight.esm.types.requirement.Types.Requirement> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
