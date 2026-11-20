package flight;

#if hl

typedef Scene3DResources = flight._hl.Scene3DResources;

#elseif cpp

typedef Scene3DResources = flight._cpp.Scene3DResources;

#elseif (js && flight_esm)

typedef Scene3DResources = flight._js.Scene3DResources;

#elseif js

#error "flight.Scene3DResources on js requires flight_esm."

#else

#error "flight.Scene3DResources: no backend for this target."

#end

#if (js && flight_esm)
extern inline function areScene3dResourceFailureGuardsEnabled(resolver:Dynamic):Bool {
	return flight._js._fn.Scene3DResources.areScene3dResourceFailureGuardsEnabled(resolver);
}
#else
extern inline function areScene3dResourceFailureGuardsEnabled(resolver:Dynamic):Bool {
#if hl
	return flight._hl._fn.Scene3DResources.areScene3dResourceFailureGuardsEnabled(resolver);
#elseif cpp
	return flight._cpp._fn.Scene3DResources.areScene3dResourceFailureGuardsEnabled(resolver);
#elseif (js && flight_esm)
	return flight._js._fn.Scene3DResources.areScene3dResourceFailureGuardsEnabled(resolver);
#else
	#error "flight.Scene3DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disableScene3dResourceFailureGuards(resolver:Dynamic):Void {
	flight._js._fn.Scene3DResources.disableScene3dResourceFailureGuards(resolver);
}
#else
extern inline function disableScene3dResourceFailureGuards(resolver:Dynamic):Void {
#if hl
	flight._hl._fn.Scene3DResources.disableScene3dResourceFailureGuards(resolver);
#elseif cpp
	flight._cpp._fn.Scene3DResources.disableScene3dResourceFailureGuards(resolver);
#elseif (js && flight_esm)
	flight._js._fn.Scene3DResources.disableScene3dResourceFailureGuards(resolver);
#else
	#error "flight.Scene3DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainScene3dResourceCoverage(out:Dynamic, resolver:Dynamic, usage:Scene3DKindUsage, catalog:SceneCoverageCatalog):Void {
	flight._js._fn.Scene3DResources.explainScene3dResourceCoverage(out, resolver, usage, catalog);
}
#else
extern inline function explainScene3dResourceCoverage(out:Dynamic, resolver:Dynamic, usage:Scene3DKindUsage, catalog:SceneCoverageCatalog):Void {
#if hl
	flight._hl._fn.Scene3DResources.explainScene3dResourceCoverage(out, resolver, usage, catalog);
#elseif cpp
	flight._cpp._fn.Scene3DResources.explainScene3dResourceCoverage(out, resolver, usage, catalog);
#elseif (js && flight_esm)
	flight._js._fn.Scene3DResources.explainScene3dResourceCoverage(out, resolver, usage, catalog);
#else
	#error "flight.Scene3DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createWebImageResourceFetch(hostImage:HostImageCapability):ImageResourceFetch {
	return flight._js._fn.Scene3DResources.createWebImageResourceFetch(hostImage);
}
#else
extern inline function createWebImageResourceFetch(hostImage:HostImageCapability):ImageResourceFetch {
#if hl
	return flight._hl._fn.Scene3DResources.createWebImageResourceFetch(hostImage);
#elseif cpp
	return flight._cpp._fn.Scene3DResources.createWebImageResourceFetch(hostImage);
#elseif (js && flight_esm)
	return flight._js._fn.Scene3DResources.createWebImageResourceFetch(hostImage);
#else
	#error "flight.Scene3DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function resolveImageResourceUri(uri:String, basePath:Null<String>):String {
	return flight._js._fn.Scene3DResources.resolveImageResourceUri(uri, basePath);
}
#else
extern inline function resolveImageResourceUri(uri:String, basePath:String):String {
#if hl
	return cast flight._hl._fn.Scene3DResources.resolveImageResourceUri(cast uri, cast basePath);
#elseif cpp
	return cast flight._cpp._fn.Scene3DResources.resolveImageResourceUri(cast uri, cast basePath);
#elseif (js && flight_esm)
	return cast flight._js._fn.Scene3DResources.resolveImageResourceUri(uri, basePath);
#else
	#error "flight.Scene3DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function resolveScene3dResources(scene:Dynamic, resolver:Dynamic, options:Null<ResolveScene3DResourcesOptions>):Scene3DResources {
	return flight._js._fn.Scene3DResources.resolveScene3dResources(scene, resolver, options);
}
#else
extern inline function resolveScene3dResources(scene:Dynamic, resolver:Dynamic, options:ResolveScene3DResourcesOptions):Scene3DResources {
#if hl
	return flight._hl._fn.Scene3DResources.resolveScene3dResources(scene, resolver, options);
#elseif cpp
	return flight._cpp._fn.Scene3DResources.resolveScene3dResources(scene, resolver, options);
#elseif (js && flight_esm)
	return flight._js._fn.Scene3DResources.resolveScene3dResources(scene, resolver, options);
#else
	#error "flight.Scene3DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function updateScene3dResourceStreaming(scene:Dynamic, resolver:Dynamic, options:Null<UpdateScene3DResourceStreamingOptions>):Scene3DResources {
	return flight._js._fn.Scene3DResources.updateScene3dResourceStreaming(scene, resolver, options);
}
#else
extern inline function updateScene3dResourceStreaming(scene:Dynamic, resolver:Dynamic, options:UpdateScene3DResourceStreamingOptions):Scene3DResources {
#if hl
	return flight._hl._fn.Scene3DResources.updateScene3dResourceStreaming(scene, resolver, options);
#elseif cpp
	return flight._cpp._fn.Scene3DResources.updateScene3dResourceStreaming(scene, resolver, options);
#elseif (js && flight_esm)
	return flight._js._fn.Scene3DResources.updateScene3dResourceStreaming(scene, resolver, options);
#else
	#error "flight.Scene3DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScene3dDocumentBasePathFromUrl(url:String):Null<String> {
	return flight._js._fn.Scene3DResources.getScene3dDocumentBasePathFromUrl(url);
}
#else
extern inline function getScene3dDocumentBasePathFromUrl(url:String):String {
#if hl
	return cast flight._hl._fn.Scene3DResources.getScene3dDocumentBasePathFromUrl(cast url);
#elseif cpp
	return cast flight._cpp._fn.Scene3DResources.getScene3dDocumentBasePathFromUrl(cast url);
#elseif (js && flight_esm)
	return cast flight._js._fn.Scene3DResources.getScene3dDocumentBasePathFromUrl(url);
#else
	#error "flight.Scene3DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setScene3dDocumentResourceBasePathFromUrl(document:Scene3DDocument, url:String):Void {
	flight._js._fn.Scene3DResources.setScene3dDocumentResourceBasePathFromUrl(document, url);
}
#else
extern inline function setScene3dDocumentResourceBasePathFromUrl(document:Scene3DDocument, url:String):Void {
#if hl
	flight._hl._fn.Scene3DResources.setScene3dDocumentResourceBasePathFromUrl(document, cast url);
#elseif cpp
	flight._cpp._fn.Scene3DResources.setScene3dDocumentResourceBasePathFromUrl(document, cast url);
#elseif (js && flight_esm)
	flight._js._fn.Scene3DResources.setScene3dDocumentResourceBasePathFromUrl(document, url);
#else
	#error "flight.Scene3DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function retryFailedScene3dResources(scene:Dynamic, resolver:Dynamic, options:Null<UpdateScene3DResourceStreamingOptions>):Int {
	return flight._js._fn.Scene3DResources.retryFailedScene3dResources(scene, resolver, options);
}
#else
extern inline function retryFailedScene3dResources(scene:Dynamic, resolver:Dynamic, options:UpdateScene3DResourceStreamingOptions):Int {
#if hl
	return flight._hl._fn.Scene3DResources.retryFailedScene3dResources(scene, resolver, options);
#elseif cpp
	return flight._cpp._fn.Scene3DResources.retryFailedScene3dResources(scene, resolver, options);
#elseif (js && flight_esm)
	return flight._js._fn.Scene3DResources.retryFailedScene3dResources(scene, resolver, options);
#else
	#error "flight.Scene3DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createBuiltInScene3dResourceResolver(hostImage:HostImageCapability, options:Null<Scene3DResourceResolverOptions>, context:Scene3DResourceResolverContext):Dynamic {
	return flight._js._fn.Scene3DResources.createBuiltInScene3dResourceResolver(hostImage, options, context);
}
#else
extern inline function createBuiltInScene3dResourceResolver(hostImage:HostImageCapability, options:Scene3DResourceResolverOptions, context:Scene3DResourceResolverContext):Dynamic {
#if hl
	return flight._hl._fn.Scene3DResources.createBuiltInScene3dResourceResolver(hostImage, options, context);
#elseif cpp
	return flight._cpp._fn.Scene3DResources.createBuiltInScene3dResourceResolver(hostImage, options, context);
#elseif (js && flight_esm)
	return flight._js._fn.Scene3DResources.createBuiltInScene3dResourceResolver(hostImage, options, context);
#else
	#error "flight.Scene3DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createScene3dResourceResolver(hostImage:HostImageCapability, options:Null<Scene3DResourceResolverOptions>, context:Scene3DResourceResolverContext):Dynamic {
	return flight._js._fn.Scene3DResources.createScene3dResourceResolver(hostImage, options, context);
}
#else
extern inline function createScene3dResourceResolver(hostImage:HostImageCapability, options:Scene3DResourceResolverOptions, context:Scene3DResourceResolverContext):Dynamic {
#if hl
	return flight._hl._fn.Scene3DResources.createScene3dResourceResolver(hostImage, options, context);
#elseif cpp
	return flight._cpp._fn.Scene3DResources.createScene3dResourceResolver(hostImage, options, context);
#elseif (js && flight_esm)
	return flight._js._fn.Scene3DResources.createScene3dResourceResolver(hostImage, options, context);
#else
	#error "flight.Scene3DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeScene3dResourceResolver(resolver:Dynamic):Void {
	flight._js._fn.Scene3DResources.disposeScene3dResourceResolver(resolver);
}
#else
extern inline function disposeScene3dResourceResolver(resolver:Dynamic):Void {
#if hl
	flight._hl._fn.Scene3DResources.disposeScene3dResourceResolver(resolver);
#elseif cpp
	flight._cpp._fn.Scene3DResources.disposeScene3dResourceResolver(resolver);
#elseif (js && flight_esm)
	flight._js._fn.Scene3DResources.disposeScene3dResourceResolver(resolver);
#else
	#error "flight.Scene3DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableScene3dResourceSignals(resolver:Dynamic):Dynamic {
	return flight._js._fn.Scene3DResources.enableScene3dResourceSignals(resolver);
}
#else
extern inline function enableScene3dResourceSignals(resolver:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Scene3DResources.enableScene3dResourceSignals(resolver);
#elseif cpp
	return flight._cpp._fn.Scene3DResources.enableScene3dResourceSignals(resolver);
#elseif (js && flight_esm)
	return flight._js._fn.Scene3DResources.enableScene3dResourceSignals(resolver);
#else
	#error "flight.Scene3DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScene3dResourceSignals(resolver:Dynamic):Null<Dynamic> {
	return flight._js._fn.Scene3DResources.getScene3dResourceSignals(resolver);
}
#else
extern inline function getScene3dResourceSignals(resolver:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Scene3DResources.getScene3dResourceSignals(resolver);
#elseif cpp
	return flight._cpp._fn.Scene3DResources.getScene3dResourceSignals(resolver);
#elseif (js && flight_esm)
	return flight._js._fn.Scene3DResources.getScene3dResourceSignals(resolver);
#else
	#error "flight.Scene3DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeImageResourceFetch(ptr:ImageResourceFetch):Void {
	flight._js._fn.Scene3DResources.freeImageResourceFetch(ptr);
}
#else
extern inline function freeImageResourceFetch(ptr:ImageResourceFetch):Void {
#if hl
	flight._hl._fn.Scene3DResources.freeImageResourceFetch(ptr);
#elseif cpp
	flight._cpp._fn.Scene3DResources.freeImageResourceFetch(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene3DResources.freeImageResourceFetch(ptr);
#else
	#error "flight.Scene3DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeScene3Dresources(ptr:Scene3DResources):Void {
	flight._js._fn.Scene3DResources.freeScene3Dresources(ptr);
}
#else
extern inline function freeScene3Dresources(ptr:Scene3DResources):Void {
#if hl
	flight._hl._fn.Scene3DResources.freeScene3Dresources(ptr);
#elseif cpp
	flight._cpp._fn.Scene3DResources.freeScene3Dresources(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene3DResources.freeScene3Dresources(ptr);
#else
	#error "flight.Scene3DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeScene3DresourceResolverRef(ptr:Scene3DResourceResolver):Void {
	flight._js._fn.Scene3DResources.freeScene3DresourceResolverRef(ptr);
}
#else
extern inline function freeScene3DresourceResolverRef(ptr:Scene3DResourceResolver):Void {
#if hl
	flight._hl._fn.Scene3DResources.freeScene3DresourceResolverRef(ptr);
#elseif cpp
	flight._cpp._fn.Scene3DResources.freeScene3DresourceResolverRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene3DResources.freeScene3DresourceResolverRef(ptr);
#else
	#error "flight.Scene3DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeScene3DresourceSignalsRef(ptr:Scene3DResourceSignals):Void {
	flight._js._fn.Scene3DResources.freeScene3DresourceSignalsRef(ptr);
}
#else
extern inline function freeScene3DresourceSignalsRef(ptr:Scene3DResourceSignals):Void {
#if hl
	flight._hl._fn.Scene3DResources.freeScene3DresourceSignalsRef(ptr);
#elseif cpp
	flight._cpp._fn.Scene3DResources.freeScene3DresourceSignalsRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene3DResources.freeScene3DresourceSignalsRef(ptr);
#else
	#error "flight.Scene3DResources: no backend for this target."
#end
}
#end
