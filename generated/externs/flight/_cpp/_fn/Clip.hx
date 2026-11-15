package flight._cpp._fn;

extern class Clip {
	@:native("flight_acquire_clip_region")
	public static function acquireClipRegion():cpp.Star<cpp.Void>;
	@:native("flight_clip_region_contains_clip_region")
	public static function clipRegionContainsClipRegion(a:cpp.Star<cpp.Void>, b:cpp.Star<cpp.Void>):Bool;
	@:native("flight_clip_region_contains_point")
	public static function clipRegionContainsPoint(clip:cpp.Star<cpp.Void>, x:Float, y:Float):Bool;
	@:native("flight_clip_region_intersects_clip_region")
	public static function clipRegionIntersectsClipRegion(a:cpp.Star<cpp.Void>, b:cpp.Star<cpp.Void>):Bool;
	@:native("flight_clone_clip_region")
	public static function cloneClipRegion(clip:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_copy_clip_region")
	public static function copyClipRegion(out:cpp.Star<cpp.Void>, source:cpp.Star<cpp.Void>):Void;
	@:native("flight_equals_clip_region")
	public static function equalsClipRegion(a:cpp.Star<cpp.Void>, b:cpp.Star<cpp.Void>):Bool;
	@:native("flight_explain_clip_region")
	public static function explainClipRegion(clip:cpp.Star<cpp.Void>):flight._cpp.ClipRegionExplanation;
	@:native("flight_intersect_clip_regions")
	public static function intersectClipRegions(out:cpp.Star<cpp.Void>, a:cpp.Star<cpp.Void>, b:cpp.Star<cpp.Void>):Void;
	@:native("flight_invalidate_clip_region")
	public static function invalidateClipRegion(clip:cpp.Star<cpp.Void>):Void;
	@:native("flight_is_clip_region_empty")
	public static function isClipRegionEmpty(clip:cpp.Star<cpp.Void>):Bool;
	@:native("flight_is_clip_region_rectangular")
	public static function isClipRegionRectangular(clip:cpp.Star<cpp.Void>):Bool;
	@:native("flight_normalize_clip_region")
	public static function normalizeClipRegion(out:cpp.Star<cpp.Void>, clip:cpp.Star<cpp.Void>):Void;
	@:native("flight_release_clip_region")
	public static function releaseClipRegion(clip:cpp.Star<cpp.Void>):Void;
	@:native("flight_transform_clip_region")
	public static function transformClipRegion(out:cpp.Star<cpp.Void>, clip:cpp.Star<cpp.Void>, matrix:flight._cpp.Matrix):Void;
	@:native("flight_union_clip_regions")
	public static function unionClipRegions(out:cpp.Star<cpp.Void>, a:cpp.Star<cpp.Void>, b:cpp.Star<cpp.Void>):Void;
	@:native("flight_create_clip_region_from_circle")
	public static function createClipRegionFromCircle(x:Float, y:Float, radius:Float, tolerance:Float):cpp.Star<cpp.Void>;
	@:native("flight_create_clip_region_from_path")
	public static function createClipRegionFromPath(path:flight._cpp.Path, tolerance:Float):cpp.Star<cpp.Void>;
	@:native("flight_get_clip_region_contours_reason_string")
	public static function getClipRegionContoursReasonString(reason:Int):cpp.ConstCharStar;
	@:native("flight_get_clip_region_status_string")
	public static function getClipRegionStatusString(status:Int):cpp.ConstCharStar;
	@:native("flight_parse_clip_region_contours_reason")
	public static function parseClipRegionContoursReason(value:cpp.ConstCharStar):Int;
	@:native("flight_parse_clip_region_status")
	public static function parseClipRegionStatus(value:cpp.ConstCharStar):Int;
	@:native("flight_disable_clip_guards")
	public static function disableClipGuards():Void;
	@:native("flight_free_clip_region_explanation")
	public static function freeClipRegionExplanation(ptr:flight._cpp.ClipRegionExplanation):Void;
}
