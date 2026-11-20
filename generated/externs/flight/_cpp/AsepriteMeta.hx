package flight._cpp;

private extern class AsepriteMeta_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_aseprite_meta_app") static function get_app(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_aseprite_meta_app") static function set_app(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_aseprite_meta_format") static function get_format(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_aseprite_meta_format") static function set_format(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_aseprite_meta_image") static function get_image(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_aseprite_meta_image") static function set_image(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_aseprite_meta_version") static function get_version(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_aseprite_meta_version") static function set_version(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract AsepriteMeta(cpp.Star<cpp.Void>) {
	public var app(get, set):String;
	inline function get_app():String { var raw = AsepriteMeta_Ffi.get_app(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); AsepriteMeta_Ffi.freeString(raw); return value; }
	inline function set_app(value:String):String { var raw:cpp.ConstCharStar = cast value; AsepriteMeta_Ffi.set_app(this, raw); return value; }
	public var format(get, set):String;
	inline function get_format():String { var raw = AsepriteMeta_Ffi.get_format(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); AsepriteMeta_Ffi.freeString(raw); return value; }
	inline function set_format(value:String):String { var raw:cpp.ConstCharStar = cast value; AsepriteMeta_Ffi.set_format(this, raw); return value; }
	public var image(get, set):String;
	inline function get_image():String { var raw = AsepriteMeta_Ffi.get_image(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); AsepriteMeta_Ffi.freeString(raw); return value; }
	inline function set_image(value:String):String { var raw:cpp.ConstCharStar = cast value; AsepriteMeta_Ffi.set_image(this, raw); return value; }
	public var version(get, set):String;
	inline function get_version():String { var raw = AsepriteMeta_Ffi.get_version(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); AsepriteMeta_Ffi.freeString(raw); return value; }
	inline function set_version(value:String):String { var raw:cpp.ConstCharStar = cast value; AsepriteMeta_Ffi.set_version(this, raw); return value; }
}
