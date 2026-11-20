package flight._cpp;

private extern class ShareTitleContent_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_share_title_content_title") static function get_title(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_share_title_content_title") static function set_title(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ShareTitleContent(cpp.Star<cpp.Void>) {
	public var title(get, set):String;
	inline function get_title():String { var raw = ShareTitleContent_Ffi.get_title(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ShareTitleContent_Ffi.freeString(raw); return value; }
	inline function set_title(value:String):String { var raw:cpp.ConstCharStar = cast value; ShareTitleContent_Ffi.set_title(this, raw); return value; }
}
