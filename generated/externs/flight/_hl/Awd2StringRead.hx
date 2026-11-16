package flight._hl;

private extern class Awd2StringRead_Ffi {
	@:hlNative("flight", "flight_field_get_awd2_string_read_value")
	static function get_value(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_awd2_string_read_value")
	static function set_value(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract Awd2StringRead(hl.Bytes) {
	public var end(get, set):Int;

	inline function get_end():Int return this.getI32(24);

	inline function set_end(value:Int):Int { this.setI32(24, value); return value; }
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
		Awd2StringRead_Ffi.set_value(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
