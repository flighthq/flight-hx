package flight._js;

@:jsRequire("flight")
private extern class SpritesheetData_Ffi {
	@:native("flight_get_spritesheet_data_image_height") static function get_imageHeight(ptr:Dynamic):Float;
	@:native("flight_set_spritesheet_data_image_height") static function set_imageHeight(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_spritesheet_data_image_width") static function get_imageWidth(ptr:Dynamic):Float;
	@:native("flight_set_spritesheet_data_image_width") static function set_imageWidth(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_spritesheet_data_scale") static function get_scale(ptr:Dynamic):Float;
	@:native("flight_set_spritesheet_data_scale") static function set_scale(ptr:Dynamic, value:Float):Float;
}

abstract SpritesheetData(Dynamic) {
	public var imageHeight(get, set):Float;

	inline function get_imageHeight():Float return SpritesheetData_Ffi.get_imageHeight(this);

	inline function set_imageHeight(value:Float):Float return SpritesheetData_Ffi.set_imageHeight(this, value);
	public var imageWidth(get, set):Float;

	inline function get_imageWidth():Float return SpritesheetData_Ffi.get_imageWidth(this);

	inline function set_imageWidth(value:Float):Float return SpritesheetData_Ffi.set_imageWidth(this, value);
	public var scale(get, set):Float;

	inline function get_scale():Float return SpritesheetData_Ffi.get_scale(this);

	inline function set_scale(value:Float):Float return SpritesheetData_Ffi.set_scale(this, value);
}
