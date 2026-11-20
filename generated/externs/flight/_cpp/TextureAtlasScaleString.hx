package flight._cpp;

private extern class TextureAtlasScaleString_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_texture_atlas_scale_string_value") static function get_value(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_texture_atlas_scale_string_value") static function set_value(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract TextureAtlasScaleString(cpp.Star<cpp.Void>) {
	public var value(get, set):String;
	inline function get_value():String { var raw = TextureAtlasScaleString_Ffi.get_value(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TextureAtlasScaleString_Ffi.freeString(raw); return value; }
	inline function set_value(value:String):String { var raw:cpp.ConstCharStar = cast value; TextureAtlasScaleString_Ffi.set_value(this, raw); return value; }
}
