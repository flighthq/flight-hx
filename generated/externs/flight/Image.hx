package flight;

extern inline function asImageResourceRef(source:TextureSourceRef):Dynamic {
#if hl
	return flight._hl._fn.Image.asImageResourceRef(source);
#elseif cpp
	return flight._cpp._fn.Image.asImageResourceRef(source);
#elseif (js && flight_esm)
	return flight._js._fn.Image.asImageResourceRef(source);
#else
	#error "flight.Image: no backend for this target."
#end
}
extern inline function cloneImageResource(resource:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Image.cloneImageResource(resource);
#elseif cpp
	return flight._cpp._fn.Image.cloneImageResource(resource);
#elseif (js && flight_esm)
	return flight._js._fn.Image.cloneImageResource(resource);
#else
	#error "flight.Image: no backend for this target."
#end
}
extern inline function invalidateImageResource(resource:Dynamic, state:ImageResolverState):Void {
#if hl
	flight._hl._fn.Image.invalidateImageResource(resource, state);
#elseif cpp
	flight._cpp._fn.Image.invalidateImageResource(resource, state);
#elseif (js && flight_esm)
	flight._js._fn.Image.invalidateImageResource(resource, state);
#else
	#error "flight.Image: no backend for this target."
#end
}
extern inline function isImageResourceEmpty(resource:Dynamic):Bool {
#if hl
	return flight._hl._fn.Image.isImageResourceEmpty(resource);
#elseif cpp
	return flight._cpp._fn.Image.isImageResourceEmpty(resource);
#elseif (js && flight_esm)
	return flight._js._fn.Image.isImageResourceEmpty(resource);
#else
	#error "flight.Image: no backend for this target."
#end
}
extern inline function createImageResourceFromBitmap(hostImage:HostImageCapability, bitmap:Bitmap):Dynamic {
#if hl
	return flight._hl._fn.Image.createImageResourceFromBitmap(hostImage, bitmap);
#elseif cpp
	return flight._cpp._fn.Image.createImageResourceFromBitmap(hostImage, bitmap);
#elseif (js && flight_esm)
	return flight._js._fn.Image.createImageResourceFromBitmap(hostImage, bitmap);
#else
	#error "flight.Image: no backend for this target."
#end
}
extern inline function createImageResourceFromSurface(hostImage:HostImageCapability, surface:SurfaceRef):Dynamic {
#if hl
	return flight._hl._fn.Image.createImageResourceFromSurface(hostImage, surface);
#elseif cpp
	return flight._cpp._fn.Image.createImageResourceFromSurface(hostImage, surface);
#elseif (js && flight_esm)
	return flight._js._fn.Image.createImageResourceFromSurface(hostImage, surface);
#else
	#error "flight.Image: no backend for this target."
#end
}
extern inline function captureBitmapFromImageResource(hostBitmapReadback:HostBitmapReadbackCapability, resource:Dynamic):Bitmap {
#if hl
	return flight._hl._fn.Image.captureBitmapFromImageResource(hostBitmapReadback, resource);
#elseif cpp
	return flight._cpp._fn.Image.captureBitmapFromImageResource(hostBitmapReadback, resource);
#elseif (js && flight_esm)
	return flight._js._fn.Image.captureBitmapFromImageResource(hostBitmapReadback, resource);
#else
	#error "flight.Image: no backend for this target."
#end
}
extern inline function isImageUrlSameOrigin(url:String, context:ImageUrlOriginContext):Bool {
#if hl
	return flight._hl._fn.Image.isImageUrlSameOrigin(cast url, context);
#elseif cpp
	return flight._cpp._fn.Image.isImageUrlSameOrigin(cast url, context);
#elseif (js && flight_esm)
	return flight._js._fn.Image.isImageUrlSameOrigin(url, context);
#else
	#error "flight.Image: no backend for this target."
#end
}
extern inline function createExternalImageResourceReference(uri:String):Dynamic {
#if hl
	return flight._hl._fn.Image.createExternalImageResourceReference(cast uri);
#elseif cpp
	return flight._cpp._fn.Image.createExternalImageResourceReference(cast uri);
#elseif (js && flight_esm)
	return flight._js._fn.Image.createExternalImageResourceReference(uri);
#else
	#error "flight.Image: no backend for this target."
#end
}
extern inline function createImageResourceFailure(cause:Unknown):Dynamic {
#if hl
	return flight._hl._fn.Image.createImageResourceFailure(cause);
#elseif cpp
	return flight._cpp._fn.Image.createImageResourceFailure(cause);
#elseif (js && flight_esm)
	return flight._js._fn.Image.createImageResourceFailure(cause);
#else
	#error "flight.Image: no backend for this target."
#end
}
extern inline function explainImageResourceReferenceResolution(reference:ImageResourceReference):ImageResourceReferenceResolutionExplanation {
#if hl
	return flight._hl._fn.Image.explainImageResourceReferenceResolution(reference);
#elseif cpp
	return flight._cpp._fn.Image.explainImageResourceReferenceResolution(reference);
#elseif (js && flight_esm)
	return flight._js._fn.Image.explainImageResourceReferenceResolution(reference);
#else
	#error "flight.Image: no backend for this target."
#end
}
extern inline function resetFailedImageResourceReference(reference:ImageResourceReference):Bool {
#if hl
	return flight._hl._fn.Image.resetFailedImageResourceReference(reference);
#elseif cpp
	return flight._cpp._fn.Image.resetFailedImageResourceReference(reference);
#elseif (js && flight_esm)
	return flight._js._fn.Image.resetFailedImageResourceReference(reference);
#else
	#error "flight.Image: no backend for this target."
#end
}
extern inline function createImageResolverState():ImageResolverState {
#if hl
	return flight._hl._fn.Image.createImageResolverState();
#elseif cpp
	return flight._cpp._fn.Image.createImageResolverState();
#elseif (js && flight_esm)
	return flight._js._fn.Image.createImageResolverState();
#else
	#error "flight.Image: no backend for this target."
#end
}
extern inline function createTextureFromImageResource(reference:ImageResourceReference, opts:CreateTexture2DOptions):Dynamic {
#if hl
	return flight._hl._fn.Image.createTextureFromImageResource(reference, opts);
#elseif cpp
	return flight._cpp._fn.Image.createTextureFromImageResource(reference, opts);
#elseif (js && flight_esm)
	return flight._js._fn.Image.createTextureFromImageResource(reference, opts);
#else
	#error "flight.Image: no backend for this target."
#end
}
extern inline function freeImageResourceReferenceResolutionExplanation(ptr:ImageResourceReferenceResolutionExplanation):Void {
#if hl
	flight._hl._fn.Image.freeImageResourceReferenceResolutionExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Image.freeImageResourceReferenceResolutionExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Image.freeImageResourceReferenceResolutionExplanation(ptr);
#else
	#error "flight.Image: no backend for this target."
#end
}
extern inline function freeImageResolverState(ptr:ImageResolverState):Void {
#if hl
	flight._hl._fn.Image.freeImageResolverState(ptr);
#elseif cpp
	flight._cpp._fn.Image.freeImageResolverState(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Image.freeImageResolverState(ptr);
#else
	#error "flight.Image: no backend for this target."
#end
}
