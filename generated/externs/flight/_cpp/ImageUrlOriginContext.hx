package flight._cpp;

private extern class ImageUrlOriginContext_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_image_url_origin_context_href") static function get_href(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_image_url_origin_context_href") static function set_href(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_image_url_origin_context_origin") static function get_origin(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_image_url_origin_context_origin") static function set_origin(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ImageUrlOriginContext(cpp.Star<cpp.Void>) {
	public var href(get, set):String;
	inline function get_href():String { var raw = ImageUrlOriginContext_Ffi.get_href(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ImageUrlOriginContext_Ffi.freeString(raw); return value; }
	inline function set_href(value:String):String { var raw:cpp.ConstCharStar = cast value; ImageUrlOriginContext_Ffi.set_href(this, raw); return value; }
	public var origin(get, set):String;
	inline function get_origin():String { var raw = ImageUrlOriginContext_Ffi.get_origin(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ImageUrlOriginContext_Ffi.freeString(raw); return value; }
	inline function set_origin(value:String):String { var raw:cpp.ConstCharStar = cast value; ImageUrlOriginContext_Ffi.set_origin(this, raw); return value; }
}
