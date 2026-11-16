package flight._cpp;

private extern class GridSliceOptions_Ffi {
	@:native("flight_get_grid_slice_options_columns") static function get_columns(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_grid_slice_options_columns") static function set_columns(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_grid_slice_options_image_height") static function get_imageHeight(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_grid_slice_options_image_height") static function set_imageHeight(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_grid_slice_options_image_width") static function get_imageWidth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_grid_slice_options_image_width") static function set_imageWidth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_grid_slice_options_rows") static function get_rows(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_grid_slice_options_rows") static function set_rows(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract GridSliceOptions(cpp.Star<cpp.Void>) {
	public var columns(get, set):Int;

	inline function get_columns():Int return GridSliceOptions_Ffi.get_columns(this);

	inline function set_columns(value:Int):Int { GridSliceOptions_Ffi.set_columns(this, value); return value; }
	public var imageHeight(get, set):Single;

	inline function get_imageHeight():Single return GridSliceOptions_Ffi.get_imageHeight(this);

	inline function set_imageHeight(value:Single):Single { GridSliceOptions_Ffi.set_imageHeight(this, value); return value; }
	public var imageWidth(get, set):Single;

	inline function get_imageWidth():Single return GridSliceOptions_Ffi.get_imageWidth(this);

	inline function set_imageWidth(value:Single):Single { GridSliceOptions_Ffi.set_imageWidth(this, value); return value; }
	public var rows(get, set):Int;

	inline function get_rows():Int return GridSliceOptions_Ffi.get_rows(this);

	inline function set_rows(value:Int):Int { GridSliceOptions_Ffi.set_rows(this, value); return value; }
}
