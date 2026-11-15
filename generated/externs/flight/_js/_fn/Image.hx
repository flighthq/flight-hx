package flight._js._fn;

@:jsRequire("flight")
extern class Image {
	@:native("flight_as_image_resource_ref")
	public static function asImageResourceRef(source:flight._js.TextureSourceRef):Dynamic;
	@:native("flight_clone_image_resource")
	public static function cloneImageResource(resource:Dynamic):Dynamic;
	@:native("flight_invalidate_image_resource")
	public static function invalidateImageResource(resource:Dynamic, state:flight._js.ImageResolverState):Void;
	@:native("flight_is_image_resource_empty")
	public static function isImageResourceEmpty(resource:Dynamic):Bool;
	@:native("flight_create_image_resource_from_bitmap")
	public static function createImageResourceFromBitmap(hostImage:flight._js.HostImageCapability, bitmap:flight._js.Bitmap):Dynamic;
	@:native("flight_create_image_resource_from_surface")
	public static function createImageResourceFromSurface(hostImage:flight._js.HostImageCapability, surface:flight._js.SurfaceRef):Dynamic;
	@:native("flight_capture_bitmap_from_image_resource")
	public static function captureBitmapFromImageResource(hostBitmapReadback:flight._js.HostBitmapReadbackCapability, resource:Dynamic):Dynamic;
	@:native("flight_is_image_url_same_origin")
	public static function isImageUrlSameOrigin(url:String, context:flight._js.ImageUrlOriginContext):Bool;
	@:native("flight_create_external_image_resource_reference")
	public static function createExternalImageResourceReference(uri:String):Dynamic;
	@:native("flight_create_image_resource_failure")
	public static function createImageResourceFailure(cause:flight._js.Unknown):Dynamic;
	@:native("flight_explain_image_resource_reference_resolution")
	public static function explainImageResourceReferenceResolution(reference:flight._js.ImageResourceReference):flight._js.ImageResourceReferenceResolutionExplanation;
	@:native("flight_reset_failed_image_resource_reference")
	public static function resetFailedImageResourceReference(reference:flight._js.ImageResourceReference):Bool;
	@:native("flight_create_image_resolver_state")
	public static function createImageResolverState():flight._js.ImageResolverState;
	@:native("flight_create_texture_from_image_resource")
	public static function createTextureFromImageResource(reference:flight._js.ImageResourceReference, opts:flight._js.CreateTexture2DOptions):Dynamic;
	@:native("flight_free_image_resource_reference_resolution_explanation")
	public static function freeImageResourceReferenceResolutionExplanation(ptr:flight._js.ImageResourceReferenceResolutionExplanation):Void;
	@:native("flight_free_image_resolver_state")
	public static function freeImageResolverState(ptr:flight._js.ImageResolverState):Void;
}
