package flight._js;

@:jsRequire("flight")
private extern class AnimationPlayer_Ffi {
	@:native("flight_get_animation_player_loop_enabled") static function get_loopEnabled(ptr:Dynamic):Bool;
	@:native("flight_set_animation_player_loop_enabled") static function set_loopEnabled(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_animation_player_playing") static function get_playing(ptr:Dynamic):Bool;
	@:native("flight_set_animation_player_playing") static function set_playing(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_animation_player_repeat_count") static function get_repeatCount(ptr:Dynamic):Int;
	@:native("flight_set_animation_player_repeat_count") static function set_repeatCount(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_animation_player_speed") static function get_speed(ptr:Dynamic):Float;
	@:native("flight_set_animation_player_speed") static function set_speed(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_animation_player_time") static function get_time(ptr:Dynamic):Float;
	@:native("flight_set_animation_player_time") static function set_time(ptr:Dynamic, value:Float):Float;
}

abstract AnimationPlayer(Dynamic) {
	public var loopEnabled(get, set):Bool;

	inline function get_loopEnabled():Bool return AnimationPlayer_Ffi.get_loopEnabled(this);

	inline function set_loopEnabled(value:Bool):Bool return AnimationPlayer_Ffi.set_loopEnabled(this, value);
	public var playing(get, set):Bool;

	inline function get_playing():Bool return AnimationPlayer_Ffi.get_playing(this);

	inline function set_playing(value:Bool):Bool return AnimationPlayer_Ffi.set_playing(this, value);
	public var repeatCount(get, set):Int;

	inline function get_repeatCount():Int return AnimationPlayer_Ffi.get_repeatCount(this);

	inline function set_repeatCount(value:Int):Int return AnimationPlayer_Ffi.set_repeatCount(this, value);
	public var speed(get, set):Float;

	inline function get_speed():Float return AnimationPlayer_Ffi.get_speed(this);

	inline function set_speed(value:Float):Float return AnimationPlayer_Ffi.set_speed(this, value);
	public var time(get, set):Float;

	inline function get_time():Float return AnimationPlayer_Ffi.get_time(this);

	inline function set_time(value:Float):Float return AnimationPlayer_Ffi.set_time(this, value);
}
