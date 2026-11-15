package flight._hl._fn;

extern class Encoding {
	@:hlNative("flight", "flight_decode_utf8")
	public static function decodeUtf8(bytes:hl.Bytes, bytesLen:Int, offset:Int, length:Int):hl.Bytes;
	@:hlNative("flight", "flight_encode_utf8")
	public static function encodeUtf8(text:hl.Bytes):Dynamic;
}
