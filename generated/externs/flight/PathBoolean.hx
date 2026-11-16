package flight;

#if (js && flight_esm)
extern inline function booleanPaths(out:Path, pathBooleanKernel:PathBooleanKernel, subject:Path, clip:Path, operation:Dynamic, options:Null<PathBooleanOptions>):Void {
	flight._js._fn.PathBoolean.booleanPaths(out, pathBooleanKernel, subject, clip, operation, options);
}
#else
extern inline function booleanPaths(out:Path, pathBooleanKernel:PathBooleanKernel, subject:Path, clip:Path, operation:flight.PathBooleanOperation, options:PathBooleanOptions):Void {
#if hl
	flight._hl._fn.PathBoolean.booleanPaths(out, pathBooleanKernel, subject, clip, operation, options);
#elseif cpp
	flight._cpp._fn.PathBoolean.booleanPaths(out, pathBooleanKernel, subject, clip, operation, options);
#elseif (js && flight_esm)
	flight._js._fn.PathBoolean.booleanPaths(out, pathBooleanKernel, subject, clip, operation, options);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function differencePaths(out:Path, pathBooleanKernel:PathBooleanKernel, a:Path, b:Path, options:Null<PathBooleanOptions>):Void {
	flight._js._fn.PathBoolean.differencePaths(out, pathBooleanKernel, a, b, options);
}
#else
extern inline function differencePaths(out:Path, pathBooleanKernel:PathBooleanKernel, a:Path, b:Path, options:PathBooleanOptions):Void {
#if hl
	flight._hl._fn.PathBoolean.differencePaths(out, pathBooleanKernel, a, b, options);
#elseif cpp
	flight._cpp._fn.PathBoolean.differencePaths(out, pathBooleanKernel, a, b, options);
#elseif (js && flight_esm)
	flight._js._fn.PathBoolean.differencePaths(out, pathBooleanKernel, a, b, options);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function intersectPaths(out:Path, pathBooleanKernel:PathBooleanKernel, a:Path, b:Path, options:Null<PathBooleanOptions>):Void {
	flight._js._fn.PathBoolean.intersectPaths(out, pathBooleanKernel, a, b, options);
}
#else
extern inline function intersectPaths(out:Path, pathBooleanKernel:PathBooleanKernel, a:Path, b:Path, options:PathBooleanOptions):Void {
#if hl
	flight._hl._fn.PathBoolean.intersectPaths(out, pathBooleanKernel, a, b, options);
#elseif cpp
	flight._cpp._fn.PathBoolean.intersectPaths(out, pathBooleanKernel, a, b, options);
#elseif (js && flight_esm)
	flight._js._fn.PathBoolean.intersectPaths(out, pathBooleanKernel, a, b, options);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function unionPaths(out:Path, pathBooleanKernel:PathBooleanKernel, a:Path, b:Path, options:Null<PathBooleanOptions>):Void {
	flight._js._fn.PathBoolean.unionPaths(out, pathBooleanKernel, a, b, options);
}
#else
extern inline function unionPaths(out:Path, pathBooleanKernel:PathBooleanKernel, a:Path, b:Path, options:PathBooleanOptions):Void {
#if hl
	flight._hl._fn.PathBoolean.unionPaths(out, pathBooleanKernel, a, b, options);
#elseif cpp
	flight._cpp._fn.PathBoolean.unionPaths(out, pathBooleanKernel, a, b, options);
#elseif (js && flight_esm)
	flight._js._fn.PathBoolean.unionPaths(out, pathBooleanKernel, a, b, options);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function xorPaths(out:Path, pathBooleanKernel:PathBooleanKernel, a:Path, b:Path, options:Null<PathBooleanOptions>):Void {
	flight._js._fn.PathBoolean.xorPaths(out, pathBooleanKernel, a, b, options);
}
#else
extern inline function xorPaths(out:Path, pathBooleanKernel:PathBooleanKernel, a:Path, b:Path, options:PathBooleanOptions):Void {
#if hl
	flight._hl._fn.PathBoolean.xorPaths(out, pathBooleanKernel, a, b, options);
#elseif cpp
	flight._cpp._fn.PathBoolean.xorPaths(out, pathBooleanKernel, a, b, options);
#elseif (js && flight_esm)
	flight._js._fn.PathBoolean.xorPaths(out, pathBooleanKernel, a, b, options);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainOffsetPath(pathBooleanKernel:PathBooleanKernel, path:Path, delta:Float, options:Null<PathOffsetOptions>):Null<PathBooleanExplanation> {
	return flight._js._fn.PathBoolean.explainOffsetPath(pathBooleanKernel, path, delta, options);
}
#else
extern inline function explainOffsetPath(pathBooleanKernel:PathBooleanKernel, path:Path, delta:Float, options:PathOffsetOptions):PathBooleanExplanation {
#if hl
	return flight._hl._fn.PathBoolean.explainOffsetPath(pathBooleanKernel, path, delta, options);
#elseif cpp
	return flight._cpp._fn.PathBoolean.explainOffsetPath(pathBooleanKernel, path, delta, options);
#elseif (js && flight_esm)
	return flight._js._fn.PathBoolean.explainOffsetPath(pathBooleanKernel, path, delta, options);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainSimplifyPath(pathBooleanKernel:PathBooleanKernel, path:Path, options:Null<PathBooleanOptions>):Null<PathBooleanExplanation> {
	return flight._js._fn.PathBoolean.explainSimplifyPath(pathBooleanKernel, path, options);
}
#else
extern inline function explainSimplifyPath(pathBooleanKernel:PathBooleanKernel, path:Path, options:PathBooleanOptions):PathBooleanExplanation {
#if hl
	return flight._hl._fn.PathBoolean.explainSimplifyPath(pathBooleanKernel, path, options);
#elseif cpp
	return flight._cpp._fn.PathBoolean.explainSimplifyPath(pathBooleanKernel, path, options);
#elseif (js && flight_esm)
	return flight._js._fn.PathBoolean.explainSimplifyPath(pathBooleanKernel, path, options);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createMartinezPathBooleanKernel():PathBooleanKernel {
	return flight._js._fn.PathBoolean.createMartinezPathBooleanKernel();
}
#else
extern inline function createMartinezPathBooleanKernel():PathBooleanKernel {
#if hl
	return flight._hl._fn.PathBoolean.createMartinezPathBooleanKernel();
#elseif cpp
	return flight._cpp._fn.PathBoolean.createMartinezPathBooleanKernel();
#elseif (js && flight_esm)
	return flight._js._fn.PathBoolean.createMartinezPathBooleanKernel();
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPathBooleanFillRuleString(value:Dynamic):String {
	return flight._js._fn.PathBoolean.getPathBooleanFillRuleString(value);
}
#else
extern inline function getPathBooleanFillRuleString(value:flight.PathBooleanFillRule):String {
#if hl
	return cast flight._hl._fn.PathBoolean.getPathBooleanFillRuleString(value);
#elseif cpp
	return cast flight._cpp._fn.PathBoolean.getPathBooleanFillRuleString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.PathBoolean.getPathBooleanFillRuleString(value);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPathBooleanOperationString(value:Dynamic):String {
	return flight._js._fn.PathBoolean.getPathBooleanOperationString(value);
}
#else
extern inline function getPathBooleanOperationString(value:flight.PathBooleanOperation):String {
#if hl
	return cast flight._hl._fn.PathBoolean.getPathBooleanOperationString(value);
#elseif cpp
	return cast flight._cpp._fn.PathBoolean.getPathBooleanOperationString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.PathBoolean.getPathBooleanOperationString(value);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parsePathBooleanFillRule(value:String):Null<Dynamic> {
	return flight._js._fn.PathBoolean.parsePathBooleanFillRule(value);
}
#else
extern inline function parsePathBooleanFillRule(value:String):Int {
#if hl
	return flight._hl._fn.PathBoolean.parsePathBooleanFillRule(cast value);
#elseif cpp
	return flight._cpp._fn.PathBoolean.parsePathBooleanFillRule(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.PathBoolean.parsePathBooleanFillRule(value);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parsePathBooleanOperation(value:String):Null<Dynamic> {
	return flight._js._fn.PathBoolean.parsePathBooleanOperation(value);
}
#else
extern inline function parsePathBooleanOperation(value:String):Int {
#if hl
	return flight._hl._fn.PathBoolean.parsePathBooleanOperation(cast value);
#elseif cpp
	return flight._cpp._fn.PathBoolean.parsePathBooleanOperation(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.PathBoolean.parsePathBooleanOperation(value);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function offsetPath(out:Path, pathBooleanKernel:PathBooleanKernel, path:Path, delta:Float, options:Null<PathOffsetOptions>):Void {
	flight._js._fn.PathBoolean.offsetPath(out, pathBooleanKernel, path, delta, options);
}
#else
extern inline function offsetPath(out:Path, pathBooleanKernel:PathBooleanKernel, path:Path, delta:Float, options:PathOffsetOptions):Void {
#if hl
	flight._hl._fn.PathBoolean.offsetPath(out, pathBooleanKernel, path, delta, options);
#elseif cpp
	flight._cpp._fn.PathBoolean.offsetPath(out, pathBooleanKernel, path, delta, options);
#elseif (js && flight_esm)
	flight._js._fn.PathBoolean.offsetPath(out, pathBooleanKernel, path, delta, options);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPathBooleanExplanationOperationString(value:Dynamic):String {
	return flight._js._fn.PathBoolean.getPathBooleanExplanationOperationString(value);
}
#else
extern inline function getPathBooleanExplanationOperationString(value:flight.PathBooleanExplanationOperation):String {
#if hl
	return cast flight._hl._fn.PathBoolean.getPathBooleanExplanationOperationString(value);
#elseif cpp
	return cast flight._cpp._fn.PathBoolean.getPathBooleanExplanationOperationString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.PathBoolean.getPathBooleanExplanationOperationString(value);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPathBooleanExplanationReasonString(value:Dynamic):String {
	return flight._js._fn.PathBoolean.getPathBooleanExplanationReasonString(value);
}
#else
extern inline function getPathBooleanExplanationReasonString(value:flight.PathBooleanExplanationReason):String {
#if hl
	return cast flight._hl._fn.PathBoolean.getPathBooleanExplanationReasonString(value);
#elseif cpp
	return cast flight._cpp._fn.PathBoolean.getPathBooleanExplanationReasonString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.PathBoolean.getPathBooleanExplanationReasonString(value);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPathOffsetEndString(value:Dynamic):String {
	return flight._js._fn.PathBoolean.getPathOffsetEndString(value);
}
#else
extern inline function getPathOffsetEndString(value:flight.PathOffsetEnd):String {
#if hl
	return cast flight._hl._fn.PathBoolean.getPathOffsetEndString(value);
#elseif cpp
	return cast flight._cpp._fn.PathBoolean.getPathOffsetEndString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.PathBoolean.getPathOffsetEndString(value);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPathOffsetJoinString(value:Dynamic):String {
	return flight._js._fn.PathBoolean.getPathOffsetJoinString(value);
}
#else
extern inline function getPathOffsetJoinString(value:flight.PathOffsetJoin):String {
#if hl
	return cast flight._hl._fn.PathBoolean.getPathOffsetJoinString(value);
#elseif cpp
	return cast flight._cpp._fn.PathBoolean.getPathOffsetJoinString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.PathBoolean.getPathOffsetJoinString(value);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parsePathBooleanExplanationOperation(value:String):Null<Dynamic> {
	return flight._js._fn.PathBoolean.parsePathBooleanExplanationOperation(value);
}
#else
extern inline function parsePathBooleanExplanationOperation(value:String):Int {
#if hl
	return flight._hl._fn.PathBoolean.parsePathBooleanExplanationOperation(cast value);
#elseif cpp
	return flight._cpp._fn.PathBoolean.parsePathBooleanExplanationOperation(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.PathBoolean.parsePathBooleanExplanationOperation(value);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parsePathBooleanExplanationReason(value:String):Null<Dynamic> {
	return flight._js._fn.PathBoolean.parsePathBooleanExplanationReason(value);
}
#else
extern inline function parsePathBooleanExplanationReason(value:String):Int {
#if hl
	return flight._hl._fn.PathBoolean.parsePathBooleanExplanationReason(cast value);
#elseif cpp
	return flight._cpp._fn.PathBoolean.parsePathBooleanExplanationReason(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.PathBoolean.parsePathBooleanExplanationReason(value);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parsePathOffsetEnd(value:String):Null<Dynamic> {
	return flight._js._fn.PathBoolean.parsePathOffsetEnd(value);
}
#else
extern inline function parsePathOffsetEnd(value:String):Int {
#if hl
	return flight._hl._fn.PathBoolean.parsePathOffsetEnd(cast value);
#elseif cpp
	return flight._cpp._fn.PathBoolean.parsePathOffsetEnd(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.PathBoolean.parsePathOffsetEnd(value);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parsePathOffsetJoin(value:String):Null<Dynamic> {
	return flight._js._fn.PathBoolean.parsePathOffsetJoin(value);
}
#else
extern inline function parsePathOffsetJoin(value:String):Int {
#if hl
	return flight._hl._fn.PathBoolean.parsePathOffsetJoin(cast value);
#elseif cpp
	return flight._cpp._fn.PathBoolean.parsePathOffsetJoin(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.PathBoolean.parsePathOffsetJoin(value);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function simplifyPath(out:Path, pathBooleanKernel:PathBooleanKernel, path:Path, options:Null<PathBooleanOptions>):Void {
	flight._js._fn.PathBoolean.simplifyPath(out, pathBooleanKernel, path, options);
}
#else
extern inline function simplifyPath(out:Path, pathBooleanKernel:PathBooleanKernel, path:Path, options:PathBooleanOptions):Void {
#if hl
	flight._hl._fn.PathBoolean.simplifyPath(out, pathBooleanKernel, path, options);
#elseif cpp
	flight._cpp._fn.PathBoolean.simplifyPath(out, pathBooleanKernel, path, options);
#elseif (js && flight_esm)
	flight._js._fn.PathBoolean.simplifyPath(out, pathBooleanKernel, path, options);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePathBooleanExplanation(ptr:PathBooleanExplanation):Void {
	flight._js._fn.PathBoolean.freePathBooleanExplanation(ptr);
}
#else
extern inline function freePathBooleanExplanation(ptr:PathBooleanExplanation):Void {
#if hl
	flight._hl._fn.PathBoolean.freePathBooleanExplanation(ptr);
#elseif cpp
	flight._cpp._fn.PathBoolean.freePathBooleanExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.PathBoolean.freePathBooleanExplanation(ptr);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePathBooleanKernel(ptr:PathBooleanKernel):Void {
	flight._js._fn.PathBoolean.freePathBooleanKernel(ptr);
}
#else
extern inline function freePathBooleanKernel(ptr:PathBooleanKernel):Void {
#if hl
	flight._hl._fn.PathBoolean.freePathBooleanKernel(ptr);
#elseif cpp
	flight._cpp._fn.PathBoolean.freePathBooleanKernel(ptr);
#elseif (js && flight_esm)
	flight._js._fn.PathBoolean.freePathBooleanKernel(ptr);
#else
	#error "flight.PathBoolean: no backend for this target."
#end
}
#end
