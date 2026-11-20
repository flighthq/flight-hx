package flight._cpp;

private extern class Awd2ParsedJoint_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_awd2_parsed_joint_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_awd2_parsed_joint_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_awd2_parsed_joint_parent_index") static function get_parentIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_parsed_joint_parent_index") static function set_parentIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Awd2ParsedJoint(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String { var raw = Awd2ParsedJoint_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Awd2ParsedJoint_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; Awd2ParsedJoint_Ffi.set_name(this, raw); return value; }
	public var parentIndex(get, set):Int;

	inline function get_parentIndex():Int return Awd2ParsedJoint_Ffi.get_parentIndex(this);

	inline function set_parentIndex(value:Int):Int { Awd2ParsedJoint_Ffi.set_parentIndex(this, value); return value; }
}
