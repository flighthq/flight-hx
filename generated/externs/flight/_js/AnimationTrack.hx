package flight._js;

@:jsRequire("flight")
private extern class AnimationTrack_Ffi {
	@:native("flight_get_animation_track_components") static function get_components(ptr:Dynamic):Int;
	@:native("flight_set_animation_track_components") static function set_components(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_animation_track_quaternion") static function get_quaternion(ptr:Dynamic):Bool;
	@:native("flight_set_animation_track_quaternion") static function set_quaternion(ptr:Dynamic, value:Bool):Bool;
}

abstract AnimationTrack(Dynamic) {
	public var components(get, set):Int;

	inline function get_components():Int return AnimationTrack_Ffi.get_components(this);

	inline function set_components(value:Int):Int return AnimationTrack_Ffi.set_components(this, value);
	public var quaternion(get, set):Bool;

	inline function get_quaternion():Bool return AnimationTrack_Ffi.get_quaternion(this);

	inline function set_quaternion(value:Bool):Bool return AnimationTrack_Ffi.set_quaternion(this, value);
}
