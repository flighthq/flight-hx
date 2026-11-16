package flight._js._fn;

@:jsRequire("@flighthq/encoding")
extern class Encoding {
	@:native("decodeUtf8")
	public static function decodeUtf8(bytes:Dynamic, offset:Null<Int>, length:Null<Int>):String;
	@:native("encodeUtf8")
	public static function encodeUtf8(text:String):Dynamic;
}
