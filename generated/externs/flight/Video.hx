package flight;

inline function canPlayVideoType(backend:HostVideoCapability, mimeType:String):Bool {
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
inline function inferVideoMimeType(url:String):String {
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
inline function createVideoResource():VideoResource {
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
inline function destroyVideoResource(hostVideo:HostVideoCapability, resource:VideoResource):Void {
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
inline function disposeVideoResource(hostVideo:HostVideoCapability, resource:VideoResource):Void {
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
inline function getVideoChannelStateString(value:flight.VideoChannelState):String {
#if hl
	return cast flight._hl._fn.Video.getVideoChannelStateString(value);
#elseif cpp
	return cast flight._cpp._fn.Video.getVideoChannelStateString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Video.getVideoChannelStateString(value);
#else
	#error "flight.Video: no backend for this target."
#end
}
inline function getVideoResourceDuration(hostVideo:HostVideoCapability, resource:VideoResource):Float {
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
inline function getVideoResourceHeight(hostVideo:HostVideoCapability, resource:VideoResource):Float {
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
inline function getVideoResourceLoadReadinessString(value:flight.VideoResourceLoadReadiness):String {
#if hl
	return cast flight._hl._fn.Video.getVideoResourceLoadReadinessString(value);
#elseif cpp
	return cast flight._cpp._fn.Video.getVideoResourceLoadReadinessString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Video.getVideoResourceLoadReadinessString(value);
#else
	#error "flight.Video: no backend for this target."
#end
}
inline function getVideoResourceWidth(hostVideo:HostVideoCapability, resource:VideoResource):Float {
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
inline function hasVideoResourceElement(resource:VideoResource):Bool {
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
inline function isVideoResourceEmpty(hostVideo:HostVideoCapability, resource:VideoResource):Bool {
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
inline function isVideoResourceReady(hostVideo:HostVideoCapability, resource:VideoResource):Bool {
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
inline function parseVideoChannelState(value:String):Int {
#if hl
	return flight._hl._fn.Video.parseVideoChannelState(cast value);
#elseif cpp
	return flight._cpp._fn.Video.parseVideoChannelState(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Video.parseVideoChannelState(value);
#else
	#error "flight.Video: no backend for this target."
#end
}
inline function parseVideoResourceLoadReadiness(value:String):Int {
#if hl
	return flight._hl._fn.Video.parseVideoResourceLoadReadiness(cast value);
#elseif cpp
	return flight._cpp._fn.Video.parseVideoResourceLoadReadiness(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Video.parseVideoResourceLoadReadiness(value);
#else
	#error "flight.Video: no backend for this target."
#end
}
inline function createVideoTexture(hostVideo:HostVideoCapability, source:VideoResource, opts:CreateTextureCommonOptions):Texture2D {
#if hl
	return flight._hl._fn.Video.createVideoTexture(hostVideo, source, opts);
#elseif cpp
	return flight._cpp._fn.Video.createVideoTexture(hostVideo, source, opts);
#elseif (js && flight_esm)
	return flight._js._fn.Video.createVideoTexture(hostVideo, source, opts);
#else
	#error "flight.Video: no backend for this target."
#end
}
inline function advanceVideoTextureTexture(hostVideo:HostVideoCapability, texture:Texture):Int {
#if hl
	return flight._hl._fn.Video.advanceVideoTextureTexture(hostVideo, texture);
#elseif cpp
	return flight._cpp._fn.Video.advanceVideoTextureTexture(hostVideo, texture);
#elseif (js && flight_esm)
	return flight._js._fn.Video.advanceVideoTextureTexture(hostVideo, texture);
#else
	#error "flight.Video: no backend for this target."
#end
}
inline function cloneVideoTextureTexture(source:Texture):Int {
#if hl
	return flight._hl._fn.Video.cloneVideoTextureTexture(source);
#elseif cpp
	return flight._cpp._fn.Video.cloneVideoTextureTexture(source);
#elseif (js && flight_esm)
	return flight._js._fn.Video.cloneVideoTextureTexture(source);
#else
	#error "flight.Video: no backend for this target."
#end
}
inline function copyVideoTextureTextureTexture(out:Texture, source:Texture):Void {
#if hl
	flight._hl._fn.Video.copyVideoTextureTextureTexture(out, source);
#elseif cpp
	flight._cpp._fn.Video.copyVideoTextureTextureTexture(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Video.copyVideoTextureTextureTexture(out, source);
#else
	#error "flight.Video: no backend for this target."
#end
}
inline function destroyVideoTexture(texture:Texture2D):Void {
#if hl
	flight._hl._fn.Video.destroyVideoTexture(texture);
#elseif cpp
	flight._cpp._fn.Video.destroyVideoTexture(texture);
#elseif (js && flight_esm)
	flight._js._fn.Video.destroyVideoTexture(texture);
#else
	#error "flight.Video: no backend for this target."
#end
}
inline function getVideoTextureHeightTexture(hostVideo:HostVideoCapability, texture:Texture):Float {
#if hl
	return flight._hl._fn.Video.getVideoTextureHeightTexture(hostVideo, texture);
#elseif cpp
	return flight._cpp._fn.Video.getVideoTextureHeightTexture(hostVideo, texture);
#elseif (js && flight_esm)
	return flight._js._fn.Video.getVideoTextureHeightTexture(hostVideo, texture);
#else
	#error "flight.Video: no backend for this target."
#end
}
inline function getVideoTextureInverseUvMatrixTexture(out:Matrix3, texture:Texture):Void {
#if hl
	flight._hl._fn.Video.getVideoTextureInverseUvMatrixTexture(out, texture);
#elseif cpp
	flight._cpp._fn.Video.getVideoTextureInverseUvMatrixTexture(out, texture);
#elseif (js && flight_esm)
	flight._js._fn.Video.getVideoTextureInverseUvMatrixTexture(out, texture);
#else
	#error "flight.Video: no backend for this target."
#end
}
inline function getVideoTextureUvMatrixTexture(out:Matrix3, texture:Texture):Void {
#if hl
	flight._hl._fn.Video.getVideoTextureUvMatrixTexture(out, texture);
#elseif cpp
	flight._cpp._fn.Video.getVideoTextureUvMatrixTexture(out, texture);
#elseif (js && flight_esm)
	flight._js._fn.Video.getVideoTextureUvMatrixTexture(out, texture);
#else
	#error "flight.Video: no backend for this target."
#end
}
inline function getVideoTextureWidthTexture(hostVideo:HostVideoCapability, texture:Texture):Float {
#if hl
	return flight._hl._fn.Video.getVideoTextureWidthTexture(hostVideo, texture);
#elseif cpp
	return flight._cpp._fn.Video.getVideoTextureWidthTexture(hostVideo, texture);
#elseif (js && flight_esm)
	return flight._js._fn.Video.getVideoTextureWidthTexture(hostVideo, texture);
#else
	#error "flight.Video: no backend for this target."
#end
}
inline function isVideoTextureFrameReadyTexture(hostVideo:HostVideoCapability, texture:Texture):Bool {
#if hl
	return flight._hl._fn.Video.isVideoTextureFrameReadyTexture(hostVideo, texture);
#elseif cpp
	return flight._cpp._fn.Video.isVideoTextureFrameReadyTexture(hostVideo, texture);
#elseif (js && flight_esm)
	return flight._js._fn.Video.isVideoTextureFrameReadyTexture(hostVideo, texture);
#else
	#error "flight.Video: no backend for this target."
#end
}
inline function resetVideoTextureFrameTexture(texture:Texture):Void {
#if hl
	flight._hl._fn.Video.resetVideoTextureFrameTexture(texture);
#elseif cpp
	flight._cpp._fn.Video.resetVideoTextureFrameTexture(texture);
#elseif (js && flight_esm)
	flight._js._fn.Video.resetVideoTextureFrameTexture(texture);
#else
	#error "flight.Video: no backend for this target."
#end
}
inline function setVideoTextureSourceTexture(hostVideo:HostVideoCapability, texture:Texture, source:VideoResource):Void {
#if hl
	flight._hl._fn.Video.setVideoTextureSourceTexture(hostVideo, texture, source);
#elseif cpp
	flight._cpp._fn.Video.setVideoTextureSourceTexture(hostVideo, texture, source);
#elseif (js && flight_esm)
	flight._js._fn.Video.setVideoTextureSourceTexture(hostVideo, texture, source);
#else
	#error "flight.Video: no backend for this target."
#end
}
inline function freeVideoResource(ptr:VideoResource):Void {
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
