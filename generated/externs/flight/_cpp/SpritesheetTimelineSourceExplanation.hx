package flight._cpp;

private extern class SpritesheetTimelineSourceExplanation_Ffi {
	@:native("flight_get_spritesheet_timeline_source_explanation_direction_materialized") static function get_directionMaterialized(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_spritesheet_timeline_source_explanation_direction_materialized") static function set_directionMaterialized(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract SpritesheetTimelineSourceExplanation(cpp.Star<cpp.Void>) {
	public var directionMaterialized(get, set):Bool;

	inline function get_directionMaterialized():Bool return SpritesheetTimelineSourceExplanation_Ffi.get_directionMaterialized(this);

	inline function set_directionMaterialized(value:Bool):Bool return SpritesheetTimelineSourceExplanation_Ffi.set_directionMaterialized(this, value);
}
