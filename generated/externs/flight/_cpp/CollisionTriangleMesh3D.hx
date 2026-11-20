package flight._cpp;

private extern class CollisionTriangleMesh3D_Ffi {
	@:native("flight_get_collision_triangle_mesh3_d_version") static function get_version(ptr:cpp.Star<cpp.Void>):haxe.Int64;
	@:native("flight_set_collision_triangle_mesh3_d_version") static function set_version(ptr:cpp.Star<cpp.Void>, value:haxe.Int64):haxe.Int64;
	@:native("flight_get_collision_triangle_mesh3_d_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_triangle_mesh3_d_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_triangle_mesh3_d_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_triangle_mesh3_d_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_triangle_mesh3_d_z") static function get_z(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_triangle_mesh3_d_z") static function set_z(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_triangle_mesh3_d_rotation_x") static function get_rotationX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_triangle_mesh3_d_rotation_x") static function set_rotationX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_triangle_mesh3_d_rotation_y") static function get_rotationY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_triangle_mesh3_d_rotation_y") static function set_rotationY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_triangle_mesh3_d_rotation_z") static function get_rotationZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_triangle_mesh3_d_rotation_z") static function set_rotationZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collision_triangle_mesh3_d_rotation_w") static function get_rotationW(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collision_triangle_mesh3_d_rotation_w") static function set_rotationW(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract CollisionTriangleMesh3D(cpp.Star<cpp.Void>) {
	public var version(get, set):haxe.Int64;

	inline function get_version():haxe.Int64 return CollisionTriangleMesh3D_Ffi.get_version(this);

	inline function set_version(value:haxe.Int64):haxe.Int64 { CollisionTriangleMesh3D_Ffi.set_version(this, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return CollisionTriangleMesh3D_Ffi.get_x(this);

	inline function set_x(value:Float):Float { CollisionTriangleMesh3D_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return CollisionTriangleMesh3D_Ffi.get_y(this);

	inline function set_y(value:Float):Float { CollisionTriangleMesh3D_Ffi.set_y(this, value); return value; }
	public var z(get, set):Float;

	inline function get_z():Float return CollisionTriangleMesh3D_Ffi.get_z(this);

	inline function set_z(value:Float):Float { CollisionTriangleMesh3D_Ffi.set_z(this, value); return value; }
	public var rotationX(get, set):Float;

	inline function get_rotationX():Float return CollisionTriangleMesh3D_Ffi.get_rotationX(this);

	inline function set_rotationX(value:Float):Float { CollisionTriangleMesh3D_Ffi.set_rotationX(this, value); return value; }
	public var rotationY(get, set):Float;

	inline function get_rotationY():Float return CollisionTriangleMesh3D_Ffi.get_rotationY(this);

	inline function set_rotationY(value:Float):Float { CollisionTriangleMesh3D_Ffi.set_rotationY(this, value); return value; }
	public var rotationZ(get, set):Float;

	inline function get_rotationZ():Float return CollisionTriangleMesh3D_Ffi.get_rotationZ(this);

	inline function set_rotationZ(value:Float):Float { CollisionTriangleMesh3D_Ffi.set_rotationZ(this, value); return value; }
	public var rotationW(get, set):Float;

	inline function get_rotationW():Float return CollisionTriangleMesh3D_Ffi.get_rotationW(this);

	inline function set_rotationW(value:Float):Float { CollisionTriangleMesh3D_Ffi.set_rotationW(this, value); return value; }
}
