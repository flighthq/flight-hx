package flight._js;

@:jsRequire("flight")
private extern class AnimationClip_Ffi {
	@:native("flight_get_animation_clip_duration") static function get_duration(ptr:Dynamic):Float;
	@:native("flight_set_animation_clip_duration") static function set_duration(ptr:Dynamic, value:Float):Float;
}

abstract AnimationClip(Dynamic) {
	public var duration(get, set):Float;

	inline function get_duration():Float return AnimationClip_Ffi.get_duration(this);

	inline function set_duration(value:Float):Float return AnimationClip_Ffi.set_duration(this, value);
}
