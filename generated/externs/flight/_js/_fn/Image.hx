package flight._js._fn;

@:jsRequire("@flighthq/image")
extern class Image {
	@:native("cloneImageResource")
	public static function cloneImageResource(resource:Dynamic):Dynamic;
	@:native("invalidateImageResource")
	public static function invalidateImageResource(resource:Dynamic, state:flight._js.ImageResolverState):Void;
	@:native("isImageResourceEmpty")
	public static function isImageResourceEmpty(resource:Dynamic):Bool;
	@:native("createImageResourceFromBitmap")
	public static function createImageResourceFromBitmap(hostImage:flight._js.HostImageCapability, bitmap:flight._js.Bitmap):Null<Dynamic>;
	@:native("isImageUrlSameOrigin")
	public static function isImageUrlSameOrigin(url:String, context:flight._js.ImageUrlOriginContext):Bool;
	@:native("createExternalImageResourceReference")
	public static function createExternalImageResourceReference(uri:String):Dynamic;
	@:native("createImageResourceFailure")
	public static function createImageResourceFailure(cause:flight._js.Unknown):Dynamic;
	@:native("explainImageResourceReferenceResolution")
	public static function explainImageResourceReferenceResolution(reference:flight._js.ImageResourceReference):flight._js.ImageResourceReferenceResolutionExplanation;
	@:native("resetFailedImageResourceReference")
	public static function resetFailedImageResourceReference(reference:flight._js.ImageResourceReference):Bool;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeImageResourceReferenceResolutionExplanation(ptr:flight._js.ImageResourceReferenceResolutionExplanation):Void {}
}
