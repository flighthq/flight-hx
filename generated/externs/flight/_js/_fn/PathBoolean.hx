package flight._js._fn;

@:jsRequire("@flighthq/path-boolean")
extern class PathBoolean {
	@:native("booleanPaths")
	public static function booleanPaths(out:flight._js.Path, pathBooleanKernel:flight._js.PathBooleanKernel, subject:flight._js.Path, clip:flight._js.Path, operation:Dynamic, options:Null<flight._js.PathBooleanOptions>):Void;
	@:native("differencePaths")
	public static function differencePaths(out:flight._js.Path, pathBooleanKernel:flight._js.PathBooleanKernel, a:flight._js.Path, b:flight._js.Path, options:Null<flight._js.PathBooleanOptions>):Void;
	@:native("intersectPaths")
	public static function intersectPaths(out:flight._js.Path, pathBooleanKernel:flight._js.PathBooleanKernel, a:flight._js.Path, b:flight._js.Path, options:Null<flight._js.PathBooleanOptions>):Void;
	@:native("unionPaths")
	public static function unionPaths(out:flight._js.Path, pathBooleanKernel:flight._js.PathBooleanKernel, a:flight._js.Path, b:flight._js.Path, options:Null<flight._js.PathBooleanOptions>):Void;
	@:native("xorPaths")
	public static function xorPaths(out:flight._js.Path, pathBooleanKernel:flight._js.PathBooleanKernel, a:flight._js.Path, b:flight._js.Path, options:Null<flight._js.PathBooleanOptions>):Void;
	@:native("explainOffsetPath")
	public static function explainOffsetPath(pathBooleanKernel:flight._js.PathBooleanKernel, path:flight._js.Path, delta:Float, options:Null<flight._js.PathOffsetOptions>):Null<flight._js.PathBooleanExplanation>;
	@:native("explainSimplifyPath")
	public static function explainSimplifyPath(pathBooleanKernel:flight._js.PathBooleanKernel, path:flight._js.Path, options:Null<flight._js.PathBooleanOptions>):Null<flight._js.PathBooleanExplanation>;
	@:native("createMartinezPathBooleanKernel")
	public static function createMartinezPathBooleanKernel():flight._js.PathBooleanKernel;
	@:native("getPathBooleanFillRuleString")
	public static function getPathBooleanFillRuleString(value:Dynamic):String;
	@:native("getPathBooleanOperationString")
	public static function getPathBooleanOperationString(value:Dynamic):String;
	@:native("parsePathBooleanFillRule")
	public static function parsePathBooleanFillRule(value:String):Null<Dynamic>;
	@:native("parsePathBooleanOperation")
	public static function parsePathBooleanOperation(value:String):Null<Dynamic>;
	@:native("offsetPath")
	public static function offsetPath(out:flight._js.Path, pathBooleanKernel:flight._js.PathBooleanKernel, path:flight._js.Path, delta:Float, options:Null<flight._js.PathOffsetOptions>):Void;
	@:native("getPathBooleanExplanationOperationString")
	public static function getPathBooleanExplanationOperationString(value:Dynamic):String;
	@:native("getPathBooleanExplanationReasonString")
	public static function getPathBooleanExplanationReasonString(value:Dynamic):String;
	@:native("getPathOffsetEndString")
	public static function getPathOffsetEndString(value:Dynamic):String;
	@:native("getPathOffsetJoinString")
	public static function getPathOffsetJoinString(value:Dynamic):String;
	@:native("parsePathBooleanExplanationOperation")
	public static function parsePathBooleanExplanationOperation(value:String):Null<Dynamic>;
	@:native("parsePathBooleanExplanationReason")
	public static function parsePathBooleanExplanationReason(value:String):Null<Dynamic>;
	@:native("parsePathOffsetEnd")
	public static function parsePathOffsetEnd(value:String):Null<Dynamic>;
	@:native("parsePathOffsetJoin")
	public static function parsePathOffsetJoin(value:String):Null<Dynamic>;
	@:native("simplifyPath")
	public static function simplifyPath(out:flight._js.Path, pathBooleanKernel:flight._js.PathBooleanKernel, path:flight._js.Path, options:Null<flight._js.PathBooleanOptions>):Void;
	@:native("unionAllPaths")
	public static function unionAllPaths(out:flight._js.Path, pathBooleanKernel:flight._js.PathBooleanKernel, paths:Dynamic, options:Null<flight._js.PathBooleanOptions>):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePathBooleanExplanation(ptr:flight._js.PathBooleanExplanation):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePathBooleanKernel(ptr:flight._js.PathBooleanKernel):Void {}
}
