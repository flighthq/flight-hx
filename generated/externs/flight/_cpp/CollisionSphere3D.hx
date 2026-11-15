package flight._cpp;

private extern class CollisionSphere3D_Ffi {
	@:native("flight_get_collision_sphere3_d_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_sphere3_d_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_sphere3_d_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_sphere3_d_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_sphere3_d_z") static function get_z(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_sphere3_d_z") static function set_z(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_sphere3_d_radius") static function get_radius(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_sphere3_d_radius") static function set_radius(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract CollisionSphere3D(cpp.Star<cpp.Void>) {
	public var x(get, set):Single;

	inline function get_x():Single return CollisionSphere3D_Ffi.get_x(this);

	inline function set_x(value:Single):Single return CollisionSphere3D_Ffi.set_x(this, value);
	public var y(get, set):Single;

	inline function get_y():Single return CollisionSphere3D_Ffi.get_y(this);

	inline function set_y(value:Single):Single return CollisionSphere3D_Ffi.set_y(this, value);
	public var z(get, set):Single;

	inline function get_z():Single return CollisionSphere3D_Ffi.get_z(this);

	inline function set_z(value:Single):Single return CollisionSphere3D_Ffi.set_z(this, value);
	public var radius(get, set):Single;

	inline function get_radius():Single return CollisionSphere3D_Ffi.get_radius(this);

	inline function set_radius(value:Single):Single return CollisionSphere3D_Ffi.set_radius(this, value);
}
