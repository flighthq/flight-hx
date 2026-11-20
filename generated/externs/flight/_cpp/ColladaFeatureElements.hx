package flight._cpp;

private extern class ColladaFeatureElements_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_collada_feature_elements_feature") static function get_feature(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_collada_feature_elements_feature") static function set_feature(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ColladaFeatureElements(cpp.Star<cpp.Void>) {
	public var feature(get, set):String;
	inline function get_feature():String { var raw = ColladaFeatureElements_Ffi.get_feature(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ColladaFeatureElements_Ffi.freeString(raw); return value; }
	inline function set_feature(value:String):String { var raw:cpp.ConstCharStar = cast value; ColladaFeatureElements_Ffi.set_feature(this, raw); return value; }
}
