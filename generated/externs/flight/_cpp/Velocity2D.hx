package flight._cpp;

private extern class Velocity2D_Ffi {
	@:native("flight_get_velocity2_d_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_velocity2_d_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_velocity2_d_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_velocity2_d_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Velocity2D(cpp.Star<cpp.Void>) {
	public var x(get, set):Float;

	inline function get_x():Float return Velocity2D_Ffi.get_x(this);

	inline function set_x(value:Float):Float { Velocity2D_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return Velocity2D_Ffi.get_y(this);

	inline function set_y(value:Float):Float { Velocity2D_Ffi.set_y(this, value); return value; }
}
