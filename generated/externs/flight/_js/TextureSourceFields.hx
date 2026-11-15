package flight._js;

@:jsRequire("flight")
private extern class TextureSourceFields_Ffi {
	@:native("flight_get_texture_source_fields_height") static function get_height(ptr:Dynamic):Int;
	@:native("flight_set_texture_source_fields_height") static function set_height(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_texture_source_fields_version") static function get_version(ptr:Dynamic):Int;
	@:native("flight_set_texture_source_fields_version") static function set_version(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_texture_source_fields_width") static function get_width(ptr:Dynamic):Int;
	@:native("flight_set_texture_source_fields_width") static function set_width(ptr:Dynamic, value:Int):Int;
}

abstract TextureSourceFields(Dynamic) {
	public var height(get, set):Int;

	inline function get_height():Int return TextureSourceFields_Ffi.get_height(this);

	inline function set_height(value:Int):Int return TextureSourceFields_Ffi.set_height(this, value);
	public var version(get, set):Int;

	inline function get_version():Int return TextureSourceFields_Ffi.get_version(this);

	inline function set_version(value:Int):Int return TextureSourceFields_Ffi.set_version(this, value);
	public var width(get, set):Int;

	inline function get_width():Int return TextureSourceFields_Ffi.get_width(this);

	inline function set_width(value:Int):Int return TextureSourceFields_Ffi.set_width(this, value);
}
