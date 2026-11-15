package flight._js;

@:jsRequire("flight")
private extern class Physics2DDebugLine_Ffi {
	@:native("flight_get_physics2_ddebug_line_body_a") static function get_bodyA(ptr:Dynamic):Int;
	@:native("flight_set_physics2_ddebug_line_body_a") static function set_bodyA(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_physics2_ddebug_line_body_b") static function get_bodyB(ptr:Dynamic):Int;
	@:native("flight_set_physics2_ddebug_line_body_b") static function set_bodyB(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_physics2_ddebug_line_x0") static function get_x0(ptr:Dynamic):Float;
	@:native("flight_set_physics2_ddebug_line_x0") static function set_x0(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_ddebug_line_x1") static function get_x1(ptr:Dynamic):Float;
	@:native("flight_set_physics2_ddebug_line_x1") static function set_x1(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_ddebug_line_y0") static function get_y0(ptr:Dynamic):Float;
	@:native("flight_set_physics2_ddebug_line_y0") static function set_y0(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_ddebug_line_y1") static function get_y1(ptr:Dynamic):Float;
	@:native("flight_set_physics2_ddebug_line_y1") static function set_y1(ptr:Dynamic, value:Float):Float;
}

abstract Physics2DDebugLine(Dynamic) {
	public var bodyA(get, set):Int;

	inline function get_bodyA():Int return Physics2DDebugLine_Ffi.get_bodyA(this);

	inline function set_bodyA(value:Int):Int return Physics2DDebugLine_Ffi.set_bodyA(this, value);
	public var bodyB(get, set):Int;

	inline function get_bodyB():Int return Physics2DDebugLine_Ffi.get_bodyB(this);

	inline function set_bodyB(value:Int):Int return Physics2DDebugLine_Ffi.set_bodyB(this, value);
	public var x0(get, set):Float;

	inline function get_x0():Float return Physics2DDebugLine_Ffi.get_x0(this);

	inline function set_x0(value:Float):Float return Physics2DDebugLine_Ffi.set_x0(this, value);
	public var x1(get, set):Float;

	inline function get_x1():Float return Physics2DDebugLine_Ffi.get_x1(this);

	inline function set_x1(value:Float):Float return Physics2DDebugLine_Ffi.set_x1(this, value);
	public var y0(get, set):Float;

	inline function get_y0():Float return Physics2DDebugLine_Ffi.get_y0(this);

	inline function set_y0(value:Float):Float return Physics2DDebugLine_Ffi.set_y0(this, value);
	public var y1(get, set):Float;

	inline function get_y1():Float return Physics2DDebugLine_Ffi.get_y1(this);

	inline function set_y1(value:Float):Float return Physics2DDebugLine_Ffi.set_y1(this, value);
}
