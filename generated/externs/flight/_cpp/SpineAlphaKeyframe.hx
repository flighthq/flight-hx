package flight._cpp;

private extern class SpineAlphaKeyframe_Ffi {
	@:native("flight_get_spine_alpha_keyframe_alpha") static function get_alpha(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spine_alpha_keyframe_alpha") static function set_alpha(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_spine_alpha_keyframe_time") static function get_time(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spine_alpha_keyframe_time") static function set_time(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract SpineAlphaKeyframe(cpp.Star<cpp.Void>) {
	public var alpha(get, set):Single;

	inline function get_alpha():Single return SpineAlphaKeyframe_Ffi.get_alpha(this);

	inline function set_alpha(value:Single):Single return SpineAlphaKeyframe_Ffi.set_alpha(this, value);
	public var time(get, set):Single;

	inline function get_time():Single return SpineAlphaKeyframe_Ffi.get_time(this);

	inline function set_time(value:Single):Single return SpineAlphaKeyframe_Ffi.set_time(this, value);
}
