package flight._js;

@:jsRequire("flight")
private extern class NativeTextData_Ffi {
	@:native("flight_get_native_text_data_height") static function get_height(ptr:Dynamic):Float;
	@:native("flight_set_native_text_data_height") static function set_height(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_native_text_data_width") static function get_width(ptr:Dynamic):Float;
	@:native("flight_set_native_text_data_width") static function set_width(ptr:Dynamic, value:Float):Float;
}

abstract NativeTextData(Dynamic) {
	public var height(get, set):Float;

	inline function get_height():Float return NativeTextData_Ffi.get_height(this);

	inline function set_height(value:Float):Float return NativeTextData_Ffi.set_height(this, value);
	public var width(get, set):Float;

	inline function get_width():Float return NativeTextData_Ffi.get_width(this);

	inline function set_width(value:Float):Float return NativeTextData_Ffi.set_width(this, value);
}
