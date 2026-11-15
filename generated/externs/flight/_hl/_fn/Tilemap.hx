package flight._hl._fn;

extern class Tilemap {
	@:hlNative("flight", "flight_create_tilemap")
	public static function createTilemap():Dynamic;
	@:hlNative("flight", "flight_create_tilemap_data")
	public static function createTilemapData():flight._hl.TilemapData;
	@:hlNative("flight", "flight_create_tilemap_runtime")
	public static function createTilemapRuntime():flight._hl.TilemapRuntime;
	@:hlNative("flight", "flight_create_tilemap_signals")
	public static function createTilemapSignals():flight._hl.TilemapSignals;
	@:hlNative("flight", "flight_clear_tilemap")
	public static function clearTilemap(tilemap:flight._hl.Tilemap):Void;
	@:hlNative("flight", "flight_clone_tilemap")
	public static function cloneTilemap(source:flight._hl.Tilemap):Dynamic;
	@:hlNative("flight", "flight_compute_tilemap_local_bounds_rectangle")
	public static function computeTilemapLocalBoundsRectangle(out:flight._hl.Rectangle, source:Dynamic):Void;
	@:hlNative("flight", "flight_enable_tilemap_signals")
	public static function enableTilemapSignals(target:flight._hl.Tilemap):flight._hl.TilemapSignals;
	@:hlNative("flight", "flight_fill_tilemap_tiles")
	public static function fillTilemapTiles(tilemap:flight._hl.Tilemap, id:Int):Void;
	@:hlNative("flight", "flight_get_tilemap_column_at_x")
	public static function getTilemapColumnAtX(source:flight._hl.Tilemap, x:Single):Int;
	@:hlNative("flight", "flight_get_tilemap_column_row_at_point")
	public static function getTilemapColumnRowAtPoint(out:flight._hl.Vector2, source:flight._hl.Tilemap, x:Single, y:Single):Bool;
	@:hlNative("flight", "flight_get_tilemap_row_at_y")
	public static function getTilemapRowAtY(source:flight._hl.Tilemap, y:Single):Int;
	@:hlNative("flight", "flight_get_tilemap_runtime")
	public static function getTilemapRuntime(source:flight._hl.Tilemap):flight._hl.TilemapRuntime;
	@:hlNative("flight", "flight_get_tilemap_tile")
	public static function getTilemapTile(tilemap:flight._hl.Tilemap, column:Int, row:Int):Int;
	@:hlNative("flight", "flight_get_tilemap_tile_at_point")
	public static function getTilemapTileAtPoint(source:flight._hl.Tilemap, point:flight._hl.Vector2):Int;
	@:hlNative("flight", "flight_get_tilemap_tile_at_point_xy")
	public static function getTilemapTileAtPointXy(source:flight._hl.Tilemap, x:Single, y:Single):Int;
	@:hlNative("flight", "flight_get_tilemap_tile_rect")
	public static function getTilemapTileRect(out:flight._hl.Rectangle, source:flight._hl.Tilemap, column:Int, row:Int):Bool;
	@:hlNative("flight", "flight_resize_tilemap")
	public static function resizeTilemap(tilemap:flight._hl.Tilemap, columns:Int, rows:Int):Void;
	@:hlNative("flight", "flight_set_tilemap_tile")
	public static function setTilemapTile(tilemap:flight._hl.Tilemap, column:Int, row:Int, id:Int):Void;
	@:hlNative("flight", "flight_set_tilemap_tile_tint")
	public static function setTilemapTileTint(tilemap:flight._hl.Tilemap, column:Int, row:Int, rgba:Int):Void;
	@:hlNative("flight", "flight_set_tilemap_tiles")
	public static function setTilemapTiles(tilemap:flight._hl.Tilemap, ids:hl.Bytes, idsLen:Int, offsetColumn:Int, offsetRow:Int, width:Int, height:Int):Void;
	@:hlNative("flight", "flight_free_tilemap_data")
	public static function freeTilemapData(ptr:flight._hl.TilemapData):Void;
	@:hlNative("flight", "flight_free_tilemap_runtime")
	public static function freeTilemapRuntime(ptr:flight._hl.TilemapRuntime):Void;
	@:hlNative("flight", "flight_free_tilemap_signals")
	public static function freeTilemapSignals(ptr:flight._hl.TilemapSignals):Void;
}
