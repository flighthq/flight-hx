package flight._cpp._fn;

extern class PathBoolean {
	@:native("flight_boolean_paths")
	public static function booleanPaths(out:flight._cpp.Path, pathBooleanKernel:flight._cpp.PathBooleanKernel, subject:flight._cpp.Path, clip:flight._cpp.Path, operation:Int, options:flight._cpp.PathBooleanOptions):Void;
	@:native("flight_difference_paths")
	public static function differencePaths(out:flight._cpp.Path, pathBooleanKernel:flight._cpp.PathBooleanKernel, a:flight._cpp.Path, b:flight._cpp.Path, options:flight._cpp.PathBooleanOptions):Void;
	@:native("flight_intersect_paths")
	public static function intersectPaths(out:flight._cpp.Path, pathBooleanKernel:flight._cpp.PathBooleanKernel, a:flight._cpp.Path, b:flight._cpp.Path, options:flight._cpp.PathBooleanOptions):Void;
	@:native("flight_union_paths")
	public static function unionPaths(out:flight._cpp.Path, pathBooleanKernel:flight._cpp.PathBooleanKernel, a:flight._cpp.Path, b:flight._cpp.Path, options:flight._cpp.PathBooleanOptions):Void;
	@:native("flight_xor_paths")
	public static function xorPaths(out:flight._cpp.Path, pathBooleanKernel:flight._cpp.PathBooleanKernel, a:flight._cpp.Path, b:flight._cpp.Path, options:flight._cpp.PathBooleanOptions):Void;
	@:native("flight_explain_offset_path")
	public static function explainOffsetPath(pathBooleanKernel:flight._cpp.PathBooleanKernel, path:flight._cpp.Path, delta:Float, options:flight._cpp.PathOffsetOptions):flight._cpp.PathBooleanExplanation;
	@:native("flight_explain_simplify_path")
	public static function explainSimplifyPath(pathBooleanKernel:flight._cpp.PathBooleanKernel, path:flight._cpp.Path, options:flight._cpp.PathBooleanOptions):flight._cpp.PathBooleanExplanation;
	@:native("flight_create_martinez_path_boolean_kernel")
	public static function createMartinezPathBooleanKernel():flight._cpp.PathBooleanKernel;
	@:native("flight_get_path_boolean_fill_rule_string")
	public static function getPathBooleanFillRuleString(value:Int):cpp.ConstCharStar;
	@:native("flight_get_path_boolean_operation_string")
	public static function getPathBooleanOperationString(value:Int):cpp.ConstCharStar;
	@:native("flight_parse_path_boolean_fill_rule")
	public static function parsePathBooleanFillRule(value:cpp.ConstCharStar):Int;
	@:native("flight_parse_path_boolean_operation")
	public static function parsePathBooleanOperation(value:cpp.ConstCharStar):Int;
	@:native("flight_offset_path")
	public static function offsetPath(out:flight._cpp.Path, pathBooleanKernel:flight._cpp.PathBooleanKernel, path:flight._cpp.Path, delta:Float, options:flight._cpp.PathOffsetOptions):Void;
	@:native("flight_get_path_boolean_explanation_operation_string")
	public static function getPathBooleanExplanationOperationString(value:Int):cpp.ConstCharStar;
	@:native("flight_get_path_boolean_explanation_reason_string")
	public static function getPathBooleanExplanationReasonString(value:Int):cpp.ConstCharStar;
	@:native("flight_get_path_offset_end_string")
	public static function getPathOffsetEndString(value:Int):cpp.ConstCharStar;
	@:native("flight_get_path_offset_join_string")
	public static function getPathOffsetJoinString(value:Int):cpp.ConstCharStar;
	@:native("flight_parse_path_boolean_explanation_operation")
	public static function parsePathBooleanExplanationOperation(value:cpp.ConstCharStar):Int;
	@:native("flight_parse_path_boolean_explanation_reason")
	public static function parsePathBooleanExplanationReason(value:cpp.ConstCharStar):Int;
	@:native("flight_parse_path_offset_end")
	public static function parsePathOffsetEnd(value:cpp.ConstCharStar):Int;
	@:native("flight_parse_path_offset_join")
	public static function parsePathOffsetJoin(value:cpp.ConstCharStar):Int;
	@:native("flight_simplify_path")
	public static function simplifyPath(out:flight._cpp.Path, pathBooleanKernel:flight._cpp.PathBooleanKernel, path:flight._cpp.Path, options:flight._cpp.PathBooleanOptions):Void;
	@:native("flight_free_path_boolean_explanation")
	public static function freePathBooleanExplanation(ptr:flight._cpp.PathBooleanExplanation):Void;
	@:native("flight_free_path_boolean_kernel")
	public static function freePathBooleanKernel(ptr:flight._cpp.PathBooleanKernel):Void;
}
