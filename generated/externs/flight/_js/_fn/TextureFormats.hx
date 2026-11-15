package flight._js._fn;

@:jsRequire("flight")
extern class TextureFormats {
	@:native("flight_detect_texture_container")
	public static function detectTextureContainer(bytes:Dynamic, bytesLen:Int):Int;
	@:native("flight_explain_texture_container_parse")
	public static function explainTextureContainerParse(bytes:Dynamic, bytesLen:Int):Dynamic;
	@:native("flight_get_atf_parse_failure_reason")
	public static function getAtfParseFailureReason(bytes:Dynamic, bytesLen:Int):Int;
	@:native("flight_parse_atf")
	public static function parseAtf(bytes:Dynamic, bytesLen:Int):Dynamic;
	@:native("flight_get_basis_parse_failure_reason")
	public static function getBasisParseFailureReason(bytes:Dynamic, bytesLen:Int):Int;
	@:native("flight_parse_basis")
	public static function parseBasis(bytes:Dynamic, bytesLen:Int):Dynamic;
	@:native("flight_get_dds_parse_failure_reason")
	public static function getDdsParseFailureReason(bytes:Dynamic, bytesLen:Int):Int;
	@:native("flight_parse_dds")
	public static function parseDds(bytes:Dynamic, bytesLen:Int):Dynamic;
	@:native("flight_get_ktx2_parse_failure_reason")
	public static function getKtx2ParseFailureReason(bytes:Dynamic, bytesLen:Int):Int;
	@:native("flight_parse_ktx2")
	public static function parseKtx2(bytes:Dynamic, bytesLen:Int):Dynamic;
	@:native("flight_compute_texture_container_levels")
	public static function computeTextureContainerLevels(format:Int, baseWidth:Int, baseHeight:Int, mipLevels:Int, layers:Int, faces:Int, startOffset:Int):Dynamic;
	@:native("flight_get_texture_container_level_byte_length")
	public static function getTextureContainerLevelByteLength(format:Int, width:Int, height:Int):haxe.Int64;
	@:native("flight_free_texture_container_parse_explanation")
	public static function freeTextureContainerParseExplanation(ptr:flight._js.TextureContainerParseExplanation):Void;
	@:native("flight_free_texture_container")
	public static function freeTextureContainer(ptr:flight._js.TextureContainer):Void;
	@:native("flight_free_texture_container_levels")
	public static function freeTextureContainerLevels(ptr:flight._js.TextureContainerLevels):Void;
}
