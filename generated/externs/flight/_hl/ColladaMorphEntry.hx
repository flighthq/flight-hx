package flight._hl;

private extern class ColladaMorphEntry_Ffi {
	@:hlNative("flight", "flight_field_get_collada_morph_entry_key")
	static function get_key(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_collada_morph_entry_key")
	static function set_key(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract ColladaMorphEntry(hl.Bytes) {
	public var key(get, set):String;
	inline function get_key():String {
		final bytes = ColladaMorphEntry_Ffi.get_key(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_key(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ColladaMorphEntry_Ffi.set_key(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
