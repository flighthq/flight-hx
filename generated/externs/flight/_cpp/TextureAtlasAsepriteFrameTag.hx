package flight._cpp;

private extern class TextureAtlasAsepriteFrameTag_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_texture_atlas_aseprite_frame_tag_from") static function get_from(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_texture_atlas_aseprite_frame_tag_from") static function set_from(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_texture_atlas_aseprite_frame_tag_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_texture_atlas_aseprite_frame_tag_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_texture_atlas_aseprite_frame_tag_to") static function get_to(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_texture_atlas_aseprite_frame_tag_to") static function set_to(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract TextureAtlasAsepriteFrameTag(cpp.Star<cpp.Void>) {
	public var from(get, set):Int;

	inline function get_from():Int return TextureAtlasAsepriteFrameTag_Ffi.get_from(this);

	inline function set_from(value:Int):Int { TextureAtlasAsepriteFrameTag_Ffi.set_from(this, value); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = TextureAtlasAsepriteFrameTag_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TextureAtlasAsepriteFrameTag_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; TextureAtlasAsepriteFrameTag_Ffi.set_name(this, raw); return value; }
	public var to(get, set):Int;

	inline function get_to():Int return TextureAtlasAsepriteFrameTag_Ffi.get_to(this);

	inline function set_to(value:Int):Int { TextureAtlasAsepriteFrameTag_Ffi.set_to(this, value); return value; }
}
