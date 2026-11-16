package flight._cpp._fn;

extern class Encoding {
	@:native("flight_decode_utf8")
	public static function decodeUtf8(bytes:cpp.Star<cpp.Void>, bytesLen:Int, offset:haxe.Int64, length:haxe.Int64):cpp.ConstCharStar;
	@:native("flight_encode_utf8")
	public static function encodeUtf8(text:cpp.ConstCharStar):flight._cpp.NativeByteBuffer;
}
