package flight._js;

@:jsRequire("flight")
private extern class TextureContainerLevels_Ffi {
	@:native("flight_get_texture_container_levels_end_offset") static function get_endOffset(ptr:Dynamic):Int;
	@:native("flight_set_texture_container_levels_end_offset") static function set_endOffset(ptr:Dynamic, value:Int):Int;
}

abstract TextureContainerLevels(Dynamic) {
	public var endOffset(get, set):Int;

	inline function get_endOffset():Int return TextureContainerLevels_Ffi.get_endOffset(this);

	inline function set_endOffset(value:Int):Int return TextureContainerLevels_Ffi.set_endOffset(this, value);
}
