package flight._js._fn;

@:jsRequire("@flighthq/image-codec")
extern class ImageCodec {
	@:native("detectImageMimeType")
	public static function detectImageMimeType(data:Dynamic):Null<String>;
}
