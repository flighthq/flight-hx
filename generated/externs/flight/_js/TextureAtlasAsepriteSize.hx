package flight._js;

@:jsRequire("flight")
private extern class TextureAtlasAsepriteSize_Ffi {
	@:native("flight_get_texture_atlas_aseprite_size_h") static function get_h(ptr:Dynamic):Float;
	@:native("flight_set_texture_atlas_aseprite_size_h") static function set_h(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_texture_atlas_aseprite_size_w") static function get_w(ptr:Dynamic):Float;
	@:native("flight_set_texture_atlas_aseprite_size_w") static function set_w(ptr:Dynamic, value:Float):Float;
}

abstract TextureAtlasAsepriteSize(Dynamic) {
	public var h(get, set):Float;

	inline function get_h():Float return TextureAtlasAsepriteSize_Ffi.get_h(this);

	inline function set_h(value:Float):Float return TextureAtlasAsepriteSize_Ffi.set_h(this, value);
	public var w(get, set):Float;

	inline function get_w():Float return TextureAtlasAsepriteSize_Ffi.get_w(this);

	inline function set_w(value:Float):Float return TextureAtlasAsepriteSize_Ffi.set_w(this, value);
}
