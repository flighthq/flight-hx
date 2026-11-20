package flight._cpp;

private extern class BitmapEncodeFailureExplanation_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_bitmap_encode_failure_explanation_reason") static function get_reason(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_bitmap_encode_failure_explanation_reason") static function set_reason(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract BitmapEncodeFailureExplanation(cpp.Star<cpp.Void>) {
	public var reason(get, set):String;
	inline function get_reason():String { var raw = BitmapEncodeFailureExplanation_Ffi.get_reason(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); BitmapEncodeFailureExplanation_Ffi.freeString(raw); return value; }
	inline function set_reason(value:String):String { var raw:cpp.ConstCharStar = cast value; BitmapEncodeFailureExplanation_Ffi.set_reason(this, raw); return value; }
}
