package flight._cpp;

private extern class Physics3DDebugSphere_Ffi {
	@:native("flight_get_physics3_ddebug_sphere_body_a") static function get_bodyA(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_ddebug_sphere_body_a") static function set_bodyA(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_ddebug_sphere_body_b") static function get_bodyB(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_ddebug_sphere_body_b") static function set_bodyB(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_ddebug_sphere_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_ddebug_sphere_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_ddebug_sphere_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_ddebug_sphere_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_ddebug_sphere_z") static function get_z(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_ddebug_sphere_z") static function set_z(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_ddebug_sphere_radius") static function get_radius(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_ddebug_sphere_radius") static function set_radius(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics3DDebugSphere(cpp.Star<cpp.Void>) {
	public var bodyA(get, set):Int;

	inline function get_bodyA():Int return Physics3DDebugSphere_Ffi.get_bodyA(this);

	inline function set_bodyA(value:Int):Int { Physics3DDebugSphere_Ffi.set_bodyA(this, value); return value; }
	public var bodyB(get, set):Int;

	inline function get_bodyB():Int return Physics3DDebugSphere_Ffi.get_bodyB(this);

	inline function set_bodyB(value:Int):Int { Physics3DDebugSphere_Ffi.set_bodyB(this, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return Physics3DDebugSphere_Ffi.get_x(this);

	inline function set_x(value:Single):Single { Physics3DDebugSphere_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return Physics3DDebugSphere_Ffi.get_y(this);

	inline function set_y(value:Single):Single { Physics3DDebugSphere_Ffi.set_y(this, value); return value; }
	public var z(get, set):Single;

	inline function get_z():Single return Physics3DDebugSphere_Ffi.get_z(this);

	inline function set_z(value:Single):Single { Physics3DDebugSphere_Ffi.set_z(this, value); return value; }
	public var radius(get, set):Single;

	inline function get_radius():Single return Physics3DDebugSphere_Ffi.get_radius(this);

	inline function set_radius(value:Single):Single { Physics3DDebugSphere_Ffi.set_radius(this, value); return value; }
}
