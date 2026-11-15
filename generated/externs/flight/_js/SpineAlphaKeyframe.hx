package flight._js;

@:jsRequire("flight")
private extern class SpineAlphaKeyframe_Ffi {
	@:native("flight_get_spine_alpha_keyframe_alpha") static function get_alpha(ptr:Dynamic):Float;
	@:native("flight_set_spine_alpha_keyframe_alpha") static function set_alpha(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_spine_alpha_keyframe_time") static function get_time(ptr:Dynamic):Float;
	@:native("flight_set_spine_alpha_keyframe_time") static function set_time(ptr:Dynamic, value:Float):Float;
}

abstract SpineAlphaKeyframe(Dynamic) {
	public var alpha(get, set):Float;

	inline function get_alpha():Float return SpineAlphaKeyframe_Ffi.get_alpha(this);

	inline function set_alpha(value:Float):Float return SpineAlphaKeyframe_Ffi.set_alpha(this, value);
	public var time(get, set):Float;

	inline function get_time():Float return SpineAlphaKeyframe_Ffi.get_time(this);

	inline function set_time(value:Float):Float return SpineAlphaKeyframe_Ffi.set_time(this, value);
}
