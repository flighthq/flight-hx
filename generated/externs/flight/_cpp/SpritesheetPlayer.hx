package flight._cpp;

private extern class SpritesheetPlayer_Ffi {
	@:native("flight_get_spritesheet_player_complete") static function get_complete(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_spritesheet_player_complete") static function set_complete(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_spritesheet_player_elapsed") static function get_elapsed(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_spritesheet_player_elapsed") static function set_elapsed(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_spritesheet_player_paused") static function get_paused(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_spritesheet_player_paused") static function set_paused(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_spritesheet_player_speed") static function get_speed(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_spritesheet_player_speed") static function set_speed(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_spritesheet_player_frame_index") static function get_frameIndex(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_spritesheet_player_frame_index") static function set_frameIndex(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract SpritesheetPlayer(cpp.Star<cpp.Void>) {
	public var complete(get, set):Bool;

	inline function get_complete():Bool return SpritesheetPlayer_Ffi.get_complete(this);

	inline function set_complete(value:Bool):Bool { SpritesheetPlayer_Ffi.set_complete(this, value); return value; }
	public var elapsed(get, set):Float;

	inline function get_elapsed():Float return SpritesheetPlayer_Ffi.get_elapsed(this);

	inline function set_elapsed(value:Float):Float { SpritesheetPlayer_Ffi.set_elapsed(this, value); return value; }
	public var paused(get, set):Bool;

	inline function get_paused():Bool return SpritesheetPlayer_Ffi.get_paused(this);

	inline function set_paused(value:Bool):Bool { SpritesheetPlayer_Ffi.set_paused(this, value); return value; }
	public var speed(get, set):Float;

	inline function get_speed():Float return SpritesheetPlayer_Ffi.get_speed(this);

	inline function set_speed(value:Float):Float { SpritesheetPlayer_Ffi.set_speed(this, value); return value; }
	public var frameIndex(get, set):Float;

	inline function get_frameIndex():Float return SpritesheetPlayer_Ffi.get_frameIndex(this);

	inline function set_frameIndex(value:Float):Float { SpritesheetPlayer_Ffi.set_frameIndex(this, value); return value; }
}
