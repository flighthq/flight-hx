package flight._cpp;

private extern class CommandFields_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_command_fields_label") static function get_label(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_command_fields_label") static function set_label(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract CommandFields(cpp.Star<cpp.Void>) {
	public var label(get, set):String;
	inline function get_label():String { var raw = CommandFields_Ffi.get_label(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); CommandFields_Ffi.freeString(raw); return value; }
	inline function set_label(value:String):String { var raw:cpp.ConstCharStar = cast value; CommandFields_Ffi.set_label(this, raw); return value; }
}
