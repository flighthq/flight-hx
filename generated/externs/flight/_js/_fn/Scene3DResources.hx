package flight._js._fn;

@:jsRequire("@flighthq/scene3d-resources")
extern class Scene3DResources {
	@:native("areScene3DResourceFailureGuardsEnabled")
	public static function areScene3dResourceFailureGuardsEnabled(resolver:Dynamic):Bool;
	@:native("disableScene3DResourceFailureGuards")
	public static function disableScene3dResourceFailureGuards(resolver:Dynamic):Void;
	@:native("explainScene3DResourceCoverage")
	public static function explainScene3dResourceCoverage(out:Dynamic, resolver:Dynamic, usage:flight._js.Scene3DKindUsage, catalog:flight._js.SceneCoverageCatalog):Void;
	@:native("createWebImageResourceFetch")
	public static function createWebImageResourceFetch(hostImage:flight._js.HostImageCapability):flight._js.ImageResourceFetch;
	@:native("resolveImageResourceUri")
	public static function resolveImageResourceUri(uri:String, basePath:Null<String>):String;
	@:native("resolveScene3DResources")
	public static function resolveScene3dResources(scene:Dynamic, resolver:Dynamic, options:Null<flight._js.ResolveScene3DResourcesOptions>):flight._js.Scene3DResources;
	@:native("updateScene3DResourceStreaming")
	public static function updateScene3dResourceStreaming(scene:Dynamic, resolver:Dynamic, options:Null<flight._js.UpdateScene3DResourceStreamingOptions>):flight._js.Scene3DResources;
	@:native("getScene3DDocumentBasePathFromUrl")
	public static function getScene3dDocumentBasePathFromUrl(url:String):Null<String>;
	@:native("setScene3DDocumentResourceBasePathFromUrl")
	public static function setScene3dDocumentResourceBasePathFromUrl(document:flight._js.Scene3DDocument, url:String):Void;
	@:native("retryFailedScene3DResources")
	public static function retryFailedScene3dResources(scene:Dynamic, resolver:Dynamic, options:Null<flight._js.UpdateScene3DResourceStreamingOptions>):Int;
	@:native("createBuiltInScene3DResourceResolver")
	public static function createBuiltInScene3dResourceResolver(hostImage:flight._js.HostImageCapability, options:Null<flight._js.Scene3DResourceResolverOptions>, context:flight._js.Scene3DResourceResolverContext):Dynamic;
	@:native("createScene3DResourceResolver")
	public static function createScene3dResourceResolver(hostImage:flight._js.HostImageCapability, options:Null<flight._js.Scene3DResourceResolverOptions>, context:flight._js.Scene3DResourceResolverContext):Dynamic;
	@:native("disposeScene3DResourceResolver")
	public static function disposeScene3dResourceResolver(resolver:Dynamic):Void;
	@:native("enableScene3DResourceSignals")
	public static function enableScene3dResourceSignals(resolver:Dynamic):Dynamic;
	@:native("getScene3DResourceSignals")
	public static function getScene3dResourceSignals(resolver:Dynamic):Null<Dynamic>;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeImageResourceFetch(ptr:flight._js.ImageResourceFetch):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeScene3Dresources(ptr:flight._js.Scene3DResources):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeScene3DresourceResolverRef(ptr:flight._js.Scene3DResourceResolver):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeScene3DresourceSignalsRef(ptr:flight._js.Scene3DResourceSignals):Void {}
}
