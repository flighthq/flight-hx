package flight._cpp;

private extern class Velocity2D_Ffi {
	@:native("flight_get_velocity2_d_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_velocity2_d_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_velocity2_d_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_velocity2_d_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Velocity2D(cpp.Star<cpp.Void>) {
	public var x(get, set):Single;

	inline function get_x():Single return Velocity2D_Ffi.get_x(this);

	inline function set_x(value:Single):Single { Velocity2D_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return Velocity2D_Ffi.get_y(this);

	inline function set_y(value:Single):Single { Velocity2D_Ffi.set_y(this, value); return value; }
}
