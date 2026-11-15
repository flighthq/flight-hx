package flight._js;

@:jsRequire("flight")
private extern class Physics2DDebugGeometry_Ffi {
	@:native("flight_get_physics2_ddebug_geometry_circle_count") static function get_circleCount(ptr:Dynamic):Int;
	@:native("flight_set_physics2_ddebug_geometry_circle_count") static function set_circleCount(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_physics2_ddebug_geometry_line_count") static function get_lineCount(ptr:Dynamic):Int;
	@:native("flight_set_physics2_ddebug_geometry_line_count") static function set_lineCount(ptr:Dynamic, value:Int):Int;
}

abstract Physics2DDebugGeometry(Dynamic) {
	public var circleCount(get, set):Int;

	inline function get_circleCount():Int return Physics2DDebugGeometry_Ffi.get_circleCount(this);

	inline function set_circleCount(value:Int):Int return Physics2DDebugGeometry_Ffi.set_circleCount(this, value);
	public var lineCount(get, set):Int;

	inline function get_lineCount():Int return Physics2DDebugGeometry_Ffi.get_lineCount(this);

	inline function set_lineCount(value:Int):Int return Physics2DDebugGeometry_Ffi.set_lineCount(this, value);
}
