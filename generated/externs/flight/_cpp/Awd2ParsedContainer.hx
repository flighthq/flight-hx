package flight._cpp;

private extern class Awd2ParsedContainer_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_awd2_parsed_container_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_awd2_parsed_container_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_awd2_parsed_container_parent_id") static function get_parentId(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_parsed_container_parent_id") static function set_parentId(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Awd2ParsedContainer(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String { var raw = Awd2ParsedContainer_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Awd2ParsedContainer_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; Awd2ParsedContainer_Ffi.set_name(this, raw); return value; }
	public var parentId(get, set):Int;

	inline function get_parentId():Int return Awd2ParsedContainer_Ffi.get_parentId(this);

	inline function set_parentId(value:Int):Int { Awd2ParsedContainer_Ffi.set_parentId(this, value); return value; }
}
