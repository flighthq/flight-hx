package flight._cpp;

private extern class SpritesheetFrame_Ffi {
	@:native("flight_get_spritesheet_frame_id") static function get_id(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_spritesheet_frame_id") static function set_id(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_spritesheet_frame_offset_x") static function get_offsetX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spritesheet_frame_offset_x") static function set_offsetX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_spritesheet_frame_offset_y") static function get_offsetY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spritesheet_frame_offset_y") static function set_offsetY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_spritesheet_frame_rotated") static function get_rotated(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_spritesheet_frame_rotated") static function set_rotated(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract SpritesheetFrame(cpp.Star<cpp.Void>) {
	public var id(get, set):Int;

	inline function get_id():Int return SpritesheetFrame_Ffi.get_id(this);

	inline function set_id(value:Int):Int return SpritesheetFrame_Ffi.set_id(this, value);
	public var offsetX(get, set):Single;

	inline function get_offsetX():Single return SpritesheetFrame_Ffi.get_offsetX(this);

	inline function set_offsetX(value:Single):Single return SpritesheetFrame_Ffi.set_offsetX(this, value);
	public var offsetY(get, set):Single;

	inline function get_offsetY():Single return SpritesheetFrame_Ffi.get_offsetY(this);

	inline function set_offsetY(value:Single):Single return SpritesheetFrame_Ffi.set_offsetY(this, value);
	public var rotated(get, set):Bool;

	inline function get_rotated():Bool return SpritesheetFrame_Ffi.get_rotated(this);

	inline function set_rotated(value:Bool):Bool return SpritesheetFrame_Ffi.set_rotated(this, value);
}
