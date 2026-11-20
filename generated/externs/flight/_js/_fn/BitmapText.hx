package flight._js._fn;

@:jsRequire("@flighthq/bitmaptext")
extern class BitmapText {
	@:native("createBitmapText")
	public static function createBitmapText(glyphSource:Null<Dynamic>):Dynamic;
	@:native("computeBitmapTextLocalBoundsRectangle")
	public static function computeBitmapTextLocalBoundsRectangle(out:flight._js.Rectangle, source:flight._js.BitmapText):Void;
	@:native("getBitmapTextBounds")
	public static function getBitmapTextBounds(source:flight._js.BitmapText):flight._js.Rectangle;
	@:native("getBitmapTextLineCount")
	public static function getBitmapTextLineCount(source:flight._js.BitmapText):Int;
	@:native("isBitmapTextGlyphLayoutStale")
	public static function isBitmapTextGlyphLayoutStale(source:flight._js.BitmapText):Bool;
	@:native("isBitmapTextTruncated")
	public static function isBitmapTextTruncated(source:flight._js.BitmapText):Bool;
	@:native("reserveBitmapText")
	public static function reserveBitmapText(target:flight._js.BitmapText, glyphCapacity:Int):Void;
	@:native("setBitmapTextAlign")
	public static function setBitmapTextAlign(target:flight._js.BitmapText, align:Dynamic):Void;
	@:native("setBitmapTextEllipsis")
	public static function setBitmapTextEllipsis(target:flight._js.BitmapText, ellipsis:String):Void;
	@:native("setBitmapTextGlyphSource")
	public static function setBitmapTextGlyphSource(target:flight._js.BitmapText, glyphSource:Null<Dynamic>):Void;
	@:native("setBitmapTextLetterSpacing")
	public static function setBitmapTextLetterSpacing(target:flight._js.BitmapText, letterSpacing:Float):Void;
	@:native("setBitmapTextLineHeight")
	public static function setBitmapTextLineHeight(target:flight._js.BitmapText, lineHeight:Float):Void;
	@:native("setBitmapTextMaxLines")
	public static function setBitmapTextMaxLines(target:flight._js.BitmapText, maxLines:Null<Int>):Void;
	@:native("setBitmapTextText")
	public static function setBitmapTextText(target:flight._js.BitmapText, text:String):Void;
	@:native("setBitmapTextWrapWidth")
	public static function setBitmapTextWrapWidth(target:flight._js.BitmapText, wrapWidth:Null<Float>):Void;
	@:native("disableBitmapTextGuards")
	public static function disableBitmapTextGuards(guardState:flight._js.BitmapTextGuardState):Void;
	@:native("enableBitmapTextGuards")
	public static function enableBitmapTextGuards(guardState:flight._js.BitmapTextGuardState, logState:Dynamic, clock:Dynamic):Void;
	@:native("explainBitmapTextMissingGlyphs")
	public static function explainBitmapTextMissingGlyphs(glyphSource:Dynamic, text:String):flight._js.BitmapTextMissingGlyphs;
	@:native("refreshBitmapTextGlyphLayout")
	public static function refreshBitmapTextGlyphLayout(bitmapText:flight._js.BitmapText, guardState:flight._js.BitmapTextGuardState):Bool;
	@:native("updateBitmapText")
	public static function updateBitmapText(bitmapText:flight._js.BitmapText, guardState:flight._js.BitmapTextGuardState):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeBitmapTextMissingGlyphs(ptr:flight._js.BitmapTextMissingGlyphs):Void {}
}
