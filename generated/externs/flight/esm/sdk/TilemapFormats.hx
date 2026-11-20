package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/tilemap-formats")
extern class TilemapFormats {
  public static final TILEMAP_REQUIREMENT_KEY_NAMESPACE:String;
  public static final TilemapFormatKindTiledTmj:String;
  public static final TilemapFormatKindTiledTmx:String;
  public static final TilemapFormatKindTiledTsj:String;
  public static final TilemapFormatKindTiledTsx:String;
  public static function applyTilemapImportOptions(options:flight.esm.types.tilemap_formats.Types.TilemapImportOptions):Void;
  public static function buildTilemapLayersFromTiled(map:flight.esm.types.tilemap_formats.Types.TiledMap, layerIndex:Float, resolveTileset:flight.esm.types.tilemap_formats.Types.TiledTilesetResolver, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Null<Array<flight.esm.types.tilemap.Types.TilemapData>>;
  public static function decodeTiledBase64Layer(text:String, compression:Null<String>, ?inflate:Null<flight.esm.types.tilemap_formats.Types.TiledInflate>):Null<js.lib.Uint32Array>;
  public static function decodeTiledCsvLayer(text:String):js.lib.Uint32Array;
  public static function decodeTiledGid(gid:Float):flight.esm.types.tilemap_formats.Types.TiledGid;
  public static function detectTilemapFormat(text:String):Null<String>;
  public static function disableTilemapFormatsGuards():Void;
  public static function enableTilemapFormatsGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function explainTiledLayerData(text:String, compression:Null<String>, ?inflate:Null<flight.esm.types.tilemap_formats.Types.TiledInflate>):flight.esm.types.tilemap_formats.Types.TiledLayerDataExplanation;
  public static function formatTiledColor(packed:Float):String;
  public static function formatTiledTileset(tileset:flight.esm.types.tilemap_formats.Types.TiledTileset):String;
  public static function formatTiledTilesetJson(tileset:flight.esm.types.tilemap_formats.Types.TiledTileset):String;
  public static function formatTiledTmj(map:flight.esm.types.tilemap_formats.Types.TiledMap):String;
  public static function formatTiledTmx(map:flight.esm.types.tilemap_formats.Types.TiledMap):String;
  public static function getTiledTilesetRefForGid(map:flight.esm.types.tilemap_formats.Types.TiledMap, tileId:Float):Null<flight.esm.types.tilemap_formats.Types.TiledTilesetRef>;
  public static function getTilemapFormat(kind:String):Null<flight.esm.types.tilemap_formats.Types.TilemapFormatEntry>;
  public static function getTilemapFormatKinds():Array<String>;
  public static function getTilesetFormat(kind:String):Null<flight.esm.types.tilemap_formats.Types.TilesetFormatEntry>;
  public static function getTilesetFormatKinds():Array<String>;
  public static function parseTiledColor(text:String):Null<Float>;
  public static function parseTiledTileset(text:String, ?_options:Null<flight.esm.types.tilemap_formats.Types.TiledParseOptions>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Null<flight.esm.types.tilemap_formats.Types.TiledTileset>;
  public static function parseTiledTilesetJson(text:String, ?_options:Null<flight.esm.types.tilemap_formats.Types.TiledParseOptions>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Null<flight.esm.types.tilemap_formats.Types.TiledTileset>;
  public static function parseTiledTmj(text:String, ?options:Null<flight.esm.types.tilemap_formats.Types.TiledParseOptions>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Null<flight.esm.types.tilemap_formats.Types.TiledMap>;
  public static function parseTiledTmx(text:String, ?options:Null<flight.esm.types.tilemap_formats.Types.TiledParseOptions>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Null<flight.esm.types.tilemap_formats.Types.TiledMap>;
  public static function parseTilemap(text:String, ?formatKind:Null<String>, ?options:Null<flight.esm.types.tilemap_formats.Types.TiledParseOptions>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Null<flight.esm.types.tilemap_formats.Types.TiledMap>;
  public static function parseTileset(text:String, ?formatKind:Null<String>, ?options:Null<flight.esm.types.tilemap_formats.Types.TiledParseOptions>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Null<flight.esm.types.tilemap_formats.Types.TiledTileset>;
  public static function registerTilemapFormat(kind:String, entry:flight.esm.types.tilemap_formats.Types.TilemapFormatEntry):Void;
  public static function registerTilesetFormat(kind:String, entry:flight.esm.types.tilemap_formats.Types.TilesetFormatEntry):Void;
  public static final tiledTmjTilemapFormat:flight.esm.types.tilemap_formats.Types.TilemapFormatDescriptor;
  public static final tiledTmxTilemapFormat:flight.esm.types.tilemap_formats.Types.TilemapFormatDescriptor;
  public static final tiledTsjTilesetFormat:flight.esm.types.tilemap_formats.Types.TilesetFormatDescriptor;
  public static final tiledTsxTilesetFormat:flight.esm.types.tilemap_formats.Types.TilesetFormatDescriptor;
  public static final tilemapAllMapFormats:Array<flight.esm.types.tilemap_formats.Types.TilemapFormatDescriptor>;
  public static final tilemapAllTilesetFormats:Array<flight.esm.types.tilemap_formats.Types.TilesetFormatDescriptor>;
  public static function unregisterTilemapFormat(kind:String):Void;
  public static function unregisterTilesetFormat(kind:String):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
