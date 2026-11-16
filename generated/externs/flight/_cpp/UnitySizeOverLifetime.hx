package flight._cpp;

private extern class UnitySizeOverLifetime_Ffi {
	@:native("flight_get_unity_size_over_lifetime_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_unity_size_over_lifetime_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_unity_size_over_lifetime_size_end") static function get_sizeEnd(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unity_size_over_lifetime_size_end") static function set_sizeEnd(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_unity_size_over_lifetime_size_start") static function get_sizeStart(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unity_size_over_lifetime_size_start") static function set_sizeStart(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract UnitySizeOverLifetime(cpp.Star<cpp.Void>) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return UnitySizeOverLifetime_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool { UnitySizeOverLifetime_Ffi.set_enabled(this, value); return value; }
	public var sizeEnd(get, set):Single;

	inline function get_sizeEnd():Single return UnitySizeOverLifetime_Ffi.get_sizeEnd(this);

	inline function set_sizeEnd(value:Single):Single { UnitySizeOverLifetime_Ffi.set_sizeEnd(this, value); return value; }
	public var sizeStart(get, set):Single;

	inline function get_sizeStart():Single return UnitySizeOverLifetime_Ffi.get_sizeStart(this);

	inline function set_sizeStart(value:Single):Single { UnitySizeOverLifetime_Ffi.set_sizeStart(this, value); return value; }
}
