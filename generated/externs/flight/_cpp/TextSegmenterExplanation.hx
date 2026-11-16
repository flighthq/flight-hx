package flight._cpp;

private extern class TextSegmenterExplanation_Ffi {
	@:native("flight_get_text_segmenter_explanation_available") static function get_available(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_text_segmenter_explanation_available") static function set_available(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_text_segmenter_explanation_intl_segmenter_available") static function get_intlSegmenterAvailable(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_text_segmenter_explanation_intl_segmenter_available") static function set_intlSegmenterAvailable(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract TextSegmenterExplanation(cpp.Star<cpp.Void>) {
	public var available(get, set):Bool;

	inline function get_available():Bool return TextSegmenterExplanation_Ffi.get_available(this);

	inline function set_available(value:Bool):Bool { TextSegmenterExplanation_Ffi.set_available(this, value); return value; }
	public var intlSegmenterAvailable(get, set):Bool;

	inline function get_intlSegmenterAvailable():Bool return TextSegmenterExplanation_Ffi.get_intlSegmenterAvailable(this);

	inline function set_intlSegmenterAvailable(value:Bool):Bool { TextSegmenterExplanation_Ffi.set_intlSegmenterAvailable(this, value); return value; }
}
