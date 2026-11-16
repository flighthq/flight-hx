package flight._cpp;

private extern class CollisionBox3D_Ffi {
	@:native("flight_get_collision_box3_d_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_box3_d_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_box3_d_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_box3_d_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_box3_d_z") static function get_z(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_box3_d_z") static function set_z(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_box3_d_half_x") static function get_halfX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_box3_d_half_x") static function set_halfX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_box3_d_half_y") static function get_halfY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_box3_d_half_y") static function set_halfY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_box3_d_half_z") static function get_halfZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_box3_d_half_z") static function set_halfZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_box3_d_rotation_x") static function get_rotationX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_box3_d_rotation_x") static function set_rotationX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_box3_d_rotation_y") static function get_rotationY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_box3_d_rotation_y") static function set_rotationY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_box3_d_rotation_z") static function get_rotationZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_box3_d_rotation_z") static function set_rotationZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_box3_d_rotation_w") static function get_rotationW(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_box3_d_rotation_w") static function set_rotationW(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract CollisionBox3D(cpp.Star<cpp.Void>) {
	public var x(get, set):Single;

	inline function get_x():Single return CollisionBox3D_Ffi.get_x(this);

	inline function set_x(value:Single):Single { CollisionBox3D_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return CollisionBox3D_Ffi.get_y(this);

	inline function set_y(value:Single):Single { CollisionBox3D_Ffi.set_y(this, value); return value; }
	public var z(get, set):Single;

	inline function get_z():Single return CollisionBox3D_Ffi.get_z(this);

	inline function set_z(value:Single):Single { CollisionBox3D_Ffi.set_z(this, value); return value; }
	public var halfX(get, set):Single;

	inline function get_halfX():Single return CollisionBox3D_Ffi.get_halfX(this);

	inline function set_halfX(value:Single):Single { CollisionBox3D_Ffi.set_halfX(this, value); return value; }
	public var halfY(get, set):Single;

	inline function get_halfY():Single return CollisionBox3D_Ffi.get_halfY(this);

	inline function set_halfY(value:Single):Single { CollisionBox3D_Ffi.set_halfY(this, value); return value; }
	public var halfZ(get, set):Single;

	inline function get_halfZ():Single return CollisionBox3D_Ffi.get_halfZ(this);

	inline function set_halfZ(value:Single):Single { CollisionBox3D_Ffi.set_halfZ(this, value); return value; }
	public var rotationX(get, set):Single;

	inline function get_rotationX():Single return CollisionBox3D_Ffi.get_rotationX(this);

	inline function set_rotationX(value:Single):Single { CollisionBox3D_Ffi.set_rotationX(this, value); return value; }
	public var rotationY(get, set):Single;

	inline function get_rotationY():Single return CollisionBox3D_Ffi.get_rotationY(this);

	inline function set_rotationY(value:Single):Single { CollisionBox3D_Ffi.set_rotationY(this, value); return value; }
	public var rotationZ(get, set):Single;

	inline function get_rotationZ():Single return CollisionBox3D_Ffi.get_rotationZ(this);

	inline function set_rotationZ(value:Single):Single { CollisionBox3D_Ffi.set_rotationZ(this, value); return value; }
	public var rotationW(get, set):Single;

	inline function get_rotationW():Single return CollisionBox3D_Ffi.get_rotationW(this);

	inline function set_rotationW(value:Single):Single { CollisionBox3D_Ffi.set_rotationW(this, value); return value; }
}
