package flight._cpp;

private extern class TextFeature_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_text_feature_tag") static function get_tag(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_text_feature_tag") static function set_tag(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_text_feature_value") static function get_value(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_feature_value") static function set_value(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract TextFeature(cpp.Star<cpp.Void>) {
	public var tag(get, set):String;
	inline function get_tag():String { var raw = TextFeature_Ffi.get_tag(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TextFeature_Ffi.freeString(raw); return value; }
	inline function set_tag(value:String):String { var raw:cpp.ConstCharStar = cast value; TextFeature_Ffi.set_tag(this, raw); return value; }
	public var value(get, set):Int;

	inline function get_value():Int return TextFeature_Ffi.get_value(this);

	inline function set_value(value:Int):Int { TextFeature_Ffi.set_value(this, value); return value; }
}
