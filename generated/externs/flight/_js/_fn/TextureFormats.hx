package flight._js._fn;

@:jsRequire("@flighthq/texture-formats")
extern class TextureFormats {
	@:native("detectTextureContainer")
	public static function detectTextureContainer(bytes:Dynamic):Null<Dynamic>;
	@:native("explainTextureContainerParse")
	public static function explainTextureContainerParse(bytes:Dynamic):Null<flight._js.TextureContainerParseExplanation>;
	@:native("getAtfParseFailureReason")
	public static function getAtfParseFailureReason(bytes:Dynamic):Null<Dynamic>;
	@:native("parseAtf")
	public static function parseAtf(bytes:Dynamic):Null<Dynamic>;
	@:native("getBasisParseFailureReason")
	public static function getBasisParseFailureReason(bytes:Dynamic):Null<Dynamic>;
	@:native("parseBasis")
	public static function parseBasis(bytes:Dynamic):Null<flight._js.TextureContainer>;
	@:native("getDdsParseFailureReason")
	public static function getDdsParseFailureReason(bytes:Dynamic):Null<Dynamic>;
	@:native("parseDds")
	public static function parseDds(bytes:Dynamic):Null<flight._js.TextureContainer>;
	@:native("getKtx2ParseFailureReason")
	public static function getKtx2ParseFailureReason(bytes:Dynamic):Null<Dynamic>;
	@:native("parseKtx2")
	public static function parseKtx2(bytes:Dynamic):Null<flight._js.TextureContainer>;
	@:native("computeTextureContainerLevels")
	public static function computeTextureContainerLevels(format:Dynamic, baseWidth:Int, baseHeight:Int, mipLevels:Int, layers:Int, faces:Int, startOffset:Int):Null<flight._js.TextureContainerLevels>;
	@:native("getTextureContainerLevelByteLength")
	public static function getTextureContainerLevelByteLength(format:Dynamic, width:Int, height:Int):Float;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTextureContainerParseExplanation(ptr:flight._js.TextureContainerParseExplanation):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTextureContainer(ptr:flight._js.TextureContainer):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTextureContainerLevels(ptr:flight._js.TextureContainerLevels):Void {}
}
