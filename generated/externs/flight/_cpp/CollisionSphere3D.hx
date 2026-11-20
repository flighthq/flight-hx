package flight._cpp;

private extern class CollisionSphere3D_Ffi {
	@:native("flight_get_collision_sphere3_d_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_sphere3_d_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_sphere3_d_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_sphere3_d_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_sphere3_d_z") static function get_z(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_sphere3_d_z") static function set_z(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_sphere3_d_radius") static function get_radius(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_sphere3_d_radius") static function set_radius(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract CollisionSphere3D(cpp.Star<cpp.Void>) {
	public var x(get, set):Float;

	inline function get_x():Float return CollisionSphere3D_Ffi.get_x(this);

	inline function set_x(value:Float):Float { CollisionSphere3D_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return CollisionSphere3D_Ffi.get_y(this);

	inline function set_y(value:Float):Float { CollisionSphere3D_Ffi.set_y(this, value); return value; }
	public var z(get, set):Float;

	inline function get_z():Float return CollisionSphere3D_Ffi.get_z(this);

	inline function set_z(value:Float):Float { CollisionSphere3D_Ffi.set_z(this, value); return value; }
	public var radius(get, set):Float;

	inline function get_radius():Float return CollisionSphere3D_Ffi.get_radius(this);

	inline function set_radius(value:Float):Float { CollisionSphere3D_Ffi.set_radius(this, value); return value; }
}
