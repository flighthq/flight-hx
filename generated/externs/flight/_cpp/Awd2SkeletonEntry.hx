package flight._cpp;

private extern class Awd2SkeletonEntry_Ffi {
	@:native("flight_get_awd2_skeleton_entry_key") static function get_key(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_skeleton_entry_key") static function set_key(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Awd2SkeletonEntry(cpp.Star<cpp.Void>) {
	public var key(get, set):Int;

	inline function get_key():Int return Awd2SkeletonEntry_Ffi.get_key(this);

	inline function set_key(value:Int):Int { Awd2SkeletonEntry_Ffi.set_key(this, value); return value; }
}
