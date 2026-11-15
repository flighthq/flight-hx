package flight._js;

@:jsRequire("flight")
private extern class CollisionPoint2D_Ffi {
	@:native("flight_get_collision_point2_d_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_collision_point2_d_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_point2_d_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_collision_point2_d_y") static function set_y(ptr:Dynamic, value:Float):Float;
}

abstract CollisionPoint2D(Dynamic) {
	public var x(get, set):Float;

	inline function get_x():Float return CollisionPoint2D_Ffi.get_x(this);

	inline function set_x(value:Float):Float return CollisionPoint2D_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return CollisionPoint2D_Ffi.get_y(this);

	inline function set_y(value:Float):Float return CollisionPoint2D_Ffi.set_y(this, value);
}
