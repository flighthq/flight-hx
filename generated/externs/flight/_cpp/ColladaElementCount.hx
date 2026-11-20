package flight._cpp;

private extern class ColladaElementCount_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_collada_element_count_feature") static function get_feature(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_collada_element_count_feature") static function set_feature(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_collada_element_count_count") static function get_count(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_collada_element_count_count") static function set_count(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract ColladaElementCount(cpp.Star<cpp.Void>) {
	public var feature(get, set):String;
	inline function get_feature():String { var raw = ColladaElementCount_Ffi.get_feature(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ColladaElementCount_Ffi.freeString(raw); return value; }
	inline function set_feature(value:String):String { var raw:cpp.ConstCharStar = cast value; ColladaElementCount_Ffi.set_feature(this, raw); return value; }
	public var count(get, set):Int;

	inline function get_count():Int return ColladaElementCount_Ffi.get_count(this);

	inline function set_count(value:Int):Int { ColladaElementCount_Ffi.set_count(this, value); return value; }
}
