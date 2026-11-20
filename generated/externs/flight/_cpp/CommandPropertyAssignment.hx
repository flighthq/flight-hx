package flight._cpp;

private extern class CommandPropertyAssignment_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_command_property_assignment_property") static function get_property(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_command_property_assignment_property") static function set_property(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract CommandPropertyAssignment(cpp.Star<cpp.Void>) {
	public var property(get, set):String;
	inline function get_property():String { var raw = CommandPropertyAssignment_Ffi.get_property(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); CommandPropertyAssignment_Ffi.freeString(raw); return value; }
	inline function set_property(value:String):String { var raw:cpp.ConstCharStar = cast value; CommandPropertyAssignment_Ffi.set_property(this, raw); return value; }
}
