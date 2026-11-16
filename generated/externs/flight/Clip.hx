package flight;

#if (js && flight_esm)
extern inline function acquireClipRegion():Dynamic {
	return flight._js._fn.Clip.acquireClipRegion();
}
#else
extern inline function acquireClipRegion():Dynamic {
#if hl
	return flight._hl._fn.Clip.acquireClipRegion();
#elseif cpp
	return flight._cpp._fn.Clip.acquireClipRegion();
#elseif (js && flight_esm)
	return flight._js._fn.Clip.acquireClipRegion();
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clipRegionContainsClipRegion(a:Dynamic, b:Dynamic):Bool {
	return flight._js._fn.Clip.clipRegionContainsClipRegion(a, b);
}
#else
extern inline function clipRegionContainsClipRegion(a:Dynamic, b:Dynamic):Bool {
#if hl
	return flight._hl._fn.Clip.clipRegionContainsClipRegion(a, b);
#elseif cpp
	return flight._cpp._fn.Clip.clipRegionContainsClipRegion(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Clip.clipRegionContainsClipRegion(a, b);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clipRegionContainsPoint(clip:Dynamic, x:Float, y:Float):Bool {
	return flight._js._fn.Clip.clipRegionContainsPoint(clip, x, y);
}
#else
extern inline function clipRegionContainsPoint(clip:Dynamic, x:Float, y:Float):Bool {
#if hl
	return flight._hl._fn.Clip.clipRegionContainsPoint(clip, x, y);
#elseif cpp
	return flight._cpp._fn.Clip.clipRegionContainsPoint(clip, x, y);
#elseif (js && flight_esm)
	return flight._js._fn.Clip.clipRegionContainsPoint(clip, x, y);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clipRegionIntersectsClipRegion(a:Dynamic, b:Dynamic):Bool {
	return flight._js._fn.Clip.clipRegionIntersectsClipRegion(a, b);
}
#else
extern inline function clipRegionIntersectsClipRegion(a:Dynamic, b:Dynamic):Bool {
#if hl
	return flight._hl._fn.Clip.clipRegionIntersectsClipRegion(a, b);
#elseif cpp
	return flight._cpp._fn.Clip.clipRegionIntersectsClipRegion(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Clip.clipRegionIntersectsClipRegion(a, b);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function cloneClipRegion(clip:Dynamic):Dynamic {
	return flight._js._fn.Clip.cloneClipRegion(clip);
}
#else
extern inline function cloneClipRegion(clip:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Clip.cloneClipRegion(clip);
#elseif cpp
	return flight._cpp._fn.Clip.cloneClipRegion(clip);
#elseif (js && flight_esm)
	return flight._js._fn.Clip.cloneClipRegion(clip);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function copyClipRegion(out:Dynamic, source:Dynamic):Void {
	flight._js._fn.Clip.copyClipRegion(out, source);
}
#else
extern inline function copyClipRegion(out:Dynamic, source:Dynamic):Void {
#if hl
	flight._hl._fn.Clip.copyClipRegion(out, source);
#elseif cpp
	flight._cpp._fn.Clip.copyClipRegion(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Clip.copyClipRegion(out, source);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function equalsClipRegion(a:Dynamic, b:Dynamic):Bool {
	return flight._js._fn.Clip.equalsClipRegion(a, b);
}
#else
extern inline function equalsClipRegion(a:Dynamic, b:Dynamic):Bool {
#if hl
	return flight._hl._fn.Clip.equalsClipRegion(a, b);
#elseif cpp
	return flight._cpp._fn.Clip.equalsClipRegion(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Clip.equalsClipRegion(a, b);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainClipRegion(clip:Dynamic):ClipRegionExplanation {
	return flight._js._fn.Clip.explainClipRegion(clip);
}
#else
extern inline function explainClipRegion(clip:Dynamic):ClipRegionExplanation {
#if hl
	return flight._hl._fn.Clip.explainClipRegion(clip);
#elseif cpp
	return flight._cpp._fn.Clip.explainClipRegion(clip);
#elseif (js && flight_esm)
	return flight._js._fn.Clip.explainClipRegion(clip);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function intersectClipRegions(out:Dynamic, a:Dynamic, b:Dynamic):Void {
	flight._js._fn.Clip.intersectClipRegions(out, a, b);
}
#else
extern inline function intersectClipRegions(out:Dynamic, a:Dynamic, b:Dynamic):Void {
#if hl
	flight._hl._fn.Clip.intersectClipRegions(out, a, b);
#elseif cpp
	flight._cpp._fn.Clip.intersectClipRegions(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Clip.intersectClipRegions(out, a, b);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function invalidateClipRegion(clip:Dynamic):Void {
	flight._js._fn.Clip.invalidateClipRegion(clip);
}
#else
extern inline function invalidateClipRegion(clip:Dynamic):Void {
#if hl
	flight._hl._fn.Clip.invalidateClipRegion(clip);
#elseif cpp
	flight._cpp._fn.Clip.invalidateClipRegion(clip);
#elseif (js && flight_esm)
	flight._js._fn.Clip.invalidateClipRegion(clip);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isClipRegionEmpty(clip:Dynamic):Bool {
	return flight._js._fn.Clip.isClipRegionEmpty(clip);
}
#else
extern inline function isClipRegionEmpty(clip:Dynamic):Bool {
#if hl
	return flight._hl._fn.Clip.isClipRegionEmpty(clip);
#elseif cpp
	return flight._cpp._fn.Clip.isClipRegionEmpty(clip);
#elseif (js && flight_esm)
	return flight._js._fn.Clip.isClipRegionEmpty(clip);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isClipRegionRectangular(clip:Dynamic):Bool {
	return flight._js._fn.Clip.isClipRegionRectangular(clip);
}
#else
extern inline function isClipRegionRectangular(clip:Dynamic):Bool {
#if hl
	return flight._hl._fn.Clip.isClipRegionRectangular(clip);
#elseif cpp
	return flight._cpp._fn.Clip.isClipRegionRectangular(clip);
#elseif (js && flight_esm)
	return flight._js._fn.Clip.isClipRegionRectangular(clip);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function normalizeClipRegion(out:Dynamic, clip:Dynamic):Void {
	flight._js._fn.Clip.normalizeClipRegion(out, clip);
}
#else
extern inline function normalizeClipRegion(out:Dynamic, clip:Dynamic):Void {
#if hl
	flight._hl._fn.Clip.normalizeClipRegion(out, clip);
#elseif cpp
	flight._cpp._fn.Clip.normalizeClipRegion(out, clip);
#elseif (js && flight_esm)
	flight._js._fn.Clip.normalizeClipRegion(out, clip);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function releaseClipRegion(clip:Dynamic):Void {
	flight._js._fn.Clip.releaseClipRegion(clip);
}
#else
extern inline function releaseClipRegion(clip:Dynamic):Void {
#if hl
	flight._hl._fn.Clip.releaseClipRegion(clip);
#elseif cpp
	flight._cpp._fn.Clip.releaseClipRegion(clip);
#elseif (js && flight_esm)
	flight._js._fn.Clip.releaseClipRegion(clip);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function transformClipRegion(out:Dynamic, clip:Dynamic, matrix:Matrix):Void {
	flight._js._fn.Clip.transformClipRegion(out, clip, matrix);
}
#else
extern inline function transformClipRegion(out:Dynamic, clip:Dynamic, matrix:Matrix):Void {
#if hl
	flight._hl._fn.Clip.transformClipRegion(out, clip, matrix);
#elseif cpp
	flight._cpp._fn.Clip.transformClipRegion(out, clip, matrix);
#elseif (js && flight_esm)
	flight._js._fn.Clip.transformClipRegion(out, clip, matrix);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function unionClipRegions(out:Dynamic, a:Dynamic, b:Dynamic):Void {
	flight._js._fn.Clip.unionClipRegions(out, a, b);
}
#else
extern inline function unionClipRegions(out:Dynamic, a:Dynamic, b:Dynamic):Void {
#if hl
	flight._hl._fn.Clip.unionClipRegions(out, a, b);
#elseif cpp
	flight._cpp._fn.Clip.unionClipRegions(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Clip.unionClipRegions(out, a, b);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createClipRegionFromCircle(x:Float, y:Float, radius:Float, tolerance:Null<Float>):Dynamic {
	return flight._js._fn.Clip.createClipRegionFromCircle(x, y, radius, tolerance);
}
#else
extern inline function createClipRegionFromCircle(x:Float, y:Float, radius:Float, tolerance:Float):Dynamic {
#if hl
	return flight._hl._fn.Clip.createClipRegionFromCircle(x, y, radius, tolerance);
#elseif cpp
	return flight._cpp._fn.Clip.createClipRegionFromCircle(x, y, radius, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Clip.createClipRegionFromCircle(x, y, radius, tolerance);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createClipRegionFromPath(path:Path, tolerance:Null<Float>):Dynamic {
	return flight._js._fn.Clip.createClipRegionFromPath(path, tolerance);
}
#else
extern inline function createClipRegionFromPath(path:Path, tolerance:Float):Dynamic {
#if hl
	return flight._hl._fn.Clip.createClipRegionFromPath(path, tolerance);
#elseif cpp
	return flight._cpp._fn.Clip.createClipRegionFromPath(path, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Clip.createClipRegionFromPath(path, tolerance);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getClipRegionContoursReasonString(reason:Dynamic):String {
	return flight._js._fn.Clip.getClipRegionContoursReasonString(reason);
}
#else
extern inline function getClipRegionContoursReasonString(reason:flight.ClipRegionContoursReason):String {
#if hl
	return cast flight._hl._fn.Clip.getClipRegionContoursReasonString(reason);
#elseif cpp
	return cast flight._cpp._fn.Clip.getClipRegionContoursReasonString(reason);
#elseif (js && flight_esm)
	return cast flight._js._fn.Clip.getClipRegionContoursReasonString(reason);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getClipRegionStatusString(status:Dynamic):String {
	return flight._js._fn.Clip.getClipRegionStatusString(status);
}
#else
extern inline function getClipRegionStatusString(status:flight.ClipRegionStatus):String {
#if hl
	return cast flight._hl._fn.Clip.getClipRegionStatusString(status);
#elseif cpp
	return cast flight._cpp._fn.Clip.getClipRegionStatusString(status);
#elseif (js && flight_esm)
	return cast flight._js._fn.Clip.getClipRegionStatusString(status);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseClipRegionContoursReason(value:String):Null<Dynamic> {
	return flight._js._fn.Clip.parseClipRegionContoursReason(value);
}
#else
extern inline function parseClipRegionContoursReason(value:String):Int {
#if hl
	return flight._hl._fn.Clip.parseClipRegionContoursReason(cast value);
#elseif cpp
	return flight._cpp._fn.Clip.parseClipRegionContoursReason(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Clip.parseClipRegionContoursReason(value);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseClipRegionStatus(value:String):Null<Dynamic> {
	return flight._js._fn.Clip.parseClipRegionStatus(value);
}
#else
extern inline function parseClipRegionStatus(value:String):Int {
#if hl
	return flight._hl._fn.Clip.parseClipRegionStatus(cast value);
#elseif cpp
	return flight._cpp._fn.Clip.parseClipRegionStatus(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Clip.parseClipRegionStatus(value);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disableClipGuards():Void {
	flight._js._fn.Clip.disableClipGuards();
}
#else
extern inline function disableClipGuards():Void {
#if hl
	flight._hl._fn.Clip.disableClipGuards();
#elseif cpp
	flight._cpp._fn.Clip.disableClipGuards();
#elseif (js && flight_esm)
	flight._js._fn.Clip.disableClipGuards();
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeClipRegionExplanation(ptr:ClipRegionExplanation):Void {
	flight._js._fn.Clip.freeClipRegionExplanation(ptr);
}
#else
extern inline function freeClipRegionExplanation(ptr:ClipRegionExplanation):Void {
#if hl
	flight._hl._fn.Clip.freeClipRegionExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Clip.freeClipRegionExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Clip.freeClipRegionExplanation(ptr);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
