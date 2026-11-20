package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/path-boolean")
extern class PathBoolean {
  public static function booleanPaths(out:flight.esm.types.path_contract.Types.PathRaw, pathBooleanKernel:flight.esm.types.path_boolean_contract.Types.PathBooleanKernelRaw, subject:flight.esm.types.path_contract.Types.PathRaw, clip:flight.esm.types.path_contract.Types.PathRaw, operation:flight.esm.types.path_boolean.Types.PathBooleanOperation, ?options:Null<flight.esm.types.path_boolean.Types.PathBooleanOptions>):Void;
  public static function createMartinezPathBooleanKernel():flight.esm.types.path_boolean_contract.Types.PathBooleanKernelRaw;
  public static function differencePaths(out:flight.esm.types.path_contract.Types.PathRaw, pathBooleanKernel:flight.esm.types.path_boolean_contract.Types.PathBooleanKernelRaw, a:flight.esm.types.path_contract.Types.PathRaw, b:flight.esm.types.path_contract.Types.PathRaw, ?options:Null<flight.esm.types.path_boolean.Types.PathBooleanOptions>):Void;
  public static function explainOffsetPath(pathBooleanKernel:flight.esm.types.path_boolean_contract.Types.PathBooleanKernelRaw, path:flight.esm.types.path_contract.Types.PathRaw, delta:Float, ?options:Null<flight.esm.types.path_boolean.Types.PathOffsetOptions>):Null<flight.esm.types.path_boolean.Types.PathBooleanExplanation>;
  public static function explainSimplifyPath(pathBooleanKernel:flight.esm.types.path_boolean_contract.Types.PathBooleanKernelRaw, path:flight.esm.types.path_contract.Types.PathRaw, ?options:Null<flight.esm.types.path_boolean.Types.PathBooleanOptions>):Null<flight.esm.types.path_boolean.Types.PathBooleanExplanation>;
  public static function getPathBooleanExplanationOperationString(value:flight.esm.types.path_boolean.Types.PathBooleanExplanationOperation):String;
  public static function getPathBooleanExplanationReasonString(value:flight.esm.types.path_boolean.Types.PathBooleanExplanationReason):String;
  public static function getPathBooleanFillRuleString(value:flight.esm.types.path_boolean.Types.PathBooleanFillRule):String;
  public static function getPathBooleanOperationString(value:flight.esm.types.path_boolean.Types.PathBooleanOperation):String;
  public static function getPathOffsetEndString(value:flight.esm.types.path_boolean.Types.PathOffsetEnd):String;
  public static function getPathOffsetJoinString(value:flight.esm.types.path_boolean.Types.PathOffsetJoin):String;
  public static function intersectPaths(out:flight.esm.types.path_contract.Types.PathRaw, pathBooleanKernel:flight.esm.types.path_boolean_contract.Types.PathBooleanKernelRaw, a:flight.esm.types.path_contract.Types.PathRaw, b:flight.esm.types.path_contract.Types.PathRaw, ?options:Null<flight.esm.types.path_boolean.Types.PathBooleanOptions>):Void;
  public static final martinezPathBooleanKernel:flight.esm.types.path_boolean_contract.Types.PathBooleanKernelRaw;
  public static function offsetPath(out:flight.esm.types.path_contract.Types.PathRaw, pathBooleanKernel:flight.esm.types.path_boolean_contract.Types.PathBooleanKernelRaw, path:flight.esm.types.path_contract.Types.PathRaw, delta:Float, ?options:Null<flight.esm.types.path_boolean.Types.PathOffsetOptions>):Void;
  public static function parsePathBooleanExplanationOperation(value:String):Null<String>;
  public static function parsePathBooleanExplanationReason(value:String):Null<String>;
  public static function parsePathBooleanFillRule(value:String):Null<String>;
  public static function parsePathBooleanOperation(value:String):Null<String>;
  public static function parsePathOffsetEnd(value:String):Null<String>;
  public static function parsePathOffsetJoin(value:String):Null<String>;
  public static function resolvePathRegions(out:flight.esm.types.path_contract.Types.PathRaw, pathBooleanKernel:flight.esm.types.path_boolean_contract.Types.PathBooleanKernelRaw, rings:Array<Array<Float>>, fillRule:flight.esm.types.path_boolean.Types.PathBooleanFillRule):Void;
  public static function simplifyPath(out:flight.esm.types.path_contract.Types.PathRaw, pathBooleanKernel:flight.esm.types.path_boolean_contract.Types.PathBooleanKernelRaw, path:flight.esm.types.path_contract.Types.PathRaw, ?options:Null<flight.esm.types.path_boolean.Types.PathBooleanOptions>):Void;
  public static function unionAllPaths(out:flight.esm.types.path_contract.Types.PathRaw, pathBooleanKernel:flight.esm.types.path_boolean_contract.Types.PathBooleanKernelRaw, paths:Array<flight.esm.types.path_contract.Types.PathRaw>, ?options:Null<flight.esm.types.path_boolean.Types.PathBooleanOptions>):Void;
  public static function unionPaths(out:flight.esm.types.path_contract.Types.PathRaw, pathBooleanKernel:flight.esm.types.path_boolean_contract.Types.PathBooleanKernelRaw, a:flight.esm.types.path_contract.Types.PathRaw, b:flight.esm.types.path_contract.Types.PathRaw, ?options:Null<flight.esm.types.path_boolean.Types.PathBooleanOptions>):Void;
  public static function writePathBooleanContours(out:flight.esm.types.path_contract.Types.PathRaw, contours:Array<Array<Float>>):Void;
  public static function xorPaths(out:flight.esm.types.path_contract.Types.PathRaw, pathBooleanKernel:flight.esm.types.path_boolean_contract.Types.PathBooleanKernelRaw, a:flight.esm.types.path_contract.Types.PathRaw, b:flight.esm.types.path_contract.Types.PathRaw, ?options:Null<flight.esm.types.path_boolean.Types.PathBooleanOptions>):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
