package flight.esm.requirement_codegen;

#if (js && flight_esm)
@:jsRequire("@flighthq/requirement-codegen/contract")
extern class Contract {
  public static function createRequirementCodegenPlan(catalog:flight.esm.types.requirement_catalog.Types.RequirementCatalog, requirements:flight.esm.types.requirement.Types.RequirementSetRaw, backend:String):{ backend:String, declined:Array<flight.esm.types.requirement_codegen.Types.RequirementDeclination>, entries:Array<flight.esm.types.requirement_catalog.Types.RequirementCatalogEntry>, unresolved:Array<flight.esm.types.requirement.Types.Requirement>, raw:Dynamic };
  public static function initializeRequirementCodegenPlan(out:flight.esm.types.entity_contract.Types.EntityConstruction<Dynamic>, catalog:flight.esm.types.requirement_catalog.Types.RequirementCatalog, requirements:flight.esm.types.requirement.Types.RequirementSetRaw, backend:String):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
