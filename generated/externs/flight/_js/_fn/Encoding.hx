package flight._js._fn;

@:jsRequire("@flighthq/encoding")
extern class Encoding {
	@:native("decodeUTF8")
	public static function decodeUtf8(bytes:Dynamic, offset:Null<Int>, length:Null<Int>):String;
	@:native("encodeUTF8")
	public static function encodeUtf8(text:String):flight._js.ByteResult;
}
