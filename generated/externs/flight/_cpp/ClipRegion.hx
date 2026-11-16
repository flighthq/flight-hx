package flight._cpp;

private extern class ClipRegion_Ffi {
	@:native("flight_get_clip_region_version") static function get_version(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_clip_region_version") static function set_version(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract ClipRegion(cpp.Star<cpp.Void>) {
	public var version(get, set):Int;

	inline function get_version():Int return ClipRegion_Ffi.get_version(this);

	inline function set_version(value:Int):Int { ClipRegion_Ffi.set_version(this, value); return value; }
}
