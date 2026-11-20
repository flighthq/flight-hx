package flight._cpp;

private extern class TexturePackerAtlasMeta_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_texture_packer_atlas_meta_app") static function get_app(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_texture_packer_atlas_meta_app") static function set_app(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_texture_packer_atlas_meta_format") static function get_format(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_texture_packer_atlas_meta_format") static function set_format(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_texture_packer_atlas_meta_image") static function get_image(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_texture_packer_atlas_meta_image") static function set_image(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_texture_packer_atlas_meta_version") static function get_version(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_texture_packer_atlas_meta_version") static function set_version(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract TexturePackerAtlasMeta(cpp.Star<cpp.Void>) {
	public var app(get, set):String;
	inline function get_app():String { var raw = TexturePackerAtlasMeta_Ffi.get_app(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TexturePackerAtlasMeta_Ffi.freeString(raw); return value; }
	inline function set_app(value:String):String { var raw:cpp.ConstCharStar = cast value; TexturePackerAtlasMeta_Ffi.set_app(this, raw); return value; }
	public var format(get, set):String;
	inline function get_format():String { var raw = TexturePackerAtlasMeta_Ffi.get_format(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TexturePackerAtlasMeta_Ffi.freeString(raw); return value; }
	inline function set_format(value:String):String { var raw:cpp.ConstCharStar = cast value; TexturePackerAtlasMeta_Ffi.set_format(this, raw); return value; }
	public var image(get, set):String;
	inline function get_image():String { var raw = TexturePackerAtlasMeta_Ffi.get_image(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TexturePackerAtlasMeta_Ffi.freeString(raw); return value; }
	inline function set_image(value:String):String { var raw:cpp.ConstCharStar = cast value; TexturePackerAtlasMeta_Ffi.set_image(this, raw); return value; }
	public var version(get, set):String;
	inline function get_version():String { var raw = TexturePackerAtlasMeta_Ffi.get_version(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TexturePackerAtlasMeta_Ffi.freeString(raw); return value; }
	inline function set_version(value:String):String { var raw:cpp.ConstCharStar = cast value; TexturePackerAtlasMeta_Ffi.set_version(this, raw); return value; }
}
