package flight._cpp._fn;

extern class TextureFormats {
	@:native("flight_detect_texture_container")
	public static function detectTextureContainer(bytes:cpp.Star<cpp.Void>, bytesLen:Int):Int;
	@:native("flight_explain_texture_container_parse")
	public static function explainTextureContainerParse(bytes:cpp.Star<cpp.Void>, bytesLen:Int):flight._cpp.TextureContainerParseExplanation;
	@:native("flight_get_atf_parse_failure_reason")
	public static function getAtfParseFailureReason(bytes:cpp.Star<cpp.Void>, bytesLen:Int):Int;
	@:native("flight_parse_atf")
	public static function parseAtf(bytes:cpp.Star<cpp.Void>, bytesLen:Int):cpp.Star<cpp.Void>;
	@:native("flight_get_basis_parse_failure_reason")
	public static function getBasisParseFailureReason(bytes:cpp.Star<cpp.Void>, bytesLen:Int):Int;
	@:native("flight_parse_basis")
	public static function parseBasis(bytes:cpp.Star<cpp.Void>, bytesLen:Int):flight._cpp.TextureContainer;
	@:native("flight_get_dds_parse_failure_reason")
	public static function getDdsParseFailureReason(bytes:cpp.Star<cpp.Void>, bytesLen:Int):Int;
	@:native("flight_parse_dds")
	public static function parseDds(bytes:cpp.Star<cpp.Void>, bytesLen:Int):flight._cpp.TextureContainer;
	@:native("flight_get_ktx2_parse_failure_reason")
	public static function getKtx2ParseFailureReason(bytes:cpp.Star<cpp.Void>, bytesLen:Int):Int;
	@:native("flight_parse_ktx2")
	public static function parseKtx2(bytes:cpp.Star<cpp.Void>, bytesLen:Int):flight._cpp.TextureContainer;
	@:native("flight_compute_texture_container_levels")
	public static function computeTextureContainerLevels(format:Int, baseWidth:Int, baseHeight:Int, mipLevels:Int, layers:Int, faces:Int, startOffset:Int):flight._cpp.TextureContainerLevels;
	@:native("flight_get_texture_container_level_byte_length")
	public static function getTextureContainerLevelByteLength(format:Int, width:Int, height:Int):haxe.Int64;
	@:native("flight_free_texture_container_parse_explanation")
	public static function freeTextureContainerParseExplanation(ptr:flight._cpp.TextureContainerParseExplanation):Void;
	@:native("flight_free_texture_container")
	public static function freeTextureContainer(ptr:flight._cpp.TextureContainer):Void;
	@:native("flight_free_texture_container_levels")
	public static function freeTextureContainerLevels(ptr:flight._cpp.TextureContainerLevels):Void;
}
