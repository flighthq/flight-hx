package flight._cpp;

private extern class ClipRegionExplanation_Ffi {
	@:native("flight_get_clip_region_explanation_conservative") static function get_conservative(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_clip_region_explanation_conservative") static function set_conservative(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract ClipRegionExplanation(cpp.Star<cpp.Void>) {
	public var conservative(get, set):Bool;

	inline function get_conservative():Bool return ClipRegionExplanation_Ffi.get_conservative(this);

	inline function set_conservative(value:Bool):Bool { ClipRegionExplanation_Ffi.set_conservative(this, value); return value; }
}
