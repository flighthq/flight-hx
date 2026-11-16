package flight._cpp;

private extern class Physics2DDebugLine_Ffi {
	@:native("flight_get_physics2_ddebug_line_body_a") static function get_bodyA(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_ddebug_line_body_a") static function set_bodyA(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics2_ddebug_line_body_b") static function get_bodyB(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_ddebug_line_body_b") static function set_bodyB(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics2_ddebug_line_x0") static function get_x0(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_ddebug_line_x0") static function set_x0(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_ddebug_line_x1") static function get_x1(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_ddebug_line_x1") static function set_x1(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_ddebug_line_y0") static function get_y0(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_ddebug_line_y0") static function set_y0(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_ddebug_line_y1") static function get_y1(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_ddebug_line_y1") static function set_y1(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics2DDebugLine(cpp.Star<cpp.Void>) {
	public var bodyA(get, set):Int;

	inline function get_bodyA():Int return Physics2DDebugLine_Ffi.get_bodyA(this);

	inline function set_bodyA(value:Int):Int { Physics2DDebugLine_Ffi.set_bodyA(this, value); return value; }
	public var bodyB(get, set):Int;

	inline function get_bodyB():Int return Physics2DDebugLine_Ffi.get_bodyB(this);

	inline function set_bodyB(value:Int):Int { Physics2DDebugLine_Ffi.set_bodyB(this, value); return value; }
	public var x0(get, set):Single;

	inline function get_x0():Single return Physics2DDebugLine_Ffi.get_x0(this);

	inline function set_x0(value:Single):Single { Physics2DDebugLine_Ffi.set_x0(this, value); return value; }
	public var x1(get, set):Single;

	inline function get_x1():Single return Physics2DDebugLine_Ffi.get_x1(this);

	inline function set_x1(value:Single):Single { Physics2DDebugLine_Ffi.set_x1(this, value); return value; }
	public var y0(get, set):Single;

	inline function get_y0():Single return Physics2DDebugLine_Ffi.get_y0(this);

	inline function set_y0(value:Single):Single { Physics2DDebugLine_Ffi.set_y0(this, value); return value; }
	public var y1(get, set):Single;

	inline function get_y1():Single return Physics2DDebugLine_Ffi.get_y1(this);

	inline function set_y1(value:Single):Single { Physics2DDebugLine_Ffi.set_y1(this, value); return value; }
}
