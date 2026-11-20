package flight._cpp;

private extern class NotificationLifecycleFailure_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_notification_lifecycle_failure_id") static function get_id(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_notification_lifecycle_failure_id") static function set_id(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract NotificationLifecycleFailure(cpp.Star<cpp.Void>) {
	public var id(get, set):String;
	inline function get_id():String { var raw = NotificationLifecycleFailure_Ffi.get_id(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); NotificationLifecycleFailure_Ffi.freeString(raw); return value; }
	inline function set_id(value:String):String { var raw:cpp.ConstCharStar = cast value; NotificationLifecycleFailure_Ffi.set_id(this, raw); return value; }
}
