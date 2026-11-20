package flight._cpp;

private extern class TrayTitleReading_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_tray_title_reading_title") static function get_title(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_tray_title_reading_title") static function set_title(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract TrayTitleReading(cpp.Star<cpp.Void>) {
	public var title(get, set):String;
	inline function get_title():String { var raw = TrayTitleReading_Ffi.get_title(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TrayTitleReading_Ffi.freeString(raw); return value; }
	inline function set_title(value:String):String { var raw:cpp.ConstCharStar = cast value; TrayTitleReading_Ffi.set_title(this, raw); return value; }
}
