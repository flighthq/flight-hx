package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/bitmapfont-formats")
extern class BitmapfontFormats {
  public static final BITMAP_FONT_REQUIREMENT_KEY_NAMESPACE:String;
  public static final BitmapFontFormatKindBmFontBinary:String;
  public static final BitmapFontFormatKindBmFontJson:String;
  public static final BitmapFontFormatKindBmFontText:String;
  public static final BitmapFontFormatKindBmFontXml:String;
  public static function applyBitmapFontImportOptions(options:flight.esm.types.bitmapfont_formats.Types.BitmapFontImportOptions):Void;
  public static final bitmapFontAllFormats:Array<flight.esm.types.bitmapfont_formats.Types.BitmapFontFormatDescriptor>;
  public static final bmFontBinaryFormat:flight.esm.types.bitmapfont_formats.Types.BitmapFontFormatDescriptor;
  public static final bmFontJsonFormat:flight.esm.types.bitmapfont_formats.Types.BitmapFontFormatDescriptor;
  public static final bmFontTextFormat:flight.esm.types.bitmapfont_formats.Types.BitmapFontFormatDescriptor;
  public static final bmFontXmlFormat:flight.esm.types.bitmapfont_formats.Types.BitmapFontFormatDescriptor;
  public static function detectBitmapFontFormat(bytes:js.lib.Uint8Array):Null<String>;
  public static function explainBitmapFontParse(text:String, ?options:Null<flight.esm.types.bitmapfont_contract.Types.BitmapFontParseOptions>):flight.esm.types.bitmapfont_formats.Types.BitmapFontParseExplanation;
  public static function formatBitmapFontFnt(font:flight.esm.types.bitmapfont_contract.Types.BitmapFont):String;
  public static function getBitmapFontFormat(kind:String):Null<flight.esm.types.bitmapfont_formats.Types.BitmapFontFormatEntry>;
  public static function getBitmapFontFormatKinds():Array<String>;
  public static function parseBitmapFont(bytes:js.lib.Uint8Array, ?formatKind:Null<String>, ?options:Null<flight.esm.types.bitmapfont_contract.Types.BitmapFontParseOptions>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Null<flight.esm.types.bitmapfont_contract.Types.BitmapFont>;
  public static function parseBitmapFontBinary(bytes:js.lib.Uint8Array, ?options:Null<flight.esm.types.bitmapfont_contract.Types.BitmapFontParseOptions>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Null<flight.esm.types.bitmapfont_contract.Types.BitmapFont>;
  public static function parseBitmapFontFnt(text:String, ?options:Null<flight.esm.types.bitmapfont_contract.Types.BitmapFontParseOptions>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Null<flight.esm.types.bitmapfont_contract.Types.BitmapFont>;
  public static function parseBitmapFontJson(text:String, ?options:Null<flight.esm.types.bitmapfont_contract.Types.BitmapFontParseOptions>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Null<flight.esm.types.bitmapfont_contract.Types.BitmapFont>;
  public static function parseBitmapFontXml(text:String, ?options:Null<flight.esm.types.bitmapfont_contract.Types.BitmapFontParseOptions>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Null<flight.esm.types.bitmapfont_contract.Types.BitmapFont>;
  public static function readBitmapFontFormatKind(bytes:js.lib.Uint8Array):Null<String>;
  public static function registerBitmapFontFormat(kind:String, entry:flight.esm.types.bitmapfont_formats.Types.BitmapFontFormatEntry):Void;
  public static function unregisterBitmapFontFormat(kind:String):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
