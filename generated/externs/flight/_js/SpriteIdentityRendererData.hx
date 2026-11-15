package flight._js;

@:jsRequire("flight")
private extern class SpriteIdentityRendererData_Ffi {
	@:native("flight_get_sprite_identity_renderer_data_texture_version") static function get_textureVersion(ptr:Dynamic):haxe.Int64;
	@:native("flight_set_sprite_identity_renderer_data_texture_version") static function set_textureVersion(ptr:Dynamic, value:haxe.Int64):haxe.Int64;
}

abstract SpriteIdentityRendererData(Dynamic) {
	public var textureVersion(get, set):haxe.Int64;

	inline function get_textureVersion():haxe.Int64 return SpriteIdentityRendererData_Ffi.get_textureVersion(this);

	inline function set_textureVersion(value:haxe.Int64):haxe.Int64 return SpriteIdentityRendererData_Ffi.set_textureVersion(this, value);
}
