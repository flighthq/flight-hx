package flight;

#if (js && flight_esm)
extern inline function getLottieFeatureNames(out:Dynamic):Void {
	flight._js._fn.Scene2dFormats.getLottieFeatureNames(out);
}
#else
extern inline function getLottieFeatureNames(out:Dynamic):Void {
#if hl
	flight._hl._fn.Scene2dFormats.getLottieFeatureNames(out);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.getLottieFeatureNames(out);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.getLottieFeatureNames(out);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyAnimationClipToLottieDocument(clip:AnimationClip, time:Float):Void {
	flight._js._fn.Scene2dFormats.applyAnimationClipToLottieDocument(clip, time);
}
#else
extern inline function applyAnimationClipToLottieDocument(clip:AnimationClip, time:Float):Void {
#if hl
	flight._hl._fn.Scene2dFormats.applyAnimationClipToLottieDocument(clip, time);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.applyAnimationClipToLottieDocument(clip, time);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.applyAnimationClipToLottieDocument(clip, time);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerAllLottieHandlers(registry:LottieRegistry):Void {
	flight._js._fn.Scene2dFormats.registerAllLottieHandlers(registry);
}
#else
extern inline function registerAllLottieHandlers(registry:LottieRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerAllLottieHandlers(registry);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerAllLottieHandlers(registry);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerAllLottieHandlers(registry);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerLottieLayerHandlers(registry:LottieRegistry):Void {
	flight._js._fn.Scene2dFormats.registerLottieLayerHandlers(registry);
}
#else
extern inline function registerLottieLayerHandlers(registry:LottieRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerLottieLayerHandlers(registry);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerLottieLayerHandlers(registry);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerLottieLayerHandlers(registry);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerLottieMaskHandlers(registry:LottieRegistry):Void {
	flight._js._fn.Scene2dFormats.registerLottieMaskHandlers(registry);
}
#else
extern inline function registerLottieMaskHandlers(registry:LottieRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerLottieMaskHandlers(registry);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerLottieMaskHandlers(registry);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerLottieMaskHandlers(registry);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createLottieRegistry():LottieRegistry {
	return flight._js._fn.Scene2dFormats.createLottieRegistry();
}
#else
extern inline function createLottieRegistry():LottieRegistry {
#if hl
	return flight._hl._fn.Scene2dFormats.createLottieRegistry();
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.createLottieRegistry();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.createLottieRegistry();
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getLottieLayerHandler(registry:LottieRegistry, kind:LottieLayerKind):Null<LottieLayerHandler> {
	return flight._js._fn.Scene2dFormats.getLottieLayerHandler(registry, kind);
}
#else
extern inline function getLottieLayerHandler(registry:LottieRegistry, kind:LottieLayerKind):LottieLayerHandler {
#if hl
	return flight._hl._fn.Scene2dFormats.getLottieLayerHandler(registry, kind);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.getLottieLayerHandler(registry, kind);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.getLottieLayerHandler(registry, kind);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getLottieMaskHandler(registry:LottieRegistry, kind:String):Null<LottieMaskHandler> {
	return flight._js._fn.Scene2dFormats.getLottieMaskHandler(registry, kind);
}
#else
extern inline function getLottieMaskHandler(registry:LottieRegistry, kind:String):LottieMaskHandler {
#if hl
	return flight._hl._fn.Scene2dFormats.getLottieMaskHandler(registry, cast kind);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.getLottieMaskHandler(registry, cast kind);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.getLottieMaskHandler(registry, kind);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getLottieShapeItemHandler(registry:LottieRegistry, kind:String):Null<LottieShapeItemHandler> {
	return flight._js._fn.Scene2dFormats.getLottieShapeItemHandler(registry, kind);
}
#else
extern inline function getLottieShapeItemHandler(registry:LottieRegistry, kind:String):LottieShapeItemHandler {
#if hl
	return flight._hl._fn.Scene2dFormats.getLottieShapeItemHandler(registry, cast kind);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.getLottieShapeItemHandler(registry, cast kind);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.getLottieShapeItemHandler(registry, kind);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerLottieLayerHandler(registry:LottieRegistry, kind:LottieLayerKind, handle:LottieLayerHandler):Void {
	flight._js._fn.Scene2dFormats.registerLottieLayerHandler(registry, kind, handle);
}
#else
extern inline function registerLottieLayerHandler(registry:LottieRegistry, kind:LottieLayerKind, handle:LottieLayerHandler):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerLottieLayerHandler(registry, kind, handle);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerLottieLayerHandler(registry, kind, handle);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerLottieLayerHandler(registry, kind, handle);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerLottieMaskHandler(registry:LottieRegistry, kind:String, handle:LottieMaskHandler):Void {
	flight._js._fn.Scene2dFormats.registerLottieMaskHandler(registry, kind, handle);
}
#else
extern inline function registerLottieMaskHandler(registry:LottieRegistry, kind:String, handle:LottieMaskHandler):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerLottieMaskHandler(registry, cast kind, handle);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerLottieMaskHandler(registry, cast kind, handle);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerLottieMaskHandler(registry, kind, handle);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerLottieShapeItemHandler(registry:LottieRegistry, kind:String, handle:LottieShapeItemHandler):Void {
	flight._js._fn.Scene2dFormats.registerLottieShapeItemHandler(registry, kind, handle);
}
#else
extern inline function registerLottieShapeItemHandler(registry:LottieRegistry, kind:String, handle:LottieShapeItemHandler):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerLottieShapeItemHandler(registry, cast kind, handle);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerLottieShapeItemHandler(registry, cast kind, handle);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerLottieShapeItemHandler(registry, kind, handle);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function unregisterLottieLayerHandler(registry:LottieRegistry, kind:LottieLayerKind):Bool {
	return flight._js._fn.Scene2dFormats.unregisterLottieLayerHandler(registry, kind);
}
#else
extern inline function unregisterLottieLayerHandler(registry:LottieRegistry, kind:LottieLayerKind):Bool {
#if hl
	return flight._hl._fn.Scene2dFormats.unregisterLottieLayerHandler(registry, kind);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.unregisterLottieLayerHandler(registry, kind);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.unregisterLottieLayerHandler(registry, kind);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function unregisterLottieMaskHandler(registry:LottieRegistry, kind:String):Bool {
	return flight._js._fn.Scene2dFormats.unregisterLottieMaskHandler(registry, kind);
}
#else
extern inline function unregisterLottieMaskHandler(registry:LottieRegistry, kind:String):Bool {
#if hl
	return flight._hl._fn.Scene2dFormats.unregisterLottieMaskHandler(registry, cast kind);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.unregisterLottieMaskHandler(registry, cast kind);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.unregisterLottieMaskHandler(registry, kind);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function unregisterLottieShapeItemHandler(registry:LottieRegistry, kind:String):Bool {
	return flight._js._fn.Scene2dFormats.unregisterLottieShapeItemHandler(registry, kind);
}
#else
extern inline function unregisterLottieShapeItemHandler(registry:LottieRegistry, kind:String):Bool {
#if hl
	return flight._hl._fn.Scene2dFormats.unregisterLottieShapeItemHandler(registry, cast kind);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.unregisterLottieShapeItemHandler(registry, cast kind);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.unregisterLottieShapeItemHandler(registry, kind);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isReadableLottie(json:String):Bool {
	return flight._js._fn.Scene2dFormats.isReadableLottie(json);
}
#else
extern inline function isReadableLottie(json:String):Bool {
#if hl
	return flight._hl._fn.Scene2dFormats.isReadableLottie(cast json);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.isReadableLottie(cast json);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.isReadableLottie(json);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseLottieRequirements(json:String):RequirementSet {
	return flight._js._fn.Scene2dFormats.parseLottieRequirements(json);
}
#else
extern inline function parseLottieRequirements(json:String):RequirementSet {
#if hl
	return flight._hl._fn.Scene2dFormats.parseLottieRequirements(cast json);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.parseLottieRequirements(cast json);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.parseLottieRequirements(json);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerLottieShapeItemHandlers(registry:LottieRegistry):Void {
	flight._js._fn.Scene2dFormats.registerLottieShapeItemHandlers(registry);
}
#else
extern inline function registerLottieShapeItemHandlers(registry:LottieRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerLottieShapeItemHandlers(registry);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerLottieShapeItemHandlers(registry);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerLottieShapeItemHandlers(registry);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyAnimationClipToRiveDocument(clip:AnimationClip, time:Float):Void {
	flight._js._fn.Scene2dFormats.applyAnimationClipToRiveDocument(clip, time);
}
#else
extern inline function applyAnimationClipToRiveDocument(clip:AnimationClip, time:Float):Void {
#if hl
	flight._hl._fn.Scene2dFormats.applyAnimationClipToRiveDocument(clip, time);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.applyAnimationClipToRiveDocument(clip, time);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.applyAnimationClipToRiveDocument(clip, time);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerRiveAnimationHandlers(registry:RiveImportRegistry):Void {
	flight._js._fn.Scene2dFormats.registerRiveAnimationHandlers(registry);
}
#else
extern inline function registerRiveAnimationHandlers(registry:RiveImportRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerRiveAnimationHandlers(registry);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerRiveAnimationHandlers(registry);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerRiveAnimationHandlers(registry);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createRiveImageSprite(name:String, assetIndex:Int):Dynamic {
	return flight._js._fn.Scene2dFormats.createRiveImageSprite(name, assetIndex);
}
#else
extern inline function createRiveImageSprite(name:String, assetIndex:Int):flight.FlightNode {
#if hl
	return flight._hl._fn.Scene2dFormats.createRiveImageSprite(cast name, assetIndex);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.createRiveImageSprite(cast name, assetIndex);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.createRiveImageSprite(name, assetIndex);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRiveImageAssetIndex(node:Dynamic):Int {
	return flight._js._fn.Scene2dFormats.getRiveImageAssetIndex(node);
}
#else
extern inline function getRiveImageAssetIndex(node:flight.FlightNode):Int {
#if hl
	return flight._hl._fn.Scene2dFormats.getRiveImageAssetIndex(node);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.getRiveImageAssetIndex(node);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.getRiveImageAssetIndex(node);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRiveImageTexture(node:Dynamic):Null<Dynamic> {
	return flight._js._fn.Scene2dFormats.getRiveImageTexture(node);
}
#else
extern inline function getRiveImageTexture(node:flight.FlightNode):Dynamic {
#if hl
	return flight._hl._fn.Scene2dFormats.getRiveImageTexture(node);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.getRiveImageTexture(node);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.getRiveImageTexture(node);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRiveNestedArtboardIndex(node:Dynamic):Int {
	return flight._js._fn.Scene2dFormats.getRiveNestedArtboardIndex(node);
}
#else
extern inline function getRiveNestedArtboardIndex(node:flight.FlightNode):Int {
#if hl
	return flight._hl._fn.Scene2dFormats.getRiveNestedArtboardIndex(node);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.getRiveNestedArtboardIndex(node);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.getRiveNestedArtboardIndex(node);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function markRiveNestedArtboard(node:Dynamic, artboardIndex:Int):Void {
	flight._js._fn.Scene2dFormats.markRiveNestedArtboard(node, artboardIndex);
}
#else
extern inline function markRiveNestedArtboard(node:flight.FlightNode, artboardIndex:Int):Void {
#if hl
	flight._hl._fn.Scene2dFormats.markRiveNestedArtboard(node, artboardIndex);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.markRiveNestedArtboard(node, artboardIndex);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.markRiveNestedArtboard(node, artboardIndex);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerRiveAssetHandlers(registry:RiveImportRegistry):Void {
	flight._js._fn.Scene2dFormats.registerRiveAssetHandlers(registry);
}
#else
extern inline function registerRiveAssetHandlers(registry:RiveImportRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerRiveAssetHandlers(registry);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerRiveAssetHandlers(registry);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerRiveAssetHandlers(registry);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerRiveClippingHandlers(pathBooleanKernel:PathBooleanKernel, registry:RiveImportRegistry):Void {
	flight._js._fn.Scene2dFormats.registerRiveClippingHandlers(pathBooleanKernel, registry);
}
#else
extern inline function registerRiveClippingHandlers(pathBooleanKernel:PathBooleanKernel, registry:RiveImportRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerRiveClippingHandlers(pathBooleanKernel, registry);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerRiveClippingHandlers(pathBooleanKernel, registry);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerRiveClippingHandlers(pathBooleanKernel, registry);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRiveCorePropertyFieldType(key:Int):Null<RiveFieldType> {
	return flight._js._fn.Scene2dFormats.getRiveCorePropertyFieldType(key);
}
#else
extern inline function getRiveCorePropertyFieldType(key:Int):RiveFieldType {
#if hl
	return flight._hl._fn.Scene2dFormats.getRiveCorePropertyFieldType(key);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.getRiveCorePropertyFieldType(key);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.getRiveCorePropertyFieldType(key);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isRiveCoreBytesProperty(key:Int):Bool {
	return flight._js._fn.Scene2dFormats.isRiveCoreBytesProperty(key);
}
#else
extern inline function isRiveCoreBytesProperty(key:Int):Bool {
#if hl
	return flight._hl._fn.Scene2dFormats.isRiveCoreBytesProperty(key);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.isRiveCoreBytesProperty(key);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.isRiveCoreBytesProperty(key);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isReadableRive(source:Dynamic):Bool {
	return flight._js._fn.Scene2dFormats.isReadableRive(source);
}
#else
extern inline function isReadableRive(source:Dynamic, sourceLen:Int):Bool {
#if hl
	return flight._hl._fn.Scene2dFormats.isReadableRive(source, sourceLen);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.isReadableRive(source, sourceLen);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.isReadableRive(source, sourceLen);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRiveCoreTypeName(typeKey:Int):Null<String> {
	return flight._js._fn.Scene2dFormats.getRiveCoreTypeName(typeKey);
}
#else
extern inline function getRiveCoreTypeName(typeKey:Int):String {
#if hl
	return cast flight._hl._fn.Scene2dFormats.getRiveCoreTypeName(typeKey);
#elseif cpp
	return cast flight._cpp._fn.Scene2dFormats.getRiveCoreTypeName(typeKey);
#elseif (js && flight_esm)
	return cast flight._js._fn.Scene2dFormats.getRiveCoreTypeName(typeKey);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getRiveCoreTypeParent(typeKey:Int):Null<Int> {
	return flight._js._fn.Scene2dFormats.getRiveCoreTypeParent(typeKey);
}
#else
extern inline function getRiveCoreTypeParent(typeKey:Int):haxe.Int64 {
#if hl
	return flight._hl._fn.Scene2dFormats.getRiveCoreTypeParent(typeKey);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.getRiveCoreTypeParent(typeKey);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.getRiveCoreTypeParent(typeKey);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isRiveCoreTypeDerivedFrom(typeKey:Int, ancestorTypeKey:Int):Bool {
	return flight._js._fn.Scene2dFormats.isRiveCoreTypeDerivedFrom(typeKey, ancestorTypeKey);
}
#else
extern inline function isRiveCoreTypeDerivedFrom(typeKey:Int, ancestorTypeKey:Int):Bool {
#if hl
	return flight._hl._fn.Scene2dFormats.isRiveCoreTypeDerivedFrom(typeKey, ancestorTypeKey);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.isRiveCoreTypeDerivedFrom(typeKey, ancestorTypeKey);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.isRiveCoreTypeDerivedFrom(typeKey, ancestorTypeKey);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerRiveDrawOrderHandlers(registry:RiveImportRegistry):Void {
	flight._js._fn.Scene2dFormats.registerRiveDrawOrderHandlers(registry);
}
#else
extern inline function registerRiveDrawOrderHandlers(registry:RiveImportRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerRiveDrawOrderHandlers(registry);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerRiveDrawOrderHandlers(registry);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerRiveDrawOrderHandlers(registry);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerAllRiveHandlers(pathBooleanKernel:PathBooleanKernel, registry:RiveImportRegistry):Void {
	flight._js._fn.Scene2dFormats.registerAllRiveHandlers(pathBooleanKernel, registry);
}
#else
extern inline function registerAllRiveHandlers(pathBooleanKernel:PathBooleanKernel, registry:RiveImportRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerAllRiveHandlers(pathBooleanKernel, registry);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerAllRiveHandlers(pathBooleanKernel, registry);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerAllRiveHandlers(pathBooleanKernel, registry);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createRiveImportRegistry():RiveImportRegistry {
	return flight._js._fn.Scene2dFormats.createRiveImportRegistry();
}
#else
extern inline function createRiveImportRegistry():RiveImportRegistry {
#if hl
	return flight._hl._fn.Scene2dFormats.createRiveImportRegistry();
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.createRiveImportRegistry();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.createRiveImportRegistry();
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerRiveLayoutHandlers(registry:RiveImportRegistry):Void {
	flight._js._fn.Scene2dFormats.registerRiveLayoutHandlers(registry);
}
#else
extern inline function registerRiveLayoutHandlers(registry:RiveImportRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerRiveLayoutHandlers(registry);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerRiveLayoutHandlers(registry);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerRiveLayoutHandlers(registry);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createRiveImportRegistryFromOptions(options:RiveImportOptions, pathBooleanKernel:PathBooleanKernel):RiveImportRegistry {
	return flight._js._fn.Scene2dFormats.createRiveImportRegistryFromOptions(options, pathBooleanKernel);
}
#else
extern inline function createRiveImportRegistryFromOptions(options:RiveImportOptions, pathBooleanKernel:PathBooleanKernel):RiveImportRegistry {
#if hl
	return flight._hl._fn.Scene2dFormats.createRiveImportRegistryFromOptions(options, pathBooleanKernel);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.createRiveImportRegistryFromOptions(options, pathBooleanKernel);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.createRiveImportRegistryFromOptions(options, pathBooleanKernel);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyRiveImportOptions(options:RiveImportOptions, pathBooleanKernel:PathBooleanKernel, registry:RiveImportRegistry):Void {
	flight._js._fn.Scene2dFormats.applyRiveImportOptions(options, pathBooleanKernel, registry);
}
#else
extern inline function applyRiveImportOptions(options:RiveImportOptions, pathBooleanKernel:PathBooleanKernel, registry:RiveImportRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.applyRiveImportOptions(options, pathBooleanKernel, registry);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.applyRiveImportOptions(options, pathBooleanKernel, registry);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.applyRiveImportOptions(options, pathBooleanKernel, registry);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerRiveShapeHandlers(registry:RiveImportRegistry):Void {
	flight._js._fn.Scene2dFormats.registerRiveShapeHandlers(registry);
}
#else
extern inline function registerRiveShapeHandlers(registry:RiveImportRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerRiveShapeHandlers(registry);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerRiveShapeHandlers(registry);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerRiveShapeHandlers(registry);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendRiveShapeGeometry(shape:Dynamic, paths:Dynamic):Void {
	flight._js._fn.Scene2dFormats.appendRiveShapeGeometry(shape, paths);
}
#else
extern inline function appendRiveShapeGeometry(shape:flight.FlightNode, paths:Dynamic, pathsLen:Int):Void {
#if hl
	flight._hl._fn.Scene2dFormats.appendRiveShapeGeometry(shape, paths, pathsLen);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.appendRiveShapeGeometry(shape, paths, pathsLen);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.appendRiveShapeGeometry(shape, paths, pathsLen);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerRivePaintHandlers(registry:RiveImportRegistry):Void {
	flight._js._fn.Scene2dFormats.registerRivePaintHandlers(registry);
}
#else
extern inline function registerRivePaintHandlers(registry:RiveImportRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerRivePaintHandlers(registry);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerRivePaintHandlers(registry);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerRivePaintHandlers(registry);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerRivePathHandlers(registry:RiveImportRegistry):Void {
	flight._js._fn.Scene2dFormats.registerRivePathHandlers(registry);
}
#else
extern inline function registerRivePathHandlers(registry:RiveImportRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerRivePathHandlers(registry);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerRivePathHandlers(registry);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerRivePathHandlers(registry);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerRiveSkeletonHandlers(registry:RiveImportRegistry):Void {
	flight._js._fn.Scene2dFormats.registerRiveSkeletonHandlers(registry);
}
#else
extern inline function registerRiveSkeletonHandlers(registry:RiveImportRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerRiveSkeletonHandlers(registry);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerRiveSkeletonHandlers(registry);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerRiveSkeletonHandlers(registry);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerRiveSoloHandlers(registry:RiveImportRegistry):Void {
	flight._js._fn.Scene2dFormats.registerRiveSoloHandlers(registry);
}
#else
extern inline function registerRiveSoloHandlers(registry:RiveImportRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerRiveSoloHandlers(registry);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerRiveSoloHandlers(registry);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerRiveSoloHandlers(registry);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerRiveStateMachineHandlers(registry:RiveImportRegistry):Void {
	flight._js._fn.Scene2dFormats.registerRiveStateMachineHandlers(registry);
}
#else
extern inline function registerRiveStateMachineHandlers(registry:RiveImportRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerRiveStateMachineHandlers(registry);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerRiveStateMachineHandlers(registry);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerRiveStateMachineHandlers(registry);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerRiveTextHandlers(registry:RiveImportRegistry):Void {
	flight._js._fn.Scene2dFormats.registerRiveTextHandlers(registry);
}
#else
extern inline function registerRiveTextHandlers(registry:RiveImportRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerRiveTextHandlers(registry);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerRiveTextHandlers(registry);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerRiveTextHandlers(registry);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerSvgClipHandlers(registry:SvgRegistry):Void {
	flight._js._fn.Scene2dFormats.registerSvgClipHandlers(registry);
}
#else
extern inline function registerSvgClipHandlers(registry:SvgRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerSvgClipHandlers(registry);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerSvgClipHandlers(registry);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerSvgClipHandlers(registry);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerSvgElementHandlers(registry:SvgRegistry):Void {
	flight._js._fn.Scene2dFormats.registerSvgElementHandlers(registry);
}
#else
extern inline function registerSvgElementHandlers(registry:SvgRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerSvgElementHandlers(registry);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerSvgElementHandlers(registry);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerSvgElementHandlers(registry);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerAllSvgHandlers(registry:SvgRegistry):Void {
	flight._js._fn.Scene2dFormats.registerAllSvgHandlers(registry);
}
#else
extern inline function registerAllSvgHandlers(registry:SvgRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerAllSvgHandlers(registry);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerAllSvgHandlers(registry);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerAllSvgHandlers(registry);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSvgRegistry():SvgRegistry {
	return flight._js._fn.Scene2dFormats.createSvgRegistry();
}
#else
extern inline function createSvgRegistry():SvgRegistry {
#if hl
	return flight._hl._fn.Scene2dFormats.createSvgRegistry();
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.createSvgRegistry();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.createSvgRegistry();
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getSvgClipHandler(registry:SvgRegistry, kind:String):Null<SvgClipHandler> {
	return flight._js._fn.Scene2dFormats.getSvgClipHandler(registry, kind);
}
#else
extern inline function getSvgClipHandler(registry:SvgRegistry, kind:String):SvgClipHandler {
#if hl
	return flight._hl._fn.Scene2dFormats.getSvgClipHandler(registry, cast kind);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.getSvgClipHandler(registry, cast kind);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.getSvgClipHandler(registry, kind);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getSvgElementHandler(registry:SvgRegistry, kind:String):Null<SvgElementHandler> {
	return flight._js._fn.Scene2dFormats.getSvgElementHandler(registry, kind);
}
#else
extern inline function getSvgElementHandler(registry:SvgRegistry, kind:String):SvgElementHandler {
#if hl
	return flight._hl._fn.Scene2dFormats.getSvgElementHandler(registry, cast kind);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.getSvgElementHandler(registry, cast kind);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.getSvgElementHandler(registry, kind);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerSvgClipHandler(registry:SvgRegistry, kind:String, handle:SvgClipHandler):Void {
	flight._js._fn.Scene2dFormats.registerSvgClipHandler(registry, kind, handle);
}
#else
extern inline function registerSvgClipHandler(registry:SvgRegistry, kind:String, handle:SvgClipHandler):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerSvgClipHandler(registry, cast kind, handle);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerSvgClipHandler(registry, cast kind, handle);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerSvgClipHandler(registry, kind, handle);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerSvgElementHandler(registry:SvgRegistry, kind:String, handle:SvgElementHandler):Void {
	flight._js._fn.Scene2dFormats.registerSvgElementHandler(registry, kind, handle);
}
#else
extern inline function registerSvgElementHandler(registry:SvgRegistry, kind:String, handle:SvgElementHandler):Void {
#if hl
	flight._hl._fn.Scene2dFormats.registerSvgElementHandler(registry, cast kind, handle);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.registerSvgElementHandler(registry, cast kind, handle);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.registerSvgElementHandler(registry, kind, handle);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function unregisterSvgClipHandler(registry:SvgRegistry, kind:String):Bool {
	return flight._js._fn.Scene2dFormats.unregisterSvgClipHandler(registry, kind);
}
#else
extern inline function unregisterSvgClipHandler(registry:SvgRegistry, kind:String):Bool {
#if hl
	return flight._hl._fn.Scene2dFormats.unregisterSvgClipHandler(registry, cast kind);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.unregisterSvgClipHandler(registry, cast kind);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.unregisterSvgClipHandler(registry, kind);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function unregisterSvgElementHandler(registry:SvgRegistry, kind:String):Bool {
	return flight._js._fn.Scene2dFormats.unregisterSvgElementHandler(registry, kind);
}
#else
extern inline function unregisterSvgElementHandler(registry:SvgRegistry, kind:String):Bool {
#if hl
	return flight._hl._fn.Scene2dFormats.unregisterSvgElementHandler(registry, cast kind);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.unregisterSvgElementHandler(registry, cast kind);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.unregisterSvgElementHandler(registry, kind);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isReadableSvg(source:String):Bool {
	return flight._js._fn.Scene2dFormats.isReadableSvg(source);
}
#else
extern inline function isReadableSvg(source:String):Bool {
#if hl
	return flight._hl._fn.Scene2dFormats.isReadableSvg(cast source);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.isReadableSvg(cast source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.isReadableSvg(source);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseSvgRequirements(source:String):RequirementSet {
	return flight._js._fn.Scene2dFormats.parseSvgRequirements(source);
}
#else
extern inline function parseSvgRequirements(source:String):RequirementSet {
#if hl
	return flight._hl._fn.Scene2dFormats.parseSvgRequirements(cast source);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.parseSvgRequirements(cast source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.parseSvgRequirements(source);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeLottieRegistry(ptr:LottieRegistry):Void {
	flight._js._fn.Scene2dFormats.freeLottieRegistry(ptr);
}
#else
extern inline function freeLottieRegistry(ptr:LottieRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.freeLottieRegistry(ptr);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.freeLottieRegistry(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.freeLottieRegistry(ptr);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeLottieLayerHandler(ptr:LottieLayerHandler):Void {
	flight._js._fn.Scene2dFormats.freeLottieLayerHandler(ptr);
}
#else
extern inline function freeLottieLayerHandler(ptr:LottieLayerHandler):Void {
#if hl
	flight._hl._fn.Scene2dFormats.freeLottieLayerHandler(ptr);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.freeLottieLayerHandler(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.freeLottieLayerHandler(ptr);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeLottieMaskHandler(ptr:LottieMaskHandler):Void {
	flight._js._fn.Scene2dFormats.freeLottieMaskHandler(ptr);
}
#else
extern inline function freeLottieMaskHandler(ptr:LottieMaskHandler):Void {
#if hl
	flight._hl._fn.Scene2dFormats.freeLottieMaskHandler(ptr);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.freeLottieMaskHandler(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.freeLottieMaskHandler(ptr);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeLottieShapeItemHandler(ptr:LottieShapeItemHandler):Void {
	flight._js._fn.Scene2dFormats.freeLottieShapeItemHandler(ptr);
}
#else
extern inline function freeLottieShapeItemHandler(ptr:LottieShapeItemHandler):Void {
#if hl
	flight._hl._fn.Scene2dFormats.freeLottieShapeItemHandler(ptr);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.freeLottieShapeItemHandler(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.freeLottieShapeItemHandler(ptr);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePathRef(ptr:Path):Void {
	flight._js._fn.Scene2dFormats.freePathRef(ptr);
}
#else
extern inline function freePathRef(ptr:Path):Void {
#if hl
	flight._hl._fn.Scene2dFormats.freePathRef(ptr);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.freePathRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.freePathRef(ptr);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeRiveFieldType(ptr:RiveFieldType):Void {
	flight._js._fn.Scene2dFormats.freeRiveFieldType(ptr);
}
#else
extern inline function freeRiveFieldType(ptr:RiveFieldType):Void {
#if hl
	flight._hl._fn.Scene2dFormats.freeRiveFieldType(ptr);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.freeRiveFieldType(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.freeRiveFieldType(ptr);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeRiveImportRegistry(ptr:RiveImportRegistry):Void {
	flight._js._fn.Scene2dFormats.freeRiveImportRegistry(ptr);
}
#else
extern inline function freeRiveImportRegistry(ptr:RiveImportRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.freeRiveImportRegistry(ptr);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.freeRiveImportRegistry(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.freeRiveImportRegistry(ptr);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSvgRegistry(ptr:SvgRegistry):Void {
	flight._js._fn.Scene2dFormats.freeSvgRegistry(ptr);
}
#else
extern inline function freeSvgRegistry(ptr:SvgRegistry):Void {
#if hl
	flight._hl._fn.Scene2dFormats.freeSvgRegistry(ptr);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.freeSvgRegistry(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.freeSvgRegistry(ptr);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSvgClipHandler(ptr:SvgClipHandler):Void {
	flight._js._fn.Scene2dFormats.freeSvgClipHandler(ptr);
}
#else
extern inline function freeSvgClipHandler(ptr:SvgClipHandler):Void {
#if hl
	flight._hl._fn.Scene2dFormats.freeSvgClipHandler(ptr);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.freeSvgClipHandler(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.freeSvgClipHandler(ptr);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSvgElementHandler(ptr:SvgElementHandler):Void {
	flight._js._fn.Scene2dFormats.freeSvgElementHandler(ptr);
}
#else
extern inline function freeSvgElementHandler(ptr:SvgElementHandler):Void {
#if hl
	flight._hl._fn.Scene2dFormats.freeSvgElementHandler(ptr);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.freeSvgElementHandler(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.freeSvgElementHandler(ptr);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
#end
