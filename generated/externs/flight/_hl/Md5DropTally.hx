package flight._hl;

private extern class Md5DropTally_Ffi {
	@:hlNative("flight", "flight_field_get_md5_drop_tally_kind")
	static function get_kind(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_md5_drop_tally_kind")
	static function set_kind(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract Md5DropTally(hl.Bytes) {
	public var count(get, set):Int;

	inline function get_count():Int return this.getI32(72);

	inline function set_count(value:Int):Int { this.setI32(72, value); return value; }
	public var kind(get, set):String;
	inline function get_kind():String {
		final bytes = Md5DropTally_Ffi.get_kind(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_kind(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Md5DropTally_Ffi.set_kind(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
