package flight;

inline function parseTextureAtlasAsepriteDocument(atlas:TextureAtlas, doc:TextureAtlasAsepriteDocument):Void {
#if hl
	flight._hl._fn.TextureatlasFormats.parseTextureAtlasAsepriteDocument(atlas, doc);
#elseif cpp
	flight._cpp._fn.TextureatlasFormats.parseTextureAtlasAsepriteDocument(atlas, doc);
#elseif (js && flight_esm)
	flight._js._fn.TextureatlasFormats.parseTextureAtlasAsepriteDocument(atlas, doc);
#else
	#error "flight.TextureatlasFormats: no backend for this target."
#end
}
inline function parseTextureAtlasAsepriteJson(atlas:TextureAtlas, json:String):Void {
#if hl
	flight._hl._fn.TextureatlasFormats.parseTextureAtlasAsepriteJson(atlas, cast json);
#elseif cpp
	flight._cpp._fn.TextureatlasFormats.parseTextureAtlasAsepriteJson(atlas, cast json);
#elseif (js && flight_esm)
	flight._js._fn.TextureatlasFormats.parseTextureAtlasAsepriteJson(atlas, json);
#else
	#error "flight.TextureatlasFormats: no backend for this target."
#end
}
inline function createTextureAtlasFormatRegistry():TextureAtlasFormatRegistry {
#if hl
	return flight._hl._fn.TextureatlasFormats.createTextureAtlasFormatRegistry();
#elseif cpp
	return flight._cpp._fn.TextureatlasFormats.createTextureAtlasFormatRegistry();
#elseif (js && flight_esm)
	return flight._js._fn.TextureatlasFormats.createTextureAtlasFormatRegistry();
#else
	#error "flight.TextureatlasFormats: no backend for this target."
#end
}
inline function applyTextureAtlasImportOptions(registry:TextureAtlasFormatRegistry, options:TextureAtlasImportOptions):Void {
#if hl
	flight._hl._fn.TextureatlasFormats.applyTextureAtlasImportOptions(registry, options);
#elseif cpp
	flight._cpp._fn.TextureatlasFormats.applyTextureAtlasImportOptions(registry, options);
#elseif (js && flight_esm)
	flight._js._fn.TextureatlasFormats.applyTextureAtlasImportOptions(registry, options);
#else
	#error "flight.TextureatlasFormats: no backend for this target."
#end
}
inline function asepriteTextureAtlasFormat(registry:TextureAtlasFormatRegistry):TextureAtlasFormatDescriptor {
#if hl
	return flight._hl._fn.TextureatlasFormats.asepriteTextureAtlasFormat(registry);
#elseif cpp
	return flight._cpp._fn.TextureatlasFormats.asepriteTextureAtlasFormat(registry);
#elseif (js && flight_esm)
	return flight._js._fn.TextureatlasFormats.asepriteTextureAtlasFormat(registry);
#else
	#error "flight.TextureatlasFormats: no backend for this target."
#end
}
inline function detectTextureAtlasFormat(registry:TextureAtlasFormatRegistry, content:String):TextureAtlasFormatKind {
#if hl
	return flight._hl._fn.TextureatlasFormats.detectTextureAtlasFormat(registry, cast content);
#elseif cpp
	return flight._cpp._fn.TextureatlasFormats.detectTextureAtlasFormat(registry, cast content);
#elseif (js && flight_esm)
	return flight._js._fn.TextureatlasFormats.detectTextureAtlasFormat(registry, content);
#else
	#error "flight.TextureatlasFormats: no backend for this target."
#end
}
inline function getTextureAtlasFormatKinds(out:Dynamic, registry:TextureAtlasFormatRegistry):Void {
#if hl
	flight._hl._fn.TextureatlasFormats.getTextureAtlasFormatKinds(out, registry);
#elseif cpp
	flight._cpp._fn.TextureatlasFormats.getTextureAtlasFormatKinds(out, registry);
#elseif (js && flight_esm)
	flight._js._fn.TextureatlasFormats.getTextureAtlasFormatKinds(out, registry);
#else
	#error "flight.TextureatlasFormats: no backend for this target."
#end
}
inline function libgdxAtlasTextureAtlasFormat(registry:TextureAtlasFormatRegistry):TextureAtlasFormatDescriptor {
#if hl
	return flight._hl._fn.TextureatlasFormats.libgdxAtlasTextureAtlasFormat(registry);
#elseif cpp
	return flight._cpp._fn.TextureatlasFormats.libgdxAtlasTextureAtlasFormat(registry);
#elseif (js && flight_esm)
	return flight._js._fn.TextureatlasFormats.libgdxAtlasTextureAtlasFormat(registry);
#else
	#error "flight.TextureatlasFormats: no backend for this target."
#end
}
inline function parseTextureAtlas(atlas:TextureAtlas, registry:TextureAtlasFormatRegistry, content:String, formatKind:TextureAtlasFormatKind, options:TextureAtlasParseOptions):Bool {
#if hl
	return flight._hl._fn.TextureatlasFormats.parseTextureAtlas(atlas, registry, cast content, formatKind, options);
#elseif cpp
	return flight._cpp._fn.TextureatlasFormats.parseTextureAtlas(atlas, registry, cast content, formatKind, options);
#elseif (js && flight_esm)
	return flight._js._fn.TextureatlasFormats.parseTextureAtlas(atlas, registry, content, formatKind, options);
#else
	#error "flight.TextureatlasFormats: no backend for this target."
#end
}
inline function starlingTextureAtlasFormat(registry:TextureAtlasFormatRegistry):TextureAtlasFormatDescriptor {
#if hl
	return flight._hl._fn.TextureatlasFormats.starlingTextureAtlasFormat(registry);
#elseif cpp
	return flight._cpp._fn.TextureatlasFormats.starlingTextureAtlasFormat(registry);
#elseif (js && flight_esm)
	return flight._js._fn.TextureatlasFormats.starlingTextureAtlasFormat(registry);
#else
	#error "flight.TextureatlasFormats: no backend for this target."
#end
}
inline function texturePackerTextureAtlasFormat(registry:TextureAtlasFormatRegistry):TextureAtlasFormatDescriptor {
#if hl
	return flight._hl._fn.TextureatlasFormats.texturePackerTextureAtlasFormat(registry);
#elseif cpp
	return flight._cpp._fn.TextureatlasFormats.texturePackerTextureAtlasFormat(registry);
#elseif (js && flight_esm)
	return flight._js._fn.TextureatlasFormats.texturePackerTextureAtlasFormat(registry);
#else
	#error "flight.TextureatlasFormats: no backend for this target."
#end
}
inline function unregisterTextureAtlasFormat(registry:TextureAtlasFormatRegistry, kind:TextureAtlasFormatKind):Void {
#if hl
	flight._hl._fn.TextureatlasFormats.unregisterTextureAtlasFormat(registry, kind);
#elseif cpp
	flight._cpp._fn.TextureatlasFormats.unregisterTextureAtlasFormat(registry, kind);
#elseif (js && flight_esm)
	flight._js._fn.TextureatlasFormats.unregisterTextureAtlasFormat(registry, kind);
#else
	#error "flight.TextureatlasFormats: no backend for this target."
#end
}
inline function parseTextureAtlasLibgdxAtlas(atlas:TextureAtlas, text:String):Void {
#if hl
	flight._hl._fn.TextureatlasFormats.parseTextureAtlasLibgdxAtlas(atlas, cast text);
#elseif cpp
	flight._cpp._fn.TextureatlasFormats.parseTextureAtlasLibgdxAtlas(atlas, cast text);
#elseif (js && flight_esm)
	flight._js._fn.TextureatlasFormats.parseTextureAtlasLibgdxAtlas(atlas, text);
#else
	#error "flight.TextureatlasFormats: no backend for this target."
#end
}
inline function readTextureAtlasScale(scale:TextureAtlasScale):Float {
#if hl
	return flight._hl._fn.TextureatlasFormats.readTextureAtlasScale(scale);
#elseif cpp
	return flight._cpp._fn.TextureatlasFormats.readTextureAtlasScale(scale);
#elseif (js && flight_esm)
	return flight._js._fn.TextureatlasFormats.readTextureAtlasScale(scale);
#else
	#error "flight.TextureatlasFormats: no backend for this target."
#end
}
inline function resetTextureAtlasPageMeta(atlas:TextureAtlas):Void {
#if hl
	flight._hl._fn.TextureatlasFormats.resetTextureAtlasPageMeta(atlas);
#elseif cpp
	flight._cpp._fn.TextureatlasFormats.resetTextureAtlasPageMeta(atlas);
#elseif (js && flight_esm)
	flight._js._fn.TextureatlasFormats.resetTextureAtlasPageMeta(atlas);
#else
	#error "flight.TextureatlasFormats: no backend for this target."
#end
}
inline function parseTextureAtlasStarlingXml(atlas:TextureAtlas, xml:String):Void {
#if hl
	flight._hl._fn.TextureatlasFormats.parseTextureAtlasStarlingXml(atlas, cast xml);
#elseif cpp
	flight._cpp._fn.TextureatlasFormats.parseTextureAtlasStarlingXml(atlas, cast xml);
#elseif (js && flight_esm)
	flight._js._fn.TextureatlasFormats.parseTextureAtlasStarlingXml(atlas, xml);
#else
	#error "flight.TextureatlasFormats: no backend for this target."
#end
}
inline function parseTexturePackerAtlasDocument(atlas:TextureAtlas, doc:TexturePackerAtlasDocument, options:TexturePackerAtlasParseOptions):Void {
#if hl
	flight._hl._fn.TextureatlasFormats.parseTexturePackerAtlasDocument(atlas, doc, options);
#elseif cpp
	flight._cpp._fn.TextureatlasFormats.parseTexturePackerAtlasDocument(atlas, doc, options);
#elseif (js && flight_esm)
	flight._js._fn.TextureatlasFormats.parseTexturePackerAtlasDocument(atlas, doc, options);
#else
	#error "flight.TextureatlasFormats: no backend for this target."
#end
}
inline function parseTexturePackerAtlasJson(atlas:TextureAtlas, json:String, options:TexturePackerAtlasParseOptions):Void {
#if hl
	flight._hl._fn.TextureatlasFormats.parseTexturePackerAtlasJson(atlas, cast json, options);
#elseif cpp
	flight._cpp._fn.TextureatlasFormats.parseTexturePackerAtlasJson(atlas, cast json, options);
#elseif (js && flight_esm)
	flight._js._fn.TextureatlasFormats.parseTexturePackerAtlasJson(atlas, json, options);
#else
	#error "flight.TextureatlasFormats: no backend for this target."
#end
}
inline function getTextureAtlasFrameTagDirectionString(value:flight.TextureAtlasFrameTagDirection):String {
#if hl
	return cast flight._hl._fn.TextureatlasFormats.getTextureAtlasFrameTagDirectionString(value);
#elseif cpp
	return cast flight._cpp._fn.TextureatlasFormats.getTextureAtlasFrameTagDirectionString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.TextureatlasFormats.getTextureAtlasFrameTagDirectionString(value);
#else
	#error "flight.TextureatlasFormats: no backend for this target."
#end
}
inline function parseTextureAtlasFrameTagDirection(value:String):Int {
#if hl
	return flight._hl._fn.TextureatlasFormats.parseTextureAtlasFrameTagDirection(cast value);
#elseif cpp
	return flight._cpp._fn.TextureatlasFormats.parseTextureAtlasFrameTagDirection(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.TextureatlasFormats.parseTextureAtlasFrameTagDirection(value);
#else
	#error "flight.TextureatlasFormats: no backend for this target."
#end
}
inline function freeTextureAtlasFormatRegistry(ptr:TextureAtlasFormatRegistry):Void {
#if hl
	flight._hl._fn.TextureatlasFormats.freeTextureAtlasFormatRegistry(ptr);
#elseif cpp
	flight._cpp._fn.TextureatlasFormats.freeTextureAtlasFormatRegistry(ptr);
#elseif (js && flight_esm)
	flight._js._fn.TextureatlasFormats.freeTextureAtlasFormatRegistry(ptr);
#else
	#error "flight.TextureatlasFormats: no backend for this target."
#end
}
inline function freeTextureAtlasFormatKind(ptr:TextureAtlasFormatKind):Void {
#if hl
	flight._hl._fn.TextureatlasFormats.freeTextureAtlasFormatKind(ptr);
#elseif cpp
	flight._cpp._fn.TextureatlasFormats.freeTextureAtlasFormatKind(ptr);
#elseif (js && flight_esm)
	flight._js._fn.TextureatlasFormats.freeTextureAtlasFormatKind(ptr);
#else
	#error "flight.TextureatlasFormats: no backend for this target."
#end
}
