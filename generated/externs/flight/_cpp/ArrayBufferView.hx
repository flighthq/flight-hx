package flight._cpp;

private extern class ArrayBufferView_Ffi {
	@:native("flight_get_array_buffer_view_byte_offset") static function get_byteOffset(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_array_buffer_view_byte_offset") static function set_byteOffset(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_array_buffer_view_byte_length") static function get_byteLength(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_array_buffer_view_byte_length") static function set_byteLength(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract ArrayBufferView(cpp.Star<cpp.Void>) {
	public var byteOffset(get, set):Int;

	inline function get_byteOffset():Int return ArrayBufferView_Ffi.get_byteOffset(this);

	inline function set_byteOffset(value:Int):Int { ArrayBufferView_Ffi.set_byteOffset(this, value); return value; }
	public var byteLength(get, set):Int;

	inline function get_byteLength():Int return ArrayBufferView_Ffi.get_byteLength(this);

	inline function set_byteLength(value:Int):Int { ArrayBufferView_Ffi.set_byteLength(this, value); return value; }
}
