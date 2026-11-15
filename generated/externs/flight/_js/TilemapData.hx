package flight._js;

@:jsRequire("flight")
private extern class TilemapData_Ffi {
	@:native("flight_get_tilemap_data_columns") static function get_columns(ptr:Dynamic):Int;
	@:native("flight_set_tilemap_data_columns") static function set_columns(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_tilemap_data_rows") static function get_rows(ptr:Dynamic):Int;
	@:native("flight_set_tilemap_data_rows") static function set_rows(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_tilemap_data_tile_height") static function get_tileHeight(ptr:Dynamic):Float;
	@:native("flight_set_tilemap_data_tile_height") static function set_tileHeight(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_tilemap_data_tile_width") static function get_tileWidth(ptr:Dynamic):Float;
	@:native("flight_set_tilemap_data_tile_width") static function set_tileWidth(ptr:Dynamic, value:Float):Float;
}

abstract TilemapData(Dynamic) {
	public var columns(get, set):Int;

	inline function get_columns():Int return TilemapData_Ffi.get_columns(this);

	inline function set_columns(value:Int):Int return TilemapData_Ffi.set_columns(this, value);
	public var rows(get, set):Int;

	inline function get_rows():Int return TilemapData_Ffi.get_rows(this);

	inline function set_rows(value:Int):Int return TilemapData_Ffi.set_rows(this, value);
	public var tileHeight(get, set):Float;

	inline function get_tileHeight():Float return TilemapData_Ffi.get_tileHeight(this);

	inline function set_tileHeight(value:Float):Float return TilemapData_Ffi.set_tileHeight(this, value);
	public var tileWidth(get, set):Float;

	inline function get_tileWidth():Float return TilemapData_Ffi.get_tileWidth(this);

	inline function set_tileWidth(value:Float):Float return TilemapData_Ffi.set_tileWidth(this, value);
}
