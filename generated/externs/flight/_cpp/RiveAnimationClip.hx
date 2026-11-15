package flight._cpp;

private extern class RiveAnimationClip_Ffi {
	@:native("flight_get_rive_animation_clip_speed") static function get_speed(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rive_animation_clip_speed") static function set_speed(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract RiveAnimationClip(cpp.Star<cpp.Void>) {
	public var speed(get, set):Single;

	inline function get_speed():Single return RiveAnimationClip_Ffi.get_speed(this);

	inline function set_speed(value:Single):Single return RiveAnimationClip_Ffi.set_speed(this, value);
}
