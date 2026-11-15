package flight._cpp;

private extern class UnityShape_Ffi {
	@:native("flight_get_unity_shape_angle") static function get_angle(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unity_shape_angle") static function set_angle(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_unity_shape_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_unity_shape_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_unity_shape_radius") static function get_radius(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unity_shape_radius") static function set_radius(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract UnityShape(cpp.Star<cpp.Void>) {
	public var angle(get, set):Single;

	inline function get_angle():Single return UnityShape_Ffi.get_angle(this);

	inline function set_angle(value:Single):Single return UnityShape_Ffi.set_angle(this, value);
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return UnityShape_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool return UnityShape_Ffi.set_enabled(this, value);
	public var radius(get, set):Single;

	inline function get_radius():Single return UnityShape_Ffi.get_radius(this);

	inline function set_radius(value:Single):Single return UnityShape_Ffi.set_radius(this, value);
}
