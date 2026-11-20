package flight._js._fn;

@:jsRequire("@flighthq/requirement")
extern class Requirement {
	@:native("collectScene2DRequirements")
	public static function collectScene2dRequirements(run:Dynamic):flight._js.RequirementSet;
	@:native("createRequirementSet")
	public static function createRequirementSet(covers:Dynamic, requirements:Dynamic):flight._js.RequirementSet;
	@:native("diffRequirementSets")
	public static function diffRequirementSets(requirements:flight._js.RequirementSet, baseline:flight._js.RequirementSet):flight._js.RequirementSet;
	@:native("mergeRequirementSets")
	public static function mergeRequirementSets(requirementSets:Dynamic):flight._js.RequirementSet;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeRequirementSet(ptr:flight._js.RequirementSet):Void {}
}
