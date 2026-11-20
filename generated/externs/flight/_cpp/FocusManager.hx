package flight._cpp;

private extern class FocusManager_Ffi {
	@:native("flight_get_focus_manager_wrap") static function get_wrap(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_focus_manager_wrap") static function set_wrap(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract FocusManager(cpp.Star<cpp.Void>) {
	public var wrap(get, set):Bool;

	inline function get_wrap():Bool return FocusManager_Ffi.get_wrap(this);

	inline function set_wrap(value:Bool):Bool { FocusManager_Ffi.set_wrap(this, value); return value; }
}
