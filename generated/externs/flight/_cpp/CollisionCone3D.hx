package flight._cpp;

private extern class CollisionCone3D_Ffi {
	@:native("flight_get_collision_cone3_d_x0") static function get_x0(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_cone3_d_x0") static function set_x0(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_cone3_d_y0") static function get_y0(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_cone3_d_y0") static function set_y0(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_cone3_d_z0") static function get_z0(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_cone3_d_z0") static function set_z0(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_cone3_d_x1") static function get_x1(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_cone3_d_x1") static function set_x1(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_cone3_d_y1") static function get_y1(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_cone3_d_y1") static function set_y1(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_cone3_d_z1") static function get_z1(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_cone3_d_z1") static function set_z1(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_cone3_d_radius") static function get_radius(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_cone3_d_radius") static function set_radius(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract CollisionCone3D(cpp.Star<cpp.Void>) {
	public var x0(get, set):Single;

	inline function get_x0():Single return CollisionCone3D_Ffi.get_x0(this);

	inline function set_x0(value:Single):Single return CollisionCone3D_Ffi.set_x0(this, value);
	public var y0(get, set):Single;

	inline function get_y0():Single return CollisionCone3D_Ffi.get_y0(this);

	inline function set_y0(value:Single):Single return CollisionCone3D_Ffi.set_y0(this, value);
	public var z0(get, set):Single;

	inline function get_z0():Single return CollisionCone3D_Ffi.get_z0(this);

	inline function set_z0(value:Single):Single return CollisionCone3D_Ffi.set_z0(this, value);
	public var x1(get, set):Single;

	inline function get_x1():Single return CollisionCone3D_Ffi.get_x1(this);

	inline function set_x1(value:Single):Single return CollisionCone3D_Ffi.set_x1(this, value);
	public var y1(get, set):Single;

	inline function get_y1():Single return CollisionCone3D_Ffi.get_y1(this);

	inline function set_y1(value:Single):Single return CollisionCone3D_Ffi.set_y1(this, value);
	public var z1(get, set):Single;

	inline function get_z1():Single return CollisionCone3D_Ffi.get_z1(this);

	inline function set_z1(value:Single):Single return CollisionCone3D_Ffi.set_z1(this, value);
	public var radius(get, set):Single;

	inline function get_radius():Single return CollisionCone3D_Ffi.get_radius(this);

	inline function set_radius(value:Single):Single return CollisionCone3D_Ffi.set_radius(this, value);
}
