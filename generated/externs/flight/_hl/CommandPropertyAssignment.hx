package flight._hl;

private extern class CommandPropertyAssignment_Ffi {
	@:hlNative("flight", "flight_field_get_command_property_assignment_property")
	static function get_property(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_command_property_assignment_property")
	static function set_property(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract CommandPropertyAssignment(hl.Bytes) {
	public var property(get, set):String;
	inline function get_property():String {
		final bytes = CommandPropertyAssignment_Ffi.get_property(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_property(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		CommandPropertyAssignment_Ffi.set_property(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
