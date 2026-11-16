package flight._cpp;

private extern class TextLabelContentExplanation_Ffi {
	@:native("flight_get_text_label_content_explanation_agreement") static function get_agreement(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_text_label_content_explanation_agreement") static function set_agreement(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_text_label_content_explanation_revision") static function get_revision(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_label_content_explanation_revision") static function set_revision(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract TextLabelContentExplanation(cpp.Star<cpp.Void>) {
	public var agreement(get, set):Bool;

	inline function get_agreement():Bool return TextLabelContentExplanation_Ffi.get_agreement(this);

	inline function set_agreement(value:Bool):Bool { TextLabelContentExplanation_Ffi.set_agreement(this, value); return value; }
	public var revision(get, set):Int;

	inline function get_revision():Int return TextLabelContentExplanation_Ffi.get_revision(this);

	inline function set_revision(value:Int):Int { TextLabelContentExplanation_Ffi.set_revision(this, value); return value; }
}
