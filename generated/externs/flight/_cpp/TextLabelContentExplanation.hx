package flight._cpp;

private extern class TextLabelContentExplanation_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_text_label_content_explanation_agreement") static function get_agreement(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_text_label_content_explanation_agreement") static function set_agreement(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_field_get_text_label_content_explanation_live_string") static function get_liveString(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_text_label_content_explanation_live_string") static function set_liveString(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_text_label_content_explanation_revision") static function get_revision(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_label_content_explanation_revision") static function set_revision(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract TextLabelContentExplanation(cpp.Star<cpp.Void>) {
	public var agreement(get, set):Bool;

	inline function get_agreement():Bool return TextLabelContentExplanation_Ffi.get_agreement(this);

	inline function set_agreement(value:Bool):Bool { TextLabelContentExplanation_Ffi.set_agreement(this, value); return value; }
	public var liveString(get, set):String;
	inline function get_liveString():String { var raw = TextLabelContentExplanation_Ffi.get_liveString(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TextLabelContentExplanation_Ffi.freeString(raw); return value; }
	inline function set_liveString(value:String):String { var raw:cpp.ConstCharStar = cast value; TextLabelContentExplanation_Ffi.set_liveString(this, raw); return value; }
	public var revision(get, set):Int;

	inline function get_revision():Int return TextLabelContentExplanation_Ffi.get_revision(this);

	inline function set_revision(value:Int):Int { TextLabelContentExplanation_Ffi.set_revision(this, value); return value; }
}
