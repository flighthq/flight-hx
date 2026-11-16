package flight._cpp;

private extern class CollisionAabb2D_Ffi {
	@:native("flight_get_collision_aabb2_d_min_x") static function get_minX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_aabb2_d_min_x") static function set_minX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_aabb2_d_min_y") static function get_minY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_aabb2_d_min_y") static function set_minY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_aabb2_d_max_x") static function get_maxX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_aabb2_d_max_x") static function set_maxX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_aabb2_d_max_y") static function get_maxY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_aabb2_d_max_y") static function set_maxY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract CollisionAabb2D(cpp.Star<cpp.Void>) {
	public var minX(get, set):Single;

	inline function get_minX():Single return CollisionAabb2D_Ffi.get_minX(this);

	inline function set_minX(value:Single):Single { CollisionAabb2D_Ffi.set_minX(this, value); return value; }
	public var minY(get, set):Single;

	inline function get_minY():Single return CollisionAabb2D_Ffi.get_minY(this);

	inline function set_minY(value:Single):Single { CollisionAabb2D_Ffi.set_minY(this, value); return value; }
	public var maxX(get, set):Single;

	inline function get_maxX():Single return CollisionAabb2D_Ffi.get_maxX(this);

	inline function set_maxX(value:Single):Single { CollisionAabb2D_Ffi.set_maxX(this, value); return value; }
	public var maxY(get, set):Single;

	inline function get_maxY():Single return CollisionAabb2D_Ffi.get_maxY(this);

	inline function set_maxY(value:Single):Single { CollisionAabb2D_Ffi.set_maxY(this, value); return value; }
}
