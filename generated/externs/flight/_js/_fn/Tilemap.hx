package flight._js._fn;

@:jsRequire("@flighthq/tilemap")
extern class Tilemap {
	@:native("createTilemap")
	public static function createTilemap():Dynamic;
	@:native("clearTilemap")
	public static function clearTilemap(tilemap:flight._js.Tilemap):Void;
	@:native("cloneTilemap")
	public static function cloneTilemap(source:flight._js.Tilemap):Dynamic;
	@:native("computeTilemapLocalBoundsRectangle")
	public static function computeTilemapLocalBoundsRectangle(out:flight._js.Rectangle, source:Dynamic):Void;
	@:native("enableTilemapSignals")
	public static function enableTilemapSignals(target:flight._js.Tilemap):flight._js.TilemapSignals;
	@:native("fillTilemapTiles")
	public static function fillTilemapTiles(tilemap:flight._js.Tilemap, id:Int):Void;
	@:native("getTilemapColumnAtX")
	public static function getTilemapColumnAtX(source:flight._js.Tilemap, x:Float):Int;
	@:native("getTilemapColumnRowAtPoint")
	public static function getTilemapColumnRowAtPoint(out:flight._js.Vector2, source:flight._js.Tilemap, x:Float, y:Float):Bool;
	@:native("getTilemapRowAtY")
	public static function getTilemapRowAtY(source:flight._js.Tilemap, y:Float):Int;
	@:native("getTilemapTile")
	public static function getTilemapTile(tilemap:flight._js.Tilemap, column:Int, row:Int):Int;
	@:native("getTilemapTileAtPoint")
	public static function getTilemapTileAtPoint(source:flight._js.Tilemap, point:flight._js.Vector2):Int;
	@:native("getTilemapTileAtPointXY")
	public static function getTilemapTileAtPointXy(source:flight._js.Tilemap, x:Float, y:Float):Int;
	@:native("getTilemapTileRect")
	public static function getTilemapTileRect(out:flight._js.Rectangle, source:flight._js.Tilemap, column:Int, row:Int):Bool;
	@:native("resizeTilemap")
	public static function resizeTilemap(tilemap:flight._js.Tilemap, columns:Int, rows:Int):Void;
	@:native("setTilemapTile")
	public static function setTilemapTile(tilemap:flight._js.Tilemap, column:Int, row:Int, id:Int):Void;
	@:native("setTilemapTileTint")
	public static function setTilemapTileTint(tilemap:flight._js.Tilemap, column:Int, row:Int, rgba:Int):Void;
	@:native("setTilemapTiles")
	public static function setTilemapTiles(tilemap:flight._js.Tilemap, ids:Dynamic, offsetColumn:Int, offsetRow:Int, width:Int, height:Int):Void;
}
