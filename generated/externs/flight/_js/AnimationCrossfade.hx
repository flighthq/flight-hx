package flight._js;

@:jsRequire("flight")
private extern class AnimationCrossfade_Ffi {
	@:native("flight_get_animation_crossfade_duration") static function get_duration(ptr:Dynamic):Float;
	@:native("flight_set_animation_crossfade_duration") static function set_duration(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_animation_crossfade_elapsed") static function get_elapsed(ptr:Dynamic):Float;
	@:native("flight_set_animation_crossfade_elapsed") static function set_elapsed(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_animation_crossfade_weight") static function get_weight(ptr:Dynamic):Float;
	@:native("flight_set_animation_crossfade_weight") static function set_weight(ptr:Dynamic, value:Float):Float;
}

abstract AnimationCrossfade(Dynamic) {
	public var duration(get, set):Float;

	inline function get_duration():Float return AnimationCrossfade_Ffi.get_duration(this);

	inline function set_duration(value:Float):Float return AnimationCrossfade_Ffi.set_duration(this, value);
	public var elapsed(get, set):Float;

	inline function get_elapsed():Float return AnimationCrossfade_Ffi.get_elapsed(this);

	inline function set_elapsed(value:Float):Float return AnimationCrossfade_Ffi.set_elapsed(this, value);
	public var weight(get, set):Float;

	inline function get_weight():Float return AnimationCrossfade_Ffi.get_weight(this);

	inline function set_weight(value:Float):Float return AnimationCrossfade_Ffi.set_weight(this, value);
}
