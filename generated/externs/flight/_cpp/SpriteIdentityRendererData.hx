package flight._cpp;

private extern class SpriteIdentityRendererData_Ffi {
	@:native("flight_get_sprite_identity_renderer_data_texture_version") static function get_textureVersion(ptr:cpp.Star<cpp.Void>):haxe.Int64;
	@:native("flight_set_sprite_identity_renderer_data_texture_version") static function set_textureVersion(ptr:cpp.Star<cpp.Void>, value:haxe.Int64):haxe.Int64;
}

abstract SpriteIdentityRendererData(cpp.Star<cpp.Void>) {
	public var textureVersion(get, set):haxe.Int64;

	inline function get_textureVersion():haxe.Int64 return SpriteIdentityRendererData_Ffi.get_textureVersion(this);

	inline function set_textureVersion(value:haxe.Int64):haxe.Int64 { SpriteIdentityRendererData_Ffi.set_textureVersion(this, value); return value; }
}
