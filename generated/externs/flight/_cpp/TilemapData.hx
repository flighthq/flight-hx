package flight._cpp;

private extern class TilemapData_Ffi {
	@:native("flight_get_tilemap_data_columns") static function get_columns(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_tilemap_data_columns") static function set_columns(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_tilemap_data_rows") static function get_rows(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_tilemap_data_rows") static function set_rows(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_tilemap_data_tile_height") static function get_tileHeight(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_tilemap_data_tile_height") static function set_tileHeight(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_tilemap_data_tile_width") static function get_tileWidth(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_tilemap_data_tile_width") static function set_tileWidth(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract TilemapData(cpp.Star<cpp.Void>) {
	public var columns(get, set):Int;

	inline function get_columns():Int return TilemapData_Ffi.get_columns(this);

	inline function set_columns(value:Int):Int { TilemapData_Ffi.set_columns(this, value); return value; }
	public var rows(get, set):Int;

	inline function get_rows():Int return TilemapData_Ffi.get_rows(this);

	inline function set_rows(value:Int):Int { TilemapData_Ffi.set_rows(this, value); return value; }
	public var tileHeight(get, set):Float;

	inline function get_tileHeight():Float return TilemapData_Ffi.get_tileHeight(this);

	inline function set_tileHeight(value:Float):Float { TilemapData_Ffi.set_tileHeight(this, value); return value; }
	public var tileWidth(get, set):Float;

	inline function get_tileWidth():Float return TilemapData_Ffi.get_tileWidth(this);

	inline function set_tileWidth(value:Float):Float { TilemapData_Ffi.set_tileWidth(this, value); return value; }
}
