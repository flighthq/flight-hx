package flight._cpp;

private extern class AnimationTrack_Ffi {
	@:native("flight_get_animation_track_components") static function get_components(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_animation_track_components") static function set_components(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_animation_track_quaternion") static function get_quaternion(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_animation_track_quaternion") static function set_quaternion(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract AnimationTrack(cpp.Star<cpp.Void>) {
	public var components(get, set):Int;

	inline function get_components():Int return AnimationTrack_Ffi.get_components(this);

	inline function set_components(value:Int):Int return AnimationTrack_Ffi.set_components(this, value);
	public var quaternion(get, set):Bool;

	inline function get_quaternion():Bool return AnimationTrack_Ffi.get_quaternion(this);

	inline function set_quaternion(value:Bool):Bool return AnimationTrack_Ffi.set_quaternion(this, value);
}
