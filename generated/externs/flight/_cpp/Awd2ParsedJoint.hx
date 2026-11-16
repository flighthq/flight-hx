package flight._cpp;

private extern class Awd2ParsedJoint_Ffi {
	@:native("flight_field_get_awd2_parsed_joint_name")
	static function get_name(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_awd2_parsed_joint_name")
	static function set_name(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_awd2_parsed_joint_parent_index") static function get_parentIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_parsed_joint_parent_index") static function set_parentIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Awd2ParsedJoint(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = Awd2ParsedJoint_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Awd2ParsedJoint_Ffi.set_name(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var parentIndex(get, set):Int;

	inline function get_parentIndex():Int return Awd2ParsedJoint_Ffi.get_parentIndex(this);

	inline function set_parentIndex(value:Int):Int { Awd2ParsedJoint_Ffi.set_parentIndex(this, value); return value; }
}
