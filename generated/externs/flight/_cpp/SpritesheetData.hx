package flight._cpp;

private extern class SpritesheetData_Ffi {
	@:native("flight_get_spritesheet_data_image_height") static function get_imageHeight(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spritesheet_data_image_height") static function set_imageHeight(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_spritesheet_data_image_width") static function get_imageWidth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spritesheet_data_image_width") static function set_imageWidth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_spritesheet_data_scale") static function get_scale(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spritesheet_data_scale") static function set_scale(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract SpritesheetData(cpp.Star<cpp.Void>) {
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
