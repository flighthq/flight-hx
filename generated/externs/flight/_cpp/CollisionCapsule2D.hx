package flight._cpp;

private extern class CollisionCapsule2D_Ffi {
	@:native("flight_get_collision_capsule2_d_x0") static function get_x0(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_capsule2_d_x0") static function set_x0(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_capsule2_d_y0") static function get_y0(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_capsule2_d_y0") static function set_y0(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_capsule2_d_x1") static function get_x1(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_capsule2_d_x1") static function set_x1(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_capsule2_d_y1") static function get_y1(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_capsule2_d_y1") static function set_y1(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_capsule2_d_radius") static function get_radius(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_capsule2_d_radius") static function set_radius(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract CollisionCapsule2D(cpp.Star<cpp.Void>) {
	public var x0(get, set):Float;

	inline function get_x0():Float return CollisionCapsule2D_Ffi.get_x0(this);

	inline function set_x0(value:Float):Float { CollisionCapsule2D_Ffi.set_x0(this, value); return value; }
	public var y0(get, set):Float;

	inline function get_y0():Float return CollisionCapsule2D_Ffi.get_y0(this);

	inline function set_y0(value:Float):Float { CollisionCapsule2D_Ffi.set_y0(this, value); return value; }
	public var x1(get, set):Float;

	inline function get_x1():Float return CollisionCapsule2D_Ffi.get_x1(this);

	inline function set_x1(value:Float):Float { CollisionCapsule2D_Ffi.set_x1(this, value); return value; }
	public var y1(get, set):Float;

	inline function get_y1():Float return CollisionCapsule2D_Ffi.get_y1(this);

	inline function set_y1(value:Float):Float { CollisionCapsule2D_Ffi.set_y1(this, value); return value; }
	public var radius(get, set):Float;

	inline function get_radius():Float return CollisionCapsule2D_Ffi.get_radius(this);

	inline function set_radius(value:Float):Float { CollisionCapsule2D_Ffi.set_radius(this, value); return value; }
}
