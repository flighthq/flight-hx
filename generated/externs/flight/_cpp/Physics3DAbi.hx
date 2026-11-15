package flight._cpp;

private extern class Physics3DAbi_Ffi {
	@:native("flight_get_physics3_dabi_capabilities") static function get_capabilities(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dabi_capabilities") static function set_capabilities(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_dabi_version") static function get_version(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dabi_version") static function set_version(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Physics3DAbi(cpp.Star<cpp.Void>) {
	public var capabilities(get, set):Int;

	inline function get_capabilities():Int return Physics3DAbi_Ffi.get_capabilities(this);

	inline function set_capabilities(value:Int):Int return Physics3DAbi_Ffi.set_capabilities(this, value);
	public var version(get, set):Int;

	inline function get_version():Int return Physics3DAbi_Ffi.get_version(this);

	inline function set_version(value:Int):Int return Physics3DAbi_Ffi.set_version(this, value);
}
