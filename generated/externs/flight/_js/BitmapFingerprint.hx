package flight._js;

@:jsRequire("flight")
private extern class BitmapFingerprint_Ffi {
	@:native("flight_get_bitmap_fingerprint_grid_size") static function get_gridSize(ptr:Dynamic):Int;
	@:native("flight_set_bitmap_fingerprint_grid_size") static function set_gridSize(ptr:Dynamic, value:Int):Int;
}

abstract BitmapFingerprint(Dynamic) {
	public var gridSize(get, set):Int;

	inline function get_gridSize():Int return BitmapFingerprint_Ffi.get_gridSize(this);

	inline function set_gridSize(value:Int):Int return BitmapFingerprint_Ffi.set_gridSize(this, value);
}
