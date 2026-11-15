package flight._hl._fn;

extern class TextureFormats {
	@:hlNative("flight", "flight_detect_texture_container")
	public static function detectTextureContainer(bytes:hl.Bytes, bytesLen:Int):Int;
	@:hlNative("flight", "flight_explain_texture_container_parse")
	public static function explainTextureContainerParse(bytes:hl.Bytes, bytesLen:Int):Dynamic;
	@:hlNative("flight", "flight_get_atf_parse_failure_reason")
	public static function getAtfParseFailureReason(bytes:hl.Bytes, bytesLen:Int):Int;
	@:hlNative("flight", "flight_parse_atf")
	public static function parseAtf(bytes:hl.Bytes, bytesLen:Int):Dynamic;
	@:hlNative("flight", "flight_get_basis_parse_failure_reason")
	public static function getBasisParseFailureReason(bytes:hl.Bytes, bytesLen:Int):Int;
	@:hlNative("flight", "flight_parse_basis")
	public static function parseBasis(bytes:hl.Bytes, bytesLen:Int):Dynamic;
	@:hlNative("flight", "flight_get_dds_parse_failure_reason")
	public static function getDdsParseFailureReason(bytes:hl.Bytes, bytesLen:Int):Int;
	@:hlNative("flight", "flight_parse_dds")
	public static function parseDds(bytes:hl.Bytes, bytesLen:Int):Dynamic;
	@:hlNative("flight", "flight_get_ktx2_parse_failure_reason")
	public static function getKtx2ParseFailureReason(bytes:hl.Bytes, bytesLen:Int):Int;
	@:hlNative("flight", "flight_parse_ktx2")
	public static function parseKtx2(bytes:hl.Bytes, bytesLen:Int):Dynamic;
	@:hlNative("flight", "flight_compute_texture_container_levels")
	public static function computeTextureContainerLevels(format:Int, baseWidth:Int, baseHeight:Int, mipLevels:Int, layers:Int, faces:Int, startOffset:Int):Dynamic;
	@:hlNative("flight", "flight_get_texture_container_level_byte_length")
	public static function getTextureContainerLevelByteLength(format:Int, width:Int, height:Int):haxe.Int64;
	@:hlNative("flight", "flight_free_texture_container_parse_explanation")
	public static function freeTextureContainerParseExplanation(ptr:flight._hl.TextureContainerParseExplanation):Void;
	@:hlNative("flight", "flight_free_texture_container")
	public static function freeTextureContainer(ptr:flight._hl.TextureContainer):Void;
	@:hlNative("flight", "flight_free_texture_container_levels")
	public static function freeTextureContainerLevels(ptr:flight._hl.TextureContainerLevels):Void;
}
