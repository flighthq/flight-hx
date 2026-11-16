package flight._js._fn;

@:jsRequire("flight")
extern class Encoding {
	@:native("flight_decode_utf8")
	public static function decodeUtf8(bytes:Dynamic, bytesLen:Int, offset:haxe.Int64, length:haxe.Int64):String;
	@:native("flight_encode_utf8")
	public static function encodeUtf8(text:String):Dynamic;
}
