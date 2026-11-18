package flight;

#if (js && flight_esm)
extern inline function canPlayVideoType(backend:HostVideoCapability, mimeType:String):Bool {
	return flight._js._fn.Video.canPlayVideoType(backend, mimeType);
}
#else
extern inline function canPlayVideoType(backend:HostVideoCapability, mimeType:String):Bool {
#if hl
	return flight._hl._fn.Video.canPlayVideoType(backend, cast mimeType);
#elseif cpp
	return flight._cpp._fn.Video.canPlayVideoType(backend, cast mimeType);
#elseif (js && flight_esm)
	return flight._js._fn.Video.canPlayVideoType(backend, mimeType);
#else
	#error "flight.Video: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function inferVideoMimeType(url:String):Null<String> {
	return flight._js._fn.Video.inferVideoMimeType(url);
}
#else
extern inline function inferVideoMimeType(url:String):String {
#if hl
	return cast flight._hl._fn.Video.inferVideoMimeType(cast url);
#elseif cpp
	return cast flight._cpp._fn.Video.inferVideoMimeType(cast url);
#elseif (js && flight_esm)
	return cast flight._js._fn.Video.inferVideoMimeType(url);
#else
	#error "flight.Video: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createVideoResource():VideoResource {
	return flight._js._fn.Video.createVideoResource();
}
#else
extern inline function createVideoResource():VideoResource {
#if hl
	return flight._hl._fn.Video.createVideoResource();
#elseif cpp
	return flight._cpp._fn.Video.createVideoResource();
#elseif (js && flight_esm)
	return flight._js._fn.Video.createVideoResource();
#else
	#error "flight.Video: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function destroyVideoResource(hostVideo:HostVideoCapability, resource:VideoResource):Void {
	flight._js._fn.Video.destroyVideoResource(hostVideo, resource);
}
#else
extern inline function destroyVideoResource(hostVideo:HostVideoCapability, resource:VideoResource):Void {
#if hl
	flight._hl._fn.Video.destroyVideoResource(hostVideo, resource);
#elseif cpp
	flight._cpp._fn.Video.destroyVideoResource(hostVideo, resource);
#elseif (js && flight_esm)
	flight._js._fn.Video.destroyVideoResource(hostVideo, resource);
#else
	#error "flight.Video: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeVideoResource(hostVideo:HostVideoCapability, resource:VideoResource):Void {
	flight._js._fn.Video.disposeVideoResource(hostVideo, resource);
}
#else
extern inline function disposeVideoResource(hostVideo:HostVideoCapability, resource:VideoResource):Void {
#if hl
	flight._hl._fn.Video.disposeVideoResource(hostVideo, resource);
#elseif cpp
	flight._cpp._fn.Video.disposeVideoResource(hostVideo, resource);
#elseif (js && flight_esm)
	flight._js._fn.Video.disposeVideoResource(hostVideo, resource);
#else
	#error "flight.Video: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getVideoResourceDuration(hostVideo:HostVideoCapability, resource:VideoResource):Float {
	return flight._js._fn.Video.getVideoResourceDuration(hostVideo, resource);
}
#else
extern inline function getVideoResourceDuration(hostVideo:HostVideoCapability, resource:VideoResource):Float {
#if hl
	return flight._hl._fn.Video.getVideoResourceDuration(hostVideo, resource);
#elseif cpp
	return flight._cpp._fn.Video.getVideoResourceDuration(hostVideo, resource);
#elseif (js && flight_esm)
	return flight._js._fn.Video.getVideoResourceDuration(hostVideo, resource);
#else
	#error "flight.Video: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getVideoResourceHeight(hostVideo:HostVideoCapability, resource:VideoResource):Float {
	return flight._js._fn.Video.getVideoResourceHeight(hostVideo, resource);
}
#else
extern inline function getVideoResourceHeight(hostVideo:HostVideoCapability, resource:VideoResource):Float {
#if hl
	return flight._hl._fn.Video.getVideoResourceHeight(hostVideo, resource);
#elseif cpp
	return flight._cpp._fn.Video.getVideoResourceHeight(hostVideo, resource);
#elseif (js && flight_esm)
	return flight._js._fn.Video.getVideoResourceHeight(hostVideo, resource);
#else
	#error "flight.Video: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getVideoResourceWidth(hostVideo:HostVideoCapability, resource:VideoResource):Float {
	return flight._js._fn.Video.getVideoResourceWidth(hostVideo, resource);
}
#else
extern inline function getVideoResourceWidth(hostVideo:HostVideoCapability, resource:VideoResource):Float {
#if hl
	return flight._hl._fn.Video.getVideoResourceWidth(hostVideo, resource);
#elseif cpp
	return flight._cpp._fn.Video.getVideoResourceWidth(hostVideo, resource);
#elseif (js && flight_esm)
	return flight._js._fn.Video.getVideoResourceWidth(hostVideo, resource);
#else
	#error "flight.Video: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasVideoResourceElement(resource:VideoResource):Bool {
	return flight._js._fn.Video.hasVideoResourceElement(resource);
}
#else
extern inline function hasVideoResourceElement(resource:VideoResource):Bool {
#if hl
	return flight._hl._fn.Video.hasVideoResourceElement(resource);
#elseif cpp
	return flight._cpp._fn.Video.hasVideoResourceElement(resource);
#elseif (js && flight_esm)
	return flight._js._fn.Video.hasVideoResourceElement(resource);
#else
	#error "flight.Video: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isVideoResourceEmpty(hostVideo:HostVideoCapability, resource:VideoResource):Bool {
	return flight._js._fn.Video.isVideoResourceEmpty(hostVideo, resource);
}
#else
extern inline function isVideoResourceEmpty(hostVideo:HostVideoCapability, resource:VideoResource):Bool {
#if hl
	return flight._hl._fn.Video.isVideoResourceEmpty(hostVideo, resource);
#elseif cpp
	return flight._cpp._fn.Video.isVideoResourceEmpty(hostVideo, resource);
#elseif (js && flight_esm)
	return flight._js._fn.Video.isVideoResourceEmpty(hostVideo, resource);
#else
	#error "flight.Video: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isVideoResourceReady(hostVideo:HostVideoCapability, resource:VideoResource):Bool {
	return flight._js._fn.Video.isVideoResourceReady(hostVideo, resource);
}
#else
extern inline function isVideoResourceReady(hostVideo:HostVideoCapability, resource:VideoResource):Bool {
#if hl
	return flight._hl._fn.Video.isVideoResourceReady(hostVideo, resource);
#elseif cpp
	return flight._cpp._fn.Video.isVideoResourceReady(hostVideo, resource);
#elseif (js && flight_esm)
	return flight._js._fn.Video.isVideoResourceReady(hostVideo, resource);
#else
	#error "flight.Video: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeVideoResource(ptr:VideoResource):Void {
	flight._js._fn.Video.freeVideoResource(ptr);
}
#else
extern inline function freeVideoResource(ptr:VideoResource):Void {
#if hl
	flight._hl._fn.Video.freeVideoResource(ptr);
#elseif cpp
	flight._cpp._fn.Video.freeVideoResource(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Video.freeVideoResource(ptr);
#else
	#error "flight.Video: no backend for this target."
#end
}
#end
