package flight._cpp;

private extern class ColorKeyframe_Ffi {
	@:native("flight_get_color_keyframe_time") static function get_time(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_color_keyframe_time") static function set_time(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_color_keyframe_r") static function get_r(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_color_keyframe_r") static function set_r(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_color_keyframe_g") static function get_g(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_color_keyframe_g") static function set_g(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_color_keyframe_b") static function get_b(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_color_keyframe_b") static function set_b(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract ColorKeyframe(cpp.Star<cpp.Void>) {
	public var time(get, set):Single;

	inline function get_time():Single return ColorKeyframe_Ffi.get_time(this);

	inline function set_time(value:Single):Single return ColorKeyframe_Ffi.set_time(this, value);
	public var r(get, set):Single;

	inline function get_r():Single return ColorKeyframe_Ffi.get_r(this);

	inline function set_r(value:Single):Single return ColorKeyframe_Ffi.set_r(this, value);
	public var g(get, set):Single;

	inline function get_g():Single return ColorKeyframe_Ffi.get_g(this);

	inline function set_g(value:Single):Single return ColorKeyframe_Ffi.set_g(this, value);
	public var b(get, set):Single;

	inline function get_b():Single return ColorKeyframe_Ffi.get_b(this);

	inline function set_b(value:Single):Single return ColorKeyframe_Ffi.set_b(this, value);
}
