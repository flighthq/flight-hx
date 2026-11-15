package flight._cpp;

private extern class CollisionAabb3D_Ffi {
	@:native("flight_get_collision_aabb3_d_min_x") static function get_minX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_aabb3_d_min_x") static function set_minX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_aabb3_d_min_y") static function get_minY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_aabb3_d_min_y") static function set_minY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_aabb3_d_min_z") static function get_minZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_aabb3_d_min_z") static function set_minZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_aabb3_d_max_x") static function get_maxX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_aabb3_d_max_x") static function set_maxX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_aabb3_d_max_y") static function get_maxY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_aabb3_d_max_y") static function set_maxY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_aabb3_d_max_z") static function get_maxZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_aabb3_d_max_z") static function set_maxZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract CollisionAabb3D(cpp.Star<cpp.Void>) {
	public var minX(get, set):Single;

	inline function get_minX():Single return CollisionAabb3D_Ffi.get_minX(this);

	inline function set_minX(value:Single):Single return CollisionAabb3D_Ffi.set_minX(this, value);
	public var minY(get, set):Single;

	inline function get_minY():Single return CollisionAabb3D_Ffi.get_minY(this);

	inline function set_minY(value:Single):Single return CollisionAabb3D_Ffi.set_minY(this, value);
	public var minZ(get, set):Single;

	inline function get_minZ():Single return CollisionAabb3D_Ffi.get_minZ(this);

	inline function set_minZ(value:Single):Single return CollisionAabb3D_Ffi.set_minZ(this, value);
	public var maxX(get, set):Single;

	inline function get_maxX():Single return CollisionAabb3D_Ffi.get_maxX(this);

	inline function set_maxX(value:Single):Single return CollisionAabb3D_Ffi.set_maxX(this, value);
	public var maxY(get, set):Single;

	inline function get_maxY():Single return CollisionAabb3D_Ffi.get_maxY(this);

	inline function set_maxY(value:Single):Single return CollisionAabb3D_Ffi.set_maxY(this, value);
	public var maxZ(get, set):Single;

	inline function get_maxZ():Single return CollisionAabb3D_Ffi.get_maxZ(this);

	inline function set_maxZ(value:Single):Single return CollisionAabb3D_Ffi.set_maxZ(this, value);
}
