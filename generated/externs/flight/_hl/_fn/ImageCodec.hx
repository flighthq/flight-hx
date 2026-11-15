package flight._hl._fn;

extern class ImageCodec {
	@:hlNative("flight", "flight_detect_image_mime_type")
	public static function detectImageMimeType(data:hl.Bytes, dataLen:Int):hl.Bytes;
}
