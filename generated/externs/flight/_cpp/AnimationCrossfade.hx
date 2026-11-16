package flight._cpp;

private extern class AnimationCrossfade_Ffi {
	@:native("flight_get_animation_crossfade_duration") static function get_duration(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_animation_crossfade_duration") static function set_duration(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_animation_crossfade_elapsed") static function get_elapsed(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_animation_crossfade_elapsed") static function set_elapsed(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_animation_crossfade_weight") static function get_weight(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_animation_crossfade_weight") static function set_weight(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract AnimationCrossfade(cpp.Star<cpp.Void>) {
	public var duration(get, set):Single;

	inline function get_duration():Single return AnimationCrossfade_Ffi.get_duration(this);

	inline function set_duration(value:Single):Single { AnimationCrossfade_Ffi.set_duration(this, value); return value; }
	public var elapsed(get, set):Single;

	inline function get_elapsed():Single return AnimationCrossfade_Ffi.get_elapsed(this);

	inline function set_elapsed(value:Single):Single { AnimationCrossfade_Ffi.set_elapsed(this, value); return value; }
	public var weight(get, set):Single;

	inline function get_weight():Single return AnimationCrossfade_Ffi.get_weight(this);

	inline function set_weight(value:Single):Single { AnimationCrossfade_Ffi.set_weight(this, value); return value; }
}
