package flight._js;

@:jsRequire("flight")
private extern class CollisionRaycastHit2D_Ffi {
	@:native("flight_get_collision_raycast_hit2_d_fraction") static function get_fraction(ptr:Dynamic):Float;
	@:native("flight_set_collision_raycast_hit2_d_fraction") static function set_fraction(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_raycast_hit2_d_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_collision_raycast_hit2_d_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_raycast_hit2_d_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_collision_raycast_hit2_d_y") static function set_y(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_raycast_hit2_d_normal_x") static function get_normalX(ptr:Dynamic):Float;
	@:native("flight_set_collision_raycast_hit2_d_normal_x") static function set_normalX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_raycast_hit2_d_normal_y") static function get_normalY(ptr:Dynamic):Float;
	@:native("flight_set_collision_raycast_hit2_d_normal_y") static function set_normalY(ptr:Dynamic, value:Float):Float;
}

abstract CollisionRaycastHit2D(Dynamic) {
	public var fraction(get, set):Float;

	inline function get_fraction():Float return CollisionRaycastHit2D_Ffi.get_fraction(this);

	inline function set_fraction(value:Float):Float return CollisionRaycastHit2D_Ffi.set_fraction(this, value);
	public var x(get, set):Float;

	inline function get_x():Float return CollisionRaycastHit2D_Ffi.get_x(this);

	inline function set_x(value:Float):Float return CollisionRaycastHit2D_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return CollisionRaycastHit2D_Ffi.get_y(this);

	inline function set_y(value:Float):Float return CollisionRaycastHit2D_Ffi.set_y(this, value);
	public var normalX(get, set):Float;

	inline function get_normalX():Float return CollisionRaycastHit2D_Ffi.get_normalX(this);

	inline function set_normalX(value:Float):Float return CollisionRaycastHit2D_Ffi.set_normalX(this, value);
	public var normalY(get, set):Float;

	inline function get_normalY():Float return CollisionRaycastHit2D_Ffi.get_normalY(this);

	inline function set_normalY(value:Float):Float return CollisionRaycastHit2D_Ffi.set_normalY(this, value);
}
