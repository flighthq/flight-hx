package flight._cpp;

private extern class ShareTextContent_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_share_text_content_text") static function get_text(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_share_text_content_text") static function set_text(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ShareTextContent(cpp.Star<cpp.Void>) {
	public var text(get, set):String;
	inline function get_text():String { var raw = ShareTextContent_Ffi.get_text(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ShareTextContent_Ffi.freeString(raw); return value; }
	inline function set_text(value:String):String { var raw:cpp.ConstCharStar = cast value; ShareTextContent_Ffi.set_text(this, raw); return value; }
}
