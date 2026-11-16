package flight._cpp;

private extern class AnimationPlayer_Ffi {
	@:native("flight_get_animation_player_loop_enabled") static function get_loopEnabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_animation_player_loop_enabled") static function set_loopEnabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_animation_player_playing") static function get_playing(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_animation_player_playing") static function set_playing(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_animation_player_repeat_count") static function get_repeatCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_animation_player_repeat_count") static function set_repeatCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_animation_player_speed") static function get_speed(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_animation_player_speed") static function set_speed(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_animation_player_time") static function get_time(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_animation_player_time") static function set_time(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract AnimationPlayer(cpp.Star<cpp.Void>) {
	public var loopEnabled(get, set):Bool;

	inline function get_loopEnabled():Bool return AnimationPlayer_Ffi.get_loopEnabled(this);

	inline function set_loopEnabled(value:Bool):Bool { AnimationPlayer_Ffi.set_loopEnabled(this, value); return value; }
	public var playing(get, set):Bool;

	inline function get_playing():Bool return AnimationPlayer_Ffi.get_playing(this);

	inline function set_playing(value:Bool):Bool { AnimationPlayer_Ffi.set_playing(this, value); return value; }
	public var repeatCount(get, set):Int;

	inline function get_repeatCount():Int return AnimationPlayer_Ffi.get_repeatCount(this);

	inline function set_repeatCount(value:Int):Int { AnimationPlayer_Ffi.set_repeatCount(this, value); return value; }
	public var speed(get, set):Single;

	inline function get_speed():Single return AnimationPlayer_Ffi.get_speed(this);

	inline function set_speed(value:Single):Single { AnimationPlayer_Ffi.set_speed(this, value); return value; }
	public var time(get, set):Single;

	inline function get_time():Single return AnimationPlayer_Ffi.get_time(this);

	inline function set_time(value:Single):Single { AnimationPlayer_Ffi.set_time(this, value); return value; }
}
