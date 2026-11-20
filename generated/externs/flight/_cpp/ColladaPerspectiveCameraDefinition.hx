package flight._cpp;

private extern class ColladaPerspectiveCameraDefinition_Ffi {
	@:native("flight_get_collada_perspective_camera_definition_aspect") static function get_aspect(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collada_perspective_camera_definition_aspect") static function set_aspect(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collada_perspective_camera_definition_far") static function get_far(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collada_perspective_camera_definition_far") static function set_far(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collada_perspective_camera_definition_fov_y") static function get_fovY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collada_perspective_camera_definition_fov_y") static function set_fovY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collada_perspective_camera_definition_near") static function get_near(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collada_perspective_camera_definition_near") static function set_near(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract ColladaPerspectiveCameraDefinition(cpp.Star<cpp.Void>) {
	public var aspect(get, set):Float;

	inline function get_aspect():Float return ColladaPerspectiveCameraDefinition_Ffi.get_aspect(this);

	inline function set_aspect(value:Float):Float { ColladaPerspectiveCameraDefinition_Ffi.set_aspect(this, value); return value; }
	public var far(get, set):Float;

	inline function get_far():Float return ColladaPerspectiveCameraDefinition_Ffi.get_far(this);

	inline function set_far(value:Float):Float { ColladaPerspectiveCameraDefinition_Ffi.set_far(this, value); return value; }
	public var fovY(get, set):Float;

	inline function get_fovY():Float return ColladaPerspectiveCameraDefinition_Ffi.get_fovY(this);

	inline function set_fovY(value:Float):Float { ColladaPerspectiveCameraDefinition_Ffi.set_fovY(this, value); return value; }
	public var near(get, set):Float;

	inline function get_near():Float return ColladaPerspectiveCameraDefinition_Ffi.get_near(this);

	inline function set_near(value:Float):Float { ColladaPerspectiveCameraDefinition_Ffi.set_near(this, value); return value; }
}
