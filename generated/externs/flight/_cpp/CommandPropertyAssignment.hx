package flight._cpp;

private extern class CommandPropertyAssignment_Ffi {
	@:native("flight_field_get_command_property_assignment_property")
	static function get_property(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_command_property_assignment_property")
	static function set_property(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract CommandPropertyAssignment(cpp.Star<cpp.Void>) {
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
		CommandPropertyAssignment_Ffi.set_property(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
