package flight._cpp;

private extern class TextureContainer_Ffi {
	@:native("flight_get_texture_container_width") static function get_width(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_texture_container_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_texture_container_height") static function get_height(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_texture_container_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_texture_container_depth") static function get_depth(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_texture_container_depth") static function set_depth(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_texture_container_mip_levels") static function get_mipLevels(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_texture_container_mip_levels") static function set_mipLevels(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_texture_container_layers") static function get_layers(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_texture_container_layers") static function set_layers(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_texture_container_faces") static function get_faces(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_texture_container_faces") static function set_faces(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract TextureContainer(cpp.Star<cpp.Void>) {
	public var width(get, set):Int;

	inline function get_width():Int return TextureContainer_Ffi.get_width(this);

	inline function set_width(value:Int):Int { TextureContainer_Ffi.set_width(this, value); return value; }
	public var height(get, set):Int;

	inline function get_height():Int return TextureContainer_Ffi.get_height(this);

	inline function set_height(value:Int):Int { TextureContainer_Ffi.set_height(this, value); return value; }
	public var depth(get, set):Int;

	inline function get_depth():Int return TextureContainer_Ffi.get_depth(this);

	inline function set_depth(value:Int):Int { TextureContainer_Ffi.set_depth(this, value); return value; }
	public var mipLevels(get, set):Int;

	inline function get_mipLevels():Int return TextureContainer_Ffi.get_mipLevels(this);

	inline function set_mipLevels(value:Int):Int { TextureContainer_Ffi.set_mipLevels(this, value); return value; }
	public var layers(get, set):Int;

	inline function get_layers():Int return TextureContainer_Ffi.get_layers(this);

	inline function set_layers(value:Int):Int { TextureContainer_Ffi.set_layers(this, value); return value; }
	public var faces(get, set):Int;

	inline function get_faces():Int return TextureContainer_Ffi.get_faces(this);

	inline function set_faces(value:Int):Int { TextureContainer_Ffi.set_faces(this, value); return value; }
}
