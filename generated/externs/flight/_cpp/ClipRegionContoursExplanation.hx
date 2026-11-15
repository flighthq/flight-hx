package flight._cpp;

private extern class ClipRegionContoursExplanation_Ffi {
	@:native("flight_get_clip_region_contours_explanation_contour_index") static function get_contourIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_clip_region_contours_explanation_contour_index") static function set_contourIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_clip_region_contours_explanation_coordinate_count") static function get_coordinateCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_clip_region_contours_explanation_coordinate_count") static function set_coordinateCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract ClipRegionContoursExplanation(cpp.Star<cpp.Void>) {
	public var contourIndex(get, set):Int;

	inline function get_contourIndex():Int return ClipRegionContoursExplanation_Ffi.get_contourIndex(this);

	inline function set_contourIndex(value:Int):Int return ClipRegionContoursExplanation_Ffi.set_contourIndex(this, value);
	public var coordinateCount(get, set):Int;

	inline function get_coordinateCount():Int return ClipRegionContoursExplanation_Ffi.get_coordinateCount(this);

	inline function set_coordinateCount(value:Int):Int return ClipRegionContoursExplanation_Ffi.set_coordinateCount(this, value);
}
