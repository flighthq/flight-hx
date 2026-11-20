package flight._cpp._fn;

extern class Scene3DResources {
	@:native("flight_are_scene3d_resource_failure_guards_enabled")
	public static function areScene3dResourceFailureGuardsEnabled(resolver:cpp.Star<cpp.Void>):Bool;
	@:native("flight_disable_scene3d_resource_failure_guards")
	public static function disableScene3dResourceFailureGuards(resolver:cpp.Star<cpp.Void>):Void;
	@:native("flight_explain_scene3d_resource_coverage")
	public static function explainScene3dResourceCoverage(out:cpp.Star<cpp.Void>, resolver:cpp.Star<cpp.Void>, usage:flight._cpp.Scene3DKindUsage, catalog:flight._cpp.SceneCoverageCatalog):Void;
	@:native("flight_create_web_image_resource_fetch")
	public static function createWebImageResourceFetch(hostImage:flight._cpp.HostImageCapability):flight._cpp.ImageResourceFetch;
	@:native("flight_resolve_image_resource_uri")
	public static function resolveImageResourceUri(uri:cpp.ConstCharStar, basePath:cpp.ConstCharStar):cpp.ConstCharStar;
	@:native("flight_resolve_scene3d_resources")
	public static function resolveScene3dResources(scene:cpp.Star<cpp.Void>, resolver:cpp.Star<cpp.Void>, options:flight._cpp.ResolveScene3DResourcesOptions):flight._cpp.Scene3DResources;
	@:native("flight_update_scene3d_resource_streaming")
	public static function updateScene3dResourceStreaming(scene:cpp.Star<cpp.Void>, resolver:cpp.Star<cpp.Void>, options:flight._cpp.UpdateScene3DResourceStreamingOptions):flight._cpp.Scene3DResources;
	@:native("flight_get_scene3d_document_base_path_from_url")
	public static function getScene3dDocumentBasePathFromUrl(url:cpp.ConstCharStar):cpp.ConstCharStar;
	@:native("flight_set_scene3d_document_resource_base_path_from_url")
	public static function setScene3dDocumentResourceBasePathFromUrl(document:flight._cpp.Scene3DDocument, url:cpp.ConstCharStar):Void;
	@:native("flight_retry_failed_scene3d_resources")
	public static function retryFailedScene3dResources(scene:cpp.Star<cpp.Void>, resolver:cpp.Star<cpp.Void>, options:flight._cpp.UpdateScene3DResourceStreamingOptions):Int;
	@:native("flight_create_built_in_scene3d_resource_resolver")
	public static function createBuiltInScene3dResourceResolver(hostImage:flight._cpp.HostImageCapability, options:flight._cpp.Scene3DResourceResolverOptions, context:flight._cpp.Scene3DResourceResolverContext):cpp.Star<cpp.Void>;
	@:native("flight_create_scene3d_resource_resolver")
	public static function createScene3dResourceResolver(hostImage:flight._cpp.HostImageCapability, options:flight._cpp.Scene3DResourceResolverOptions, context:flight._cpp.Scene3DResourceResolverContext):cpp.Star<cpp.Void>;
	@:native("flight_dispose_scene3d_resource_resolver")
	public static function disposeScene3dResourceResolver(resolver:cpp.Star<cpp.Void>):Void;
	@:native("flight_enable_scene3d_resource_signals")
	public static function enableScene3dResourceSignals(resolver:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_get_scene3d_resource_signals")
	public static function getScene3dResourceSignals(resolver:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_free_image_resource_fetch")
	public static function freeImageResourceFetch(ptr:flight._cpp.ImageResourceFetch):Void;
	@:native("flight_free_scene3_dresources")
	public static function freeScene3Dresources(ptr:flight._cpp.Scene3DResources):Void;
	@:native("flight_free_scene3_dresource_resolver_ref")
	public static function freeScene3DresourceResolverRef(ptr:flight._cpp.Scene3DResourceResolver):Void;
	@:native("flight_free_scene3_dresource_signals_ref")
	public static function freeScene3DresourceSignalsRef(ptr:flight._cpp.Scene3DResourceSignals):Void;
}
