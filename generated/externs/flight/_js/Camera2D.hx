package flight._js;

@:jsRequire("flight")
private extern class Camera2D_Ffi {
	@:native("flight_get_camera2_d_rotation") static function get_rotation(ptr:Dynamic):Float;
	@:native("flight_set_camera2_d_rotation") static function set_rotation(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_camera2_d_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_camera2_d_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_camera2_d_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_camera2_d_y") static function set_y(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_camera2_d_zoom") static function get_zoom(ptr:Dynamic):Float;
	@:native("flight_set_camera2_d_zoom") static function set_zoom(ptr:Dynamic, value:Float):Float;
}

abstract Camera2D(Dynamic) {
	public var rotation(get, set):Float;

	inline function get_rotation():Float return Camera2D_Ffi.get_rotation(this);

	inline function set_rotation(value:Float):Float return Camera2D_Ffi.set_rotation(this, value);
	public var x(get, set):Float;

	inline function get_x():Float return Camera2D_Ffi.get_x(this);

	inline function set_x(value:Float):Float return Camera2D_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return Camera2D_Ffi.get_y(this);

	inline function set_y(value:Float):Float return Camera2D_Ffi.set_y(this, value);
	public var zoom(get, set):Float;

	inline function get_zoom():Float return Camera2D_Ffi.get_zoom(this);

	inline function set_zoom(value:Float):Float return Camera2D_Ffi.set_zoom(this, value);
}
