package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/tilemap")
extern class Tilemap {
  public static final TilemapKind:String;
  public static function clearTilemap(tilemap:flight.esm.types.tilemap.Types.Tilemap):Void;
  public static function cloneTilemap(source:flight.esm.types.tilemap.Types.Tilemap):flight.esm.types.tilemap.Types.Tilemap;
  public static function computeTilemapLocalBoundsRectangle(out:flight.esm.types.geometry.Types.Rectangle, source:flight.esm.types.node.Types.BoundsNode<flight.esm.types.scene2d_contract.Types.Node2DFields>):Void;
  public static function createTilemap():flight.esm.types.tilemap.Types.Tilemap;
  public static function enableTilemapSignals(target:flight.esm.types.tilemap.Types.Tilemap):flight.esm.types.tilemap.Types.TilemapSignals;
  public static function fillTilemapTiles(tilemap:flight.esm.types.tilemap.Types.Tilemap, id:Float):Void;
  public static function getTilemapColumnAtX(source:flight.esm.types.tilemap.Types.Tilemap, x:Float):Float;
  public static function getTilemapColumnRowAtPoint(out:flight.esm.types.geometry.Types.Vector2Like, source:flight.esm.types.tilemap.Types.Tilemap, x:Float, y:Float):Bool;
  public static function getTilemapRowAtY(source:flight.esm.types.tilemap.Types.Tilemap, y:Float):Float;
  public static function getTilemapSignals(source:flight.esm.types.tilemap.Types.Tilemap):Null<flight.esm.types.tilemap.Types.TilemapSignals>;
  public static function getTilemapTile(tilemap:flight.esm.types.tilemap.Types.Tilemap, column:Float, row:Float):Float;
  public static function getTilemapTileAtPoint(source:flight.esm.types.tilemap.Types.Tilemap, point:flight.esm.types.geometry.Types.Vector2Like):Float;
  public static function getTilemapTileAtPointXY(source:flight.esm.types.tilemap.Types.Tilemap, x:Float, y:Float):Float;
  public static function getTilemapTileRect(out:flight.esm.types.geometry.Types.Rectangle, source:flight.esm.types.tilemap.Types.Tilemap, column:Float, row:Float):Bool;
  public static function resizeTilemap(tilemap:flight.esm.types.tilemap.Types.Tilemap, columns:Float, rows:Float):Void;
  public static function setTilemapTile(tilemap:flight.esm.types.tilemap.Types.Tilemap, column:Float, row:Float, id:Float):Void;
  public static function setTilemapTileTint(tilemap:flight.esm.types.tilemap.Types.Tilemap, column:Float, row:Float, rgba:Float):Void;
  public static function setTilemapTiles(tilemap:flight.esm.types.tilemap.Types.Tilemap, ids:Dynamic, offsetColumn:Float, offsetRow:Float, width:Float, height:Float):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
