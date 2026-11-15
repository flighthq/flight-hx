package flight._cpp;

private extern class TextureContainerLevel_Ffi {
	@:native("flight_get_texture_container_level_byte_offset") static function get_byteOffset(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_texture_container_level_byte_offset") static function set_byteOffset(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_texture_container_level_byte_length") static function get_byteLength(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_texture_container_level_byte_length") static function set_byteLength(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_texture_container_level_width") static function get_width(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_texture_container_level_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_texture_container_level_height") static function get_height(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_texture_container_level_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract TextureContainerLevel(cpp.Star<cpp.Void>) {
	public var byteOffset(get, set):Int;

	inline function get_byteOffset():Int return TextureContainerLevel_Ffi.get_byteOffset(this);

	inline function set_byteOffset(value:Int):Int return TextureContainerLevel_Ffi.set_byteOffset(this, value);
	public var byteLength(get, set):Int;

	inline function get_byteLength():Int return TextureContainerLevel_Ffi.get_byteLength(this);

	inline function set_byteLength(value:Int):Int return TextureContainerLevel_Ffi.set_byteLength(this, value);
	public var width(get, set):Int;

	inline function get_width():Int return TextureContainerLevel_Ffi.get_width(this);

	inline function set_width(value:Int):Int return TextureContainerLevel_Ffi.set_width(this, value);
	public var height(get, set):Int;

	inline function get_height():Int return TextureContainerLevel_Ffi.get_height(this);

	inline function set_height(value:Int):Int return TextureContainerLevel_Ffi.set_height(this, value);
}
