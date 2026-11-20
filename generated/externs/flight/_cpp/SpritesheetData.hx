package flight._cpp;

private extern class SpritesheetData_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_spritesheet_data_image_file") static function get_imageFile(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_spritesheet_data_image_file") static function set_imageFile(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_spritesheet_data_image_height") static function get_imageHeight(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spritesheet_data_image_height") static function set_imageHeight(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_spritesheet_data_image_width") static function get_imageWidth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spritesheet_data_image_width") static function set_imageWidth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_spritesheet_data_scale") static function get_scale(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spritesheet_data_scale") static function set_scale(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract SpritesheetData(cpp.Star<cpp.Void>) {
	public var imageFile(get, set):String;
	inline function get_imageFile():String { var raw = SpritesheetData_Ffi.get_imageFile(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); SpritesheetData_Ffi.freeString(raw); return value; }
	inline function set_imageFile(value:String):String { var raw:cpp.ConstCharStar = cast value; SpritesheetData_Ffi.set_imageFile(this, raw); return value; }
	public var imageHeight(get, set):Single;

	inline function get_imageHeight():Single return SpritesheetData_Ffi.get_imageHeight(this);

	inline function set_imageHeight(value:Single):Single { SpritesheetData_Ffi.set_imageHeight(this, value); return value; }
	public var imageWidth(get, set):Single;

	inline function get_imageWidth():Single return SpritesheetData_Ffi.get_imageWidth(this);

	inline function set_imageWidth(value:Single):Single { SpritesheetData_Ffi.set_imageWidth(this, value); return value; }
	public var scale(get, set):Single;

	inline function get_scale():Single return SpritesheetData_Ffi.get_scale(this);

	inline function set_scale(value:Single):Single { SpritesheetData_Ffi.set_scale(this, value); return value; }
}
