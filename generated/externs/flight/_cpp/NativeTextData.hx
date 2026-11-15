package flight._cpp;

private extern class NativeTextData_Ffi {
	@:native("flight_get_native_text_data_height") static function get_height(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_native_text_data_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_native_text_data_width") static function get_width(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_native_text_data_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract NativeTextData(cpp.Star<cpp.Void>) {
	public var height(get, set):Single;

	inline function get_height():Single return NativeTextData_Ffi.get_height(this);

	inline function set_height(value:Single):Single return NativeTextData_Ffi.set_height(this, value);
	public var width(get, set):Single;

	inline function get_width():Single return NativeTextData_Ffi.get_width(this);

	inline function set_width(value:Single):Single return NativeTextData_Ffi.set_width(this, value);
}
