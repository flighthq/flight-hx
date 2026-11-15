package flight._js;

@:jsRequire("flight")
private extern class CollisionAabb2D_Ffi {
	@:native("flight_get_collision_aabb2_d_min_x") static function get_minX(ptr:Dynamic):Float;
	@:native("flight_set_collision_aabb2_d_min_x") static function set_minX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_aabb2_d_min_y") static function get_minY(ptr:Dynamic):Float;
	@:native("flight_set_collision_aabb2_d_min_y") static function set_minY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_aabb2_d_max_x") static function get_maxX(ptr:Dynamic):Float;
	@:native("flight_set_collision_aabb2_d_max_x") static function set_maxX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_collision_aabb2_d_max_y") static function get_maxY(ptr:Dynamic):Float;
	@:native("flight_set_collision_aabb2_d_max_y") static function set_maxY(ptr:Dynamic, value:Float):Float;
}

abstract CollisionAabb2D(Dynamic) {
	public var minX(get, set):Float;

	inline function get_minX():Float return CollisionAabb2D_Ffi.get_minX(this);

	inline function set_minX(value:Float):Float return CollisionAabb2D_Ffi.set_minX(this, value);
	public var minY(get, set):Float;

	inline function get_minY():Float return CollisionAabb2D_Ffi.get_minY(this);

	inline function set_minY(value:Float):Float return CollisionAabb2D_Ffi.set_minY(this, value);
	public var maxX(get, set):Float;

	inline function get_maxX():Float return CollisionAabb2D_Ffi.get_maxX(this);

	inline function set_maxX(value:Float):Float return CollisionAabb2D_Ffi.set_maxX(this, value);
	public var maxY(get, set):Float;

	inline function get_maxY():Float return CollisionAabb2D_Ffi.get_maxY(this);

	inline function set_maxY(value:Float):Float return CollisionAabb2D_Ffi.set_maxY(this, value);
}
