package flight._cpp;

private extern class Awd2StringRead_Ffi {
	@:native("flight_get_awd2_string_read_end") static function get_end(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_string_read_end") static function set_end(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_awd2_string_read_value")
	static function get_value(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_awd2_string_read_value")
	static function set_value(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract Awd2StringRead(cpp.Star<cpp.Void>) {
	public var end(get, set):Int;

	inline function get_end():Int return Awd2StringRead_Ffi.get_end(this);

	inline function set_end(value:Int):Int { Awd2StringRead_Ffi.set_end(this, value); return value; }
	public var value(get, set):String;
	inline function get_value():String {
		final bytes = Awd2StringRead_Ffi.get_value(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_value(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Awd2StringRead_Ffi.set_value(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
