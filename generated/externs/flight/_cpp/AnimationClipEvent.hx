package flight._cpp;

private extern class AnimationClipEvent_Ffi {
	@:native("flight_get_animation_clip_event_time") static function get_time(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_animation_clip_event_time") static function set_time(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract AnimationClipEvent(cpp.Star<cpp.Void>) {
	public var time(get, set):Single;

	inline function get_time():Single return AnimationClipEvent_Ffi.get_time(this);

	inline function set_time(value:Single):Single return AnimationClipEvent_Ffi.set_time(this, value);
}
