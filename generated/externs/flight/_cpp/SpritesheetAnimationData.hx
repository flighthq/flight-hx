package flight._cpp;

private extern class SpritesheetAnimationData_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_spritesheet_animation_data_frame_duration") static function get_frameDuration(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_spritesheet_animation_data_frame_duration") static function set_frameDuration(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_spritesheet_animation_data_repeat_count") static function get_repeatCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_spritesheet_animation_data_repeat_count") static function set_repeatCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_spritesheet_animation_data_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_spritesheet_animation_data_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_spritesheet_animation_data_origin_x") static function get_originX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spritesheet_animation_data_origin_x") static function set_originX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_spritesheet_animation_data_origin_y") static function get_originY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spritesheet_animation_data_origin_y") static function set_originY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract SpritesheetAnimationData(cpp.Star<cpp.Void>) {
	public var frameDuration(get, set):Float;

	inline function get_frameDuration():Float return SpritesheetAnimationData_Ffi.get_frameDuration(this);

	inline function set_frameDuration(value:Float):Float { SpritesheetAnimationData_Ffi.set_frameDuration(this, value); return value; }
	public var repeatCount(get, set):Int;

	inline function get_repeatCount():Int return SpritesheetAnimationData_Ffi.get_repeatCount(this);

	inline function set_repeatCount(value:Int):Int { SpritesheetAnimationData_Ffi.set_repeatCount(this, value); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = SpritesheetAnimationData_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); SpritesheetAnimationData_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; SpritesheetAnimationData_Ffi.set_name(this, raw); return value; }
	public var originX(get, set):Single;

	inline function get_originX():Single return SpritesheetAnimationData_Ffi.get_originX(this);

	inline function set_originX(value:Single):Single { SpritesheetAnimationData_Ffi.set_originX(this, value); return value; }
	public var originY(get, set):Single;

	inline function get_originY():Single return SpritesheetAnimationData_Ffi.get_originY(this);

	inline function set_originY(value:Single):Single { SpritesheetAnimationData_Ffi.set_originY(this, value); return value; }
}
