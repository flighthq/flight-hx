package flight._cpp;

private extern class Notification_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_notification_id") static function get_id(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_notification_id") static function set_id(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_notification_tag") static function get_tag(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_notification_tag") static function set_tag(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_notification_title") static function get_title(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_notification_title") static function set_title(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract Notification(cpp.Star<cpp.Void>) {
	public var id(get, set):String;
	inline function get_id():String { var raw = Notification_Ffi.get_id(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Notification_Ffi.freeString(raw); return value; }
	inline function set_id(value:String):String { var raw:cpp.ConstCharStar = cast value; Notification_Ffi.set_id(this, raw); return value; }
	public var tag(get, set):String;
	inline function get_tag():String { var raw = Notification_Ffi.get_tag(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Notification_Ffi.freeString(raw); return value; }
	inline function set_tag(value:String):String { var raw:cpp.ConstCharStar = cast value; Notification_Ffi.set_tag(this, raw); return value; }
	public var title(get, set):String;
	inline function get_title():String { var raw = Notification_Ffi.get_title(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Notification_Ffi.freeString(raw); return value; }
	inline function set_title(value:String):String { var raw:cpp.ConstCharStar = cast value; Notification_Ffi.set_title(this, raw); return value; }
}
