package flight._hl._fn;

extern class Encoding {
	@:hlNative("flight", "flight_decode_utf8")
	public static function decodeUtf8(bytes:hl.Bytes, bytesLen:Int, offset:haxe.Int64, length:haxe.Int64):hl.Bytes;
	@:hlNative("flight", "flight_encode_utf8")
	public static function encodeUtf8(text:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_encode_utf8_result_len")
	public static function encodeUtf8ResultLen(result:hl.Bytes):Int;
	@:hlNative("flight", "flight_encode_utf8_result_get")
	public static function encodeUtf8ResultGet(result:hl.Bytes, index:Int):hl.Bytes;
	@:hlNative("flight", "flight_encode_utf8_result_free")
	public static function encodeUtf8ResultFree(result:hl.Bytes):Void;
}

final class EncodeUtf8ByteResult extends flight._hl.ByteResult {
	var handle:hl.Bytes;

	public function new(handle:hl.Bytes) {
		super(Encoding.encodeUtf8ResultLen(handle));
		this.handle = handle;
	}

	override function freeNative():Void {
		Encoding.encodeUtf8ResultFree(handle);
	}

	override function readNative(index:Int):Int {
		return Encoding.encodeUtf8ResultGet(handle, index).getUI8(0);
	}
}
