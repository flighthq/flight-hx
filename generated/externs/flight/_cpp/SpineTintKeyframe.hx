package flight._cpp;

private extern class SpineTintKeyframe_Ffi {
	@:native("flight_get_spine_tint_keyframe_time") static function get_time(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spine_tint_keyframe_time") static function set_time(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract SpineTintKeyframe(cpp.Star<cpp.Void>) {
	public var time(get, set):Single;

	inline function get_time():Single return SpineTintKeyframe_Ffi.get_time(this);

	inline function set_time(value:Single):Single { SpineTintKeyframe_Ffi.set_time(this, value); return value; }
}
