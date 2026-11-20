package flight._cpp;

private extern class ShellShortcutLink_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_shell_shortcut_link_target") static function get_target(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_shell_shortcut_link_target") static function set_target(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ShellShortcutLink(cpp.Star<cpp.Void>) {
	public var target(get, set):String;
	inline function get_target():String { var raw = ShellShortcutLink_Ffi.get_target(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ShellShortcutLink_Ffi.freeString(raw); return value; }
	inline function set_target(value:String):String { var raw:cpp.ConstCharStar = cast value; ShellShortcutLink_Ffi.set_target(this, raw); return value; }
}
