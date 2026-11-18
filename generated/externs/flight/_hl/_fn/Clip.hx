package flight._hl._fn;

extern class Clip {
	@:hlNative("flight", "flight_create_clip_region_from_rectangle")
	public static function createClipRegionFromRectangle(rectangle:flight._hl.Rectangle):hl.Bytes;
	@:hlNative("flight", "flight_acquire_clip_region")
	public static function acquireClipRegion():hl.Bytes;
	@:hlNative("flight", "flight_clip_region_contains_clip_region")
	public static function clipRegionContainsClipRegion(a:hl.Bytes, b:hl.Bytes):Bool;
	@:hlNative("flight", "flight_clip_region_contains_point")
	public static function clipRegionContainsPoint(clip:hl.Bytes, x:Float, y:Float):Bool;
	@:hlNative("flight", "flight_clip_region_contains_rectangle")
	public static function clipRegionContainsRectangle(clip:hl.Bytes, rectangle:flight._hl.Rectangle):Bool;
	@:hlNative("flight", "flight_clip_region_intersects_clip_region")
	public static function clipRegionIntersectsClipRegion(a:hl.Bytes, b:hl.Bytes):Bool;
	@:hlNative("flight", "flight_clip_region_intersects_rectangle")
	public static function clipRegionIntersectsRectangle(clip:hl.Bytes, rectangle:flight._hl.Rectangle):Bool;
	@:hlNative("flight", "flight_clone_clip_region")
	public static function cloneClipRegion(clip:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_copy_clip_region")
	public static function copyClipRegion(out:hl.Bytes, source:hl.Bytes):Void;
	@:hlNative("flight", "flight_equals_clip_region")
	public static function equalsClipRegion(a:hl.Bytes, b:hl.Bytes):Bool;
	@:hlNative("flight", "flight_explain_clip_region")
	public static function explainClipRegion(clip:hl.Bytes):flight._hl.ClipRegionExplanation;
	@:hlNative("flight", "flight_get_clip_region_bounds")
	public static function getClipRegionBounds(out:flight._hl.Rectangle, clip:hl.Bytes):Void;
	@:hlNative("flight", "flight_intersect_clip_regions")
	public static function intersectClipRegions(out:hl.Bytes, a:hl.Bytes, b:hl.Bytes):Void;
	@:hlNative("flight", "flight_invalidate_clip_region")
	public static function invalidateClipRegion(clip:hl.Bytes):Void;
	@:hlNative("flight", "flight_is_clip_region_empty")
	public static function isClipRegionEmpty(clip:hl.Bytes):Bool;
	@:hlNative("flight", "flight_is_clip_region_rectangular")
	public static function isClipRegionRectangular(clip:hl.Bytes):Bool;
	@:hlNative("flight", "flight_normalize_clip_region")
	public static function normalizeClipRegion(out:hl.Bytes, clip:hl.Bytes):Void;
	@:hlNative("flight", "flight_release_clip_region")
	public static function releaseClipRegion(clip:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_clip_region_to_rectangle")
	public static function setClipRegionToRectangle(out:hl.Bytes, rectangle:flight._hl.Rectangle):Void;
	@:hlNative("flight", "flight_transform_clip_region")
	public static function transformClipRegion(out:hl.Bytes, clip:hl.Bytes, matrix:flight._hl.Matrix):Void;
	@:hlNative("flight", "flight_union_clip_regions")
	public static function unionClipRegions(out:hl.Bytes, a:hl.Bytes, b:hl.Bytes):Void;
	@:hlNative("flight", "flight_create_clip_region_from_circle")
	public static function createClipRegionFromCircle(x:Float, y:Float, radius:Float, tolerance:Float):hl.Bytes;
	@:hlNative("flight", "flight_create_clip_region_from_ellipse")
	public static function createClipRegionFromEllipse(rectangle:flight._hl.Rectangle, tolerance:Float):hl.Bytes;
	@:hlNative("flight", "flight_create_clip_region_from_path")
	public static function createClipRegionFromPath(path:flight._hl.Path, tolerance:Float):hl.Bytes;
	@:hlNative("flight", "flight_create_clip_region_from_rounded_rectangle")
	public static function createClipRegionFromRoundedRectangle(rectangle:flight._hl.Rectangle, radius:Float, tolerance:Float):hl.Bytes;
	@:hlNative("flight", "flight_disable_clip_guards")
	public static function disableClipGuards():Void;
	@:hlNative("flight", "flight_free_clip_region_explanation")
	public static function freeClipRegionExplanation(ptr:flight._hl.ClipRegionExplanation):Void;
}
