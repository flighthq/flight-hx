package flight._js;

@:jsRequire("flight")
private extern class RiveAnimationClip_Ffi {
	@:native("flight_get_rive_animation_clip_speed") static function get_speed(ptr:Dynamic):Float;
	@:native("flight_set_rive_animation_clip_speed") static function set_speed(ptr:Dynamic, value:Float):Float;
}

abstract RiveAnimationClip(Dynamic) {
	public var speed(get, set):Float;

	inline function get_speed():Float return RiveAnimationClip_Ffi.get_speed(this);

	inline function set_speed(value:Float):Float return RiveAnimationClip_Ffi.set_speed(this, value);
}
