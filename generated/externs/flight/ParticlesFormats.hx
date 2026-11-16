package flight;

extern inline function detectParticleFormat(registry:ParticleFormatRegistry, text:String):ParticleFormatKind {
#if hl
	return flight._hl._fn.ParticlesFormats.detectParticleFormat(registry, cast text);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.detectParticleFormat(registry, cast text);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.detectParticleFormat(registry, text);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function createParticleFormatRegistry():ParticleFormatRegistry {
#if hl
	return flight._hl._fn.ParticlesFormats.createParticleFormatRegistry();
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.createParticleFormatRegistry();
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.createParticleFormatRegistry();
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function detectRegisteredParticleFormat(registry:ParticleFormatRegistry, text:String):ParticleFormatKind {
#if hl
	return flight._hl._fn.ParticlesFormats.detectRegisteredParticleFormat(registry, cast text);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.detectRegisteredParticleFormat(registry, cast text);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.detectRegisteredParticleFormat(registry, text);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function getRegisteredParticleFormats(out:Dynamic, registry:ParticleFormatRegistry):Void {
#if hl
	flight._hl._fn.ParticlesFormats.getRegisteredParticleFormats(out, registry);
#elseif cpp
	flight._cpp._fn.ParticlesFormats.getRegisteredParticleFormats(out, registry);
#elseif (js && flight_esm)
	flight._js._fn.ParticlesFormats.getRegisteredParticleFormats(out, registry);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function parseRegisteredParticleFormat(registry:ParticleFormatRegistry, text:String, kind:String, options:ParseParticleConfigOptions):ParticleConfigParseResult {
#if hl
	return flight._hl._fn.ParticlesFormats.parseRegisteredParticleFormat(registry, cast text, cast kind, options);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.parseRegisteredParticleFormat(registry, cast text, cast kind, options);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.parseRegisteredParticleFormat(registry, text, kind, options);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function registerParticleFormat(registry:ParticleFormatRegistry, kind:String, codec:ParticleFormatCodec):Void {
#if hl
	flight._hl._fn.ParticlesFormats.registerParticleFormat(registry, cast kind, codec);
#elseif cpp
	flight._cpp._fn.ParticlesFormats.registerParticleFormat(registry, cast kind, codec);
#elseif (js && flight_esm)
	flight._js._fn.ParticlesFormats.registerParticleFormat(registry, kind, codec);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function unregisterParticleFormat(registry:ParticleFormatRegistry, kind:String):Bool {
#if hl
	return flight._hl._fn.ParticlesFormats.unregisterParticleFormat(registry, cast kind);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.unregisterParticleFormat(registry, cast kind);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.unregisterParticleFormat(registry, kind);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function parseLibgdxParticle(text:String, options:LibgdxParseOptions):ParticleEmitterConfig {
#if hl
	return flight._hl._fn.ParticlesFormats.parseLibgdxParticle(cast text, options);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.parseLibgdxParticle(cast text, options);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.parseLibgdxParticle(text, options);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function parseLibgdxParticleDocument(text:String, options:LibgdxParseOptions):LibgdxParseResult {
#if hl
	return flight._hl._fn.ParticlesFormats.parseLibgdxParticleDocument(cast text, options);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.parseLibgdxParticleDocument(cast text, options);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.parseLibgdxParticleDocument(text, options);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function serializeLibgdxParticle(config:ParticleEmitterConfig, existing:LibgdxParticleDocument, options:LibgdxSerializeOptions):String {
#if hl
	return cast flight._hl._fn.ParticlesFormats.serializeLibgdxParticle(config, existing, options);
#elseif cpp
	return cast flight._cpp._fn.ParticlesFormats.serializeLibgdxParticle(config, existing, options);
#elseif (js && flight_esm)
	return cast flight._js._fn.ParticlesFormats.serializeLibgdxParticle(config, existing, options);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function serializeLibgdxParticleDocument(config:ParticleEmitterConfig, existing:LibgdxParticleDocument, options:LibgdxSerializeOptions):ParticleSerializeResult {
#if hl
	return flight._hl._fn.ParticlesFormats.serializeLibgdxParticleDocument(config, existing, options);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.serializeLibgdxParticleDocument(config, existing, options);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.serializeLibgdxParticleDocument(config, existing, options);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function parseParticleConfig(registry:ParticleFormatRegistry, text:String, options:ParseParticleConfigOptions):ParticleEmitterConfig {
#if hl
	return flight._hl._fn.ParticlesFormats.parseParticleConfig(registry, cast text, options);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.parseParticleConfig(registry, cast text, options);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.parseParticleConfig(registry, text, options);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function parseParticleConfigDocument(registry:ParticleFormatRegistry, text:String, options:ParseParticleConfigOptions):ParticleConfigParseResult {
#if hl
	return flight._hl._fn.ParticlesFormats.parseParticleConfigDocument(registry, cast text, options);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.parseParticleConfigDocument(registry, cast text, options);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.parseParticleConfigDocument(registry, text, options);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function parseParticleDesignerPlist(plistXml:String, options:ParticleDesignerParseOptions):ParticleEmitterConfig {
#if hl
	return flight._hl._fn.ParticlesFormats.parseParticleDesignerPlist(cast plistXml, options);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.parseParticleDesignerPlist(cast plistXml, options);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.parseParticleDesignerPlist(plistXml, options);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function parseParticleDesignerPlistDocument(plistXml:String, options:ParticleDesignerParseOptions):ParticleDesignerParseResult {
#if hl
	return flight._hl._fn.ParticlesFormats.parseParticleDesignerPlistDocument(cast plistXml, options);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.parseParticleDesignerPlistDocument(cast plistXml, options);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.parseParticleDesignerPlistDocument(plistXml, options);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function serializeParticleDesignerPlist(config:ParticleEmitterConfig, existing:ParticleDesignerDocument, options:ParticleDesignerSerializeOptions):String {
#if hl
	return cast flight._hl._fn.ParticlesFormats.serializeParticleDesignerPlist(config, existing, options);
#elseif cpp
	return cast flight._cpp._fn.ParticlesFormats.serializeParticleDesignerPlist(config, existing, options);
#elseif (js && flight_esm)
	return cast flight._js._fn.ParticlesFormats.serializeParticleDesignerPlist(config, existing, options);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function serializeParticleDesignerPlistDocument(config:ParticleEmitterConfig, existing:ParticleDesignerDocument, options:ParticleDesignerSerializeOptions):ParticleSerializeResult {
#if hl
	return flight._hl._fn.ParticlesFormats.serializeParticleDesignerPlistDocument(config, existing, options);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.serializeParticleDesignerPlistDocument(config, existing, options);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.serializeParticleDesignerPlistDocument(config, existing, options);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function parsePixiParticle(json:String):ParticleEmitterConfig {
#if hl
	return flight._hl._fn.ParticlesFormats.parsePixiParticle(cast json);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.parsePixiParticle(cast json);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.parsePixiParticle(json);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function parsePixiParticleDocument(json:String):PixiParseResult {
#if hl
	return flight._hl._fn.ParticlesFormats.parsePixiParticleDocument(cast json);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.parsePixiParticleDocument(cast json);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.parsePixiParticleDocument(json);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function createParticleAllFormats():Dynamic {
#if hl
	return flight._hl._fn.ParticlesFormats.createParticleAllFormats();
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.createParticleAllFormats();
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.createParticleAllFormats();
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function applyParticleImportOptions(registry:ParticleFormatRegistry, options:ParticleImportOptions):Void {
#if hl
	flight._hl._fn.ParticlesFormats.applyParticleImportOptions(registry, options);
#elseif cpp
	flight._cpp._fn.ParticlesFormats.applyParticleImportOptions(registry, options);
#elseif (js && flight_esm)
	flight._js._fn.ParticlesFormats.applyParticleImportOptions(registry, options);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function getLibgdxParticleFormat():ParticleFormatDescriptor {
#if hl
	return flight._hl._fn.ParticlesFormats.getLibgdxParticleFormat();
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.getLibgdxParticleFormat();
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.getLibgdxParticleFormat();
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function getParticleDesignerParticleFormat():ParticleFormatDescriptor {
#if hl
	return flight._hl._fn.ParticlesFormats.getParticleDesignerParticleFormat();
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.getParticleDesignerParticleFormat();
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.getParticleDesignerParticleFormat();
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function getPixiParticleFormat():ParticleFormatDescriptor {
#if hl
	return flight._hl._fn.ParticlesFormats.getPixiParticleFormat();
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.getPixiParticleFormat();
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.getPixiParticleFormat();
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function getSpineParticleFormat():ParticleFormatDescriptor {
#if hl
	return flight._hl._fn.ParticlesFormats.getSpineParticleFormat();
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.getSpineParticleFormat();
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.getSpineParticleFormat();
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function getStarlingPexParticleFormat():ParticleFormatDescriptor {
#if hl
	return flight._hl._fn.ParticlesFormats.getStarlingPexParticleFormat();
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.getStarlingPexParticleFormat();
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.getStarlingPexParticleFormat();
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function getUnityParticleFormat():ParticleFormatDescriptor {
#if hl
	return flight._hl._fn.ParticlesFormats.getUnityParticleFormat();
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.getUnityParticleFormat();
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.getUnityParticleFormat();
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function registerBuiltInParticleFormats(registry:ParticleFormatRegistry):Void {
#if hl
	flight._hl._fn.ParticlesFormats.registerBuiltInParticleFormats(registry);
#elseif cpp
	flight._cpp._fn.ParticlesFormats.registerBuiltInParticleFormats(registry);
#elseif (js && flight_esm)
	flight._js._fn.ParticlesFormats.registerBuiltInParticleFormats(registry);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function parseSpineParticle(json:String):ParticleEmitterConfig {
#if hl
	return flight._hl._fn.ParticlesFormats.parseSpineParticle(cast json);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.parseSpineParticle(cast json);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.parseSpineParticle(json);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function parseSpineParticleDocument(json:String):SpineParseResult {
#if hl
	return flight._hl._fn.ParticlesFormats.parseSpineParticleDocument(cast json);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.parseSpineParticleDocument(cast json);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.parseSpineParticleDocument(json);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function serializeSpineParticle(config:ParticleEmitterConfig, existing:SpineParticleDocument):String {
#if hl
	return cast flight._hl._fn.ParticlesFormats.serializeSpineParticle(config, existing);
#elseif cpp
	return cast flight._cpp._fn.ParticlesFormats.serializeSpineParticle(config, existing);
#elseif (js && flight_esm)
	return cast flight._js._fn.ParticlesFormats.serializeSpineParticle(config, existing);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function serializeSpineParticleDocument(config:ParticleEmitterConfig, existing:SpineParticleDocument):ParticleSerializeResult {
#if hl
	return flight._hl._fn.ParticlesFormats.serializeSpineParticleDocument(config, existing);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.serializeSpineParticleDocument(config, existing);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.serializeSpineParticleDocument(config, existing);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function parseStarlingPex(xml:String, options:StarlingPexParseOptions):ParticleEmitterConfig {
#if hl
	return flight._hl._fn.ParticlesFormats.parseStarlingPex(cast xml, options);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.parseStarlingPex(cast xml, options);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.parseStarlingPex(xml, options);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function parseStarlingPexDocument(xml:String, options:StarlingPexParseOptions):StarlingPexParseResult {
#if hl
	return flight._hl._fn.ParticlesFormats.parseStarlingPexDocument(cast xml, options);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.parseStarlingPexDocument(cast xml, options);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.parseStarlingPexDocument(xml, options);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function serializeStarlingPex(config:ParticleEmitterConfig, existing:StarlingPexDocument, options:StarlingPexSerializeOptions):String {
#if hl
	return cast flight._hl._fn.ParticlesFormats.serializeStarlingPex(config, existing, options);
#elseif cpp
	return cast flight._cpp._fn.ParticlesFormats.serializeStarlingPex(config, existing, options);
#elseif (js && flight_esm)
	return cast flight._js._fn.ParticlesFormats.serializeStarlingPex(config, existing, options);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function serializeStarlingPexDocument(config:ParticleEmitterConfig, existing:StarlingPexDocument, options:StarlingPexSerializeOptions):ParticleSerializeResult {
#if hl
	return flight._hl._fn.ParticlesFormats.serializeStarlingPexDocument(config, existing, options);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.serializeStarlingPexDocument(config, existing, options);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.serializeStarlingPexDocument(config, existing, options);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function parseUnityParticle(json:String, options:UnityParseOptions):ParticleEmitterConfig {
#if hl
	return flight._hl._fn.ParticlesFormats.parseUnityParticle(cast json, options);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.parseUnityParticle(cast json, options);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.parseUnityParticle(json, options);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function parseUnityParticleDocument(json:String, options:UnityParseOptions):UnityParseResult {
#if hl
	return flight._hl._fn.ParticlesFormats.parseUnityParticleDocument(cast json, options);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.parseUnityParticleDocument(cast json, options);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.parseUnityParticleDocument(json, options);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function serializeUnityParticle(config:ParticleEmitterConfig, existing:UnityParticleDocument, options:UnitySerializeOptions):String {
#if hl
	return cast flight._hl._fn.ParticlesFormats.serializeUnityParticle(config, existing, options);
#elseif cpp
	return cast flight._cpp._fn.ParticlesFormats.serializeUnityParticle(config, existing, options);
#elseif (js && flight_esm)
	return cast flight._js._fn.ParticlesFormats.serializeUnityParticle(config, existing, options);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function serializeUnityParticleDocument(config:ParticleEmitterConfig, existing:UnityParticleDocument, options:UnitySerializeOptions):ParticleSerializeResult {
#if hl
	return flight._hl._fn.ParticlesFormats.serializeUnityParticleDocument(config, existing, options);
#elseif cpp
	return flight._cpp._fn.ParticlesFormats.serializeUnityParticleDocument(config, existing, options);
#elseif (js && flight_esm)
	return flight._js._fn.ParticlesFormats.serializeUnityParticleDocument(config, existing, options);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function freeParticleFormatKind(ptr:ParticleFormatKind):Void {
#if hl
	flight._hl._fn.ParticlesFormats.freeParticleFormatKind(ptr);
#elseif cpp
	flight._cpp._fn.ParticlesFormats.freeParticleFormatKind(ptr);
#elseif (js && flight_esm)
	flight._js._fn.ParticlesFormats.freeParticleFormatKind(ptr);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function freeParticleFormatRegistry(ptr:ParticleFormatRegistry):Void {
#if hl
	flight._hl._fn.ParticlesFormats.freeParticleFormatRegistry(ptr);
#elseif cpp
	flight._cpp._fn.ParticlesFormats.freeParticleFormatRegistry(ptr);
#elseif (js && flight_esm)
	flight._js._fn.ParticlesFormats.freeParticleFormatRegistry(ptr);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function freeParticleConfigParseResult(ptr:ParticleConfigParseResult):Void {
#if hl
	flight._hl._fn.ParticlesFormats.freeParticleConfigParseResult(ptr);
#elseif cpp
	flight._cpp._fn.ParticlesFormats.freeParticleConfigParseResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.ParticlesFormats.freeParticleConfigParseResult(ptr);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function freeLibgdxParseResult(ptr:LibgdxParseResult):Void {
#if hl
	flight._hl._fn.ParticlesFormats.freeLibgdxParseResult(ptr);
#elseif cpp
	flight._cpp._fn.ParticlesFormats.freeLibgdxParseResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.ParticlesFormats.freeLibgdxParseResult(ptr);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function freeParticleSerializeResult(ptr:ParticleSerializeResult):Void {
#if hl
	flight._hl._fn.ParticlesFormats.freeParticleSerializeResult(ptr);
#elseif cpp
	flight._cpp._fn.ParticlesFormats.freeParticleSerializeResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.ParticlesFormats.freeParticleSerializeResult(ptr);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function freeParticleDesignerParseResult(ptr:ParticleDesignerParseResult):Void {
#if hl
	flight._hl._fn.ParticlesFormats.freeParticleDesignerParseResult(ptr);
#elseif cpp
	flight._cpp._fn.ParticlesFormats.freeParticleDesignerParseResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.ParticlesFormats.freeParticleDesignerParseResult(ptr);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function freePixiParseResult(ptr:PixiParseResult):Void {
#if hl
	flight._hl._fn.ParticlesFormats.freePixiParseResult(ptr);
#elseif cpp
	flight._cpp._fn.ParticlesFormats.freePixiParseResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.ParticlesFormats.freePixiParseResult(ptr);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function freeParticleFormatDescriptor(ptr:ParticleFormatDescriptor):Void {
#if hl
	flight._hl._fn.ParticlesFormats.freeParticleFormatDescriptor(ptr);
#elseif cpp
	flight._cpp._fn.ParticlesFormats.freeParticleFormatDescriptor(ptr);
#elseif (js && flight_esm)
	flight._js._fn.ParticlesFormats.freeParticleFormatDescriptor(ptr);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function freeSpineParseResult(ptr:SpineParseResult):Void {
#if hl
	flight._hl._fn.ParticlesFormats.freeSpineParseResult(ptr);
#elseif cpp
	flight._cpp._fn.ParticlesFormats.freeSpineParseResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.ParticlesFormats.freeSpineParseResult(ptr);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function freeStarlingPexParseResult(ptr:StarlingPexParseResult):Void {
#if hl
	flight._hl._fn.ParticlesFormats.freeStarlingPexParseResult(ptr);
#elseif cpp
	flight._cpp._fn.ParticlesFormats.freeStarlingPexParseResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.ParticlesFormats.freeStarlingPexParseResult(ptr);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
extern inline function freeUnityParseResult(ptr:UnityParseResult):Void {
#if hl
	flight._hl._fn.ParticlesFormats.freeUnityParseResult(ptr);
#elseif cpp
	flight._cpp._fn.ParticlesFormats.freeUnityParseResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.ParticlesFormats.freeUnityParseResult(ptr);
#else
	#error "flight.ParticlesFormats: no backend for this target."
#end
}
