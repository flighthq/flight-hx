package flight._js;

@:jsRequire("flight")
private extern class GridSliceOptions_Ffi {
	@:native("flight_get_grid_slice_options_columns") static function get_columns(ptr:Dynamic):Int;
	@:native("flight_set_grid_slice_options_columns") static function set_columns(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_grid_slice_options_image_height") static function get_imageHeight(ptr:Dynamic):Float;
	@:native("flight_set_grid_slice_options_image_height") static function set_imageHeight(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_grid_slice_options_image_width") static function get_imageWidth(ptr:Dynamic):Float;
	@:native("flight_set_grid_slice_options_image_width") static function set_imageWidth(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_grid_slice_options_rows") static function get_rows(ptr:Dynamic):Int;
	@:native("flight_set_grid_slice_options_rows") static function set_rows(ptr:Dynamic, value:Int):Int;
}

abstract GridSliceOptions(Dynamic) {
	public var columns(get, set):Int;

	inline function get_columns():Int return GridSliceOptions_Ffi.get_columns(this);

	inline function set_columns(value:Int):Int return GridSliceOptions_Ffi.set_columns(this, value);
	public var imageHeight(get, set):Float;

	inline function get_imageHeight():Float return GridSliceOptions_Ffi.get_imageHeight(this);

	inline function set_imageHeight(value:Float):Float return GridSliceOptions_Ffi.set_imageHeight(this, value);
	public var imageWidth(get, set):Float;

	inline function get_imageWidth():Float return GridSliceOptions_Ffi.get_imageWidth(this);

	inline function set_imageWidth(value:Float):Float return GridSliceOptions_Ffi.set_imageWidth(this, value);
	public var rows(get, set):Int;

	inline function get_rows():Int return GridSliceOptions_Ffi.get_rows(this);

	inline function set_rows(value:Int):Int return GridSliceOptions_Ffi.set_rows(this, value);
}
