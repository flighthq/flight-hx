package flight._js._fn;

@:jsRequire("@flighthq/clip")
extern class Clip {
	@:native("createClipRegionFromRectangle")
	public static function createClipRegionFromRectangle(rectangle:flight._js.Rectangle):Dynamic;
	@:native("acquireClipRegion")
	public static function acquireClipRegion():Dynamic;
	@:native("clipRegionContainsClipRegion")
	public static function clipRegionContainsClipRegion(a:Dynamic, b:Dynamic):Bool;
	@:native("clipRegionContainsPoint")
	public static function clipRegionContainsPoint(clip:Dynamic, x:Float, y:Float):Bool;
	@:native("clipRegionContainsRectangle")
	public static function clipRegionContainsRectangle(clip:Dynamic, rectangle:flight._js.Rectangle):Bool;
	@:native("clipRegionIntersectsClipRegion")
	public static function clipRegionIntersectsClipRegion(a:Dynamic, b:Dynamic):Bool;
	@:native("clipRegionIntersectsRectangle")
	public static function clipRegionIntersectsRectangle(clip:Dynamic, rectangle:flight._js.Rectangle):Bool;
	@:native("cloneClipRegion")
	public static function cloneClipRegion(clip:Dynamic):Dynamic;
	@:native("copyClipRegion")
	public static function copyClipRegion(out:Dynamic, source:Dynamic):Void;
	@:native("equalsClipRegion")
	public static function equalsClipRegion(a:Dynamic, b:Dynamic):Bool;
	@:native("explainClipRegion")
	public static function explainClipRegion(clip:Dynamic):flight._js.ClipRegionExplanation;
	@:native("getClipRegionBounds")
	public static function getClipRegionBounds(out:flight._js.Rectangle, clip:Dynamic):Void;
	@:native("intersectClipRegions")
	public static function intersectClipRegions(out:Dynamic, a:Dynamic, b:Dynamic):Void;
	@:native("invalidateClipRegion")
	public static function invalidateClipRegion(clip:Dynamic):Void;
	@:native("isClipRegionEmpty")
	public static function isClipRegionEmpty(clip:Dynamic):Bool;
	@:native("isClipRegionRectangular")
	public static function isClipRegionRectangular(clip:Dynamic):Bool;
	@:native("normalizeClipRegion")
	public static function normalizeClipRegion(out:Dynamic, clip:Dynamic):Void;
	@:native("releaseClipRegion")
	public static function releaseClipRegion(clip:Dynamic):Void;
	@:native("setClipRegionToRectangle")
	public static function setClipRegionToRectangle(out:Dynamic, rectangle:flight._js.Rectangle):Void;
	@:native("transformClipRegion")
	public static function transformClipRegion(out:Dynamic, clip:Dynamic, matrix:flight._js.Matrix):Void;
	@:native("unionClipRegions")
	public static function unionClipRegions(out:Dynamic, a:Dynamic, b:Dynamic):Void;
	@:native("createClipRegionFromCircle")
	public static function createClipRegionFromCircle(x:Float, y:Float, radius:Float, tolerance:Null<Float>):Dynamic;
	@:native("createClipRegionFromEllipse")
	public static function createClipRegionFromEllipse(rectangle:flight._js.Rectangle, tolerance:Null<Float>):Dynamic;
	@:native("createClipRegionFromPath")
	public static function createClipRegionFromPath(path:flight._js.Path, tolerance:Null<Float>):Dynamic;
	@:native("createClipRegionFromRoundedRectangle")
	public static function createClipRegionFromRoundedRectangle(rectangle:flight._js.Rectangle, radius:Float, tolerance:Null<Float>):Dynamic;
	@:native("disableClipGuards")
	public static function disableClipGuards():Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeClipRegionExplanation(ptr:flight._js.ClipRegionExplanation):Void {}
}
