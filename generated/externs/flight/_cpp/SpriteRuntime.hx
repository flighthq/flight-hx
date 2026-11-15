package flight._cpp;

private extern class SpriteRuntime_Ffi {
	@:native("flight_get_sprite_runtime_local_bounds_texture_version") static function get_localBoundsTextureVersion(ptr:cpp.Star<cpp.Void>):haxe.Int64;
	@:native("flight_set_sprite_runtime_local_bounds_texture_version") static function set_localBoundsTextureVersion(ptr:cpp.Star<cpp.Void>, value:haxe.Int64):haxe.Int64;
}

abstract SpriteRuntime(cpp.Star<cpp.Void>) {
	public var localBoundsTextureVersion(get, set):haxe.Int64;

	inline function get_localBoundsTextureVersion():haxe.Int64 return SpriteRuntime_Ffi.get_localBoundsTextureVersion(this);

	inline function set_localBoundsTextureVersion(value:haxe.Int64):haxe.Int64 return SpriteRuntime_Ffi.set_localBoundsTextureVersion(this, value);
}
