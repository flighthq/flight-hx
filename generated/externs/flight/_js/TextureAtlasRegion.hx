package flight._js;

@:jsRequire("flight")
private extern class TextureAtlasRegion_Ffi {
	@:native("flight_get_texture_atlas_region_height") static function get_height(ptr:Dynamic):Float;
	@:native("flight_set_texture_atlas_region_height") static function set_height(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_texture_atlas_region_id") static function get_id(ptr:Dynamic):Int;
	@:native("flight_set_texture_atlas_region_id") static function set_id(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_texture_atlas_region_source_x") static function get_sourceX(ptr:Dynamic):Float;
	@:native("flight_set_texture_atlas_region_source_x") static function set_sourceX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_texture_atlas_region_source_y") static function get_sourceY(ptr:Dynamic):Float;
	@:native("flight_set_texture_atlas_region_source_y") static function set_sourceY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_texture_atlas_region_trimmed") static function get_trimmed(ptr:Dynamic):Bool;
	@:native("flight_set_texture_atlas_region_trimmed") static function set_trimmed(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_texture_atlas_region_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_texture_atlas_region_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_texture_atlas_region_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_texture_atlas_region_y") static function set_y(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_texture_atlas_region_width") static function get_width(ptr:Dynamic):Float;
	@:native("flight_set_texture_atlas_region_width") static function set_width(ptr:Dynamic, value:Float):Float;
}

abstract TextureAtlasRegion(Dynamic) {
	public var height(get, set):Float;

	inline function get_height():Float return TextureAtlasRegion_Ffi.get_height(this);

	inline function set_height(value:Float):Float return TextureAtlasRegion_Ffi.set_height(this, value);
	public var id(get, set):Int;

	inline function get_id():Int return TextureAtlasRegion_Ffi.get_id(this);

	inline function set_id(value:Int):Int return TextureAtlasRegion_Ffi.set_id(this, value);
	public var sourceX(get, set):Float;

	inline function get_sourceX():Float return TextureAtlasRegion_Ffi.get_sourceX(this);

	inline function set_sourceX(value:Float):Float return TextureAtlasRegion_Ffi.set_sourceX(this, value);
	public var sourceY(get, set):Float;

	inline function get_sourceY():Float return TextureAtlasRegion_Ffi.get_sourceY(this);

	inline function set_sourceY(value:Float):Float return TextureAtlasRegion_Ffi.set_sourceY(this, value);
	public var trimmed(get, set):Bool;

	inline function get_trimmed():Bool return TextureAtlasRegion_Ffi.get_trimmed(this);

	inline function set_trimmed(value:Bool):Bool return TextureAtlasRegion_Ffi.set_trimmed(this, value);
	public var x(get, set):Float;

	inline function get_x():Float return TextureAtlasRegion_Ffi.get_x(this);

	inline function set_x(value:Float):Float return TextureAtlasRegion_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return TextureAtlasRegion_Ffi.get_y(this);

	inline function set_y(value:Float):Float return TextureAtlasRegion_Ffi.set_y(this, value);
	public var width(get, set):Float;

	inline function get_width():Float return TextureAtlasRegion_Ffi.get_width(this);

	inline function set_width(value:Float):Float return TextureAtlasRegion_Ffi.set_width(this, value);
}
