package flight;

#if (js && flight_esm)
extern inline function createAudioBuffer(length:Int, numberOfChannels:Int, sampleRate:Float):Dynamic {
	return flight._js._fn.Audio.createAudioBuffer(length, numberOfChannels, sampleRate);
}
#else
extern inline function createAudioBuffer(length:Int, numberOfChannels:Int, sampleRate:Float):Dynamic {
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
#end
#if (js && flight_esm)
extern inline function copyToAudioBufferChannel(buffer:Dynamic, source:Dynamic, channel:Int):Void {
	flight._js._fn.Audio.copyToAudioBufferChannel(buffer, source, channel);
}
#else
extern inline function copyToAudioBufferChannel(buffer:Dynamic, source:Dynamic, sourceLen:Int, channel:Int):Void {
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
#end
#if (js && flight_esm)
extern inline function hasAudioDecodeSlot(audioDecode:HostAudioDecodeCapabilities, mimeType:String):Bool {
	return flight._js._fn.Audio.hasAudioDecodeSlot(audioDecode, mimeType);
}
#else
extern inline function hasAudioDecodeSlot(audioDecode:HostAudioDecodeCapabilities, mimeType:String):Bool {
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
#end
#if (js && flight_esm)
extern inline function canPlayAudioType(hostAudioCodec:HostAudioCodecCapability, mimeType:String):Bool {
	return flight._js._fn.Audio.canPlayAudioType(hostAudioCodec, mimeType);
}
#else
extern inline function canPlayAudioType(hostAudioCodec:HostAudioCodecCapability, mimeType:String):Bool {
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
#end
#if (js && flight_esm)
extern inline function getAudioMimeTypeEssence(mimeType:String):String {
	return flight._js._fn.Audio.getAudioMimeTypeEssence(mimeType);
}
#else
extern inline function getAudioMimeTypeEssence(mimeType:String):String {
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
#end
#if (js && flight_esm)
extern inline function getAudioMimeTypeParameter(mimeType:String, name:String):Null<String> {
	return flight._js._fn.Audio.getAudioMimeTypeParameter(mimeType, name);
}
#else
extern inline function getAudioMimeTypeParameter(mimeType:String, name:String):String {
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
#end
#if (js && flight_esm)
extern inline function inferAudioMimeType(url:String):Null<String> {
	return flight._js._fn.Audio.inferAudioMimeType(url);
}
#else
extern inline function inferAudioMimeType(url:String):String {
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
#end
#if (js && flight_esm)
extern inline function createAudioResource(buffer:Null<Dynamic>):Dynamic {
	return flight._js._fn.Audio.createAudioResource(buffer);
}
#else
extern inline function createAudioResource(buffer:Dynamic):Dynamic {
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
#end
#if (js && flight_esm)
extern inline function cloneAudioResource(resource:Dynamic):Dynamic {
	return flight._js._fn.Audio.cloneAudioResource(resource);
}
#else
extern inline function cloneAudioResource(resource:Dynamic):Dynamic {
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
#end
#if (js && flight_esm)
extern inline function disposeAudioResource(resource:Dynamic):Void {
	flight._js._fn.Audio.disposeAudioResource(resource);
}
#else
extern inline function disposeAudioResource(resource:Dynamic):Void {
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
#end
#if (js && flight_esm)
extern inline function getAudioResourceByteSize(resource:Dynamic):Int {
	return flight._js._fn.Audio.getAudioResourceByteSize(resource);
}
#else
extern inline function getAudioResourceByteSize(resource:Dynamic):Int {
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
#end
#if (js && flight_esm)
extern inline function getAudioResourceChannelCount(resource:Dynamic):Int {
	return flight._js._fn.Audio.getAudioResourceChannelCount(resource);
}
#else
extern inline function getAudioResourceChannelCount(resource:Dynamic):Int {
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
#end
#if (js && flight_esm)
extern inline function getAudioResourceDuration(resource:Dynamic):Float {
	return flight._js._fn.Audio.getAudioResourceDuration(resource);
}
#else
extern inline function getAudioResourceDuration(resource:Dynamic):Float {
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
#end
#if (js && flight_esm)
extern inline function getAudioResourceSampleRate(resource:Dynamic):Float {
	return flight._js._fn.Audio.getAudioResourceSampleRate(resource);
}
#else
extern inline function getAudioResourceSampleRate(resource:Dynamic):Float {
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
#end
#if (js && flight_esm)
extern inline function hasAudioResourceBuffer(resource:Dynamic):Bool {
	return flight._js._fn.Audio.hasAudioResourceBuffer(resource);
}
#else
extern inline function hasAudioResourceBuffer(resource:Dynamic):Bool {
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
#end
#if (js && flight_esm)
extern inline function isAudioResourceEmpty(resource:Dynamic):Bool {
	return flight._js._fn.Audio.isAudioResourceEmpty(resource);
}
#else
extern inline function isAudioResourceEmpty(resource:Dynamic):Bool {
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
#end
#if (js && flight_esm)
extern inline function selectAudioResourceUrl(hostAudioCodec:HostAudioCodecCapability, sources:Dynamic, decoders:Null<AudioDecoderRegistry>):Null<String> {
	return flight._js._fn.Audio.selectAudioResourceUrl(hostAudioCodec, sources, decoders);
}
#else
extern inline function selectAudioResourceUrl(hostAudioCodec:HostAudioCodecCapability, sources:Dynamic, sourcesLen:Int, decoders:AudioDecoderRegistry):String {
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
#end
#if (js && flight_esm)
extern inline function createAudioResourceFailure(cause:Unknown):Dynamic {
	return flight._js._fn.Audio.createAudioResourceFailure(cause);
}
#else
extern inline function createAudioResourceFailure(cause:Unknown):Dynamic {
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
#end
#if (js && flight_esm)
extern inline function createExternalAudioResourceReference(uri:String):Dynamic {
	return flight._js._fn.Audio.createExternalAudioResourceReference(uri);
}
#else
extern inline function createExternalAudioResourceReference(uri:String):Dynamic {
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
#end
#if (js && flight_esm)
extern inline function explainAudioResourceReferenceResolution(reference:AudioResourceReference):AudioResourceReferenceResolutionExplanation {
	return flight._js._fn.Audio.explainAudioResourceReferenceResolution(reference);
}
#else
extern inline function explainAudioResourceReferenceResolution(reference:AudioResourceReference):AudioResourceReferenceResolutionExplanation {
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
#end
#if (js && flight_esm)
extern inline function findAudioResourceReferenceByName(references:Dynamic, name:String):Null<AudioResourceReference> {
	return flight._js._fn.Audio.findAudioResourceReferenceByName(references, name);
}
#else
extern inline function findAudioResourceReferenceByName(references:Dynamic, referencesLen:Int, name:String):AudioResourceReference {
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
#end
#if (js && flight_esm)
extern inline function resetFailedAudioResourceReference(reference:AudioResourceReference):Bool {
	return flight._js._fn.Audio.resetFailedAudioResourceReference(reference);
}
#else
extern inline function resetFailedAudioResourceReference(reference:AudioResourceReference):Bool {
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
#end
#if (js && flight_esm)
extern inline function getAudioChannelStateString(value:Dynamic):String {
	return flight._js._fn.Audio.getAudioChannelStateString(value);
}
#else
extern inline function getAudioChannelStateString(value:flight.AudioChannelState):String {
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
#end
#if (js && flight_esm)
extern inline function getAudioResourceFailureKindString(value:Dynamic):String {
	return flight._js._fn.Audio.getAudioResourceFailureKindString(value);
}
#else
extern inline function getAudioResourceFailureKindString(value:flight.AudioResourceFailureKind):String {
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
#end
#if (js && flight_esm)
extern inline function getAudioResourceReferenceKindString(value:Dynamic):String {
	return flight._js._fn.Audio.getAudioResourceReferenceKindString(value);
}
#else
extern inline function getAudioResourceReferenceKindString(value:flight.AudioResourceReferenceKind):String {
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
#end
#if (js && flight_esm)
extern inline function parseAudioChannelState(value:String):Null<Dynamic> {
	return flight._js._fn.Audio.parseAudioChannelState(value);
}
#else
extern inline function parseAudioChannelState(value:String):Int {
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
#end
#if (js && flight_esm)
extern inline function parseAudioResourceFailureKind(value:String):Null<Dynamic> {
	return flight._js._fn.Audio.parseAudioResourceFailureKind(value);
}
#else
extern inline function parseAudioResourceFailureKind(value:String):Int {
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
#end
#if (js && flight_esm)
extern inline function parseAudioResourceReferenceKind(value:String):Null<Dynamic> {
	return flight._js._fn.Audio.parseAudioResourceReferenceKind(value);
}
#else
extern inline function parseAudioResourceReferenceKind(value:String):Int {
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
#end
#if (js && flight_esm)
extern inline function freeAudioResourceReferenceResolutionExplanation(ptr:AudioResourceReferenceResolutionExplanation):Void {
	flight._js._fn.Audio.freeAudioResourceReferenceResolutionExplanation(ptr);
}
#else
extern inline function freeAudioResourceReferenceResolutionExplanation(ptr:AudioResourceReferenceResolutionExplanation):Void {
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
#end
#if (js && flight_esm)
extern inline function freeAudioResourceReference(ptr:AudioResourceReference):Void {
	flight._js._fn.Audio.freeAudioResourceReference(ptr);
}
#else
extern inline function freeAudioResourceReference(ptr:AudioResourceReference):Void {
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
#end
#if (js && flight_esm)
extern inline function freeString(ptr:Dynamic):Void {
	flight._js._fn.Audio.freeString(ptr);
}
#else
extern inline function freeString(ptr:Dynamic):Void {
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
#end
