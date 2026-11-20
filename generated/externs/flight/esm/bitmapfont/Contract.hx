package flight.esm.bitmapfont;

#if (js && flight_esm)
@:jsRequire("@flighthq/bitmapfont/contract")
extern class Contract {
  public static function createBitmapFont(data:flight.esm.types.bitmapfont_contract.Types.BitmapFontData):flight.esm.types.bitmapfont_contract.Types.BitmapFont;
  public static function createBitmapFontFromGlyphAtlas(atlas:flight.esm.types.glyphatlas_contract.Types.GlyphAtlas):flight.esm.types.bitmapfont_contract.Types.BitmapFont;
  public static function createGlyphSourceFromBitmapFont(font:flight.esm.types.bitmapfont_contract.Types.BitmapFont):flight.esm.types.glyphatlas_contract.Types.GlyphSource;
  public static function disableBitmapFontGuards():Void;
  public static function enableBitmapFontGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function explainBitmapFontGlyph(font:flight.esm.types.bitmapfont_contract.Types.BitmapFont, codepoint:Float):flight.esm.types.bitmapfont_contract.Types.BitmapFontGlyphExplanation;
  public static function getBitmapFontGlyph(font:flight.esm.types.bitmapfont_contract.Types.BitmapFont, codepoint:Float):Null<flight.esm.types.glyphatlas_contract.Types.GlyphEntry>;
  public static function getBitmapFontKerning(font:flight.esm.types.bitmapfont_contract.Types.BitmapFont, left:Float, right:Float):Float;
  public static function getBitmapFontMetrics(font:flight.esm.types.bitmapfont_contract.Types.BitmapFont):flight.esm.types.font.Types.GlyphMetrics;
  public static function getBitmapFontPage(font:flight.esm.types.bitmapfont_contract.Types.BitmapFont, ?page:Float):Null<flight.esm.types.textureatlas_contract.Types.TextureAtlas>;
  public static function getBitmapFontPages(font:flight.esm.types.bitmapfont_contract.Types.BitmapFont):Array<Null<flight.esm.types.textureatlas_contract.Types.TextureAtlas>>;
  public static function hasBitmapFontGlyph(font:flight.esm.types.bitmapfont_contract.Types.BitmapFont, codepoint:Float):Bool;
  public static function initializeBitmapFont(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.bitmapfont_contract.Types.BitmapFont>, data:flight.esm.types.bitmapfont_contract.Types.BitmapFontData):Void;
  public static function initializeGlyphSourceFromBitmapFont(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.glyphatlas_contract.Types.GlyphSource>, font:flight.esm.types.bitmapfont_contract.Types.BitmapFont):Void;
  public static function packBitmapFontKerningKey(left:Float, right:Float):Float;
  public static function setBitmapFontGuard(guard:Null<((reason:String, codepoint:Float, page:Float) -> Void)>):Void;
  public static function summarizeBitmapFont(font:flight.esm.types.bitmapfont_contract.Types.BitmapFont):flight.esm.types.bitmapfont_contract.Types.BitmapFontSummary;
  public static function unpackBitmapFontKerningKey(key:Float, out:flight.esm.types.bitmapfont_contract.Types.BitmapFontKerningPair):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
