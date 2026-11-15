package flight._cpp;

private extern class CollisionObb2D_Ffi {
	@:native("flight_get_collision_obb2_d_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_obb2_d_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_obb2_d_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_obb2_d_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_obb2_d_half_w") static function get_halfW(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_obb2_d_half_w") static function set_halfW(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_obb2_d_half_h") static function get_halfH(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_obb2_d_half_h") static function set_halfH(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collision_obb2_d_rotation") static function get_rotation(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collision_obb2_d_rotation") static function set_rotation(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract CollisionObb2D(cpp.Star<cpp.Void>) {
	public var x(get, set):Single;

	inline function get_x():Single return CollisionObb2D_Ffi.get_x(this);

	inline function set_x(value:Single):Single return CollisionObb2D_Ffi.set_x(this, value);
	public var y(get, set):Single;

	inline function get_y():Single return CollisionObb2D_Ffi.get_y(this);

	inline function set_y(value:Single):Single return CollisionObb2D_Ffi.set_y(this, value);
	public var halfW(get, set):Single;

	inline function get_halfW():Single return CollisionObb2D_Ffi.get_halfW(this);

	inline function set_halfW(value:Single):Single return CollisionObb2D_Ffi.set_halfW(this, value);
	public var halfH(get, set):Single;

	inline function get_halfH():Single return CollisionObb2D_Ffi.get_halfH(this);

	inline function set_halfH(value:Single):Single return CollisionObb2D_Ffi.set_halfH(this, value);
	public var rotation(get, set):Single;

	inline function get_rotation():Single return CollisionObb2D_Ffi.get_rotation(this);

	inline function set_rotation(value:Single):Single return CollisionObb2D_Ffi.set_rotation(this, value);
}
