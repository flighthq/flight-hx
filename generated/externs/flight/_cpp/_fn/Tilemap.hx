package flight._cpp._fn;

extern class Tilemap {
	@:native("flight_create_tilemap")
	public static function createTilemap():flight._cpp.FlightNode;
	@:native("flight_clear_tilemap")
	public static function clearTilemap(tilemap:flight._cpp.FlightNode):Void;
	@:native("flight_clone_tilemap")
	public static function cloneTilemap(source:flight._cpp.FlightNode):flight._cpp.FlightNode;
	@:native("flight_compute_tilemap_local_bounds_rectangle")
	public static function computeTilemapLocalBoundsRectangle(out:flight._cpp.Rectangle, source:flight._cpp.FlightNode):Void;
	@:native("flight_enable_tilemap_signals")
	public static function enableTilemapSignals(target:flight._cpp.FlightNode):flight._cpp.TilemapSignals;
	@:native("flight_fill_tilemap_tiles")
	public static function fillTilemapTiles(tilemap:flight._cpp.FlightNode, id:Int):Void;
	@:native("flight_get_tilemap_column_at_x")
	public static function getTilemapColumnAtX(source:flight._cpp.FlightNode, x:Float):Int;
	@:native("flight_get_tilemap_column_row_at_point")
	public static function getTilemapColumnRowAtPoint(out:flight._cpp.Vector2, source:flight._cpp.FlightNode, x:Float, y:Float):Bool;
	@:native("flight_get_tilemap_row_at_y")
	public static function getTilemapRowAtY(source:flight._cpp.FlightNode, y:Float):Int;
	@:native("flight_get_tilemap_tile")
	public static function getTilemapTile(tilemap:flight._cpp.FlightNode, column:Int, row:Int):Int;
	@:native("flight_get_tilemap_tile_at_point")
	public static function getTilemapTileAtPoint(source:flight._cpp.FlightNode, point:flight._cpp.Vector2):Int;
	@:native("flight_get_tilemap_tile_at_point_xy")
	public static function getTilemapTileAtPointXy(source:flight._cpp.FlightNode, x:Float, y:Float):Int;
	@:native("flight_get_tilemap_tile_rect")
	public static function getTilemapTileRect(out:flight._cpp.Rectangle, source:flight._cpp.FlightNode, column:Int, row:Int):Bool;
	@:native("flight_resize_tilemap")
	public static function resizeTilemap(tilemap:flight._cpp.FlightNode, columns:Int, rows:Int):Void;
	@:native("flight_set_tilemap_tile")
	public static function setTilemapTile(tilemap:flight._cpp.FlightNode, column:Int, row:Int, id:Int):Void;
	@:native("flight_set_tilemap_tile_tint")
	public static function setTilemapTileTint(tilemap:flight._cpp.FlightNode, column:Int, row:Int, rgba:Int):Void;
	@:native("flight_set_tilemap_tiles")
	public static function setTilemapTiles(tilemap:flight._cpp.FlightNode, ids:cpp.Star<cpp.Void>, idsLen:Int, offsetColumn:Int, offsetRow:Int, width:Int, height:Int):Void;
}
