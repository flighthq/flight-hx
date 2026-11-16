package flight._cpp;

private extern class NativeTextData_Ffi {
	@:native("flight_get_native_text_data_height") static function get_height(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_native_text_data_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_native_text_data_text")
	static function get_text(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_native_text_data_text")
	static function set_text(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_native_text_data_width") static function get_width(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_native_text_data_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract NativeTextData(cpp.Star<cpp.Void>) {
	public var height(get, set):Single;

	inline function get_height():Single return NativeTextData_Ffi.get_height(this);

	inline function set_height(value:Single):Single { NativeTextData_Ffi.set_height(this, value); return value; }
	public var text(get, set):String;
	inline function get_text():String {
		final bytes = NativeTextData_Ffi.get_text(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_text(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		NativeTextData_Ffi.set_text(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var width(get, set):Single;

	inline function get_width():Single return NativeTextData_Ffi.get_width(this);

	inline function set_width(value:Single):Single { NativeTextData_Ffi.set_width(this, value); return value; }
}
