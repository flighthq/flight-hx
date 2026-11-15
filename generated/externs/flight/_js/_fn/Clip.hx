package flight._js._fn;

@:jsRequire("flight")
extern class Clip {
	@:native("flight_acquire_clip_region")
	public static function acquireClipRegion():Dynamic;
	@:native("flight_clip_region_contains_clip_region")
	public static function clipRegionContainsClipRegion(a:Dynamic, b:Dynamic):Bool;
	@:native("flight_clip_region_contains_point")
	public static function clipRegionContainsPoint(clip:Dynamic, x:Float, y:Float):Bool;
	@:native("flight_clip_region_intersects_clip_region")
	public static function clipRegionIntersectsClipRegion(a:Dynamic, b:Dynamic):Bool;
	@:native("flight_clone_clip_region")
	public static function cloneClipRegion(clip:Dynamic):Dynamic;
	@:native("flight_copy_clip_region")
	public static function copyClipRegion(out:Dynamic, source:Dynamic):Void;
	@:native("flight_equals_clip_region")
	public static function equalsClipRegion(a:Dynamic, b:Dynamic):Bool;
	@:native("flight_explain_clip_region")
	public static function explainClipRegion(clip:Dynamic):flight._js.ClipRegionExplanation;
	@:native("flight_intersect_clip_regions")
	public static function intersectClipRegions(out:Dynamic, a:Dynamic, b:Dynamic):Void;
	@:native("flight_invalidate_clip_region")
	public static function invalidateClipRegion(clip:Dynamic):Void;
	@:native("flight_is_clip_region_empty")
	public static function isClipRegionEmpty(clip:Dynamic):Bool;
	@:native("flight_is_clip_region_rectangular")
	public static function isClipRegionRectangular(clip:Dynamic):Bool;
	@:native("flight_normalize_clip_region")
	public static function normalizeClipRegion(out:Dynamic, clip:Dynamic):Void;
	@:native("flight_release_clip_region")
	public static function releaseClipRegion(clip:Dynamic):Void;
	@:native("flight_transform_clip_region")
	public static function transformClipRegion(out:Dynamic, clip:Dynamic, matrix:flight._js.Matrix):Void;
	@:native("flight_union_clip_regions")
	public static function unionClipRegions(out:Dynamic, a:Dynamic, b:Dynamic):Void;
	@:native("flight_create_clip_region_from_circle")
	public static function createClipRegionFromCircle(x:Float, y:Float, radius:Float, tolerance:Float):Dynamic;
	@:native("flight_create_clip_region_from_path")
	public static function createClipRegionFromPath(path:flight._js.Path, tolerance:Float):Dynamic;
	@:native("flight_get_clip_region_contours_reason_string")
	public static function getClipRegionContoursReasonString(reason:Int):String;
	@:native("flight_get_clip_region_status_string")
	public static function getClipRegionStatusString(status:Int):String;
	@:native("flight_parse_clip_region_contours_reason")
	public static function parseClipRegionContoursReason(value:String):Int;
	@:native("flight_parse_clip_region_status")
	public static function parseClipRegionStatus(value:String):Int;
	@:native("flight_disable_clip_guards")
	public static function disableClipGuards():Void;
	@:native("flight_free_clip_region_explanation")
	public static function freeClipRegionExplanation(ptr:flight._js.ClipRegionExplanation):Void;
}
