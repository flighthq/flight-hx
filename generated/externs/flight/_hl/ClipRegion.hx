package flight._hl;

private extern class ClipRegion_Ffi {
	@:hlNative("flight", "flight_get_clip_region_version")
	static function get_version(ptr:hl.Bytes):Int;
	@:hlNative("flight", "flight_set_clip_region_version")
	static function set_version(ptr:hl.Bytes, value:Int):Int;
}

abstract ClipRegion(hl.Bytes) {
	public var version(get, set):Int;

	inline function get_version():Int return ClipRegion_Ffi.get_version(this);

	inline function set_version(value:Int):Int { ClipRegion_Ffi.set_version(this, value); return value; }
}
