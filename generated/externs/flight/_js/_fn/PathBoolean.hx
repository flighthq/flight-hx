package flight._js._fn;

@:jsRequire("flight")
extern class PathBoolean {
	@:native("flight_boolean_paths")
	public static function booleanPaths(out:flight._js.Path, pathBooleanKernel:flight._js.PathBooleanKernel, subject:flight._js.Path, clip:flight._js.Path, operation:Int, options:flight._js.PathBooleanOptions):Void;
	@:native("flight_difference_paths")
	public static function differencePaths(out:flight._js.Path, pathBooleanKernel:flight._js.PathBooleanKernel, a:flight._js.Path, b:flight._js.Path, options:flight._js.PathBooleanOptions):Void;
	@:native("flight_intersect_paths")
	public static function intersectPaths(out:flight._js.Path, pathBooleanKernel:flight._js.PathBooleanKernel, a:flight._js.Path, b:flight._js.Path, options:flight._js.PathBooleanOptions):Void;
	@:native("flight_union_paths")
	public static function unionPaths(out:flight._js.Path, pathBooleanKernel:flight._js.PathBooleanKernel, a:flight._js.Path, b:flight._js.Path, options:flight._js.PathBooleanOptions):Void;
	@:native("flight_xor_paths")
	public static function xorPaths(out:flight._js.Path, pathBooleanKernel:flight._js.PathBooleanKernel, a:flight._js.Path, b:flight._js.Path, options:flight._js.PathBooleanOptions):Void;
	@:native("flight_explain_offset_path")
	public static function explainOffsetPath(pathBooleanKernel:flight._js.PathBooleanKernel, path:flight._js.Path, delta:Float, options:flight._js.PathOffsetOptions):Dynamic;
	@:native("flight_explain_simplify_path")
	public static function explainSimplifyPath(pathBooleanKernel:flight._js.PathBooleanKernel, path:flight._js.Path, options:flight._js.PathBooleanOptions):Dynamic;
	@:native("flight_create_martinez_path_boolean_kernel")
	public static function createMartinezPathBooleanKernel():flight._js.PathBooleanKernel;
	@:native("flight_get_path_boolean_fill_rule_string")
	public static function getPathBooleanFillRuleString(value:Int):String;
	@:native("flight_get_path_boolean_operation_string")
	public static function getPathBooleanOperationString(value:Int):String;
	@:native("flight_parse_path_boolean_fill_rule")
	public static function parsePathBooleanFillRule(value:String):Int;
	@:native("flight_parse_path_boolean_operation")
	public static function parsePathBooleanOperation(value:String):Int;
	@:native("flight_offset_path")
	public static function offsetPath(out:flight._js.Path, pathBooleanKernel:flight._js.PathBooleanKernel, path:flight._js.Path, delta:Float, options:flight._js.PathOffsetOptions):Void;
	@:native("flight_get_path_boolean_explanation_operation_string")
	public static function getPathBooleanExplanationOperationString(value:Int):String;
	@:native("flight_get_path_boolean_explanation_reason_string")
	public static function getPathBooleanExplanationReasonString(value:Int):String;
	@:native("flight_get_path_offset_end_string")
	public static function getPathOffsetEndString(value:Int):String;
	@:native("flight_get_path_offset_join_string")
	public static function getPathOffsetJoinString(value:Int):String;
	@:native("flight_parse_path_boolean_explanation_operation")
	public static function parsePathBooleanExplanationOperation(value:String):Int;
	@:native("flight_parse_path_boolean_explanation_reason")
	public static function parsePathBooleanExplanationReason(value:String):Int;
	@:native("flight_parse_path_offset_end")
	public static function parsePathOffsetEnd(value:String):Int;
	@:native("flight_parse_path_offset_join")
	public static function parsePathOffsetJoin(value:String):Int;
	@:native("flight_simplify_path")
	public static function simplifyPath(out:flight._js.Path, pathBooleanKernel:flight._js.PathBooleanKernel, path:flight._js.Path, options:flight._js.PathBooleanOptions):Void;
	@:native("flight_free_path_boolean_explanation")
	public static function freePathBooleanExplanation(ptr:flight._js.PathBooleanExplanation):Void;
	@:native("flight_free_path_boolean_kernel")
	public static function freePathBooleanKernel(ptr:flight._js.PathBooleanKernel):Void;
}
