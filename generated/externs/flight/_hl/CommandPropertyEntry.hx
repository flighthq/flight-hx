package flight._hl;

private extern class CommandPropertyEntry_Ffi {
	@:hlNative("flight", "flight_field_get_command_property_entry_property")
	static function get_property(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_command_property_entry_property")
	static function set_property(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract CommandPropertyEntry(hl.Bytes) {
	public var property(get, set):String;
	inline function get_property():String {
		final bytes = CommandPropertyEntry_Ffi.get_property(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_property(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		CommandPropertyEntry_Ffi.set_property(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
