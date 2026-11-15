package flight._cpp;

private extern class SpritesheetAnimationData_Ffi {
	@:native("flight_get_spritesheet_animation_data_frame_duration") static function get_frameDuration(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_spritesheet_animation_data_frame_duration") static function set_frameDuration(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_spritesheet_animation_data_repeat_count") static function get_repeatCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_spritesheet_animation_data_repeat_count") static function set_repeatCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_spritesheet_animation_data_origin_x") static function get_originX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spritesheet_animation_data_origin_x") static function set_originX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_spritesheet_animation_data_origin_y") static function get_originY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spritesheet_animation_data_origin_y") static function set_originY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract SpritesheetAnimationData(cpp.Star<cpp.Void>) {
	public var frameDuration(get, set):Float;

	inline function get_frameDuration():Float return SpritesheetAnimationData_Ffi.get_frameDuration(this);

	inline function set_frameDuration(value:Float):Float return SpritesheetAnimationData_Ffi.set_frameDuration(this, value);
	public var repeatCount(get, set):Int;

	inline function get_repeatCount():Int return SpritesheetAnimationData_Ffi.get_repeatCount(this);

	inline function set_repeatCount(value:Int):Int return SpritesheetAnimationData_Ffi.set_repeatCount(this, value);
	public var originX(get, set):Single;

	inline function get_originX():Single return SpritesheetAnimationData_Ffi.get_originX(this);

	inline function set_originX(value:Single):Single return SpritesheetAnimationData_Ffi.set_originX(this, value);
	public var originY(get, set):Single;

	inline function get_originY():Single return SpritesheetAnimationData_Ffi.get_originY(this);

	inline function set_originY(value:Single):Single return SpritesheetAnimationData_Ffi.set_originY(this, value);
}
