package flight.esm.spritesheet_formats;

#if (js && flight_esm)
@:jsRequire("@flighthq/spritesheet-formats/contract")
extern class Contract {
  public static final SpritesheetFormatKindAseprite:String;
  public static final SpritesheetFormatKindCocosPlist:String;
  public static final SpritesheetFormatKindLibgdxAtlas:String;
  public static final SpritesheetFormatKindStarling:String;
  public static final SpritesheetFormatKindTexturePacker:String;
  public static function applySpritesheetImportOptions(options:flight.esm.types.spritesheet_formats.Types.SpritesheetImportOptions):Void;
  public static final asepriteSpritesheetFormat:flight.esm.types.spritesheet_formats.Types.SpritesheetFormatDescriptor;
  public static final cocosPlistSpritesheetFormat:flight.esm.types.spritesheet_formats.Types.SpritesheetFormatDescriptor;
  public static function detectSpritesheetFormat(text:String):Null<String>;
  public static function formatLibgdxAtlas(data:flight.esm.types.spritesheet.Types.SpritesheetData):String;
  public static function getSpritesheetFormat(kind:String):Dynamic;
  public static function getSpritesheetFormatKinds():Array<String>;
  public static final libgdxAtlasSpritesheetFormat:flight.esm.types.spritesheet_formats.Types.SpritesheetFormatDescriptor;
  public static function parseAsepriteSpritesheet(json:String, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):flight.esm.types.spritesheet.Types.SpritesheetData;
  public static function parseAsepriteSpritesheetDocument(json:String, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):flight.esm.types.spritesheet_formats.Types.AsepriteParsed;
  public static function parseCocosPlistSpritesheet(xml:String, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):flight.esm.types.spritesheet.Types.SpritesheetData;
  public static function parseCocosPlistSpritesheetDocument(xml:String, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):flight.esm.types.spritesheet_formats.Types.CocosPlistParsed;
  public static function parseLibgdxAtlasSpritesheet(text:String, ?options:Null<flight.esm.types.spritesheet_formats.Types.LibgdxAtlasParseOptions>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):flight.esm.types.spritesheet.Types.SpritesheetData;
  public static function parseSpritesheet(text:String, ?formatKind:Null<String>, ?options:Null<flight.esm.types.spritesheet_formats.Types.SpritesheetParseOptions>):Null<flight.esm.types.spritesheet.Types.SpritesheetData>;
  public static function parseStarlingSpritesheet(xml:String, ?options:Null<flight.esm.types.spritesheet_formats.Types.StarlingParseOptions>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):flight.esm.types.spritesheet.Types.SpritesheetData;
  public static function parseStarlingSpritesheetDocument(xml:String, ?options:Null<flight.esm.types.spritesheet_formats.Types.StarlingParseOptions>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):flight.esm.types.spritesheet_formats.Types.StarlingParsed;
  public static function parseTexturePackerSpritesheet(json:String, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):flight.esm.types.spritesheet.Types.SpritesheetData;
  public static function parseTexturePackerSpritesheetDocument(json:String, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):flight.esm.types.spritesheet_formats.Types.TexturePackerParsed;
  public static function registerSpritesheetFormat(kind:String, entry:Dynamic):Void;
  public static function serializeAsepriteSpritesheet(data:flight.esm.types.spritesheet.Types.SpritesheetData, ?existing:Dynamic, ?options:Null<flight.esm.types.spritesheet_formats.Types.AsepriteSerializeOptions>):String;
  public static function serializeCocosPlistSpritesheet(data:flight.esm.types.spritesheet.Types.SpritesheetData, ?existing:Dynamic):String;
  public static function serializeStarlingSpritesheet(data:flight.esm.types.spritesheet.Types.SpritesheetData, ?existing:Dynamic):String;
  public static function serializeTexturePackerSpritesheet(data:flight.esm.types.spritesheet.Types.SpritesheetData, ?existing:Dynamic, ?options:Null<flight.esm.types.spritesheet_formats.Types.TexturePackerSerializeOptions>):String;
  public static final spritesheetAllFormats:Array<flight.esm.types.spritesheet_formats.Types.SpritesheetFormatDescriptor>;
  public static final starlingSpritesheetFormat:flight.esm.types.spritesheet_formats.Types.SpritesheetFormatDescriptor;
  public static final texturePackerSpritesheetFormat:flight.esm.types.spritesheet_formats.Types.SpritesheetFormatDescriptor;
  public static function unregisterSpritesheetFormat(kind:String):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
