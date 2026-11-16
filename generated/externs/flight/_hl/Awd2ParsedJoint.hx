package flight._hl;

private extern class Awd2ParsedJoint_Ffi {
	@:hlNative("flight", "flight_field_get_awd2_parsed_joint_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_awd2_parsed_joint_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract Awd2ParsedJoint(hl.Bytes) {
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
		Awd2ParsedJoint_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var parentIndex(get, set):Int;

	inline function get_parentIndex():Int return this.getUI16(40);

	inline function set_parentIndex(value:Int):Int { this.setUI16(40, value); return value; }
}
