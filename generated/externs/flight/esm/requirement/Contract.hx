package flight.esm.requirement;

#if (js && flight_esm)
@:jsRequire("@flighthq/requirement/contract")
extern class Contract {
  public static final RequirementFacet:Dynamic;
  public static final RequirementSet:Dynamic;
  public static function collectScene2DRequirements(run:((arg0:Array<flight.esm.types.requirement.Types.Requirement>) -> Void)):flight.esm.types.requirement.Types.RequirementSetRaw;
  public static function createRequirementSet(covers:Array<flight.esm.types.requirement.Types.RequirementFacet>, requirements:Array<flight.esm.types.requirement.Types.Requirement>):flight.esm.types.requirement.Types.RequirementSetRaw;
  public static function diffRequirementSets(requirements:flight.esm.types.requirement.Types.RequirementSetRaw, baseline:flight.esm.types.requirement.Types.RequirementSetRaw):flight.esm.types.requirement.Types.RequirementSetRaw;
  public static function getRequirementFacetString(value:flight.esm.types.requirement.Types.RequirementFacet):String;
  public static function initializeRequirementSet(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.requirement.Types.RequirementSetRaw>, covers:Array<flight.esm.types.requirement.Types.RequirementFacet>, requirements:Array<flight.esm.types.requirement.Types.Requirement>):Void;
  public static function mergeRequirementSets(requirementSets:Array<flight.esm.types.requirement.Types.RequirementSetRaw>):flight.esm.types.requirement.Types.RequirementSetRaw;
  public static function parseRequirementFacet(value:String):Null<String>;
  public static function reportRequirement(sink:Null<Array<flight.esm.types.requirement.Types.Requirement>>, facet:flight.esm.types.requirement.Types.RequirementFacet, key:String):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
