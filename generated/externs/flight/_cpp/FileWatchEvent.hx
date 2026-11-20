package flight._cpp;

private extern class FileWatchEvent_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_file_watch_event_path") static function get_path(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_file_watch_event_path") static function set_path(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract FileWatchEvent(cpp.Star<cpp.Void>) {
	public var path(get, set):String;
	inline function get_path():String { var raw = FileWatchEvent_Ffi.get_path(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); FileWatchEvent_Ffi.freeString(raw); return value; }
	inline function set_path(value:String):String { var raw:cpp.ConstCharStar = cast value; FileWatchEvent_Ffi.set_path(this, raw); return value; }
}
