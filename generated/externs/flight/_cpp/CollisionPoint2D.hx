package flight._cpp;

private extern class CollisionPoint2D_Ffi {
	@:native("flight_get_collision_point2_d_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_point2_d_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_point2_d_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_point2_d_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract CollisionPoint2D(cpp.Star<cpp.Void>) {
	public var x(get, set):Float;

	inline function get_x():Float return CollisionPoint2D_Ffi.get_x(this);

	inline function set_x(value:Float):Float { CollisionPoint2D_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return CollisionPoint2D_Ffi.get_y(this);

	inline function set_y(value:Float):Float { CollisionPoint2D_Ffi.set_y(this, value); return value; }
}
