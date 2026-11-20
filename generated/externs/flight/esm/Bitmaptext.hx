package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/bitmaptext")
extern class Bitmaptext {
  public static final BitmapTextKind:String;
  public static function computeBitmapTextLocalBoundsRectangle(out:flight.esm.types.geometry.Types.Rectangle, source:flight.esm.types.bitmaptext.Types.BitmapText):Void;
  public static function createBitmapText(glyphSource:Null<flight.esm.types.glyphatlas_contract.Types.GlyphSource>, ?options:Null<flight.esm.types.bitmaptext.Types.BitmapTextOptions>):flight.esm.types.bitmaptext.Types.BitmapText;
  public static function disableBitmapTextGuards():Void;
  public static function enableBitmapTextGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function explainBitmapTextMissingGlyphs(glyphSource:flight.esm.types.glyphatlas_contract.Types.GlyphSource, text:String):flight.esm.types.bitmaptext.Types.BitmapTextMissingGlyphs;
  public static function getBitmapTextBounds(source:flight.esm.types.bitmaptext.Types.BitmapText):flight.esm.types.geometry.Types.Rectangle;
  public static function getBitmapTextLineCount(source:flight.esm.types.bitmaptext.Types.BitmapText):Float;
  public static function getBitmapTextPages(source:flight.esm.types.bitmaptext.Types.BitmapText):Array<flight.esm.types.bitmaptext.Types.BitmapTextPage>;
  public static function isBitmapTextGlyphLayoutStale(source:flight.esm.types.bitmaptext.Types.BitmapText):Bool;
  public static function isBitmapTextTruncated(source:flight.esm.types.bitmaptext.Types.BitmapText):Bool;
  public static function refreshBitmapTextGlyphLayout(bitmapText:flight.esm.types.bitmaptext.Types.BitmapText):Bool;
  public static function reserveBitmapText(target:flight.esm.types.bitmaptext.Types.BitmapText, glyphCapacity:Float):Void;
  public static function setBitmapTextAlign(target:flight.esm.types.bitmaptext.Types.BitmapText, align:flight.esm.types.bitmaptext.Types.BitmapTextAlign):Void;
  public static function setBitmapTextEllipsis(target:flight.esm.types.bitmaptext.Types.BitmapText, ellipsis:String):Void;
  public static function setBitmapTextGlyphSource(target:flight.esm.types.bitmaptext.Types.BitmapText, glyphSource:Null<flight.esm.types.glyphatlas_contract.Types.GlyphSource>):Void;
  public static function setBitmapTextLetterSpacing(target:flight.esm.types.bitmaptext.Types.BitmapText, letterSpacing:Float):Void;
  public static function setBitmapTextLineHeight(target:flight.esm.types.bitmaptext.Types.BitmapText, lineHeight:Float):Void;
  public static function setBitmapTextMaxLines(target:flight.esm.types.bitmaptext.Types.BitmapText, maxLines:Null<Float>):Void;
  public static function setBitmapTextMissingGlyphGuard(guard:Null<((codepoint:Float) -> Void)>):Void;
  public static function setBitmapTextText(target:flight.esm.types.bitmaptext.Types.BitmapText, text:String):Void;
  public static function setBitmapTextWrapWidth(target:flight.esm.types.bitmaptext.Types.BitmapText, wrapWidth:Null<Float>):Void;
  public static function updateBitmapText(bitmapText:flight.esm.types.bitmaptext.Types.BitmapText):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
