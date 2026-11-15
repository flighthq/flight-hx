package flight._js;

@:jsRequire("flight")
private extern class UnpackedRectangleExplanation_Ffi {
	@:native("flight_get_unpacked_rectangle_explanation_usable_width") static function get_usableWidth(ptr:Dynamic):Float;
	@:native("flight_set_unpacked_rectangle_explanation_usable_width") static function set_usableWidth(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_unpacked_rectangle_explanation_usable_height") static function get_usableHeight(ptr:Dynamic):Float;
	@:native("flight_set_unpacked_rectangle_explanation_usable_height") static function set_usableHeight(ptr:Dynamic, value:Float):Float;
}

abstract UnpackedRectangleExplanation(Dynamic) {
	public var usableWidth(get, set):Float;

	inline function get_usableWidth():Float return UnpackedRectangleExplanation_Ffi.get_usableWidth(this);

	inline function set_usableWidth(value:Float):Float return UnpackedRectangleExplanation_Ffi.set_usableWidth(this, value);
	public var usableHeight(get, set):Float;

	inline function get_usableHeight():Float return UnpackedRectangleExplanation_Ffi.get_usableHeight(this);

	inline function set_usableHeight(value:Float):Float return UnpackedRectangleExplanation_Ffi.set_usableHeight(this, value);
}
