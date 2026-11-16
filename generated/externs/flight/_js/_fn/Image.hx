package flight._js._fn;

@:jsRequire("@flighthq/image")
extern class Image {
	@:native("asImageResourceRef")
	public static function asImageResourceRef(source:flight._js.TextureSourceRef):Null<Dynamic>;
	@:native("cloneImageResource")
	public static function cloneImageResource(resource:Dynamic):Dynamic;
	@:native("invalidateImageResource")
	public static function invalidateImageResource(resource:Dynamic, state:flight._js.ImageResolverState):Void;
	@:native("isImageResourceEmpty")
	public static function isImageResourceEmpty(resource:Dynamic):Bool;
	@:native("createImageResourceFromBitmap")
	public static function createImageResourceFromBitmap(hostImage:flight._js.HostImageCapability, bitmap:flight._js.Bitmap):Null<Dynamic>;
	@:native("createImageResourceFromSurface")
	public static function createImageResourceFromSurface(hostImage:flight._js.HostImageCapability, surface:flight._js.SurfaceRef):Null<Dynamic>;
	@:native("captureBitmapFromImageResource")
	public static function captureBitmapFromImageResource(hostBitmapReadback:flight._js.HostBitmapReadbackCapability, resource:Dynamic):Null<flight._js.Bitmap>;
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
	@:native("createImageResolverState")
	public static function createImageResolverState():flight._js.ImageResolverState;
	@:native("createTextureFromImageResource")
	public static function createTextureFromImageResource(reference:flight._js.ImageResourceReference, opts:Null<flight._js.CreateTexture2DOptions>):Dynamic;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeImageResourceReferenceResolutionExplanation(ptr:flight._js.ImageResourceReferenceResolutionExplanation):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeImageResolverState(ptr:flight._js.ImageResolverState):Void {}
}
