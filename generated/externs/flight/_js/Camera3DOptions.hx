package flight._js;

@:jsRequire("flight")
private extern class Camera3DOptions_Ffi {
	@:native("flight_get_camera3_doptions_far") static function get_far(ptr:Dynamic):Float;
	@:native("flight_set_camera3_doptions_far") static function set_far(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_camera3_doptions_near") static function get_near(ptr:Dynamic):Float;
	@:native("flight_set_camera3_doptions_near") static function set_near(ptr:Dynamic, value:Float):Float;
}

abstract Camera3DOptions(Dynamic) {
	public var far(get, set):Float;

	inline function get_far():Float return Camera3DOptions_Ffi.get_far(this);

	inline function set_far(value:Float):Float return Camera3DOptions_Ffi.set_far(this, value);
	public var near(get, set):Float;

	inline function get_near():Float return Camera3DOptions_Ffi.get_near(this);

	inline function set_near(value:Float):Float return Camera3DOptions_Ffi.set_near(this, value);
}
