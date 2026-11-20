package flight._cpp;

private extern class StarlingDocument_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_starling_document_image_path") static function get_imagePath(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_starling_document_image_path") static function set_imagePath(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract StarlingDocument(cpp.Star<cpp.Void>) {
	public var imagePath(get, set):String;
	inline function get_imagePath():String { var raw = StarlingDocument_Ffi.get_imagePath(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); StarlingDocument_Ffi.freeString(raw); return value; }
	inline function set_imagePath(value:String):String { var raw:cpp.ConstCharStar = cast value; StarlingDocument_Ffi.set_imagePath(this, raw); return value; }
}
