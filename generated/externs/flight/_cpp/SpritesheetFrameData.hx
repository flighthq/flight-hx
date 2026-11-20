package flight._cpp;

private extern class SpritesheetFrameData_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_spritesheet_frame_data_height") static function get_height(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spritesheet_frame_data_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_spritesheet_frame_data_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_spritesheet_frame_data_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_spritesheet_frame_data_offset_x") static function get_offsetX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spritesheet_frame_data_offset_x") static function set_offsetX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_spritesheet_frame_data_offset_y") static function get_offsetY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spritesheet_frame_data_offset_y") static function set_offsetY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_spritesheet_frame_data_rotated") static function get_rotated(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_spritesheet_frame_data_rotated") static function set_rotated(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_spritesheet_frame_data_source_height") static function get_sourceHeight(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spritesheet_frame_data_source_height") static function set_sourceHeight(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_spritesheet_frame_data_source_width") static function get_sourceWidth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spritesheet_frame_data_source_width") static function set_sourceWidth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_spritesheet_frame_data_width") static function get_width(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spritesheet_frame_data_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_spritesheet_frame_data_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spritesheet_frame_data_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_spritesheet_frame_data_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spritesheet_frame_data_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract SpritesheetFrameData(cpp.Star<cpp.Void>) {
	public var height(get, set):Single;

	inline function get_height():Single return SpritesheetFrameData_Ffi.get_height(this);

	inline function set_height(value:Single):Single { SpritesheetFrameData_Ffi.set_height(this, value); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = SpritesheetFrameData_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); SpritesheetFrameData_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; SpritesheetFrameData_Ffi.set_name(this, raw); return value; }
	public var offsetX(get, set):Single;

	inline function get_offsetX():Single return SpritesheetFrameData_Ffi.get_offsetX(this);

	inline function set_offsetX(value:Single):Single { SpritesheetFrameData_Ffi.set_offsetX(this, value); return value; }
	public var offsetY(get, set):Single;

	inline function get_offsetY():Single return SpritesheetFrameData_Ffi.get_offsetY(this);

	inline function set_offsetY(value:Single):Single { SpritesheetFrameData_Ffi.set_offsetY(this, value); return value; }
	public var rotated(get, set):Bool;

	inline function get_rotated():Bool return SpritesheetFrameData_Ffi.get_rotated(this);

	inline function set_rotated(value:Bool):Bool { SpritesheetFrameData_Ffi.set_rotated(this, value); return value; }
	public var sourceHeight(get, set):Single;

	inline function get_sourceHeight():Single return SpritesheetFrameData_Ffi.get_sourceHeight(this);

	inline function set_sourceHeight(value:Single):Single { SpritesheetFrameData_Ffi.set_sourceHeight(this, value); return value; }
	public var sourceWidth(get, set):Single;

	inline function get_sourceWidth():Single return SpritesheetFrameData_Ffi.get_sourceWidth(this);

	inline function set_sourceWidth(value:Single):Single { SpritesheetFrameData_Ffi.set_sourceWidth(this, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return SpritesheetFrameData_Ffi.get_width(this);

	inline function set_width(value:Single):Single { SpritesheetFrameData_Ffi.set_width(this, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return SpritesheetFrameData_Ffi.get_x(this);

	inline function set_x(value:Single):Single { SpritesheetFrameData_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return SpritesheetFrameData_Ffi.get_y(this);

	inline function set_y(value:Single):Single { SpritesheetFrameData_Ffi.set_y(this, value); return value; }
}
