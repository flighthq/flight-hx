package flight._hl;

private extern class TextFieldLinkEvent_Ffi {
	@:hlNative("flight", "flight_field_get_text_field_link_event_url")
	static function get_url(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_text_field_link_event_url")
	static function set_url(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract TextFieldLinkEvent(hl.Bytes) {
	public var url(get, set):String;
	inline function get_url():String {
		final bytes = TextFieldLinkEvent_Ffi.get_url(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_url(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		TextFieldLinkEvent_Ffi.set_url(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(24);

	inline function set_x(value:Single):Single { this.setF32(24, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(28);

	inline function set_y(value:Single):Single { this.setF32(28, value); return value; }
}
