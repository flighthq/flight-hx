package flight._js;

@:jsRequire("flight")
private extern class SpineTintKeyframe_Ffi {
	@:native("flight_get_spine_tint_keyframe_time") static function get_time(ptr:Dynamic):Float;
	@:native("flight_set_spine_tint_keyframe_time") static function set_time(ptr:Dynamic, value:Float):Float;
}

abstract SpineTintKeyframe(Dynamic) {
	public var time(get, set):Float;

	inline function get_time():Float return SpineTintKeyframe_Ffi.get_time(this);

	inline function set_time(value:Float):Float return SpineTintKeyframe_Ffi.set_time(this, value);
}
