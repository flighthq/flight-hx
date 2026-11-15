package flight._cpp;

private extern class CollisionCircle2D_Ffi {
	@:native("flight_get_collision_circle2_d_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_circle2_d_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_circle2_d_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_circle2_d_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_circle2_d_radius") static function get_radius(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_circle2_d_radius") static function set_radius(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract CollisionCircle2D(cpp.Star<cpp.Void>) {
	public var x(get, set):Float;

	inline function get_x():Float return CollisionCircle2D_Ffi.get_x(this);

	inline function set_x(value:Float):Float return CollisionCircle2D_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return CollisionCircle2D_Ffi.get_y(this);

	inline function set_y(value:Float):Float return CollisionCircle2D_Ffi.set_y(this, value);
	public var radius(get, set):Float;

	inline function get_radius():Float return CollisionCircle2D_Ffi.get_radius(this);

	inline function set_radius(value:Float):Float return CollisionCircle2D_Ffi.set_radius(this, value);
}
