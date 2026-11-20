package flight._cpp._fn;

extern class Requirement {
	@:native("flight_collect_scene2d_requirements")
	public static function collectScene2dRequirements(runFn:cpp.Star<cpp.Void>, runCtx:cpp.Star<cpp.Void>):flight._cpp.RequirementSet;
	@:native("flight_create_requirement_set")
	public static function createRequirementSet(covers:cpp.Star<cpp.Void>, coversLen:Int, requirements:cpp.Star<cpp.Void>, requirementsLen:Int):flight._cpp.RequirementSet;
	@:native("flight_diff_requirement_sets")
	public static function diffRequirementSets(requirements:flight._cpp.RequirementSet, baseline:flight._cpp.RequirementSet):flight._cpp.RequirementSet;
	@:native("flight_merge_requirement_sets")
	public static function mergeRequirementSets(requirementSets:cpp.Star<cpp.Void>, requirementSetsLen:Int):flight._cpp.RequirementSet;
	@:native("flight_free_requirement_set")
	public static function freeRequirementSet(ptr:flight._cpp.RequirementSet):Void;
}
