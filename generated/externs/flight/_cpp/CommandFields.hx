package flight._cpp;

private extern class CommandFields_Ffi {
	@:native("flight_field_get_command_fields_label")
	static function get_label(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_command_fields_label")
	static function set_label(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract CommandFields(cpp.Star<cpp.Void>) {
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
		CommandFields_Ffi.set_label(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
