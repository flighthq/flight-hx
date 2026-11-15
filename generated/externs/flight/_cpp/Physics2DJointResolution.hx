package flight._cpp;

private extern class Physics2DJointResolution_Ffi {
	@:native("flight_get_physics2_djoint_resolution_body_a") static function get_bodyA(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_djoint_resolution_body_a") static function set_bodyA(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics2_djoint_resolution_body_a_found") static function get_bodyAFound(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics2_djoint_resolution_body_a_found") static function set_bodyAFound(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics2_djoint_resolution_body_a_used") static function get_bodyAUsed(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics2_djoint_resolution_body_a_used") static function set_bodyAUsed(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics2_djoint_resolution_body_b") static function get_bodyB(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_djoint_resolution_body_b") static function set_bodyB(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics2_djoint_resolution_body_b_found") static function get_bodyBFound(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics2_djoint_resolution_body_b_found") static function set_bodyBFound(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics2_djoint_resolution_joint_index") static function get_jointIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_djoint_resolution_joint_index") static function set_jointIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics2_djoint_resolution_solver_registered") static function get_solverRegistered(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics2_djoint_resolution_solver_registered") static function set_solverRegistered(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Physics2DJointResolution(cpp.Star<cpp.Void>) {
	public var bodyA(get, set):Int;

	inline function get_bodyA():Int return Physics2DJointResolution_Ffi.get_bodyA(this);

	inline function set_bodyA(value:Int):Int return Physics2DJointResolution_Ffi.set_bodyA(this, value);
	public var bodyAFound(get, set):Bool;

	inline function get_bodyAFound():Bool return Physics2DJointResolution_Ffi.get_bodyAFound(this);

	inline function set_bodyAFound(value:Bool):Bool return Physics2DJointResolution_Ffi.set_bodyAFound(this, value);
	public var bodyAUsed(get, set):Bool;

	inline function get_bodyAUsed():Bool return Physics2DJointResolution_Ffi.get_bodyAUsed(this);

	inline function set_bodyAUsed(value:Bool):Bool return Physics2DJointResolution_Ffi.set_bodyAUsed(this, value);
	public var bodyB(get, set):Int;

	inline function get_bodyB():Int return Physics2DJointResolution_Ffi.get_bodyB(this);

	inline function set_bodyB(value:Int):Int return Physics2DJointResolution_Ffi.set_bodyB(this, value);
	public var bodyBFound(get, set):Bool;

	inline function get_bodyBFound():Bool return Physics2DJointResolution_Ffi.get_bodyBFound(this);

	inline function set_bodyBFound(value:Bool):Bool return Physics2DJointResolution_Ffi.set_bodyBFound(this, value);
	public var jointIndex(get, set):Int;

	inline function get_jointIndex():Int return Physics2DJointResolution_Ffi.get_jointIndex(this);

	inline function set_jointIndex(value:Int):Int return Physics2DJointResolution_Ffi.set_jointIndex(this, value);
	public var solverRegistered(get, set):Bool;

	inline function get_solverRegistered():Bool return Physics2DJointResolution_Ffi.get_solverRegistered(this);

	inline function set_solverRegistered(value:Bool):Bool return Physics2DJointResolution_Ffi.set_solverRegistered(this, value);
}
