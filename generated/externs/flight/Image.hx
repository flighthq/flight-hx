package flight;

#if (js && flight_esm)
extern inline function cloneImageResource(resource:Dynamic):Dynamic {
	return flight._js._fn.Image.cloneImageResource(resource);
}
#else
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
#end
#if (js && flight_esm)
extern inline function invalidateImageResource(resource:Dynamic, state:ImageResolverState):Void {
	flight._js._fn.Image.invalidateImageResource(resource, state);
}
#else
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
#end
#if (js && flight_esm)
extern inline function isImageResourceEmpty(resource:Dynamic):Bool {
	return flight._js._fn.Image.isImageResourceEmpty(resource);
}
#else
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
#end
#if (js && flight_esm)
extern inline function createImageResourceFromBitmap(hostImage:HostImageCapability, bitmap:Bitmap):Null<Dynamic> {
	return flight._js._fn.Image.createImageResourceFromBitmap(hostImage, bitmap);
}
#else
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
#end
#if (js && flight_esm)
extern inline function isImageUrlSameOrigin(url:String, context:ImageUrlOriginContext):Bool {
	return flight._js._fn.Image.isImageUrlSameOrigin(url, context);
}
#else
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
#end
#if (js && flight_esm)
extern inline function createExternalImageResourceReference(uri:String):Dynamic {
	return flight._js._fn.Image.createExternalImageResourceReference(uri);
}
#else
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
#end
#if (js && flight_esm)
extern inline function createImageResourceFailure(cause:Unknown):Dynamic {
	return flight._js._fn.Image.createImageResourceFailure(cause);
}
#else
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
#end
#if (js && flight_esm)
extern inline function explainImageResourceReferenceResolution(reference:ImageResourceReference):ImageResourceReferenceResolutionExplanation {
	return flight._js._fn.Image.explainImageResourceReferenceResolution(reference);
}
#else
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
#end
#if (js && flight_esm)
extern inline function resetFailedImageResourceReference(reference:ImageResourceReference):Bool {
	return flight._js._fn.Image.resetFailedImageResourceReference(reference);
}
#else
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
#end
#if (js && flight_esm)
extern inline function freeImageResourceReferenceResolutionExplanation(ptr:ImageResourceReferenceResolutionExplanation):Void {
	flight._js._fn.Image.freeImageResourceReferenceResolutionExplanation(ptr);
}
#else
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
#end
