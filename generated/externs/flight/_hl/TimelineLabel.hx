package flight._hl;

private extern class TimelineLabel_Ffi {
	@:hlNative("flight", "flight_field_get_timeline_label_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_timeline_label_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract TimelineLabel(hl.Bytes) {
	public var frame(get, set):Int;

	inline function get_frame():Int return this.getI32(0);

	inline function set_frame(value:Int):Int { this.setI32(0, value); return value; }
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = TimelineLabel_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		TimelineLabel_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
