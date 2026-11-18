package flight._hl;

private extern class CommandFields_Ffi {
	@:hlNative("flight", "flight_field_get_command_fields_label")
	static function get_label(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_command_fields_label")
	static function set_label(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract CommandFields(hl.Bytes) {
	public var label(get, set):String;
	inline function get_label():String {
		final bytes = CommandFields_Ffi.get_label(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_label(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		CommandFields_Ffi.set_label(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
