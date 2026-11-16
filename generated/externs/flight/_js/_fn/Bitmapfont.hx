package flight._js._fn;

@:jsRequire("@flighthq/bitmapfont")
extern class Bitmapfont {
	@:native("createBitmapFont")
	public static function createBitmapFont(guardState:flight._js.BitmapFontGuardStateRef, data:flight._js.BitmapFontData):Dynamic;
	@:native("createBitmapFontGuardState")
	public static function createBitmapFontGuardState():flight._js.BitmapFontGuardStateRef;
	@:native("getBitmapFontGlyph")
	public static function getBitmapFontGlyph(font:Dynamic, codepoint:Int):Null<Dynamic>;
	@:native("getBitmapFontKerning")
	public static function getBitmapFontKerning(font:Dynamic, left:Int, right:Int):Float;
	@:native("getBitmapFontPage")
	public static function getBitmapFontPage(font:Dynamic, page:Null<Int>):Null<Dynamic>;
	@:native("hasBitmapFontGlyph")
	public static function hasBitmapFontGlyph(font:Dynamic, codepoint:Int):Bool;
	@:native("packBitmapFontKerningKey")
	public static function packBitmapFontKerningKey(left:Int, right:Int):Float;
	@:native("unpackBitmapFontKerningKey")
	public static function unpackBitmapFontKerningKey(out:flight._js.BitmapFontKerningPair, key:Float):Void;
	@:native("createBitmapFontFromGlyphAtlas")
	public static function createBitmapFontFromGlyphAtlas(guardState:flight._js.BitmapFontGuardStateRef, atlas:Dynamic):Dynamic;
	@:native("createGlyphSourceFromBitmapFont")
	public static function createGlyphSourceFromBitmapFont(font:Dynamic):Dynamic;
	@:native("getBitmapFontEncodingString")
	public static function getBitmapFontEncodingString(value:Dynamic):String;
	@:native("getBitmapFontGlyphExplanationReasonString")
	public static function getBitmapFontGlyphExplanationReasonString(value:Dynamic):String;
	@:native("getBitmapFontGuardLogKeyString")
	public static function getBitmapFontGuardLogKeyString(value:flight._js.BitmapFontGuardLogKey):String;
	@:native("getBitmapFontGuardReasonString")
	public static function getBitmapFontGuardReasonString(value:flight._js.BitmapFontGuardReason):String;
	@:native("parseBitmapFontEncoding")
	public static function parseBitmapFontEncoding(value:String):Null<Dynamic>;
	@:native("parseBitmapFontGlyphExplanationReason")
	public static function parseBitmapFontGlyphExplanationReason(value:String):Null<Dynamic>;
	@:native("parseBitmapFontGuardLogKey")
	public static function parseBitmapFontGuardLogKey(value:String):Null<flight._js.BitmapFontGuardLogKey>;
	@:native("parseBitmapFontGuardReason")
	public static function parseBitmapFontGuardReason(value:String):Null<flight._js.BitmapFontGuardReason>;
	@:native("disableBitmapFontGuards")
	public static function disableBitmapFontGuards(guardState:flight._js.BitmapFontGuardStateRef):Void;
	@:native("enableBitmapFontGuards")
	public static function enableBitmapFontGuards(guardState:flight._js.BitmapFontGuardStateRef, logState:Dynamic, clock:flight._js.BitmapFontClock):Void;
	@:native("explainBitmapFontGlyph")
	public static function explainBitmapFontGlyph(font:Dynamic, codepoint:Int):flight._js.BitmapFontGlyphExplanation;
	@:native("summarizeBitmapFont")
	public static function summarizeBitmapFont(font:Dynamic):flight._js.BitmapFontSummary;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeBitmapFontGuardStateRef(ptr:flight._js.BitmapFontGuardStateRef):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeBitmapFontGuardLogKey(ptr:flight._js.BitmapFontGuardLogKey):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeBitmapFontGuardReason(ptr:flight._js.BitmapFontGuardReason):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeBitmapFontGlyphExplanation(ptr:flight._js.BitmapFontGlyphExplanation):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeBitmapFontSummary(ptr:flight._js.BitmapFontSummary):Void {}
}
