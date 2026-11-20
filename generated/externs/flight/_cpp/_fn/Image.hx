package flight._cpp._fn;

extern class Image {
	@:native("flight_clone_image_resource")
	public static function cloneImageResource(resource:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_invalidate_image_resource")
	public static function invalidateImageResource(resource:cpp.Star<cpp.Void>, state:flight._cpp.ImageResolverState):Void;
	@:native("flight_is_image_resource_empty")
	public static function isImageResourceEmpty(resource:cpp.Star<cpp.Void>):Bool;
	@:native("flight_create_image_resource_from_bitmap")
	public static function createImageResourceFromBitmap(hostImage:flight._cpp.HostImageCapability, bitmap:flight._cpp.Bitmap):cpp.Star<cpp.Void>;
	@:native("flight_is_image_url_same_origin")
	public static function isImageUrlSameOrigin(url:cpp.ConstCharStar, context:flight._cpp.ImageUrlOriginContext):Bool;
	@:native("flight_create_external_image_resource_reference")
	public static function createExternalImageResourceReference(uri:cpp.ConstCharStar):cpp.Star<cpp.Void>;
	@:native("flight_create_image_resource_failure")
	public static function createImageResourceFailure(cause:flight._cpp.Unknown):cpp.Star<cpp.Void>;
	@:native("flight_explain_image_resource_reference_resolution")
	public static function explainImageResourceReferenceResolution(reference:flight._cpp.ImageResourceReference):flight._cpp.ImageResourceReferenceResolutionExplanation;
	@:native("flight_reset_failed_image_resource_reference")
	public static function resetFailedImageResourceReference(reference:flight._cpp.ImageResourceReference):Bool;
	@:native("flight_free_image_resource_ref")
	public static function freeImageResourceRef(ptr:flight._cpp.ImageResource):Void;
	@:native("flight_free_external_image_resource_reference_ref")
	public static function freeExternalImageResourceReferenceRef(ptr:flight._cpp.ExternalImageResourceReference):Void;
	@:native("flight_free_image_resource_failure_ref")
	public static function freeImageResourceFailureRef(ptr:flight._cpp.ImageResourceFailure):Void;
	@:native("flight_free_image_resource_reference_resolution_explanation")
	public static function freeImageResourceReferenceResolutionExplanation(ptr:flight._cpp.ImageResourceReferenceResolutionExplanation):Void;
	@:native("flight_free_texture_ref")
	public static function freeTextureRef(ptr:flight._cpp.Texture):Void;
}
