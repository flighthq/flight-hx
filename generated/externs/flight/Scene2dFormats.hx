package flight;

inline function createLottieBezierPath(value:LottieShapePath):Path {
#if hl
	return flight._hl._fn.Scene2dFormats.createLottieBezierPath(value);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.createLottieBezierPath(value);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.createLottieBezierPath(value);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function flattenLottieShapePath(out:Dynamic, path:LottieShapePath):Void {
#if hl
	flight._hl._fn.Scene2dFormats.flattenLottieShapePath(out, path);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.flattenLottieShapePath(out, path);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.flattenLottieShapePath(out, path);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function unflattenLottieShapePath(template:LottieShapePath, values:Dynamic, valuesLen:Int):LottieShapePath {
#if hl
	return flight._hl._fn.Scene2dFormats.unflattenLottieShapePath(template, values, valuesLen);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.unflattenLottieShapePath(template, values, valuesLen);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.unflattenLottieShapePath(template, values, valuesLen);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function getLottieFeatureNames(out:Dynamic):Void {
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
inline function applyAnimationClipToLottieDocument(clip:AnimationClip, time:Float):Void {
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
inline function lottieClamp(value:Float, minimum:Float, maximum:Float):Float {
#if hl
	return flight._hl._fn.Scene2dFormats.lottieClamp(value, minimum, maximum);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.lottieClamp(value, minimum, maximum);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.lottieClamp(value, minimum, maximum);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function lottieDegreesToRadians(value:Float):Float {
#if hl
	return flight._hl._fn.Scene2dFormats.lottieDegreesToRadians(value);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.lottieDegreesToRadians(value);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.lottieDegreesToRadians(value);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function lottieNumericValue(out:Dynamic, value:Unknown, components:Int):Void {
#if hl
	flight._hl._fn.Scene2dFormats.lottieNumericValue(out, value, components);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.lottieNumericValue(out, value, components);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.lottieNumericValue(out, value, components);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function lottieRgba(color:Dynamic, colorLen:Int):Int {
#if hl
	return flight._hl._fn.Scene2dFormats.lottieRgba(color, colorLen);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.lottieRgba(color, colorLen);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.lottieRgba(color, colorLen);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function createLottieGradientMatrix(start:Dynamic, startLen:Int, end:Dynamic, endLen:Int):Matrix {
#if hl
	return flight._hl._fn.Scene2dFormats.createLottieGradientMatrix(start, startLen, end, endLen);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.createLottieGradientMatrix(start, startLen, end, endLen);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.createLottieGradientMatrix(start, startLen, end, endLen);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function interpolateLottieGradientOpacity(stops:Dynamic, stopsLen:Int, offset:Float):Float {
#if hl
	return flight._hl._fn.Scene2dFormats.interpolateLottieGradientOpacity(stops, stopsLen, offset);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.interpolateLottieGradientOpacity(stops, stopsLen, offset);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.interpolateLottieGradientOpacity(stops, stopsLen, offset);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function parseLottieGradient(values:Dynamic, valuesLen:Int, count:Int, opacity:Float):LottieGradientPaint {
#if hl
	return flight._hl._fn.Scene2dFormats.parseLottieGradient(values, valuesLen, count, opacity);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.parseLottieGradient(values, valuesLen, count, opacity);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.parseLottieGradient(values, valuesLen, count, opacity);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function registerAllLottieHandlers(registry:LottieRegistry):Void {
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
inline function registerLottieLayerHandlers(registry:LottieRegistry):Void {
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
inline function registerLottieMaskHandlers(registry:LottieRegistry):Void {
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
inline function createLottieRegistry():LottieRegistry {
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
inline function getLottieLayerHandler(registry:LottieRegistry, kind:LottieLayerKind):LottieLayerHandler {
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
inline function getLottieMaskHandler(registry:LottieRegistry, kind:String):LottieMaskHandler {
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
inline function getLottieShapeItemHandler(registry:LottieRegistry, kind:String):LottieShapeItemHandler {
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
inline function registerLottieLayerHandler(registry:LottieRegistry, kind:LottieLayerKind, handle:LottieLayerHandler):Void {
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
inline function registerLottieMaskHandler(registry:LottieRegistry, kind:String, handle:LottieMaskHandler):Void {
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
inline function registerLottieShapeItemHandler(registry:LottieRegistry, kind:String, handle:LottieShapeItemHandler):Void {
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
inline function unregisterLottieLayerHandler(registry:LottieRegistry, kind:LottieLayerKind):Bool {
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
inline function unregisterLottieMaskHandler(registry:LottieRegistry, kind:String):Bool {
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
inline function unregisterLottieShapeItemHandler(registry:LottieRegistry, kind:String):Bool {
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
inline function isReadableLottie(json:String):Bool {
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
inline function parseLottieRequirements(json:String):RequirementSet {
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
inline function applyLottieShapeDirection(path:Dynamic, direction:Int):Dynamic {
#if hl
	return flight._hl._fn.Scene2dFormats.applyLottieShapeDirection(path, direction);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.applyLottieShapeDirection(path, direction);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.applyLottieShapeDirection(path, direction);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function registerLottieShapeItemHandlers(registry:LottieRegistry):Void {
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
inline function mapLottieLineCap(value:Int):flight.CapsStyle {
#if hl
	return flight._hl._fn.Scene2dFormats.mapLottieLineCap(value);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.mapLottieLineCap(value);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.mapLottieLineCap(value);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function mapLottieLineJoin(value:Int):flight.JointStyle {
#if hl
	return flight._hl._fn.Scene2dFormats.mapLottieLineJoin(value);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.mapLottieLineJoin(value);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.mapLottieLineJoin(value);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function applyAnimationClipToRiveDocument(clip:AnimationClip, time:Float):Void {
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
inline function registerRiveAnimationHandlers(registry:RiveImportRegistry):Void {
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
inline function createRiveImageSprite(name:String, assetIndex:Int):Dynamic {
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
inline function getRiveImageAssetIndex(node:Dynamic):Int {
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
inline function getRiveImageTexture(node:Dynamic):Dynamic {
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
inline function getRiveNestedArtboardIndex(node:Dynamic):Int {
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
inline function markRiveNestedArtboard(node:Dynamic, artboardIndex:Int):Void {
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
inline function registerRiveAssetHandlers(registry:RiveImportRegistry):Void {
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
inline function registerRiveClippingHandlers(pathBooleanKernel:PathBooleanKernel, registry:RiveImportRegistry):Void {
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
inline function getRiveCorePropertyFieldType(key:Int):RiveFieldType {
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
inline function isRiveCoreBytesProperty(key:Int):Bool {
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
inline function isReadableRive(source:Dynamic, sourceLen:Int):Bool {
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
inline function getRiveCoreTypeName(typeKey:Int):String {
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
inline function getRiveCoreTypeParent(typeKey:Int):Int {
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
inline function isRiveCoreTypeDerivedFrom(typeKey:Int, ancestorTypeKey:Int):Bool {
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
inline function registerRiveDrawOrderHandlers(registry:RiveImportRegistry):Void {
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
inline function registerAllRiveHandlers(pathBooleanKernel:PathBooleanKernel, registry:RiveImportRegistry):Void {
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
inline function createRiveImportRegistry():RiveImportRegistry {
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
inline function importRiveCoreObjectAsData():Dynamic {
#if hl
	return flight._hl._fn.Scene2dFormats.importRiveCoreObjectAsData();
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.importRiveCoreObjectAsData();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.importRiveCoreObjectAsData();
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function registerRiveLayoutHandlers(registry:RiveImportRegistry):Void {
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
inline function createRiveImportRegistryFromOptions(options:RiveImportOptions, pathBooleanKernel:PathBooleanKernel):RiveImportRegistry {
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
inline function applyRiveImportOptions(options:RiveImportOptions, pathBooleanKernel:PathBooleanKernel, registry:RiveImportRegistry):Void {
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
inline function registerRiveShapeHandlers(registry:RiveImportRegistry):Void {
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
inline function appendRiveShapeGeometry(shape:Dynamic, paths:Dynamic, pathsLen:Int):Void {
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
inline function registerRivePaintHandlers(registry:RiveImportRegistry):Void {
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
inline function registerRivePathHandlers(registry:RiveImportRegistry):Void {
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
inline function createRiveSkeleton2d(artboard:RiveArtboardGraph):RiveSkeleton2DImport {
#if hl
	return flight._hl._fn.Scene2dFormats.createRiveSkeleton2d(artboard);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.createRiveSkeleton2d(artboard);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.createRiveSkeleton2d(artboard);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function registerRiveSkeletonHandlers(registry:RiveImportRegistry):Void {
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
inline function registerRiveSoloHandlers(registry:RiveImportRegistry):Void {
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
inline function registerRiveStateMachineHandlers(registry:RiveImportRegistry):Void {
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
inline function registerRiveTextHandlers(registry:RiveImportRegistry):Void {
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
inline function hasUnmeasurableSvgText(target:Dynamic):Bool {
#if hl
	return flight._hl._fn.Scene2dFormats.hasUnmeasurableSvgText(target);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.hasUnmeasurableSvgText(target);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.hasUnmeasurableSvgText(target);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function usesSvgObjectBoundingBoxUnits(element:Dynamic):Bool {
#if hl
	return flight._hl._fn.Scene2dFormats.usesSvgObjectBoundingBoxUnits(element);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.usesSvgObjectBoundingBoxUnits(element);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.usesSvgObjectBoundingBoxUnits(element);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function registerSvgClipHandlers(registry:SvgRegistry):Void {
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
inline function parseSvgColor(value:String):SvgColor {
#if hl
	return flight._hl._fn.Scene2dFormats.parseSvgColor(cast value);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.parseSvgColor(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.parseSvgColor(value);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function resolveSvgColor(value:String, currentColor:String):SvgColor {
#if hl
	return flight._hl._fn.Scene2dFormats.resolveSvgColor(cast value, cast currentColor);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.resolveSvgColor(cast value, cast currentColor);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.resolveSvgColor(value, currentColor);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function registerSvgElementHandlers(registry:SvgRegistry):Void {
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
inline function createSvgGeometryPath(element:XmlElement, winding:flight.PathWinding):Path {
#if hl
	return flight._hl._fn.Scene2dFormats.createSvgGeometryPath(element, winding);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.createSvgGeometryPath(element, winding);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.createSvgGeometryPath(element, winding);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function createSvgGradientMatrix(gradient:SvgGradient, path:Path):Matrix {
#if hl
	return flight._hl._fn.Scene2dFormats.createSvgGradientMatrix(gradient, path);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.createSvgGradientMatrix(gradient, path);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.createSvgGradientMatrix(gradient, path);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function hasZeroAreaSvgGradientBox(gradient:SvgGradient, path:Path):Bool {
#if hl
	return flight._hl._fn.Scene2dFormats.hasZeroAreaSvgGradientBox(gradient, path);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.hasZeroAreaSvgGradientBox(gradient, path);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.hasZeroAreaSvgGradientBox(gradient, path);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function registerAllSvgHandlers(registry:SvgRegistry):Void {
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
inline function createSvgRegistry():SvgRegistry {
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
inline function getSvgClipHandler(registry:SvgRegistry, kind:String):SvgClipHandler {
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
inline function getSvgElementHandler(registry:SvgRegistry, kind:String):SvgElementHandler {
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
inline function registerSvgClipHandler(registry:SvgRegistry, kind:String, handle:SvgClipHandler):Void {
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
inline function registerSvgElementHandler(registry:SvgRegistry, kind:String, handle:SvgElementHandler):Void {
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
inline function unregisterSvgClipHandler(registry:SvgRegistry, kind:String):Bool {
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
inline function unregisterSvgElementHandler(registry:SvgRegistry, kind:String):Bool {
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
inline function isReadableSvg(source:String):Bool {
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
inline function parseSvgRequirements(source:String):RequirementSet {
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
inline function collectCssRules(out:Dynamic, root:XmlElement):Void {
#if hl
	flight._hl._fn.Scene2dFormats.collectCssRules(out, root);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.collectCssRules(out, root);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.collectCssRules(out, root);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function resolveSvgWinding(value:String, fallback:flight.PathWinding):flight.PathWinding {
#if hl
	return flight._hl._fn.Scene2dFormats.resolveSvgWinding(cast value, fallback);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.resolveSvgWinding(cast value, fallback);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.resolveSvgWinding(value, fallback);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function createSvgViewBoxMatrix(viewBox:Dynamic, viewBoxLen:Int, viewport:SvgViewport, preserveAspectRatioValue:String):Matrix {
#if hl
	return flight._hl._fn.Scene2dFormats.createSvgViewBoxMatrix(viewBox, viewBoxLen, viewport, cast preserveAspectRatioValue);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.createSvgViewBoxMatrix(viewBox, viewBoxLen, viewport, cast preserveAspectRatioValue);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.createSvgViewBoxMatrix(viewBox, viewBoxLen, viewport, preserveAspectRatioValue);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function createSvgViewportMatrix(element:XmlElement, viewport:SvgViewportOptions):Matrix {
#if hl
	return flight._hl._fn.Scene2dFormats.createSvgViewportMatrix(element, viewport);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.createSvgViewportMatrix(element, viewport);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.createSvgViewportMatrix(element, viewport);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function applySvgTransform(target:Dynamic, matrix:Matrix):Void {
#if hl
	flight._hl._fn.Scene2dFormats.applySvgTransform(target, matrix);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.applySvgTransform(target, matrix);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.applySvgTransform(target, matrix);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function assignSvgTransform(target:Dynamic, transform:Transform2D):Void {
#if hl
	flight._hl._fn.Scene2dFormats.assignSvgTransform(target, transform);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.assignSvgTransform(target, transform);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.assignSvgTransform(target, transform);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function multiplySvgMatrices(out:Matrix, a:Matrix, b:Matrix):Void {
#if hl
	flight._hl._fn.Scene2dFormats.multiplySvgMatrices(out, a, b);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.multiplySvgMatrices(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.multiplySvgMatrices(out, a, b);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function parseSvgTransform(value:String):Matrix {
#if hl
	return flight._hl._fn.Scene2dFormats.parseSvgTransform(cast value);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.parseSvgTransform(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.parseSvgTransform(value);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function parseSvgCoordinate(value:String, fallback:Float):Float {
#if hl
	return flight._hl._fn.Scene2dFormats.parseSvgCoordinate(cast value, fallback);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.parseSvgCoordinate(cast value, fallback);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.parseSvgCoordinate(value, fallback);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function parseSvgCssNumber(value:String, fallback:Float):Float {
#if hl
	return flight._hl._fn.Scene2dFormats.parseSvgCssNumber(cast value, fallback);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.parseSvgCssNumber(cast value, fallback);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.parseSvgCssNumber(value, fallback);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function parseSvgLength(value:String, fallback:Float):Float {
#if hl
	return flight._hl._fn.Scene2dFormats.parseSvgLength(cast value, fallback);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.parseSvgLength(cast value, fallback);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.parseSvgLength(value, fallback);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function parseSvgNumberList(value:String):Dynamic {
#if hl
	return flight._hl._fn.Scene2dFormats.parseSvgNumberList(cast value);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.parseSvgNumberList(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.parseSvgNumberList(value);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function parseUrlReference(value:String):String {
#if hl
	return cast flight._hl._fn.Scene2dFormats.parseUrlReference(cast value);
#elseif cpp
	return cast flight._cpp._fn.Scene2dFormats.parseUrlReference(cast value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Scene2dFormats.parseUrlReference(value);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function svgFirstNumber(value:String, fallback:Float):Float {
#if hl
	return flight._hl._fn.Scene2dFormats.svgFirstNumber(cast value, fallback);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.svgFirstNumber(cast value, fallback);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.svgFirstNumber(value, fallback);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function svgLocalName(name:String):String {
#if hl
	return cast flight._hl._fn.Scene2dFormats.svgLocalName(cast name);
#elseif cpp
	return cast flight._cpp._fn.Scene2dFormats.svgLocalName(cast name);
#elseif (js && flight_esm)
	return cast flight._js._fn.Scene2dFormats.svgLocalName(name);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function svgNumberAttribute(element:XmlElement, name:String, fallback:Float):Float {
#if hl
	return flight._hl._fn.Scene2dFormats.svgNumberAttribute(element, cast name, fallback);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.svgNumberAttribute(element, cast name, fallback);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.svgNumberAttribute(element, name, fallback);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function svgOptionalNumberAttribute(element:XmlElement, name:String):Float {
#if hl
	return flight._hl._fn.Scene2dFormats.svgOptionalNumberAttribute(element, cast name);
#elseif cpp
	return flight._cpp._fn.Scene2dFormats.svgOptionalNumberAttribute(element, cast name);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2dFormats.svgOptionalNumberAttribute(element, name);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function visitSvgElements(element:XmlElement, visitorFn:Dynamic, visitorCtx:Dynamic):Void {
#if hl
	flight._hl._fn.Scene2dFormats.visitSvgElements(element, visitorFn, visitorCtx);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.visitSvgElements(element, visitorFn, visitorCtx);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.visitSvgElements(element, visitorFn, visitorCtx);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function freeLottieShapePath(ptr:LottieShapePath):Void {
#if hl
	flight._hl._fn.Scene2dFormats.freeLottieShapePath(ptr);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.freeLottieShapePath(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.freeLottieShapePath(ptr);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function freeLottieGradientPaint(ptr:LottieGradientPaint):Void {
#if hl
	flight._hl._fn.Scene2dFormats.freeLottieGradientPaint(ptr);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.freeLottieGradientPaint(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.freeLottieGradientPaint(ptr);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function freeLottieRegistry(ptr:LottieRegistry):Void {
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
inline function freeLottieLayerHandler(ptr:LottieLayerHandler):Void {
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
inline function freeLottieMaskHandler(ptr:LottieMaskHandler):Void {
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
inline function freeLottieShapeItemHandler(ptr:LottieShapeItemHandler):Void {
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
inline function freeRequirementSet(ptr:RequirementSet):Void {
#if hl
	flight._hl._fn.Scene2dFormats.freeRequirementSet(ptr);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.freeRequirementSet(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.freeRequirementSet(ptr);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function freeRiveFieldType(ptr:RiveFieldType):Void {
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
inline function freeRiveImportRegistry(ptr:RiveImportRegistry):Void {
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
inline function freeRiveSkeleton2Dimport(ptr:RiveSkeleton2DImport):Void {
#if hl
	flight._hl._fn.Scene2dFormats.freeRiveSkeleton2Dimport(ptr);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.freeRiveSkeleton2Dimport(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.freeRiveSkeleton2Dimport(ptr);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function freeSvgColor(ptr:SvgColor):Void {
#if hl
	flight._hl._fn.Scene2dFormats.freeSvgColor(ptr);
#elseif cpp
	flight._cpp._fn.Scene2dFormats.freeSvgColor(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2dFormats.freeSvgColor(ptr);
#else
	#error "flight.Scene2dFormats: no backend for this target."
#end
}
inline function freeSvgRegistry(ptr:SvgRegistry):Void {
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
inline function freeSvgClipHandler(ptr:SvgClipHandler):Void {
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
inline function freeSvgElementHandler(ptr:SvgElementHandler):Void {
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
