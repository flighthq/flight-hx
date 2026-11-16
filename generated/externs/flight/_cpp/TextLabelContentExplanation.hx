package flight._cpp;

private extern class TextLabelContentExplanation_Ffi {
	@:native("flight_get_text_label_content_explanation_agreement") static function get_agreement(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_text_label_content_explanation_agreement") static function set_agreement(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_field_get_text_label_content_explanation_live_string")
	static function get_liveString(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_text_label_content_explanation_live_string")
	static function set_liveString(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_text_label_content_explanation_revision") static function get_revision(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_label_content_explanation_revision") static function set_revision(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract TextLabelContentExplanation(cpp.Star<cpp.Void>) {
	public var agreement(get, set):Bool;

	inline function get_agreement():Bool return TextLabelContentExplanation_Ffi.get_agreement(this);

	inline function set_agreement(value:Bool):Bool { TextLabelContentExplanation_Ffi.set_agreement(this, value); return value; }
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
		TextLabelContentExplanation_Ffi.set_liveString(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var revision(get, set):Int;

	inline function get_revision():Int return TextLabelContentExplanation_Ffi.get_revision(this);

	inline function set_revision(value:Int):Int { TextLabelContentExplanation_Ffi.set_revision(this, value); return value; }
}
