package flight;

#if (js && flight_esm)
extern inline function createClipRegionFromRectangle(rectangle:Rectangle):Dynamic {
	return flight._js._fn.Clip.createClipRegionFromRectangle(rectangle);
}
#else
extern inline function createClipRegionFromRectangle(rectangle:Rectangle):Dynamic {
#if hl
	return flight._hl._fn.Clip.createClipRegionFromRectangle(rectangle);
#elseif cpp
	return flight._cpp._fn.Clip.createClipRegionFromRectangle(rectangle);
#elseif (js && flight_esm)
	return flight._js._fn.Clip.createClipRegionFromRectangle(rectangle);
#else
	#error "flight.Clip: no backend for this target."
#end
}
#end
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
extern inline function clipRegionContainsRectangle(clip:Dynamic, rectangle:Rectangle):Bool {
	return flight._js._fn.Clip.clipRegionContainsRectangle(clip, rectangle);
}
#else
extern inline function clipRegionContainsRectangle(clip:Dynamic, rectangle:Rectangle):Bool {
#if hl
	return flight._hl._fn.Clip.clipRegionContainsRectangle(clip, rectangle);
#elseif cpp
	return flight._cpp._fn.Clip.clipRegionContainsRectangle(clip, rectangle);
#elseif (js && flight_esm)
	return flight._js._fn.Clip.clipRegionContainsRectangle(clip, rectangle);
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
extern inline function clipRegionIntersectsRectangle(clip:Dynamic, rectangle:Rectangle):Bool {
	return flight._js._fn.Clip.clipRegionIntersectsRectangle(clip, rectangle);
}
#else
extern inline function clipRegionIntersectsRectangle(clip:Dynamic, rectangle:Rectangle):Bool {
#if hl
	return flight._hl._fn.Clip.clipRegionIntersectsRectangle(clip, rectangle);
#elseif cpp
	return flight._cpp._fn.Clip.clipRegionIntersectsRectangle(clip, rectangle);
#elseif (js && flight_esm)
	return flight._js._fn.Clip.clipRegionIntersectsRectangle(clip, rectangle);
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
extern inline function getClipRegionBounds(out:Rectangle, clip:Dynamic):Void {
	flight._js._fn.Clip.getClipRegionBounds(out, clip);
}
#else
extern inline function getClipRegionBounds(out:Rectangle, clip:Dynamic):Void {
#if hl
	flight._hl._fn.Clip.getClipRegionBounds(out, clip);
#elseif cpp
	flight._cpp._fn.Clip.getClipRegionBounds(out, clip);
#elseif (js && flight_esm)
	flight._js._fn.Clip.getClipRegionBounds(out, clip);
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
extern inline function setClipRegionToRectangle(out:Dynamic, rectangle:Rectangle):Void {
	flight._js._fn.Clip.setClipRegionToRectangle(out, rectangle);
}
#else
extern inline function setClipRegionToRectangle(out:Dynamic, rectangle:Rectangle):Void {
#if hl
	flight._hl._fn.Clip.setClipRegionToRectangle(out, rectangle);
#elseif cpp
	flight._cpp._fn.Clip.setClipRegionToRectangle(out, rectangle);
#elseif (js && flight_esm)
	flight._js._fn.Clip.setClipRegionToRectangle(out, rectangle);
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
extern inline function createClipRegionFromEllipse(rectangle:Rectangle, tolerance:Null<Float>):Dynamic {
	return flight._js._fn.Clip.createClipRegionFromEllipse(rectangle, tolerance);
}
#else
extern inline function createClipRegionFromEllipse(rectangle:Rectangle, tolerance:Float):Dynamic {
#if hl
	return flight._hl._fn.Clip.createClipRegionFromEllipse(rectangle, tolerance);
#elseif cpp
	return flight._cpp._fn.Clip.createClipRegionFromEllipse(rectangle, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Clip.createClipRegionFromEllipse(rectangle, tolerance);
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
extern inline function createClipRegionFromRoundedRectangle(rectangle:Rectangle, radius:Float, tolerance:Null<Float>):Dynamic {
	return flight._js._fn.Clip.createClipRegionFromRoundedRectangle(rectangle, radius, tolerance);
}
#else
extern inline function createClipRegionFromRoundedRectangle(rectangle:Rectangle, radius:Float, tolerance:Float):Dynamic {
#if hl
	return flight._hl._fn.Clip.createClipRegionFromRoundedRectangle(rectangle, radius, tolerance);
#elseif cpp
	return flight._cpp._fn.Clip.createClipRegionFromRoundedRectangle(rectangle, radius, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Clip.createClipRegionFromRoundedRectangle(rectangle, radius, tolerance);
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
