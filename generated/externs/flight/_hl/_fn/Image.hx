package flight._hl._fn;

extern class Image {
	@:hlNative("flight", "flight_as_image_resource_ref")
	public static function asImageResourceRef(source:flight._hl.TextureSourceRef):hl.Bytes;
	@:hlNative("flight", "flight_clone_image_resource")
	public static function cloneImageResource(resource:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_invalidate_image_resource")
	public static function invalidateImageResource(resource:hl.Bytes, state:flight._hl.ImageResolverState):Void;
	@:hlNative("flight", "flight_is_image_resource_empty")
	public static function isImageResourceEmpty(resource:hl.Bytes):Bool;
	@:hlNative("flight", "flight_create_image_resource_from_bitmap")
	public static function createImageResourceFromBitmap(hostImage:flight._hl.HostImageCapability, bitmap:flight._hl.Bitmap):hl.Bytes;
	@:hlNative("flight", "flight_create_image_resource_from_surface")
	public static function createImageResourceFromSurface(hostImage:flight._hl.HostImageCapability, surface:flight._hl.SurfaceRef):hl.Bytes;
	@:hlNative("flight", "flight_capture_bitmap_from_image_resource")
	public static function captureBitmapFromImageResource(hostBitmapReadback:flight._hl.HostBitmapReadbackCapability, resource:hl.Bytes):flight._hl.Bitmap;
	@:hlNative("flight", "flight_is_image_url_same_origin")
	public static function isImageUrlSameOrigin(url:hl.Bytes, context:flight._hl.ImageUrlOriginContext):Bool;
	@:hlNative("flight", "flight_create_external_image_resource_reference")
	public static function createExternalImageResourceReference(uri:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_create_image_resource_failure")
	public static function createImageResourceFailure(cause:flight._hl.Unknown):hl.Bytes;
	@:hlNative("flight", "flight_explain_image_resource_reference_resolution")
	public static function explainImageResourceReferenceResolution(reference:flight._hl.ImageResourceReference):flight._hl.ImageResourceReferenceResolutionExplanation;
	@:hlNative("flight", "flight_reset_failed_image_resource_reference")
	public static function resetFailedImageResourceReference(reference:flight._hl.ImageResourceReference):Bool;
	@:hlNative("flight", "flight_create_image_resolver_state")
	public static function createImageResolverState():flight._hl.ImageResolverState;
	@:hlNative("flight", "flight_create_texture_from_image_resource")
	public static function createTextureFromImageResource(reference:flight._hl.ImageResourceReference, opts:flight._hl.CreateTexture2DOptions):hl.Bytes;
	@:hlNative("flight", "flight_free_image_resource_reference_resolution_explanation")
	public static function freeImageResourceReferenceResolutionExplanation(ptr:flight._hl.ImageResourceReferenceResolutionExplanation):Void;
	@:hlNative("flight", "flight_free_image_resolver_state")
	public static function freeImageResolverState(ptr:flight._hl.ImageResolverState):Void;
}
