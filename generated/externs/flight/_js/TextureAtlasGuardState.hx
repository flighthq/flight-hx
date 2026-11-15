package flight._js;

@:jsRequire("flight")
private extern class TextureAtlasGuardState_Ffi {
	@:native("flight_get_texture_atlas_guard_state_enabled") static function get_enabled(ptr:Dynamic):Bool;
	@:native("flight_set_texture_atlas_guard_state_enabled") static function set_enabled(ptr:Dynamic, value:Bool):Bool;
}

abstract TextureAtlasGuardState(Dynamic) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return TextureAtlasGuardState_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool return TextureAtlasGuardState_Ffi.set_enabled(this, value);
}
