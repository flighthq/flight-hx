package flight.esm.glyphatlas;

#if (js && flight_esm)
@:jsRequire("@flighthq/glyphatlas/contract")
extern class Contract {
  public static function allocateStubGlyphRasterizerBackend():flight.esm.types.font.Types.HostGlyphRasterizerCapability;
  public static function clearGlyphAtlasDirty(atlas:flight.esm.types.glyphatlas_contract.Types.GlyphAtlas):Void;
  public static function createGlyphAtlas(options:flight.esm.types.glyphatlas_contract.Types.GlyphAtlasOptions):flight.esm.types.glyphatlas_contract.Types.GlyphAtlas;
  public static function createGlyphSourceFromGlyphAtlas(atlas:flight.esm.types.glyphatlas_contract.Types.GlyphAtlas):flight.esm.types.glyphatlas_contract.Types.GlyphSource;
  public static function deriveGlyphMetricsFromFontSize(fontSize:Float):flight.esm.types.font.Types.GlyphMetrics;
  public static function disableGlyphAtlasGuards():Void;
  public static function disposeGlyphAtlas(atlas:flight.esm.types.glyphatlas_contract.Types.GlyphAtlas):Void;
  public static function enableGlyphAtlasGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function explainGlyphAtlasEntry(atlas:flight.esm.types.glyphatlas_contract.Types.GlyphAtlas, codepoint:Float):flight.esm.types.glyphatlas_contract.Types.GlyphAtlasEntryExplanation;
  public static function getGlyphAtlasBitmap(atlas:flight.esm.types.glyphatlas_contract.Types.GlyphAtlas):flight.esm.types.bitmap.Types.Bitmap;
  public static function getGlyphAtlasDirtyRegion(atlas:flight.esm.types.glyphatlas_contract.Types.GlyphAtlas):Null<flight.esm.types.geometry.Types.Rectangle>;
  public static function getGlyphAtlasEntry(atlas:flight.esm.types.glyphatlas_contract.Types.GlyphAtlas, codepoint:Float):Null<flight.esm.types.glyphatlas_contract.Types.GlyphEntry>;
  public static function getGlyphAtlasKerning(_atlas:flight.esm.types.glyphatlas_contract.Types.GlyphAtlas, _left:Float, _right:Float):Float;
  public static function getGlyphAtlasLayoutVersion(atlas:flight.esm.types.glyphatlas_contract.Types.GlyphAtlas):Float;
  public static function getGlyphAtlasMetrics(atlas:flight.esm.types.glyphatlas_contract.Types.GlyphAtlas):flight.esm.types.font.Types.GlyphMetrics;
  public static function initializeGlyphAtlas(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.glyphatlas_contract.Types.GlyphAtlas>, options:flight.esm.types.glyphatlas_contract.Types.GlyphAtlasOptions):Void;
  public static function initializeGlyphSourceFromGlyphAtlas(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.glyphatlas_contract.Types.GlyphSource>, atlas:flight.esm.types.glyphatlas_contract.Types.GlyphAtlas):Void;
  public static function initializeStubGlyphRasterizerBackend(out:flight.esm.types.font.Types.HostGlyphRasterizerCapability):Void;
  public static function setGlyphAtlasEntryGuard(guard:Null<((reason:String, subject:Float) -> Void)>):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
