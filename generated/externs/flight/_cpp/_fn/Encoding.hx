package flight._cpp._fn;

extern class Encoding {
	@:native("flight_decode_utf8")
	public static function decodeUtf8(bytes:cpp.Star<cpp.Void>, bytesLen:Int, offset:haxe.Int64, length:haxe.Int64):cpp.ConstCharStar;
	@:native("flight_encode_utf8")
	public static function encodeUtf8(text:cpp.ConstCharStar):cpp.Star<cpp.Void>;
	@:native("flight_encode_utf8_result_len")
	public static function encodeUtf8ResultLen(result:cpp.Star<cpp.Void>):Int;
	@:native("flight_encode_utf8_result_get")
	public static function encodeUtf8ResultGet(result:cpp.Star<cpp.Void>, index:Int):cpp.Star<cpp.Void>;
	@:native("flight_encode_utf8_result_free")
	public static function encodeUtf8ResultFree(result:cpp.Star<cpp.Void>):Void;
}

final class EncodeUtf8ByteResult extends flight._cpp.ByteResult {
	var handle:cpp.Pointer<cpp.Void>;

	public function new(handle:cpp.Pointer<cpp.Void>) {
		super(Encoding.encodeUtf8ResultLen(handle.ptr));
		this.handle = handle;
	}

	override function freeNative():Void {
		Encoding.encodeUtf8ResultFree(handle.ptr);
	}

	override function readNative(index:Int):Int {
		return untyped __cpp__("(int)*(const unsigned char *)({0})", Encoding.encodeUtf8ResultGet(handle.ptr, index));
	}
}
