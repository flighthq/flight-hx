package flight._cpp;

private extern class Physics3DDebugGeometry_Ffi {
	@:native("flight_get_physics3_ddebug_geometry_line_count") static function get_lineCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_ddebug_geometry_line_count") static function set_lineCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_ddebug_geometry_sphere_count") static function get_sphereCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_ddebug_geometry_sphere_count") static function set_sphereCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Physics3DDebugGeometry(cpp.Star<cpp.Void>) {
	public var lineCount(get, set):Int;

	inline function get_lineCount():Int return Physics3DDebugGeometry_Ffi.get_lineCount(this);

	inline function set_lineCount(value:Int):Int { Physics3DDebugGeometry_Ffi.set_lineCount(this, value); return value; }
	public var sphereCount(get, set):Int;

	inline function get_sphereCount():Int return Physics3DDebugGeometry_Ffi.get_sphereCount(this);

	inline function set_sphereCount(value:Int):Int { Physics3DDebugGeometry_Ffi.set_sphereCount(this, value); return value; }
}
