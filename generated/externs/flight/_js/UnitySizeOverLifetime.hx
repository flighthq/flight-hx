package flight._js;

@:jsRequire("flight")
private extern class UnitySizeOverLifetime_Ffi {
	@:native("flight_get_unity_size_over_lifetime_enabled") static function get_enabled(ptr:Dynamic):Bool;
	@:native("flight_set_unity_size_over_lifetime_enabled") static function set_enabled(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_unity_size_over_lifetime_size_end") static function get_sizeEnd(ptr:Dynamic):Float;
	@:native("flight_set_unity_size_over_lifetime_size_end") static function set_sizeEnd(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_unity_size_over_lifetime_size_start") static function get_sizeStart(ptr:Dynamic):Float;
	@:native("flight_set_unity_size_over_lifetime_size_start") static function set_sizeStart(ptr:Dynamic, value:Float):Float;
}

abstract UnitySizeOverLifetime(Dynamic) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return UnitySizeOverLifetime_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool return UnitySizeOverLifetime_Ffi.set_enabled(this, value);
	public var sizeEnd(get, set):Float;

	inline function get_sizeEnd():Float return UnitySizeOverLifetime_Ffi.get_sizeEnd(this);

	inline function set_sizeEnd(value:Float):Float return UnitySizeOverLifetime_Ffi.set_sizeEnd(this, value);
	public var sizeStart(get, set):Float;

	inline function get_sizeStart():Float return UnitySizeOverLifetime_Ffi.get_sizeStart(this);

	inline function set_sizeStart(value:Float):Float return UnitySizeOverLifetime_Ffi.set_sizeStart(this, value);
}
