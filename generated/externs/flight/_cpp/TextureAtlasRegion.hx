package flight._cpp;

private extern class TextureAtlasRegion_Ffi {
	@:native("flight_get_texture_atlas_region_height") static function get_height(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_texture_atlas_region_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_texture_atlas_region_id") static function get_id(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_texture_atlas_region_id") static function set_id(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_texture_atlas_region_source_x") static function get_sourceX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_texture_atlas_region_source_x") static function set_sourceX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_texture_atlas_region_source_y") static function get_sourceY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_texture_atlas_region_source_y") static function set_sourceY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_texture_atlas_region_trimmed") static function get_trimmed(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_texture_atlas_region_trimmed") static function set_trimmed(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_texture_atlas_region_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_texture_atlas_region_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_texture_atlas_region_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_texture_atlas_region_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_texture_atlas_region_width") static function get_width(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_texture_atlas_region_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract TextureAtlasRegion(cpp.Star<cpp.Void>) {
	public var height(get, set):Single;

	inline function get_height():Single return TextureAtlasRegion_Ffi.get_height(this);

	inline function set_height(value:Single):Single return TextureAtlasRegion_Ffi.set_height(this, value);
	public var id(get, set):Int;

	inline function get_id():Int return TextureAtlasRegion_Ffi.get_id(this);

	inline function set_id(value:Int):Int return TextureAtlasRegion_Ffi.set_id(this, value);
	public var sourceX(get, set):Single;

	inline function get_sourceX():Single return TextureAtlasRegion_Ffi.get_sourceX(this);

	inline function set_sourceX(value:Single):Single return TextureAtlasRegion_Ffi.set_sourceX(this, value);
	public var sourceY(get, set):Single;

	inline function get_sourceY():Single return TextureAtlasRegion_Ffi.get_sourceY(this);

	inline function set_sourceY(value:Single):Single return TextureAtlasRegion_Ffi.set_sourceY(this, value);
	public var trimmed(get, set):Bool;

	inline function get_trimmed():Bool return TextureAtlasRegion_Ffi.get_trimmed(this);

	inline function set_trimmed(value:Bool):Bool return TextureAtlasRegion_Ffi.set_trimmed(this, value);
	public var x(get, set):Single;

	inline function get_x():Single return TextureAtlasRegion_Ffi.get_x(this);

	inline function set_x(value:Single):Single return TextureAtlasRegion_Ffi.set_x(this, value);
	public var y(get, set):Single;

	inline function get_y():Single return TextureAtlasRegion_Ffi.get_y(this);

	inline function set_y(value:Single):Single return TextureAtlasRegion_Ffi.set_y(this, value);
	public var width(get, set):Single;

	inline function get_width():Single return TextureAtlasRegion_Ffi.get_width(this);

	inline function set_width(value:Single):Single return TextureAtlasRegion_Ffi.set_width(this, value);
}
