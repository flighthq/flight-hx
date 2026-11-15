package flight._hl._fn;

extern class Clip {
	@:hlNative("flight", "flight_acquire_clip_region")
	public static function acquireClipRegion():Dynamic;
	@:hlNative("flight", "flight_clip_region_contains_clip_region")
	public static function clipRegionContainsClipRegion(a:Dynamic, b:Dynamic):Bool;
	@:hlNative("flight", "flight_clip_region_contains_point")
	public static function clipRegionContainsPoint(clip:Dynamic, x:Float, y:Float):Bool;
	@:hlNative("flight", "flight_clip_region_intersects_clip_region")
	public static function clipRegionIntersectsClipRegion(a:Dynamic, b:Dynamic):Bool;
	@:hlNative("flight", "flight_clone_clip_region")
	public static function cloneClipRegion(clip:Dynamic):Dynamic;
	@:hlNative("flight", "flight_copy_clip_region")
	public static function copyClipRegion(out:Dynamic, source:Dynamic):Void;
	@:hlNative("flight", "flight_equals_clip_region")
	public static function equalsClipRegion(a:Dynamic, b:Dynamic):Bool;
	@:hlNative("flight", "flight_explain_clip_region")
	public static function explainClipRegion(clip:Dynamic):flight._hl.ClipRegionExplanation;
	@:hlNative("flight", "flight_intersect_clip_regions")
	public static function intersectClipRegions(out:Dynamic, a:Dynamic, b:Dynamic):Void;
	@:hlNative("flight", "flight_invalidate_clip_region")
	public static function invalidateClipRegion(clip:Dynamic):Void;
	@:hlNative("flight", "flight_is_clip_region_empty")
	public static function isClipRegionEmpty(clip:Dynamic):Bool;
	@:hlNative("flight", "flight_is_clip_region_rectangular")
	public static function isClipRegionRectangular(clip:Dynamic):Bool;
	@:hlNative("flight", "flight_normalize_clip_region")
	public static function normalizeClipRegion(out:Dynamic, clip:Dynamic):Void;
	@:hlNative("flight", "flight_release_clip_region")
	public static function releaseClipRegion(clip:Dynamic):Void;
	@:hlNative("flight", "flight_transform_clip_region")
	public static function transformClipRegion(out:Dynamic, clip:Dynamic, matrix:flight._hl.Matrix):Void;
	@:hlNative("flight", "flight_union_clip_regions")
	public static function unionClipRegions(out:Dynamic, a:Dynamic, b:Dynamic):Void;
	@:hlNative("flight", "flight_create_clip_region_from_circle")
	public static function createClipRegionFromCircle(x:Float, y:Float, radius:Float, tolerance:Float):Dynamic;
	@:hlNative("flight", "flight_create_clip_region_from_path")
	public static function createClipRegionFromPath(path:flight._hl.Path, tolerance:Float):Dynamic;
	@:hlNative("flight", "flight_get_clip_region_contours_reason_string")
	public static function getClipRegionContoursReasonString(reason:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_clip_region_status_string")
	public static function getClipRegionStatusString(status:Int):hl.Bytes;
	@:hlNative("flight", "flight_parse_clip_region_contours_reason")
	public static function parseClipRegionContoursReason(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_parse_clip_region_status")
	public static function parseClipRegionStatus(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_disable_clip_guards")
	public static function disableClipGuards():Void;
	@:hlNative("flight", "flight_free_clip_region_explanation")
	public static function freeClipRegionExplanation(ptr:flight._hl.ClipRegionExplanation):Void;
}
