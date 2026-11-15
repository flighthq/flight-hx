package flight._js;

@:jsRequire("flight")
private extern class ClipRegionExplanation_Ffi {
	@:native("flight_get_clip_region_explanation_conservative") static function get_conservative(ptr:Dynamic):Bool;
	@:native("flight_set_clip_region_explanation_conservative") static function set_conservative(ptr:Dynamic, value:Bool):Bool;
}

abstract ClipRegionExplanation(Dynamic) {
	public var conservative(get, set):Bool;

	inline function get_conservative():Bool return ClipRegionExplanation_Ffi.get_conservative(this);

	inline function set_conservative(value:Bool):Bool return ClipRegionExplanation_Ffi.set_conservative(this, value);
}
