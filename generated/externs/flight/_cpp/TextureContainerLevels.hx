package flight._cpp;

private extern class TextureContainerLevels_Ffi {
	@:native("flight_get_texture_container_levels_end_offset") static function get_endOffset(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_texture_container_levels_end_offset") static function set_endOffset(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract TextureContainerLevels(cpp.Star<cpp.Void>) {
	public var endOffset(get, set):Int;

	inline function get_endOffset():Int return TextureContainerLevels_Ffi.get_endOffset(this);

	inline function set_endOffset(value:Int):Int return TextureContainerLevels_Ffi.set_endOffset(this, value);
}
