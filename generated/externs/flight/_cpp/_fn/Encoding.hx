package flight._cpp._fn;

extern class Encoding {
	@:native("flight_decode_utf8")
	public static function decodeUtf8(bytes:cpp.Star<cpp.Void>, bytesLen:Int, offset:Int, length:Int):cpp.ConstCharStar;
	@:native("flight_encode_utf8")
	public static function encodeUtf8(text:cpp.ConstCharStar):cpp.Star<cpp.Void>;
}
