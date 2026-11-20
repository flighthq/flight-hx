package flight._cpp;

private extern class CollisionBox3D_Ffi {
	@:native("flight_get_collision_box3_d_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_box3_d_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_box3_d_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_box3_d_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_box3_d_z") static function get_z(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_box3_d_z") static function set_z(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_box3_d_half_x") static function get_halfX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_box3_d_half_x") static function set_halfX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_box3_d_half_y") static function get_halfY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_box3_d_half_y") static function set_halfY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_box3_d_half_z") static function get_halfZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_box3_d_half_z") static function set_halfZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_box3_d_rotation_x") static function get_rotationX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_box3_d_rotation_x") static function set_rotationX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_box3_d_rotation_y") static function get_rotationY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_box3_d_rotation_y") static function set_rotationY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_box3_d_rotation_z") static function get_rotationZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_box3_d_rotation_z") static function set_rotationZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_box3_d_rotation_w") static function get_rotationW(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_box3_d_rotation_w") static function set_rotationW(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract CollisionBox3D(cpp.Star<cpp.Void>) {
	public var x(get, set):Float;

	inline function get_x():Float return CollisionBox3D_Ffi.get_x(this);

	inline function set_x(value:Float):Float { CollisionBox3D_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return CollisionBox3D_Ffi.get_y(this);

	inline function set_y(value:Float):Float { CollisionBox3D_Ffi.set_y(this, value); return value; }
	public var z(get, set):Float;

	inline function get_z():Float return CollisionBox3D_Ffi.get_z(this);

	inline function set_z(value:Float):Float { CollisionBox3D_Ffi.set_z(this, value); return value; }
	public var halfX(get, set):Float;

	inline function get_halfX():Float return CollisionBox3D_Ffi.get_halfX(this);

	inline function set_halfX(value:Float):Float { CollisionBox3D_Ffi.set_halfX(this, value); return value; }
	public var halfY(get, set):Float;

	inline function get_halfY():Float return CollisionBox3D_Ffi.get_halfY(this);

	inline function set_halfY(value:Float):Float { CollisionBox3D_Ffi.set_halfY(this, value); return value; }
	public var halfZ(get, set):Float;

	inline function get_halfZ():Float return CollisionBox3D_Ffi.get_halfZ(this);

	inline function set_halfZ(value:Float):Float { CollisionBox3D_Ffi.set_halfZ(this, value); return value; }
	public var rotationX(get, set):Float;

	inline function get_rotationX():Float return CollisionBox3D_Ffi.get_rotationX(this);

	inline function set_rotationX(value:Float):Float { CollisionBox3D_Ffi.set_rotationX(this, value); return value; }
	public var rotationY(get, set):Float;

	inline function get_rotationY():Float return CollisionBox3D_Ffi.get_rotationY(this);

	inline function set_rotationY(value:Float):Float { CollisionBox3D_Ffi.set_rotationY(this, value); return value; }
	public var rotationZ(get, set):Float;

	inline function get_rotationZ():Float return CollisionBox3D_Ffi.get_rotationZ(this);

	inline function set_rotationZ(value:Float):Float { CollisionBox3D_Ffi.set_rotationZ(this, value); return value; }
	public var rotationW(get, set):Float;

	inline function get_rotationW():Float return CollisionBox3D_Ffi.get_rotationW(this);

	inline function set_rotationW(value:Float):Float { CollisionBox3D_Ffi.set_rotationW(this, value); return value; }
}
