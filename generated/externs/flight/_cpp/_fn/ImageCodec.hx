package flight._cpp._fn;

extern class ImageCodec {
	@:native("flight_detect_image_mime_type")
	public static function detectImageMimeType(data:cpp.Star<cpp.Void>, dataLen:Int):cpp.ConstCharStar;
}
