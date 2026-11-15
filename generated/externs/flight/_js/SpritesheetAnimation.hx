package flight._js;

@:jsRequire("flight")
private extern class SpritesheetAnimation_Ffi {
	@:native("flight_get_spritesheet_animation_frame_duration") static function get_frameDuration(ptr:Dynamic):Float;
	@:native("flight_set_spritesheet_animation_frame_duration") static function set_frameDuration(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_spritesheet_animation_repeat_count") static function get_repeatCount(ptr:Dynamic):Int;
	@:native("flight_set_spritesheet_animation_repeat_count") static function set_repeatCount(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_spritesheet_animation_origin_x") static function get_originX(ptr:Dynamic):Float;
	@:native("flight_set_spritesheet_animation_origin_x") static function set_originX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_spritesheet_animation_origin_y") static function get_originY(ptr:Dynamic):Float;
	@:native("flight_set_spritesheet_animation_origin_y") static function set_originY(ptr:Dynamic, value:Float):Float;
}

abstract SpritesheetAnimation(Dynamic) {
	public var frameDuration(get, set):Float;

	inline function get_frameDuration():Float return SpritesheetAnimation_Ffi.get_frameDuration(this);

	inline function set_frameDuration(value:Float):Float return SpritesheetAnimation_Ffi.set_frameDuration(this, value);
	public var repeatCount(get, set):Int;

	inline function get_repeatCount():Int return SpritesheetAnimation_Ffi.get_repeatCount(this);

	inline function set_repeatCount(value:Int):Int return SpritesheetAnimation_Ffi.set_repeatCount(this, value);
	public var originX(get, set):Float;

	inline function get_originX():Float return SpritesheetAnimation_Ffi.get_originX(this);

	inline function set_originX(value:Float):Float return SpritesheetAnimation_Ffi.set_originX(this, value);
	public var originY(get, set):Float;

	inline function get_originY():Float return SpritesheetAnimation_Ffi.get_originY(this);

	inline function set_originY(value:Float):Float return SpritesheetAnimation_Ffi.set_originY(this, value);
}
