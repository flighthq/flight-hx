package flight._cpp;

private extern class ClipboardBookmark_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_clipboard_bookmark_title") static function get_title(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_clipboard_bookmark_title") static function set_title(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_clipboard_bookmark_url") static function get_url(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_clipboard_bookmark_url") static function set_url(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ClipboardBookmark(cpp.Star<cpp.Void>) {
	public var title(get, set):String;
	inline function get_title():String { var raw = ClipboardBookmark_Ffi.get_title(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ClipboardBookmark_Ffi.freeString(raw); return value; }
	inline function set_title(value:String):String { var raw:cpp.ConstCharStar = cast value; ClipboardBookmark_Ffi.set_title(this, raw); return value; }
	public var url(get, set):String;
	inline function get_url():String { var raw = ClipboardBookmark_Ffi.get_url(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ClipboardBookmark_Ffi.freeString(raw); return value; }
	inline function set_url(value:String):String { var raw:cpp.ConstCharStar = cast value; ClipboardBookmark_Ffi.set_url(this, raw); return value; }
}
