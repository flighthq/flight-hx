package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/requirement-codegen")
extern class RequirementCodegen {
  public static function createRequirementCodegenPlan(catalog:flight.esm.types.requirement_catalog.Types.RequirementCatalog, requirements:flight.esm.types.requirement.Types.RequirementSetRaw, backend:String):{ backend:String, declined:Array<flight.esm.types.requirement_codegen.Types.RequirementDeclination>, entries:Array<flight.esm.types.requirement_catalog.Types.RequirementCatalogEntry>, unresolved:Array<flight.esm.types.requirement.Types.Requirement>, raw:Dynamic };
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
