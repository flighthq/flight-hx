package flight._hl;

private extern class TextLabelContentExplanation_Ffi {
	@:hlNative("flight", "flight_field_get_text_label_content_explanation_live_string")
	static function get_liveString(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_text_label_content_explanation_live_string")
	static function set_liveString(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract TextLabelContentExplanation(hl.Bytes) {
	public var agreement(get, set):Bool;

	inline function get_agreement():Bool return this.getUI8(0) != 0;

	inline function set_agreement(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var liveString(get, set):String;
	inline function get_liveString():String {
		final bytes = TextLabelContentExplanation_Ffi.get_liveString(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_liveString(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		TextLabelContentExplanation_Ffi.set_liveString(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var revision(get, set):Int;

	inline function get_revision():Int return this.getI32(56);

	inline function set_revision(value:Int):Int { this.setI32(56, value); return value; }
}
