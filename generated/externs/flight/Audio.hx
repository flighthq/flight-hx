package flight;

inline function createAudioBuffer(length:Int, numberOfChannels:Int, sampleRate:Float):Dynamic {
#if hl
	return flight._hl._fn.Audio.createAudioBuffer(length, numberOfChannels, sampleRate);
#elseif cpp
	return flight._cpp._fn.Audio.createAudioBuffer(length, numberOfChannels, sampleRate);
#elseif (js && flight_esm)
	return flight._js._fn.Audio.createAudioBuffer(length, numberOfChannels, sampleRate);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function copyToAudioBufferChannel(buffer:Dynamic, source:Dynamic, sourceLen:Int, channel:Int):Void {
#if hl
	flight._hl._fn.Audio.copyToAudioBufferChannel(buffer, source, sourceLen, channel);
#elseif cpp
	flight._cpp._fn.Audio.copyToAudioBufferChannel(buffer, source, sourceLen, channel);
#elseif (js && flight_esm)
	flight._js._fn.Audio.copyToAudioBufferChannel(buffer, source, sourceLen, channel);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function hasAudioDecodeSlot(audioDecode:HostAudioDecodeCapabilities, mimeType:String):Bool {
#if hl
	return flight._hl._fn.Audio.hasAudioDecodeSlot(audioDecode, cast mimeType);
#elseif cpp
	return flight._cpp._fn.Audio.hasAudioDecodeSlot(audioDecode, cast mimeType);
#elseif (js && flight_esm)
	return flight._js._fn.Audio.hasAudioDecodeSlot(audioDecode, mimeType);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function canPlayAudioType(hostAudioCodec:HostAudioCodecCapability, mimeType:String):Bool {
#if hl
	return flight._hl._fn.Audio.canPlayAudioType(hostAudioCodec, cast mimeType);
#elseif cpp
	return flight._cpp._fn.Audio.canPlayAudioType(hostAudioCodec, cast mimeType);
#elseif (js && flight_esm)
	return flight._js._fn.Audio.canPlayAudioType(hostAudioCodec, mimeType);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function getAudioMimeTypeEssence(mimeType:String):String {
#if hl
	return cast flight._hl._fn.Audio.getAudioMimeTypeEssence(cast mimeType);
#elseif cpp
	return cast flight._cpp._fn.Audio.getAudioMimeTypeEssence(cast mimeType);
#elseif (js && flight_esm)
	return cast flight._js._fn.Audio.getAudioMimeTypeEssence(mimeType);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function getAudioMimeTypeParameter(mimeType:String, name:String):String {
#if hl
	return cast flight._hl._fn.Audio.getAudioMimeTypeParameter(cast mimeType, cast name);
#elseif cpp
	return cast flight._cpp._fn.Audio.getAudioMimeTypeParameter(cast mimeType, cast name);
#elseif (js && flight_esm)
	return cast flight._js._fn.Audio.getAudioMimeTypeParameter(mimeType, name);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function inferAudioMimeType(url:String):String {
#if hl
	return cast flight._hl._fn.Audio.inferAudioMimeType(cast url);
#elseif cpp
	return cast flight._cpp._fn.Audio.inferAudioMimeType(cast url);
#elseif (js && flight_esm)
	return cast flight._js._fn.Audio.inferAudioMimeType(url);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function createAudioResource(buffer:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Audio.createAudioResource(buffer);
#elseif cpp
	return flight._cpp._fn.Audio.createAudioResource(buffer);
#elseif (js && flight_esm)
	return flight._js._fn.Audio.createAudioResource(buffer);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function cloneAudioResource(resource:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Audio.cloneAudioResource(resource);
#elseif cpp
	return flight._cpp._fn.Audio.cloneAudioResource(resource);
#elseif (js && flight_esm)
	return flight._js._fn.Audio.cloneAudioResource(resource);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function disposeAudioResource(resource:Dynamic):Void {
#if hl
	flight._hl._fn.Audio.disposeAudioResource(resource);
#elseif cpp
	flight._cpp._fn.Audio.disposeAudioResource(resource);
#elseif (js && flight_esm)
	flight._js._fn.Audio.disposeAudioResource(resource);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function getAudioResourceByteSize(resource:Dynamic):Int {
#if hl
	return flight._hl._fn.Audio.getAudioResourceByteSize(resource);
#elseif cpp
	return flight._cpp._fn.Audio.getAudioResourceByteSize(resource);
#elseif (js && flight_esm)
	return flight._js._fn.Audio.getAudioResourceByteSize(resource);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function getAudioResourceChannelCount(resource:Dynamic):Int {
#if hl
	return flight._hl._fn.Audio.getAudioResourceChannelCount(resource);
#elseif cpp
	return flight._cpp._fn.Audio.getAudioResourceChannelCount(resource);
#elseif (js && flight_esm)
	return flight._js._fn.Audio.getAudioResourceChannelCount(resource);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function getAudioResourceDuration(resource:Dynamic):Float {
#if hl
	return flight._hl._fn.Audio.getAudioResourceDuration(resource);
#elseif cpp
	return flight._cpp._fn.Audio.getAudioResourceDuration(resource);
#elseif (js && flight_esm)
	return flight._js._fn.Audio.getAudioResourceDuration(resource);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function getAudioResourceSampleRate(resource:Dynamic):Float {
#if hl
	return flight._hl._fn.Audio.getAudioResourceSampleRate(resource);
#elseif cpp
	return flight._cpp._fn.Audio.getAudioResourceSampleRate(resource);
#elseif (js && flight_esm)
	return flight._js._fn.Audio.getAudioResourceSampleRate(resource);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function hasAudioResourceBuffer(resource:Dynamic):Bool {
#if hl
	return flight._hl._fn.Audio.hasAudioResourceBuffer(resource);
#elseif cpp
	return flight._cpp._fn.Audio.hasAudioResourceBuffer(resource);
#elseif (js && flight_esm)
	return flight._js._fn.Audio.hasAudioResourceBuffer(resource);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function isAudioResourceEmpty(resource:Dynamic):Bool {
#if hl
	return flight._hl._fn.Audio.isAudioResourceEmpty(resource);
#elseif cpp
	return flight._cpp._fn.Audio.isAudioResourceEmpty(resource);
#elseif (js && flight_esm)
	return flight._js._fn.Audio.isAudioResourceEmpty(resource);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function selectAudioResourceUrl(hostAudioCodec:HostAudioCodecCapability, sources:Dynamic, sourcesLen:Int, decoders:AudioDecoderRegistry):String {
#if hl
	return cast flight._hl._fn.Audio.selectAudioResourceUrl(hostAudioCodec, sources, sourcesLen, decoders);
#elseif cpp
	return cast flight._cpp._fn.Audio.selectAudioResourceUrl(hostAudioCodec, sources, sourcesLen, decoders);
#elseif (js && flight_esm)
	return cast flight._js._fn.Audio.selectAudioResourceUrl(hostAudioCodec, sources, sourcesLen, decoders);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function createAudioResourceFailure(cause:Unknown):Dynamic {
#if hl
	return flight._hl._fn.Audio.createAudioResourceFailure(cause);
#elseif cpp
	return flight._cpp._fn.Audio.createAudioResourceFailure(cause);
#elseif (js && flight_esm)
	return flight._js._fn.Audio.createAudioResourceFailure(cause);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function createExternalAudioResourceReference(uri:String):Dynamic {
#if hl
	return flight._hl._fn.Audio.createExternalAudioResourceReference(cast uri);
#elseif cpp
	return flight._cpp._fn.Audio.createExternalAudioResourceReference(cast uri);
#elseif (js && flight_esm)
	return flight._js._fn.Audio.createExternalAudioResourceReference(uri);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function explainAudioResourceReferenceResolution(reference:AudioResourceReference):AudioResourceReferenceResolutionExplanation {
#if hl
	return flight._hl._fn.Audio.explainAudioResourceReferenceResolution(reference);
#elseif cpp
	return flight._cpp._fn.Audio.explainAudioResourceReferenceResolution(reference);
#elseif (js && flight_esm)
	return flight._js._fn.Audio.explainAudioResourceReferenceResolution(reference);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function findAudioResourceReferenceByName(references:Dynamic, referencesLen:Int, name:String):AudioResourceReference {
#if hl
	return flight._hl._fn.Audio.findAudioResourceReferenceByName(references, referencesLen, cast name);
#elseif cpp
	return flight._cpp._fn.Audio.findAudioResourceReferenceByName(references, referencesLen, cast name);
#elseif (js && flight_esm)
	return flight._js._fn.Audio.findAudioResourceReferenceByName(references, referencesLen, name);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function resetFailedAudioResourceReference(reference:AudioResourceReference):Bool {
#if hl
	return flight._hl._fn.Audio.resetFailedAudioResourceReference(reference);
#elseif cpp
	return flight._cpp._fn.Audio.resetFailedAudioResourceReference(reference);
#elseif (js && flight_esm)
	return flight._js._fn.Audio.resetFailedAudioResourceReference(reference);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function getAudioChannelStateString(value:flight.AudioChannelState):String {
#if hl
	return cast flight._hl._fn.Audio.getAudioChannelStateString(value);
#elseif cpp
	return cast flight._cpp._fn.Audio.getAudioChannelStateString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Audio.getAudioChannelStateString(value);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function getAudioResourceFailureKindString(value:flight.AudioResourceFailureKind):String {
#if hl
	return cast flight._hl._fn.Audio.getAudioResourceFailureKindString(value);
#elseif cpp
	return cast flight._cpp._fn.Audio.getAudioResourceFailureKindString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Audio.getAudioResourceFailureKindString(value);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function getAudioResourceReferenceKindString(value:flight.AudioResourceReferenceKind):String {
#if hl
	return cast flight._hl._fn.Audio.getAudioResourceReferenceKindString(value);
#elseif cpp
	return cast flight._cpp._fn.Audio.getAudioResourceReferenceKindString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Audio.getAudioResourceReferenceKindString(value);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function parseAudioChannelState(value:String):Int {
#if hl
	return flight._hl._fn.Audio.parseAudioChannelState(cast value);
#elseif cpp
	return flight._cpp._fn.Audio.parseAudioChannelState(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Audio.parseAudioChannelState(value);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function parseAudioResourceFailureKind(value:String):Int {
#if hl
	return flight._hl._fn.Audio.parseAudioResourceFailureKind(cast value);
#elseif cpp
	return flight._cpp._fn.Audio.parseAudioResourceFailureKind(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Audio.parseAudioResourceFailureKind(value);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function parseAudioResourceReferenceKind(value:String):Int {
#if hl
	return flight._hl._fn.Audio.parseAudioResourceReferenceKind(cast value);
#elseif cpp
	return flight._cpp._fn.Audio.parseAudioResourceReferenceKind(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Audio.parseAudioResourceReferenceKind(value);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function freeAudioResourceReferenceResolutionExplanation(ptr:AudioResourceReferenceResolutionExplanation):Void {
#if hl
	flight._hl._fn.Audio.freeAudioResourceReferenceResolutionExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Audio.freeAudioResourceReferenceResolutionExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Audio.freeAudioResourceReferenceResolutionExplanation(ptr);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function freeAudioResourceReference(ptr:AudioResourceReference):Void {
#if hl
	flight._hl._fn.Audio.freeAudioResourceReference(ptr);
#elseif cpp
	flight._cpp._fn.Audio.freeAudioResourceReference(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Audio.freeAudioResourceReference(ptr);
#else
	#error "flight.Audio: no backend for this target."
#end
}
inline function freeString(ptr:Dynamic):Void {
#if hl
	flight._hl._fn.Audio.freeString(ptr);
#elseif cpp
	flight._cpp._fn.Audio.freeString(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Audio.freeString(ptr);
#else
	#error "flight.Audio: no backend for this target."
#end
}
