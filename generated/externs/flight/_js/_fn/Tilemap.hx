package flight._js._fn;

@:jsRequire("flight")
extern class Tilemap {
	@:native("flight_create_tilemap")
	public static function createTilemap():Dynamic;
	@:native("flight_create_tilemap_data")
	public static function createTilemapData():flight._js.TilemapData;
	@:native("flight_create_tilemap_runtime")
	public static function createTilemapRuntime():flight._js.TilemapRuntime;
	@:native("flight_create_tilemap_signals")
	public static function createTilemapSignals():flight._js.TilemapSignals;
	@:native("flight_clear_tilemap")
	public static function clearTilemap(tilemap:flight._js.Tilemap):Void;
	@:native("flight_clone_tilemap")
	public static function cloneTilemap(source:flight._js.Tilemap):Dynamic;
	@:native("flight_compute_tilemap_local_bounds_rectangle")
	public static function computeTilemapLocalBoundsRectangle(out:flight._js.Rectangle, source:Dynamic):Void;
	@:native("flight_enable_tilemap_signals")
	public static function enableTilemapSignals(target:flight._js.Tilemap):flight._js.TilemapSignals;
	@:native("flight_fill_tilemap_tiles")
	public static function fillTilemapTiles(tilemap:flight._js.Tilemap, id:Int):Void;
	@:native("flight_get_tilemap_column_at_x")
	public static function getTilemapColumnAtX(source:flight._js.Tilemap, x:Float):Int;
	@:native("flight_get_tilemap_column_row_at_point")
	public static function getTilemapColumnRowAtPoint(out:flight._js.Vector2, source:flight._js.Tilemap, x:Float, y:Float):Bool;
	@:native("flight_get_tilemap_row_at_y")
	public static function getTilemapRowAtY(source:flight._js.Tilemap, y:Float):Int;
	@:native("flight_get_tilemap_runtime")
	public static function getTilemapRuntime(source:flight._js.Tilemap):flight._js.TilemapRuntime;
	@:native("flight_get_tilemap_tile")
	public static function getTilemapTile(tilemap:flight._js.Tilemap, column:Int, row:Int):Int;
	@:native("flight_get_tilemap_tile_at_point")
	public static function getTilemapTileAtPoint(source:flight._js.Tilemap, point:flight._js.Vector2):Int;
	@:native("flight_get_tilemap_tile_at_point_xy")
	public static function getTilemapTileAtPointXy(source:flight._js.Tilemap, x:Float, y:Float):Int;
	@:native("flight_get_tilemap_tile_rect")
	public static function getTilemapTileRect(out:flight._js.Rectangle, source:flight._js.Tilemap, column:Int, row:Int):Bool;
	@:native("flight_resize_tilemap")
	public static function resizeTilemap(tilemap:flight._js.Tilemap, columns:Int, rows:Int):Void;
	@:native("flight_set_tilemap_tile")
	public static function setTilemapTile(tilemap:flight._js.Tilemap, column:Int, row:Int, id:Int):Void;
	@:native("flight_set_tilemap_tile_tint")
	public static function setTilemapTileTint(tilemap:flight._js.Tilemap, column:Int, row:Int, rgba:Int):Void;
	@:native("flight_set_tilemap_tiles")
	public static function setTilemapTiles(tilemap:flight._js.Tilemap, ids:Dynamic, idsLen:Int, offsetColumn:Int, offsetRow:Int, width:Int, height:Int):Void;
	@:native("flight_free_tilemap_data")
	public static function freeTilemapData(ptr:flight._js.TilemapData):Void;
	@:native("flight_free_tilemap_runtime")
	public static function freeTilemapRuntime(ptr:flight._js.TilemapRuntime):Void;
	@:native("flight_free_tilemap_signals")
	public static function freeTilemapSignals(ptr:flight._js.TilemapSignals):Void;
}
