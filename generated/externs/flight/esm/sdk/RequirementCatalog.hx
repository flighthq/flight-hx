package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/requirement-catalog")
extern class RequirementCatalog {
  public static final BUILT_IN_REQUIREMENT_BACKENDS:Array<flight.esm.types.requirement_catalog.Types.RequirementBackend>;
  public static final BUILT_IN_REQUIREMENT_CATALOG_ENTRIES:Array<flight.esm.types.requirement_catalog.Types.RequirementCatalogEntry>;
  public static final BUILT_IN_REQUIREMENT_DISPOSITIONS:Array<flight.esm.types.requirement_catalog.Types.RequirementDisposition>;
  public static final BUILT_IN_REQUIREMENT_TRANSLATIONS:Array<flight.esm.types.requirement_catalog.Types.RequirementTranslation>;
  public static function createRequirementCatalog(?entries:Array<flight.esm.types.requirement_catalog.Types.RequirementCatalogEntry>, ?translations:Array<flight.esm.types.requirement_catalog.Types.RequirementTranslation>, ?dispositions:Array<flight.esm.types.requirement_catalog.Types.RequirementDisposition>):flight.esm.types.requirement_catalog.Types.RequirementCatalog;
  public static function findRequirementCatalogEntries(catalog:flight.esm.types.requirement_catalog.Types.RequirementCatalog, backend:String, facet:flight.esm.types.requirement.Types.RequirementFacet, kind:String):Array<flight.esm.types.requirement_catalog.Types.RequirementCatalogEntry>;
  public static function getRequirementCatalogEntries(catalog:flight.esm.types.requirement_catalog.Types.RequirementCatalog):Array<flight.esm.types.requirement_catalog.Types.RequirementCatalogEntry>;
  public static function registerRequirementCatalogEntry(catalog:flight.esm.types.requirement_catalog.Types.RequirementCatalog, entry:flight.esm.types.requirement_catalog.Types.RequirementCatalogEntry):Void;
  public static function unregisterRequirementCatalogEntry(catalog:flight.esm.types.requirement_catalog.Types.RequirementCatalog, entry:flight.esm.types.requirement_catalog.Types.RequirementCatalogEntry):Bool;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
