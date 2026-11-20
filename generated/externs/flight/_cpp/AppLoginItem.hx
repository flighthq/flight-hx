package flight._cpp;

private extern class AppLoginItem_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_app_login_item_open_at_login") static function get_openAtLogin(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_app_login_item_open_at_login") static function set_openAtLogin(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_app_login_item_open_as_hidden") static function get_openAsHidden(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_app_login_item_open_as_hidden") static function set_openAsHidden(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_field_get_app_login_item_path") static function get_path(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_app_login_item_path") static function set_path(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract AppLoginItem(cpp.Star<cpp.Void>) {
	public var openAtLogin(get, set):Bool;

	inline function get_openAtLogin():Bool return AppLoginItem_Ffi.get_openAtLogin(this);

	inline function set_openAtLogin(value:Bool):Bool { AppLoginItem_Ffi.set_openAtLogin(this, value); return value; }
	public var openAsHidden(get, set):Bool;

	inline function get_openAsHidden():Bool return AppLoginItem_Ffi.get_openAsHidden(this);

	inline function set_openAsHidden(value:Bool):Bool { AppLoginItem_Ffi.set_openAsHidden(this, value); return value; }
	public var path(get, set):String;
	inline function get_path():String { var raw = AppLoginItem_Ffi.get_path(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); AppLoginItem_Ffi.freeString(raw); return value; }
	inline function set_path(value:String):String { var raw:cpp.ConstCharStar = cast value; AppLoginItem_Ffi.set_path(this, raw); return value; }
}
