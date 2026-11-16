package flight;

#if (js && flight_esm)
extern inline function serializeAsepriteSpritesheet(data:SpritesheetData, existing:Null<AsepriteDocument>, options:Null<AsepriteSerializeOptions>):String {
	return flight._js._fn.SpritesheetFormats.serializeAsepriteSpritesheet(data, existing, options);
}
#else
extern inline function serializeAsepriteSpritesheet(data:SpritesheetData, existing:AsepriteDocument, options:AsepriteSerializeOptions):String {
#if hl
	return cast flight._hl._fn.SpritesheetFormats.serializeAsepriteSpritesheet(data, existing, options);
#elseif cpp
	return cast flight._cpp._fn.SpritesheetFormats.serializeAsepriteSpritesheet(data, existing, options);
#elseif (js && flight_esm)
	return cast flight._js._fn.SpritesheetFormats.serializeAsepriteSpritesheet(data, existing, options);
#else
	#error "flight.SpritesheetFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function serializeCocosPlistSpritesheet(data:SpritesheetData, existing:Null<CocosPlistDocument>):String {
	return flight._js._fn.SpritesheetFormats.serializeCocosPlistSpritesheet(data, existing);
}
#else
extern inline function serializeCocosPlistSpritesheet(data:SpritesheetData, existing:CocosPlistDocument):String {
#if hl
	return cast flight._hl._fn.SpritesheetFormats.serializeCocosPlistSpritesheet(data, existing);
#elseif cpp
	return cast flight._cpp._fn.SpritesheetFormats.serializeCocosPlistSpritesheet(data, existing);
#elseif (js && flight_esm)
	return cast flight._js._fn.SpritesheetFormats.serializeCocosPlistSpritesheet(data, existing);
#else
	#error "flight.SpritesheetFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function formatLibgdxAtlas(data:SpritesheetData):String {
	return flight._js._fn.SpritesheetFormats.formatLibgdxAtlas(data);
}
#else
extern inline function formatLibgdxAtlas(data:SpritesheetData):String {
#if hl
	return cast flight._hl._fn.SpritesheetFormats.formatLibgdxAtlas(data);
#elseif cpp
	return cast flight._cpp._fn.SpritesheetFormats.formatLibgdxAtlas(data);
#elseif (js && flight_esm)
	return cast flight._js._fn.SpritesheetFormats.formatLibgdxAtlas(data);
#else
	#error "flight.SpritesheetFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSpritesheetFormatRegistry():SpritesheetFormatRegistry {
	return flight._js._fn.SpritesheetFormats.createSpritesheetFormatRegistry();
}
#else
extern inline function createSpritesheetFormatRegistry():SpritesheetFormatRegistry {
#if hl
	return flight._hl._fn.SpritesheetFormats.createSpritesheetFormatRegistry();
#elseif cpp
	return flight._cpp._fn.SpritesheetFormats.createSpritesheetFormatRegistry();
#elseif (js && flight_esm)
	return flight._js._fn.SpritesheetFormats.createSpritesheetFormatRegistry();
#else
	#error "flight.SpritesheetFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applySpritesheetImportOptions(registry:SpritesheetFormatRegistry, options:SpritesheetImportOptions):Void {
	flight._js._fn.SpritesheetFormats.applySpritesheetImportOptions(registry, options);
}
#else
extern inline function applySpritesheetImportOptions(registry:SpritesheetFormatRegistry, options:SpritesheetImportOptions):Void {
#if hl
	flight._hl._fn.SpritesheetFormats.applySpritesheetImportOptions(registry, options);
#elseif cpp
	flight._cpp._fn.SpritesheetFormats.applySpritesheetImportOptions(registry, options);
#elseif (js && flight_esm)
	flight._js._fn.SpritesheetFormats.applySpritesheetImportOptions(registry, options);
#else
	#error "flight.SpritesheetFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function asepriteSpritesheetFormat(registry:SpritesheetFormatRegistry):SpritesheetFormatDescriptor {
	return flight._js._fn.SpritesheetFormats.asepriteSpritesheetFormat(registry);
}
#else
extern inline function asepriteSpritesheetFormat(registry:SpritesheetFormatRegistry):SpritesheetFormatDescriptor {
#if hl
	return flight._hl._fn.SpritesheetFormats.asepriteSpritesheetFormat(registry);
#elseif cpp
	return flight._cpp._fn.SpritesheetFormats.asepriteSpritesheetFormat(registry);
#elseif (js && flight_esm)
	return flight._js._fn.SpritesheetFormats.asepriteSpritesheetFormat(registry);
#else
	#error "flight.SpritesheetFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function cocosPlistSpritesheetFormat(registry:SpritesheetFormatRegistry):SpritesheetFormatDescriptor {
	return flight._js._fn.SpritesheetFormats.cocosPlistSpritesheetFormat(registry);
}
#else
extern inline function cocosPlistSpritesheetFormat(registry:SpritesheetFormatRegistry):SpritesheetFormatDescriptor {
#if hl
	return flight._hl._fn.SpritesheetFormats.cocosPlistSpritesheetFormat(registry);
#elseif cpp
	return flight._cpp._fn.SpritesheetFormats.cocosPlistSpritesheetFormat(registry);
#elseif (js && flight_esm)
	return flight._js._fn.SpritesheetFormats.cocosPlistSpritesheetFormat(registry);
#else
	#error "flight.SpritesheetFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detectSpritesheetFormat(registry:SpritesheetFormatRegistry, text:String):Null<SpritesheetFormatKind> {
	return flight._js._fn.SpritesheetFormats.detectSpritesheetFormat(registry, text);
}
#else
extern inline function detectSpritesheetFormat(registry:SpritesheetFormatRegistry, text:String):SpritesheetFormatKind {
#if hl
	return flight._hl._fn.SpritesheetFormats.detectSpritesheetFormat(registry, cast text);
#elseif cpp
	return flight._cpp._fn.SpritesheetFormats.detectSpritesheetFormat(registry, cast text);
#elseif (js && flight_esm)
	return flight._js._fn.SpritesheetFormats.detectSpritesheetFormat(registry, text);
#else
	#error "flight.SpritesheetFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getSpritesheetFormatKinds(out:Dynamic, registry:SpritesheetFormatRegistry):Void {
	flight._js._fn.SpritesheetFormats.getSpritesheetFormatKinds(out, registry);
}
#else
extern inline function getSpritesheetFormatKinds(out:Dynamic, registry:SpritesheetFormatRegistry):Void {
#if hl
	flight._hl._fn.SpritesheetFormats.getSpritesheetFormatKinds(out, registry);
#elseif cpp
	flight._cpp._fn.SpritesheetFormats.getSpritesheetFormatKinds(out, registry);
#elseif (js && flight_esm)
	flight._js._fn.SpritesheetFormats.getSpritesheetFormatKinds(out, registry);
#else
	#error "flight.SpritesheetFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function libgdxAtlasSpritesheetFormat(registry:SpritesheetFormatRegistry):SpritesheetFormatDescriptor {
	return flight._js._fn.SpritesheetFormats.libgdxAtlasSpritesheetFormat(registry);
}
#else
extern inline function libgdxAtlasSpritesheetFormat(registry:SpritesheetFormatRegistry):SpritesheetFormatDescriptor {
#if hl
	return flight._hl._fn.SpritesheetFormats.libgdxAtlasSpritesheetFormat(registry);
#elseif cpp
	return flight._cpp._fn.SpritesheetFormats.libgdxAtlasSpritesheetFormat(registry);
#elseif (js && flight_esm)
	return flight._js._fn.SpritesheetFormats.libgdxAtlasSpritesheetFormat(registry);
#else
	#error "flight.SpritesheetFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseSpritesheet(registry:SpritesheetFormatRegistry, text:String, formatKind:Null<SpritesheetFormatKind>, options:Null<SpritesheetParseOptions>):Null<SpritesheetData> {
	return flight._js._fn.SpritesheetFormats.parseSpritesheet(registry, text, formatKind, options);
}
#else
extern inline function parseSpritesheet(registry:SpritesheetFormatRegistry, text:String, formatKind:SpritesheetFormatKind, options:SpritesheetParseOptions):SpritesheetData {
#if hl
	return flight._hl._fn.SpritesheetFormats.parseSpritesheet(registry, cast text, formatKind, options);
#elseif cpp
	return flight._cpp._fn.SpritesheetFormats.parseSpritesheet(registry, cast text, formatKind, options);
#elseif (js && flight_esm)
	return flight._js._fn.SpritesheetFormats.parseSpritesheet(registry, text, formatKind, options);
#else
	#error "flight.SpritesheetFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function starlingSpritesheetFormat(registry:SpritesheetFormatRegistry):SpritesheetFormatDescriptor {
	return flight._js._fn.SpritesheetFormats.starlingSpritesheetFormat(registry);
}
#else
extern inline function starlingSpritesheetFormat(registry:SpritesheetFormatRegistry):SpritesheetFormatDescriptor {
#if hl
	return flight._hl._fn.SpritesheetFormats.starlingSpritesheetFormat(registry);
#elseif cpp
	return flight._cpp._fn.SpritesheetFormats.starlingSpritesheetFormat(registry);
#elseif (js && flight_esm)
	return flight._js._fn.SpritesheetFormats.starlingSpritesheetFormat(registry);
#else
	#error "flight.SpritesheetFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function texturePackerSpritesheetFormat(registry:SpritesheetFormatRegistry):SpritesheetFormatDescriptor {
	return flight._js._fn.SpritesheetFormats.texturePackerSpritesheetFormat(registry);
}
#else
extern inline function texturePackerSpritesheetFormat(registry:SpritesheetFormatRegistry):SpritesheetFormatDescriptor {
#if hl
	return flight._hl._fn.SpritesheetFormats.texturePackerSpritesheetFormat(registry);
#elseif cpp
	return flight._cpp._fn.SpritesheetFormats.texturePackerSpritesheetFormat(registry);
#elseif (js && flight_esm)
	return flight._js._fn.SpritesheetFormats.texturePackerSpritesheetFormat(registry);
#else
	#error "flight.SpritesheetFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function unregisterSpritesheetFormat(registry:SpritesheetFormatRegistry, kind:SpritesheetFormatKind):Void {
	flight._js._fn.SpritesheetFormats.unregisterSpritesheetFormat(registry, kind);
}
#else
extern inline function unregisterSpritesheetFormat(registry:SpritesheetFormatRegistry, kind:SpritesheetFormatKind):Void {
#if hl
	flight._hl._fn.SpritesheetFormats.unregisterSpritesheetFormat(registry, kind);
#elseif cpp
	flight._cpp._fn.SpritesheetFormats.unregisterSpritesheetFormat(registry, kind);
#elseif (js && flight_esm)
	flight._js._fn.SpritesheetFormats.unregisterSpritesheetFormat(registry, kind);
#else
	#error "flight.SpritesheetFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function serializeStarlingSpritesheet(data:SpritesheetData, existing:Null<StarlingDocument>):String {
	return flight._js._fn.SpritesheetFormats.serializeStarlingSpritesheet(data, existing);
}
#else
extern inline function serializeStarlingSpritesheet(data:SpritesheetData, existing:StarlingDocument):String {
#if hl
	return cast flight._hl._fn.SpritesheetFormats.serializeStarlingSpritesheet(data, existing);
#elseif cpp
	return cast flight._cpp._fn.SpritesheetFormats.serializeStarlingSpritesheet(data, existing);
#elseif (js && flight_esm)
	return cast flight._js._fn.SpritesheetFormats.serializeStarlingSpritesheet(data, existing);
#else
	#error "flight.SpritesheetFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function serializeTexturePackerSpritesheet(data:SpritesheetData, existing:Null<TexturePackerDocument>, options:Null<TexturePackerSerializeOptions>):String {
	return flight._js._fn.SpritesheetFormats.serializeTexturePackerSpritesheet(data, existing, options);
}
#else
extern inline function serializeTexturePackerSpritesheet(data:SpritesheetData, existing:TexturePackerDocument, options:TexturePackerSerializeOptions):String {
#if hl
	return cast flight._hl._fn.SpritesheetFormats.serializeTexturePackerSpritesheet(data, existing, options);
#elseif cpp
	return cast flight._cpp._fn.SpritesheetFormats.serializeTexturePackerSpritesheet(data, existing, options);
#elseif (js && flight_esm)
	return cast flight._js._fn.SpritesheetFormats.serializeTexturePackerSpritesheet(data, existing, options);
#else
	#error "flight.SpritesheetFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSpritesheetFormatRegistry(ptr:SpritesheetFormatRegistry):Void {
	flight._js._fn.SpritesheetFormats.freeSpritesheetFormatRegistry(ptr);
}
#else
extern inline function freeSpritesheetFormatRegistry(ptr:SpritesheetFormatRegistry):Void {
#if hl
	flight._hl._fn.SpritesheetFormats.freeSpritesheetFormatRegistry(ptr);
#elseif cpp
	flight._cpp._fn.SpritesheetFormats.freeSpritesheetFormatRegistry(ptr);
#elseif (js && flight_esm)
	flight._js._fn.SpritesheetFormats.freeSpritesheetFormatRegistry(ptr);
#else
	#error "flight.SpritesheetFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSpritesheetFormatKind(ptr:SpritesheetFormatKind):Void {
	flight._js._fn.SpritesheetFormats.freeSpritesheetFormatKind(ptr);
}
#else
extern inline function freeSpritesheetFormatKind(ptr:SpritesheetFormatKind):Void {
#if hl
	flight._hl._fn.SpritesheetFormats.freeSpritesheetFormatKind(ptr);
#elseif cpp
	flight._cpp._fn.SpritesheetFormats.freeSpritesheetFormatKind(ptr);
#elseif (js && flight_esm)
	flight._js._fn.SpritesheetFormats.freeSpritesheetFormatKind(ptr);
#else
	#error "flight.SpritesheetFormats: no backend for this target."
#end
}
#end
