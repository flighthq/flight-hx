package flight._hl;

private extern class TextureAtlasRegion_Ffi {
	@:hlNative("flight", "flight_get_texture_atlas_region_height")
	static function get_height(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_texture_atlas_region_height")
	static function set_height(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_texture_atlas_region_id")
	static function get_id(ptr:hl.Bytes):Int;
	@:hlNative("flight", "flight_set_texture_atlas_region_id")
	static function set_id(ptr:hl.Bytes, value:Int):Int;
	@:hlNative("flight", "flight_get_texture_atlas_region_source_x")
	static function get_sourceX(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_texture_atlas_region_source_x")
	static function set_sourceX(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_texture_atlas_region_source_y")
	static function get_sourceY(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_texture_atlas_region_source_y")
	static function set_sourceY(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_texture_atlas_region_trimmed")
	static function get_trimmed(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_texture_atlas_region_trimmed")
	static function set_trimmed(ptr:hl.Bytes, value:Bool):Bool;
	@:hlNative("flight", "flight_get_texture_atlas_region_x")
	static function get_x(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_texture_atlas_region_x")
	static function set_x(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_texture_atlas_region_y")
	static function get_y(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_texture_atlas_region_y")
	static function set_y(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_texture_atlas_region_width")
	static function get_width(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_texture_atlas_region_width")
	static function set_width(ptr:hl.Bytes, value:Single):Single;
}

abstract TextureAtlasRegion(hl.Bytes) {
	public var height(get, set):Single;

	inline function get_height():Single return TextureAtlasRegion_Ffi.get_height(this);

	inline function set_height(value:Single):Single { TextureAtlasRegion_Ffi.set_height(this, value); return value; }
	public var id(get, set):Int;

	inline function get_id():Int return TextureAtlasRegion_Ffi.get_id(this);

	inline function set_id(value:Int):Int { TextureAtlasRegion_Ffi.set_id(this, value); return value; }
	public var sourceX(get, set):Single;

	inline function get_sourceX():Single return TextureAtlasRegion_Ffi.get_sourceX(this);

	inline function set_sourceX(value:Single):Single { TextureAtlasRegion_Ffi.set_sourceX(this, value); return value; }
	public var sourceY(get, set):Single;

	inline function get_sourceY():Single return TextureAtlasRegion_Ffi.get_sourceY(this);

	inline function set_sourceY(value:Single):Single { TextureAtlasRegion_Ffi.set_sourceY(this, value); return value; }
	public var trimmed(get, set):Bool;

	inline function get_trimmed():Bool return TextureAtlasRegion_Ffi.get_trimmed(this);

	inline function set_trimmed(value:Bool):Bool { TextureAtlasRegion_Ffi.set_trimmed(this, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return TextureAtlasRegion_Ffi.get_x(this);

	inline function set_x(value:Single):Single { TextureAtlasRegion_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return TextureAtlasRegion_Ffi.get_y(this);

	inline function set_y(value:Single):Single { TextureAtlasRegion_Ffi.set_y(this, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return TextureAtlasRegion_Ffi.get_width(this);

	inline function set_width(value:Single):Single { TextureAtlasRegion_Ffi.set_width(this, value); return value; }
}
