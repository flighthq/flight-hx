package flight._cpp;

private extern class BitmapFingerprint_Ffi {
	@:native("flight_get_bitmap_fingerprint_grid_size") static function get_gridSize(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_fingerprint_grid_size") static function set_gridSize(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract BitmapFingerprint(cpp.Star<cpp.Void>) {
	public var gridSize(get, set):Int;

	inline function get_gridSize():Int return BitmapFingerprint_Ffi.get_gridSize(this);

	inline function set_gridSize(value:Int):Int return BitmapFingerprint_Ffi.set_gridSize(this, value);
}
