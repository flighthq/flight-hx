package flight._js;

@:jsRequire("flight")
private extern class ClipRegion_Ffi {
	@:native("flight_get_clip_region_version") static function get_version(ptr:Dynamic):Int;
	@:native("flight_set_clip_region_version") static function set_version(ptr:Dynamic, value:Int):Int;
}

abstract ClipRegion(Dynamic) {
	public var version(get, set):Int;

	inline function get_version():Int return ClipRegion_Ffi.get_version(this);

	inline function set_version(value:Int):Int return ClipRegion_Ffi.set_version(this, value);
}
