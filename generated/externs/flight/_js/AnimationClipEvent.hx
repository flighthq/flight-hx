package flight._js;

@:jsRequire("flight")
private extern class AnimationClipEvent_Ffi {
	@:native("flight_get_animation_clip_event_time") static function get_time(ptr:Dynamic):Float;
	@:native("flight_set_animation_clip_event_time") static function set_time(ptr:Dynamic, value:Float):Float;
}

abstract AnimationClipEvent(Dynamic) {
	public var time(get, set):Float;

	inline function get_time():Float return AnimationClipEvent_Ffi.get_time(this);

	inline function set_time(value:Float):Float return AnimationClipEvent_Ffi.set_time(this, value);
}
