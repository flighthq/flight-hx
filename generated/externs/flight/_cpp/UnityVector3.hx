package flight._cpp;

private extern class UnityVector3_Ffi {
	@:native("flight_get_unity_vector3_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unity_vector3_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_unity_vector3_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unity_vector3_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_unity_vector3_z") static function get_z(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unity_vector3_z") static function set_z(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract UnityVector3(cpp.Star<cpp.Void>) {
	public var x(get, set):Single;

	inline function get_x():Single return UnityVector3_Ffi.get_x(this);

	inline function set_x(value:Single):Single { UnityVector3_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return UnityVector3_Ffi.get_y(this);

	inline function set_y(value:Single):Single { UnityVector3_Ffi.set_y(this, value); return value; }
	public var z(get, set):Single;

	inline function get_z():Single return UnityVector3_Ffi.get_z(this);

	inline function set_z(value:Single):Single { UnityVector3_Ffi.set_z(this, value); return value; }
}
