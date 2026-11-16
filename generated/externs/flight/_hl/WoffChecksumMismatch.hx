package flight._hl;

private extern class WoffChecksumMismatch_Ffi {
	@:hlNative("flight", "flight_field_get_woff_checksum_mismatch_tag")
	static function get_tag(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_woff_checksum_mismatch_tag")
	static function set_tag(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract WoffChecksumMismatch(hl.Bytes) {
	public var stored(get, set):Int;

	inline function get_stored():Int return this.getI32(24);

	inline function set_stored(value:Int):Int { this.setI32(24, value); return value; }
	public var computed(get, set):Int;

	inline function get_computed():Int return this.getI32(28);

	inline function set_computed(value:Int):Int { this.setI32(28, value); return value; }
	public var tag(get, set):String;
	inline function get_tag():String {
		final bytes = WoffChecksumMismatch_Ffi.get_tag(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_tag(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		WoffChecksumMismatch_Ffi.set_tag(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
