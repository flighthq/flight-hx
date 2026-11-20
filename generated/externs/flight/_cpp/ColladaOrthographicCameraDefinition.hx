package flight._cpp;

private extern class ColladaOrthographicCameraDefinition_Ffi {
	@:native("flight_get_collada_orthographic_camera_definition_far") static function get_far(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collada_orthographic_camera_definition_far") static function set_far(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collada_orthographic_camera_definition_half_height") static function get_halfHeight(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collada_orthographic_camera_definition_half_height") static function set_halfHeight(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collada_orthographic_camera_definition_half_width") static function get_halfWidth(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collada_orthographic_camera_definition_half_width") static function set_halfWidth(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_collada_orthographic_camera_definition_near") static function get_near(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collada_orthographic_camera_definition_near") static function set_near(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract ColladaOrthographicCameraDefinition(cpp.Star<cpp.Void>) {
	public var far(get, set):Float;

	inline function get_far():Float return ColladaOrthographicCameraDefinition_Ffi.get_far(this);

	inline function set_far(value:Float):Float { ColladaOrthographicCameraDefinition_Ffi.set_far(this, value); return value; }
	public var halfHeight(get, set):Float;

	inline function get_halfHeight():Float return ColladaOrthographicCameraDefinition_Ffi.get_halfHeight(this);

	inline function set_halfHeight(value:Float):Float { ColladaOrthographicCameraDefinition_Ffi.set_halfHeight(this, value); return value; }
	public var halfWidth(get, set):Float;

	inline function get_halfWidth():Float return ColladaOrthographicCameraDefinition_Ffi.get_halfWidth(this);

	inline function set_halfWidth(value:Float):Float { ColladaOrthographicCameraDefinition_Ffi.set_halfWidth(this, value); return value; }
	public var near(get, set):Float;

	inline function get_near():Float return ColladaOrthographicCameraDefinition_Ffi.get_near(this);

	inline function set_near(value:Float):Float { ColladaOrthographicCameraDefinition_Ffi.set_near(this, value); return value; }
}
