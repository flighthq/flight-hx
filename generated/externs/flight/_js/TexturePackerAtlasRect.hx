package flight._js;

@:jsRequire("flight")
private extern class TexturePackerAtlasRect_Ffi {
	@:native("flight_get_texture_packer_atlas_rect_h") static function get_h(ptr:Dynamic):Float;
	@:native("flight_set_texture_packer_atlas_rect_h") static function set_h(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_texture_packer_atlas_rect_w") static function get_w(ptr:Dynamic):Float;
	@:native("flight_set_texture_packer_atlas_rect_w") static function set_w(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_texture_packer_atlas_rect_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_texture_packer_atlas_rect_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_texture_packer_atlas_rect_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_texture_packer_atlas_rect_y") static function set_y(ptr:Dynamic, value:Float):Float;
}

abstract TexturePackerAtlasRect(Dynamic) {
	public var h(get, set):Float;

	inline function get_h():Float return TexturePackerAtlasRect_Ffi.get_h(this);

	inline function set_h(value:Float):Float return TexturePackerAtlasRect_Ffi.set_h(this, value);
	public var w(get, set):Float;

	inline function get_w():Float return TexturePackerAtlasRect_Ffi.get_w(this);

	inline function set_w(value:Float):Float return TexturePackerAtlasRect_Ffi.set_w(this, value);
	public var x(get, set):Float;

	inline function get_x():Float return TexturePackerAtlasRect_Ffi.get_x(this);

	inline function set_x(value:Float):Float return TexturePackerAtlasRect_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return TexturePackerAtlasRect_Ffi.get_y(this);

	inline function set_y(value:Float):Float return TexturePackerAtlasRect_Ffi.set_y(this, value);
}
