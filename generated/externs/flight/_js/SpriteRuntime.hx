package flight._js;

@:jsRequire("flight")
private extern class SpriteRuntime_Ffi {
	@:native("flight_get_sprite_runtime_local_bounds_texture_version") static function get_localBoundsTextureVersion(ptr:Dynamic):haxe.Int64;
	@:native("flight_set_sprite_runtime_local_bounds_texture_version") static function set_localBoundsTextureVersion(ptr:Dynamic, value:haxe.Int64):haxe.Int64;
}

abstract SpriteRuntime(Dynamic) {
	public var localBoundsTextureVersion(get, set):haxe.Int64;

	inline function get_localBoundsTextureVersion():haxe.Int64 return SpriteRuntime_Ffi.get_localBoundsTextureVersion(this);

	inline function set_localBoundsTextureVersion(value:haxe.Int64):haxe.Int64 return SpriteRuntime_Ffi.set_localBoundsTextureVersion(this, value);
}
