package flight._js;

@:jsRequire("flight")
private extern class TextureAtlasAsepriteFrameTag_Ffi {
	@:native("flight_get_texture_atlas_aseprite_frame_tag_from") static function get_from(ptr:Dynamic):Int;
	@:native("flight_set_texture_atlas_aseprite_frame_tag_from") static function set_from(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_texture_atlas_aseprite_frame_tag_to") static function get_to(ptr:Dynamic):Int;
	@:native("flight_set_texture_atlas_aseprite_frame_tag_to") static function set_to(ptr:Dynamic, value:Int):Int;
}

abstract TextureAtlasAsepriteFrameTag(Dynamic) {
	public var from(get, set):Int;

	inline function get_from():Int return TextureAtlasAsepriteFrameTag_Ffi.get_from(this);

	inline function set_from(value:Int):Int return TextureAtlasAsepriteFrameTag_Ffi.set_from(this, value);
	public var to(get, set):Int;

	inline function get_to():Int return TextureAtlasAsepriteFrameTag_Ffi.get_to(this);

	inline function set_to(value:Int):Int return TextureAtlasAsepriteFrameTag_Ffi.set_to(this, value);
}
