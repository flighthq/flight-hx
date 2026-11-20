package flight._cpp;

private extern class TrayBalloonOptions_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_tray_balloon_options_text") static function get_text(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_tray_balloon_options_text") static function set_text(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_tray_balloon_options_title") static function get_title(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_tray_balloon_options_title") static function set_title(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract TrayBalloonOptions(cpp.Star<cpp.Void>) {
	public var text(get, set):String;
	inline function get_text():String { var raw = TrayBalloonOptions_Ffi.get_text(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TrayBalloonOptions_Ffi.freeString(raw); return value; }
	inline function set_text(value:String):String { var raw:cpp.ConstCharStar = cast value; TrayBalloonOptions_Ffi.set_text(this, raw); return value; }
	public var title(get, set):String;
	inline function get_title():String { var raw = TrayBalloonOptions_Ffi.get_title(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TrayBalloonOptions_Ffi.freeString(raw); return value; }
	inline function set_title(value:String):String { var raw:cpp.ConstCharStar = cast value; TrayBalloonOptions_Ffi.set_title(this, raw); return value; }
}
