package flight._js;

@:jsRequire("flight")
private extern class PackableRectangle_Ffi {
	@:native("flight_get_packable_rectangle_width") static function get_width(ptr:Dynamic):Float;
	@:native("flight_set_packable_rectangle_width") static function set_width(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_packable_rectangle_height") static function get_height(ptr:Dynamic):Float;
	@:native("flight_set_packable_rectangle_height") static function set_height(ptr:Dynamic, value:Float):Float;
}

abstract PackableRectangle(Dynamic) {
	public var width(get, set):Float;

	inline function get_width():Float return PackableRectangle_Ffi.get_width(this);

	inline function set_width(value:Float):Float return PackableRectangle_Ffi.set_width(this, value);
	public var height(get, set):Float;

	inline function get_height():Float return PackableRectangle_Ffi.get_height(this);

	inline function set_height(value:Float):Float return PackableRectangle_Ffi.set_height(this, value);
}
