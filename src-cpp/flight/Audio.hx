// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

inline function getAudioMimeTypeEssence(mimeType:String):String {
  return flight._cpp._fn.Audio.getAudioMimeTypeEssence(mimeType);
}

extern inline function canPlayAudioType(hostAudioCodec:flight.HostAudioCodecCapability, mimeType:String):Bool {
  return flight._cpp._attempt.Attempt_Audio_canPlayAudioType.canPlayAudioType(hostAudioCodec, mimeType);
}

extern inline function cloneAudioResource(resource:flight.AudioResource):flight.AudioResource {
  return flight._cpp._attempt.Attempt_Audio_cloneAudioResource.cloneAudioResource(resource);
}

extern inline function createAudioResource(?buffer:flight.AudioBuffer):flight.AudioResource {
  return flight._cpp._attempt.Attempt_Audio_createAudioResource.createAudioResource(buffer);
}

extern inline function createAudioResourceFailure(cause:Dynamic):flight.AudioResourceFailure {
  return flight._cpp._attempt.Attempt_Audio_createAudioResourceFailure.createAudioResourceFailure(cause);
}

extern inline function createAudioResourceFromSamples(channels:Array<flight._internal._Float32Array>, sampleRate:Float):flight.AudioResource {
  return flight._cpp._attempt.Attempt_Audio_createAudioResourceFromSamples.createAudioResourceFromSamples(channels, sampleRate);
}

extern inline function createEmbeddedAudioResourceReference(bytes:flight._internal._UInt8Array, ?mimeType:Null<String>, ?name:Null<String>):flight.EmbeddedAudioResourceReference {
  return flight._cpp._attempt.Attempt_Audio_createEmbeddedAudioResourceReference.createEmbeddedAudioResourceReference(bytes, mimeType, name);
}

extern inline function createExternalAudioResourceReference(uri:String, ?basePath:Null<String>, ?mimeType:Null<String>, ?name:Null<String>):flight.ExternalAudioResourceReference {
  return flight._cpp._attempt.Attempt_Audio_createExternalAudioResourceReference.createExternalAudioResourceReference(uri, basePath, mimeType, name);
}

extern inline function decodeAudioResourceBytes(audioDecode:flight.HostAudioDecodeCapabilities, bytes:flight._internal._UInt8Array, mimeType:Null<String>, signal:flight.AbortSignal, ?decoders:flight.AudioDecoderRegistry):flight._internal._Promise<Null<flight.AudioResource>> {
  return flight._cpp._attempt.Attempt_Audio_decodeAudioResourceBytes.decodeAudioResourceBytes(audioDecode, bytes, mimeType, signal, decoders);
}

extern inline function detectAudioMimeType(data:Dynamic):Null<String> {
  return flight._cpp._attempt.Attempt_Audio_detectAudioMimeType.detectAudioMimeType(data);
}

extern inline function disposeAudioResource(resource:flight.AudioResource):Void {
  flight._cpp._attempt.Attempt_Audio_disposeAudioResource.disposeAudioResource(resource);
}

extern inline function explainAudioResourceReferenceResolution(ref:flight.AudioResourceReference):flight.AudioResourceReferenceResolutionExplanation {
  return flight._cpp._attempt.Attempt_Audio_explainAudioResourceReferenceResolution.explainAudioResourceReferenceResolution(ref);
}

extern inline function findAudioResourceReferenceByName(references:Array<flight.AudioResourceReference>, name:String):Null<flight.AudioResourceReference> {
  return flight._cpp._attempt.Attempt_Audio_findAudioResourceReferenceByName.findAudioResourceReferenceByName(references, name);
}

extern inline function getAudioDecodeSlot(audioDecode:flight.HostAudioDecodeCapabilities, mimeType:String):Null<flight.HostAudioDecodeFormatCapability> {
  return flight._cpp._attempt.Attempt_Audio_getAudioDecodeSlot.getAudioDecodeSlot(audioDecode, mimeType);
}

extern inline function getAudioMimeTypeParameter(mimeType:String, name:String):Null<String> {
  return flight._cpp._attempt.Attempt_Audio_getAudioMimeTypeParameter.getAudioMimeTypeParameter(mimeType, name);
}

extern inline function getAudioResourceByteSize(resource:flight.AudioResource):Float {
  return flight._cpp._attempt.Attempt_Audio_getAudioResourceByteSize.getAudioResourceByteSize(resource);
}

extern inline function getAudioResourceChannelCount(resource:flight.AudioResource):Float {
  return flight._cpp._attempt.Attempt_Audio_getAudioResourceChannelCount.getAudioResourceChannelCount(resource);
}

extern inline function getAudioResourceChannelData(resource:flight.AudioResource, channel:Float):Null<flight._internal._Float32Array> {
  return flight._cpp._attempt.Attempt_Audio_getAudioResourceChannelData.getAudioResourceChannelData(resource, channel);
}

extern inline function getAudioResourceDuration(resource:flight.AudioResource):Float {
  return flight._cpp._attempt.Attempt_Audio_getAudioResourceDuration.getAudioResourceDuration(resource);
}

extern inline function getAudioResourceSampleRate(resource:flight.AudioResource):Float {
  return flight._cpp._attempt.Attempt_Audio_getAudioResourceSampleRate.getAudioResourceSampleRate(resource);
}

extern inline function hasAudioDecodeSlot(audioDecode:flight.HostAudioDecodeCapabilities, mimeType:String):Bool {
  return flight._cpp._attempt.Attempt_Audio_hasAudioDecodeSlot.hasAudioDecodeSlot(audioDecode, mimeType);
}

