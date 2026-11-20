package flight._cpp;

private extern class CollisionObb2D_Ffi {
	@:native("flight_get_collision_obb2_d_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_obb2_d_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_obb2_d_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_obb2_d_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_obb2_d_half_w") static function get_halfW(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_obb2_d_half_w") static function set_halfW(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_obb2_d_half_h") static function get_halfH(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_obb2_d_half_h") static function set_halfH(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_obb2_d_rotation") static function get_rotation(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_obb2_d_rotation") static function set_rotation(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract CollisionObb2D(cpp.Star<cpp.Void>) {
	public var x(get, set):Float;

	inline function get_x():Float return CollisionObb2D_Ffi.get_x(this);

	inline function set_x(value:Float):Float { CollisionObb2D_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return CollisionObb2D_Ffi.get_y(this);

	inline function set_y(value:Float):Float { CollisionObb2D_Ffi.set_y(this, value); return value; }
	public var halfW(get, set):Float;

	inline function get_halfW():Float return CollisionObb2D_Ffi.get_halfW(this);

	inline function set_halfW(value:Float):Float { CollisionObb2D_Ffi.set_halfW(this, value); return value; }
	public var halfH(get, set):Float;

	inline function get_halfH():Float return CollisionObb2D_Ffi.get_halfH(this);

	inline function set_halfH(value:Float):Float { CollisionObb2D_Ffi.set_halfH(this, value); return value; }
	public var rotation(get, set):Float;

	inline function get_rotation():Float return CollisionObb2D_Ffi.get_rotation(this);

	inline function set_rotation(value:Float):Float { CollisionObb2D_Ffi.set_rotation(this, value); return value; }
}
