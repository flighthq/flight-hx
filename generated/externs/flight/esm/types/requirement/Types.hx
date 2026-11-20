package flight.esm.types.requirement;

#if (js && flight_esm)
typedef Requirement = { facet:flight.esm.types.requirement.Types.RequirementFacet, key:String };

typedef RequirementFacet = String;

@:jsRequire("@flighthq/requirement", "RequirementSet")
extern class RequirementSet {
  public function new(?raw:flight.esm.types.requirement.Types.RequirementSetRaw);
  public final raw:flight.esm.types.requirement.Types.RequirementSetRaw;
  public final covers:Array<flight.esm.types.requirement.Types.RequirementFacet>;
  public final requirements:Array<flight.esm.types.requirement.Types.Requirement>;
  public function diff(baseline:flight.esm.types.requirement.Types.RequirementSet):flight.esm.types.requirement.Types.RequirementSet;
  @:overload(function(covers:Array<flight.esm.types.requirement.Types.RequirementFacet>, requirements:Array<flight.esm.types.requirement.Types.Requirement>):flight.esm.types.requirement.Types.RequirementSet {})
  public static function create():flight.esm.types.requirement.Types.RequirementSet;
  public static function from(raw:flight.esm.types.requirement.Types.RequirementSetRaw):flight.esm.types.requirement.Types.RequirementSet;
}

typedef RequirementSetRaw = { covers:Array<flight.esm.types.requirement.Types.RequirementFacet>, requirements:Array<flight.esm.types.requirement.Types.Requirement> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
