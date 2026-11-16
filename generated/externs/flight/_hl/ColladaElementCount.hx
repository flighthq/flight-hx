package flight._hl;

private extern class ColladaElementCount_Ffi {
	@:hlNative("flight", "flight_field_get_collada_element_count_feature")
	static function get_feature(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_collada_element_count_feature")
	static function set_feature(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract ColladaElementCount(hl.Bytes) {
	public var feature(get, set):String;
	inline function get_feature():String {
		final bytes = ColladaElementCount_Ffi.get_feature(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_feature(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ColladaElementCount_Ffi.set_feature(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var count(get, set):Int;

	inline function get_count():Int return this.getI32(24);

	inline function set_count(value:Int):Int { this.setI32(24, value); return value; }
}
