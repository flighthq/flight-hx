package flight._js._fn;

@:jsRequire("flight")
extern class ImageCodec {
	@:native("flight_detect_image_mime_type")
	public static function detectImageMimeType(data:Dynamic, dataLen:Int):String;
}
