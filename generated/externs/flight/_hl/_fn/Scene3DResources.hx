package flight._hl._fn;

extern class Scene3DResources {
	@:hlNative("flight", "flight_are_scene3d_resource_failure_guards_enabled")
	public static function areScene3dResourceFailureGuardsEnabled(resolver:hl.Bytes):Bool;
	@:hlNative("flight", "flight_disable_scene3d_resource_failure_guards")
	public static function disableScene3dResourceFailureGuards(resolver:hl.Bytes):Void;
	@:hlNative("flight", "flight_explain_scene3d_resource_coverage")
	public static function explainScene3dResourceCoverage(out:hl.Bytes, resolver:hl.Bytes, usage:flight._hl.Scene3DKindUsage, catalog:flight._hl.SceneCoverageCatalog):Void;
	@:hlNative("flight", "flight_create_web_image_resource_fetch")
	public static function createWebImageResourceFetch(hostImage:flight._hl.HostImageCapability):flight._hl.ImageResourceFetch;
	@:hlNative("flight", "flight_resolve_image_resource_uri")
	public static function resolveImageResourceUri(uri:hl.Bytes, basePath:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_resolve_scene3d_resources")
	public static function resolveScene3dResources(scene:hl.Bytes, resolver:hl.Bytes, options:flight._hl.ResolveScene3DResourcesOptions):flight._hl.Scene3DResources;
	@:hlNative("flight", "flight_update_scene3d_resource_streaming")
	public static function updateScene3dResourceStreaming(scene:hl.Bytes, resolver:hl.Bytes, options:flight._hl.UpdateScene3DResourceStreamingOptions):flight._hl.Scene3DResources;
	@:hlNative("flight", "flight_get_scene3d_document_base_path_from_url")
	public static function getScene3dDocumentBasePathFromUrl(url:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_set_scene3d_document_resource_base_path_from_url")
	public static function setScene3dDocumentResourceBasePathFromUrl(document:flight._hl.Scene3DDocument, url:hl.Bytes):Void;
	@:hlNative("flight", "flight_retry_failed_scene3d_resources")
	public static function retryFailedScene3dResources(scene:hl.Bytes, resolver:hl.Bytes, options:flight._hl.UpdateScene3DResourceStreamingOptions):Int;
	@:hlNative("flight", "flight_create_built_in_scene3d_resource_resolver")
	public static function createBuiltInScene3dResourceResolver(hostImage:flight._hl.HostImageCapability, options:flight._hl.Scene3DResourceResolverOptions, context:flight._hl.Scene3DResourceResolverContext):hl.Bytes;
	@:hlNative("flight", "flight_create_scene3d_resource_resolver")
	public static function createScene3dResourceResolver(hostImage:flight._hl.HostImageCapability, options:flight._hl.Scene3DResourceResolverOptions, context:flight._hl.Scene3DResourceResolverContext):hl.Bytes;
	@:hlNative("flight", "flight_dispose_scene3d_resource_resolver")
	public static function disposeScene3dResourceResolver(resolver:hl.Bytes):Void;
	@:hlNative("flight", "flight_enable_scene3d_resource_signals")
	public static function enableScene3dResourceSignals(resolver:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_get_scene3d_resource_signals")
	public static function getScene3dResourceSignals(resolver:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_free_image_resource_fetch")
	public static function freeImageResourceFetch(ptr:flight._hl.ImageResourceFetch):Void;
	@:hlNative("flight", "flight_free_scene3_dresources")
	public static function freeScene3Dresources(ptr:flight._hl.Scene3DResources):Void;
	@:hlNative("flight", "flight_free_scene3_dresource_resolver_ref")
	public static function freeScene3DresourceResolverRef(ptr:flight._hl.Scene3DResourceResolver):Void;
	@:hlNative("flight", "flight_free_scene3_dresource_signals_ref")
	public static function freeScene3DresourceSignalsRef(ptr:flight._hl.Scene3DResourceSignals):Void;
}