extern inline function hasAudioResourceBuffer(resource:flight.AudioResource):Bool {
  return flight._cpp._attempt.Attempt_Audio_hasAudioResourceBuffer.hasAudioResourceBuffer(resource);
}

extern inline function inferAudioMimeType(url:String):Null<String> {
  return flight._cpp._attempt.Attempt_Audio_inferAudioMimeType.inferAudioMimeType(url);
}

extern inline function initializeAudioResource(out:flight.EntityConstruction<flight.AudioResource>, ?buffer:flight.AudioBuffer):Void {
  flight._cpp._attempt.Attempt_Audio_initializeAudioResource.initializeAudioResource(out, buffer);
}

extern inline function initializeEmbeddedAudioResourceReference(out:flight.EntityConstruction<flight.EmbeddedAudioResourceReference>, bytes:flight._internal._UInt8Array, ?mimeType:Null<String>, ?name:Null<String>):Void {
  flight._cpp._attempt.Attempt_Audio_initializeEmbeddedAudioResourceReference.initializeEmbeddedAudioResourceReference(out, bytes, mimeType, name);
}

extern inline function initializeExternalAudioResourceReference(out:flight.EntityConstruction<flight.ExternalAudioResourceReference>, uri:String, ?basePath:Null<String>, ?mimeType:Null<String>, ?name:Null<String>):Void {
  flight._cpp._attempt.Attempt_Audio_initializeExternalAudioResourceReference.initializeExternalAudioResourceReference(out, uri, basePath, mimeType, name);
}

extern inline function isAudioResourceEmpty(resource:flight.AudioResource):Bool {
  return flight._cpp._attempt.Attempt_Audio_isAudioResourceEmpty.isAudioResourceEmpty(resource);
}

extern inline function loadAudioResourceFromBase64(audioDecode:flight.HostAudioDecodeCapabilities, base64:String, mimeType:String, ?signal:flight.AbortSignal, ?decoders:flight.AudioDecoderRegistry):flight._internal._Promise<flight.AudioResource> {
  return flight._cpp._attempt.Attempt_Audio_loadAudioResourceFromBase64.loadAudioResourceFromBase64(audioDecode, base64, mimeType, signal, decoders);
}

extern inline function loadAudioResourceFromBlob(audioDecode:flight.HostAudioDecodeCapabilities, blob:flight.Blob, ?signal:flight.AbortSignal, ?decoders:flight.AudioDecoderRegistry):flight._internal._Promise<flight.AudioResource> {
  return flight._cpp._attempt.Attempt_Audio_loadAudioResourceFromBlob.loadAudioResourceFromBlob(audioDecode, blob, signal, decoders);
}

extern inline function loadAudioResourceFromBytes(audioDecode:flight.HostAudioDecodeCapabilities, bytes:flight._internal._UInt8Array, ?mimeType:String, ?signal:flight.AbortSignal, ?decoders:flight.AudioDecoderRegistry):flight._internal._Promise<flight.AudioResource> {
  return flight._cpp._attempt.Attempt_Audio_loadAudioResourceFromBytes.loadAudioResourceFromBytes(audioDecode, bytes, mimeType, signal, decoders);
}

extern inline function loadAudioResourceFromUrl(hostNet:flight.HostNetCapability, audioDecode:flight.HostAudioDecodeCapabilities, url:String, ?signal:flight.AbortSignal, ?decoders:flight.AudioDecoderRegistry):flight._internal._Promise<flight.AudioResource> {
  return flight._cpp._attempt.Attempt_Audio_loadAudioResourceFromUrl.loadAudioResourceFromUrl(hostNet, audioDecode, url, signal, decoders);
}

extern inline function loadAudioResourceFromUrls(hostNet:flight.HostNetCapability, hostAudioCodec:flight.HostAudioCodecCapability, audioDecode:flight.HostAudioDecodeCapabilities, sources:Array<flight.AudioResourceUrl>, ?signal:flight.AbortSignal, ?decoders:flight.AudioDecoderRegistry):flight._internal._Promise<flight.AudioResource> {
  return flight._cpp._attempt.Attempt_Audio_loadAudioResourceFromUrls.loadAudioResourceFromUrls(hostNet, hostAudioCodec, audioDecode, sources, signal, decoders);
}

extern inline function resetFailedAudioResourceReference(ref:flight.AudioResourceReference):Bool {
  return flight._cpp._attempt.Attempt_Audio_resetFailedAudioResourceReference.resetFailedAudioResourceReference(ref);
}

extern inline function resolveAudioResourceReference(ref:flight.AudioResourceReference, audioDecode:flight.HostAudioDecodeCapabilities, fetch:flight.AudioResourceFetch, signal:flight.AbortSignal, ?decoders:flight.AudioDecoderRegistry):flight._internal._Promise<Null<flight.AudioResource>> {
  return flight._cpp._attempt.Attempt_Audio_resolveAudioResourceReference.resolveAudioResourceReference(ref, audioDecode, fetch, signal, decoders);
}

extern inline function selectAudioResourceUrl(hostAudioCodec:flight.HostAudioCodecCapability, sources:Array<flight.AudioResourceUrl>, ?decoders:flight.AudioDecoderRegistry):Null<String> {
  return flight._cpp._attempt.Attempt_Audio_selectAudioResourceUrl.selectAudioResourceUrl(hostAudioCodec, sources, decoders);
}
