package flight._hl._fn;

extern class Requirement {
	@:hlNative("flight", "flight_collect_scene2d_requirements")
	public static function collectScene2dRequirements(runFn:hl.Bytes, runCtx:hl.Bytes):flight._hl.RequirementSet;
	@:hlNative("flight", "flight_create_requirement_set")
	public static function createRequirementSet(covers:hl.Bytes, coversLen:Int, requirements:hl.Bytes, requirementsLen:Int):flight._hl.RequirementSet;
	@:hlNative("flight", "flight_diff_requirement_sets")
	public static function diffRequirementSets(requirements:flight._hl.RequirementSet, baseline:flight._hl.RequirementSet):flight._hl.RequirementSet;
	@:hlNative("flight", "flight_merge_requirement_sets")
	public static function mergeRequirementSets(requirementSets:hl.Bytes, requirementSetsLen:Int):flight._hl.RequirementSet;
	@:hlNative("flight", "flight_free_requirement_set")
	public static function freeRequirementSet(ptr:flight._hl.RequirementSet):Void;
}
