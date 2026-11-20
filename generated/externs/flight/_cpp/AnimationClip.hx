package flight._cpp;

private extern class AnimationClip_Ffi {
	@:native("flight_get_animation_clip_duration") static function get_duration(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_animation_clip_duration") static function set_duration(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract AnimationClip(cpp.Star<cpp.Void>) {
	public var duration(get, set):Float;

	inline function get_duration():Float return AnimationClip_Ffi.get_duration(this);

	inline function set_duration(value:Float):Float { AnimationClip_Ffi.set_duration(this, value); return value; }
}
