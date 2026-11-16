package flight._hl;

private extern class SpriteRuntime_Ffi {
	@:hlNative("flight", "flight_get_sprite_runtime_local_bounds_texture_version")
	static function get_localBoundsTextureVersion(ptr:hl.Bytes):haxe.Int64;
	@:hlNative("flight", "flight_set_sprite_runtime_local_bounds_texture_version")
	static function set_localBoundsTextureVersion(ptr:hl.Bytes, value:haxe.Int64):haxe.Int64;
}

abstract SpriteRuntime(hl.Bytes) {
	public var localBoundsTextureVersion(get, set):haxe.Int64;

	inline function get_localBoundsTextureVersion():haxe.Int64 return SpriteRuntime_Ffi.get_localBoundsTextureVersion(this);
	inline function set_localBoundsTextureVersion(value:haxe.Int64):haxe.Int64 { SpriteRuntime_Ffi.set_localBoundsTextureVersion(this, value); return value; }
}
