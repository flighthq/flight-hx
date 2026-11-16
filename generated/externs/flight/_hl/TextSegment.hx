package flight._hl;

private extern class TextSegment_Ffi {
	@:hlNative("flight", "flight_field_get_text_segment_text")
	static function get_text(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_text_segment_text")
	static function set_text(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract TextSegment(hl.Bytes) {
	public var start(get, set):Int;

	inline function get_start():Int return this.getI32(0);

	inline function set_start(value:Int):Int { this.setI32(0, value); return value; }
	public var end(get, set):Int;

	inline function get_end():Int return this.getI32(8);

	inline function set_end(value:Int):Int { this.setI32(8, value); return value; }
	public var text(get, set):String;
	inline function get_text():String {
		final bytes = TextSegment_Ffi.get_text(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_text(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		TextSegment_Ffi.set_text(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
