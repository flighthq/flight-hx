package flight._hl._fn;

extern class PathBoolean {
	@:hlNative("flight", "flight_boolean_paths")
	public static function booleanPaths(out:flight._hl.Path, pathBooleanKernel:flight._hl.PathBooleanKernel, subject:flight._hl.Path, clip:flight._hl.Path, operation:Int, options:flight._hl.PathBooleanOptions):Void;
	@:hlNative("flight", "flight_difference_paths")
	public static function differencePaths(out:flight._hl.Path, pathBooleanKernel:flight._hl.PathBooleanKernel, a:flight._hl.Path, b:flight._hl.Path, options:flight._hl.PathBooleanOptions):Void;
	@:hlNative("flight", "flight_intersect_paths")
	public static function intersectPaths(out:flight._hl.Path, pathBooleanKernel:flight._hl.PathBooleanKernel, a:flight._hl.Path, b:flight._hl.Path, options:flight._hl.PathBooleanOptions):Void;
	@:hlNative("flight", "flight_union_paths")
	public static function unionPaths(out:flight._hl.Path, pathBooleanKernel:flight._hl.PathBooleanKernel, a:flight._hl.Path, b:flight._hl.Path, options:flight._hl.PathBooleanOptions):Void;
	@:hlNative("flight", "flight_xor_paths")
	public static function xorPaths(out:flight._hl.Path, pathBooleanKernel:flight._hl.PathBooleanKernel, a:flight._hl.Path, b:flight._hl.Path, options:flight._hl.PathBooleanOptions):Void;
	@:hlNative("flight", "flight_explain_offset_path")
	public static function explainOffsetPath(pathBooleanKernel:flight._hl.PathBooleanKernel, path:flight._hl.Path, delta:Float, options:flight._hl.PathOffsetOptions):Dynamic;
	@:hlNative("flight", "flight_explain_simplify_path")
	public static function explainSimplifyPath(pathBooleanKernel:flight._hl.PathBooleanKernel, path:flight._hl.Path, options:flight._hl.PathBooleanOptions):Dynamic;
	@:hlNative("flight", "flight_create_martinez_path_boolean_kernel")
	public static function createMartinezPathBooleanKernel():flight._hl.PathBooleanKernel;
	@:hlNative("flight", "flight_get_path_boolean_fill_rule_string")
	public static function getPathBooleanFillRuleString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_path_boolean_operation_string")
	public static function getPathBooleanOperationString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_parse_path_boolean_fill_rule")
	public static function parsePathBooleanFillRule(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_parse_path_boolean_operation")
	public static function parsePathBooleanOperation(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_offset_path")
	public static function offsetPath(out:flight._hl.Path, pathBooleanKernel:flight._hl.PathBooleanKernel, path:flight._hl.Path, delta:Float, options:flight._hl.PathOffsetOptions):Void;
	@:hlNative("flight", "flight_get_path_boolean_explanation_operation_string")
	public static function getPathBooleanExplanationOperationString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_path_boolean_explanation_reason_string")
	public static function getPathBooleanExplanationReasonString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_path_offset_end_string")
	public static function getPathOffsetEndString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_path_offset_join_string")
	public static function getPathOffsetJoinString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_parse_path_boolean_explanation_operation")
	public static function parsePathBooleanExplanationOperation(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_parse_path_boolean_explanation_reason")
	public static function parsePathBooleanExplanationReason(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_parse_path_offset_end")
	public static function parsePathOffsetEnd(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_parse_path_offset_join")
	public static function parsePathOffsetJoin(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_simplify_path")
	public static function simplifyPath(out:flight._hl.Path, pathBooleanKernel:flight._hl.PathBooleanKernel, path:flight._hl.Path, options:flight._hl.PathBooleanOptions):Void;
	@:hlNative("flight", "flight_free_path_boolean_explanation")
	public static function freePathBooleanExplanation(ptr:flight._hl.PathBooleanExplanation):Void;
	@:hlNative("flight", "flight_free_path_boolean_kernel")
	public static function freePathBooleanKernel(ptr:flight._hl.PathBooleanKernel):Void;
}
