package flight;

extern inline function createAnimatedNormalModifier():AnimatedNormalModifier {
#if hl
	return flight._hl._fn.Shading.createAnimatedNormalModifier();
#elseif cpp
	return flight._cpp._fn.Shading.createAnimatedNormalModifier();
#elseif (js && flight_esm)
	return flight._js._fn.Shading.createAnimatedNormalModifier();
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function createDissolveModifier():DissolveModifier {
#if hl
	return flight._hl._fn.Shading.createDissolveModifier();
#elseif cpp
	return flight._cpp._fn.Shading.createDissolveModifier();
#elseif (js && flight_esm)
	return flight._js._fn.Shading.createDissolveModifier();
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function createEmissiveModifier():EmissiveModifier {
#if hl
	return flight._hl._fn.Shading.createEmissiveModifier();
#elseif cpp
	return flight._cpp._fn.Shading.createEmissiveModifier();
#elseif (js && flight_esm)
	return flight._js._fn.Shading.createEmissiveModifier();
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function getEmissiveModifierFacingString(value:flight.EmissiveModifierFacing):String {
#if hl
	return cast flight._hl._fn.Shading.getEmissiveModifierFacingString(value);
#elseif cpp
	return cast flight._cpp._fn.Shading.getEmissiveModifierFacingString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Shading.getEmissiveModifierFacingString(value);
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function getFogModifierModeString(value:flight.FogModifierMode):String {
#if hl
	return cast flight._hl._fn.Shading.getFogModifierModeString(value);
#elseif cpp
	return cast flight._cpp._fn.Shading.getFogModifierModeString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Shading.getFogModifierModeString(value);
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function getVertexDisplaceModifierSourceString(value:flight.VertexDisplaceModifierSource):String {
#if hl
	return cast flight._hl._fn.Shading.getVertexDisplaceModifierSourceString(value);
#elseif cpp
	return cast flight._cpp._fn.Shading.getVertexDisplaceModifierSourceString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Shading.getVertexDisplaceModifierSourceString(value);
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function parseEmissiveModifierFacing(value:String):Int {
#if hl
	return flight._hl._fn.Shading.parseEmissiveModifierFacing(cast value);
#elseif cpp
	return flight._cpp._fn.Shading.parseEmissiveModifierFacing(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Shading.parseEmissiveModifierFacing(value);
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function parseFogModifierMode(value:String):Int {
#if hl
	return flight._hl._fn.Shading.parseFogModifierMode(cast value);
#elseif cpp
	return flight._cpp._fn.Shading.parseFogModifierMode(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Shading.parseFogModifierMode(value);
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function parseVertexDisplaceModifierSource(value:String):Int {
#if hl
	return flight._hl._fn.Shading.parseVertexDisplaceModifierSource(cast value);
#elseif cpp
	return flight._cpp._fn.Shading.parseVertexDisplaceModifierSource(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Shading.parseVertexDisplaceModifierSource(value);
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function createEnvReflectModifier():EnvReflectModifier {
#if hl
	return flight._hl._fn.Shading.createEnvReflectModifier();
#elseif cpp
	return flight._cpp._fn.Shading.createEnvReflectModifier();
#elseif (js && flight_esm)
	return flight._js._fn.Shading.createEnvReflectModifier();
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function createFogModifier():FogModifier {
#if hl
	return flight._hl._fn.Shading.createFogModifier();
#elseif cpp
	return flight._cpp._fn.Shading.createFogModifier();
#elseif (js && flight_esm)
	return flight._js._fn.Shading.createFogModifier();
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function isBuiltInModifierSlot(value:String):Bool {
#if hl
	return flight._hl._fn.Shading.isBuiltInModifierSlot(cast value);
#elseif cpp
	return flight._cpp._fn.Shading.isBuiltInModifierSlot(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Shading.isBuiltInModifierSlot(value);
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function registerModifier(registry:ModifierRegistry, definition:Dynamic):Void {
#if hl
	flight._hl._fn.Shading.registerModifier(registry, definition);
#elseif cpp
	flight._cpp._fn.Shading.registerModifier(registry, definition);
#elseif (js && flight_esm)
	flight._js._fn.Shading.registerModifier(registry, definition);
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function resolveModifier(registry:ModifierRegistry, kind:String):Dynamic {
#if hl
	return flight._hl._fn.Shading.resolveModifier(registry, cast kind);
#elseif cpp
	return flight._cpp._fn.Shading.resolveModifier(registry, cast kind);
#elseif (js && flight_esm)
	return flight._js._fn.Shading.resolveModifier(registry, kind);
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function registerBuiltInModifiers(registry:ModifierRegistry):Void {
#if hl
	flight._hl._fn.Shading.registerBuiltInModifiers(registry);
#elseif cpp
	flight._cpp._fn.Shading.registerBuiltInModifiers(registry);
#elseif (js && flight_esm)
	flight._js._fn.Shading.registerBuiltInModifiers(registry);
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function createRimModifier():RimModifier {
#if hl
	return flight._hl._fn.Shading.createRimModifier();
#elseif cpp
	return flight._cpp._fn.Shading.createRimModifier();
#elseif (js && flight_esm)
	return flight._js._fn.Shading.createRimModifier();
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function createShadedMaterial():ShadedMaterial {
#if hl
	return flight._hl._fn.Shading.createShadedMaterial();
#elseif cpp
	return flight._cpp._fn.Shading.createShadedMaterial();
#elseif (js && flight_esm)
	return flight._js._fn.Shading.createShadedMaterial();
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function createToonModifier():ToonModifier {
#if hl
	return flight._hl._fn.Shading.createToonModifier();
#elseif cpp
	return flight._cpp._fn.Shading.createToonModifier();
#elseif (js && flight_esm)
	return flight._js._fn.Shading.createToonModifier();
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function createVertexDisplaceModifier():VertexDisplaceModifier {
#if hl
	return flight._hl._fn.Shading.createVertexDisplaceModifier();
#elseif cpp
	return flight._cpp._fn.Shading.createVertexDisplaceModifier();
#elseif (js && flight_esm)
	return flight._js._fn.Shading.createVertexDisplaceModifier();
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function freeAnimatedNormalModifier(ptr:AnimatedNormalModifier):Void {
#if hl
	flight._hl._fn.Shading.freeAnimatedNormalModifier(ptr);
#elseif cpp
	flight._cpp._fn.Shading.freeAnimatedNormalModifier(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Shading.freeAnimatedNormalModifier(ptr);
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function freeDissolveModifier(ptr:DissolveModifier):Void {
#if hl
	flight._hl._fn.Shading.freeDissolveModifier(ptr);
#elseif cpp
	flight._cpp._fn.Shading.freeDissolveModifier(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Shading.freeDissolveModifier(ptr);
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function freeEmissiveModifier(ptr:EmissiveModifier):Void {
#if hl
	flight._hl._fn.Shading.freeEmissiveModifier(ptr);
#elseif cpp
	flight._cpp._fn.Shading.freeEmissiveModifier(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Shading.freeEmissiveModifier(ptr);
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function freeEnvReflectModifier(ptr:EnvReflectModifier):Void {
#if hl
	flight._hl._fn.Shading.freeEnvReflectModifier(ptr);
#elseif cpp
	flight._cpp._fn.Shading.freeEnvReflectModifier(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Shading.freeEnvReflectModifier(ptr);
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function freeFogModifier(ptr:FogModifier):Void {
#if hl
	flight._hl._fn.Shading.freeFogModifier(ptr);
#elseif cpp
	flight._cpp._fn.Shading.freeFogModifier(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Shading.freeFogModifier(ptr);
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function freeRimModifier(ptr:RimModifier):Void {
#if hl
	flight._hl._fn.Shading.freeRimModifier(ptr);
#elseif cpp
	flight._cpp._fn.Shading.freeRimModifier(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Shading.freeRimModifier(ptr);
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function freeShadedMaterial(ptr:ShadedMaterial):Void {
#if hl
	flight._hl._fn.Shading.freeShadedMaterial(ptr);
#elseif cpp
	flight._cpp._fn.Shading.freeShadedMaterial(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Shading.freeShadedMaterial(ptr);
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function freeToonModifier(ptr:ToonModifier):Void {
#if hl
	flight._hl._fn.Shading.freeToonModifier(ptr);
#elseif cpp
	flight._cpp._fn.Shading.freeToonModifier(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Shading.freeToonModifier(ptr);
#else
	#error "flight.Shading: no backend for this target."
#end
}
extern inline function freeVertexDisplaceModifier(ptr:VertexDisplaceModifier):Void {
#if hl
	flight._hl._fn.Shading.freeVertexDisplaceModifier(ptr);
#elseif cpp
	flight._cpp._fn.Shading.freeVertexDisplaceModifier(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Shading.freeVertexDisplaceModifier(ptr);
#else
	#error "flight.Shading: no backend for this target."
#end
}
