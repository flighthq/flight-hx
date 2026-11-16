package flight._js._fn;

@:jsRequire("@flighthq/scene2d-formats")
extern class Scene2dFormats {
	@:native("createLottieBezierPath")
	public static function createLottieBezierPath(value:flight._js.LottieShapePath):flight._js.Path;
	@:native("flattenLottieShapePath")
	public static function flattenLottieShapePath(out:Dynamic, path:flight._js.LottieShapePath):Void;
	@:native("unflattenLottieShapePath")
	public static function unflattenLottieShapePath(template:flight._js.LottieShapePath, values:Dynamic):flight._js.LottieShapePath;
	@:native("getLottieFeatureNames")
	public static function getLottieFeatureNames(out:Dynamic):Void;
	@:native("applyAnimationClipToLottieDocument")
	public static function applyAnimationClipToLottieDocument(clip:flight._js.AnimationClip, time:Float):Void;
	@:native("lottieClamp")
	public static function lottieClamp(value:Float, minimum:Float, maximum:Float):Float;
	@:native("lottieDegreesToRadians")
	public static function lottieDegreesToRadians(value:Float):Float;
	@:native("lottieNumericValue")
	public static function lottieNumericValue(out:Dynamic, value:flight._js.Unknown, components:Int):Void;
	@:native("lottieRgba")
	public static function lottieRgba(color:Dynamic):Int;
	@:native("createLottieGradientMatrix")
	public static function createLottieGradientMatrix(start:Dynamic, end:Dynamic):flight._js.Matrix;
	@:native("interpolateLottieGradientOpacity")
	public static function interpolateLottieGradientOpacity(stops:Dynamic, offset:Float):Float;
	@:native("parseLottieGradient")
	public static function parseLottieGradient(values:Dynamic, count:Int, opacity:Float):flight._js.LottieGradientPaint;
	@:native("registerAllLottieHandlers")
	public static function registerAllLottieHandlers(registry:flight._js.LottieRegistry):Void;
	@:native("registerLottieLayerHandlers")
	public static function registerLottieLayerHandlers(registry:flight._js.LottieRegistry):Void;
	@:native("registerLottieMaskHandlers")
	public static function registerLottieMaskHandlers(registry:flight._js.LottieRegistry):Void;
	@:native("createLottieRegistry")
	public static function createLottieRegistry():flight._js.LottieRegistry;
	@:native("getLottieLayerHandler")
	public static function getLottieLayerHandler(registry:flight._js.LottieRegistry, kind:flight._js.LottieLayerKind):Null<flight._js.LottieLayerHandler>;
	@:native("getLottieMaskHandler")
	public static function getLottieMaskHandler(registry:flight._js.LottieRegistry, kind:String):Null<flight._js.LottieMaskHandler>;
	@:native("getLottieShapeItemHandler")
	public static function getLottieShapeItemHandler(registry:flight._js.LottieRegistry, kind:String):Null<flight._js.LottieShapeItemHandler>;
	@:native("registerLottieLayerHandler")
	public static function registerLottieLayerHandler(registry:flight._js.LottieRegistry, kind:flight._js.LottieLayerKind, handle:flight._js.LottieLayerHandler):Void;
	@:native("registerLottieMaskHandler")
	public static function registerLottieMaskHandler(registry:flight._js.LottieRegistry, kind:String, handle:flight._js.LottieMaskHandler):Void;
	@:native("registerLottieShapeItemHandler")
	public static function registerLottieShapeItemHandler(registry:flight._js.LottieRegistry, kind:String, handle:flight._js.LottieShapeItemHandler):Void;
	@:native("unregisterLottieLayerHandler")
	public static function unregisterLottieLayerHandler(registry:flight._js.LottieRegistry, kind:flight._js.LottieLayerKind):Bool;
	@:native("unregisterLottieMaskHandler")
	public static function unregisterLottieMaskHandler(registry:flight._js.LottieRegistry, kind:String):Bool;
	@:native("unregisterLottieShapeItemHandler")
	public static function unregisterLottieShapeItemHandler(registry:flight._js.LottieRegistry, kind:String):Bool;
	@:native("isReadableLottie")
	public static function isReadableLottie(json:String):Bool;
	@:native("parseLottieRequirements")
	public static function parseLottieRequirements(json:String):flight._js.RequirementSet;
	@:native("applyLottieShapeDirection")
	public static function applyLottieShapeDirection(path:Dynamic, direction:Null<Int>):Dynamic;
	@:native("registerLottieShapeItemHandlers")
	public static function registerLottieShapeItemHandlers(registry:flight._js.LottieRegistry):Void;
	@:native("mapLottieLineCap")
	public static function mapLottieLineCap(value:Null<Int>):Dynamic;
	@:native("mapLottieLineJoin")
	public static function mapLottieLineJoin(value:Null<Int>):Dynamic;
	@:native("applyAnimationClipToRiveDocument")
	public static function applyAnimationClipToRiveDocument(clip:flight._js.AnimationClip, time:Float):Void;
	@:native("registerRiveAnimationHandlers")
	public static function registerRiveAnimationHandlers(registry:flight._js.RiveImportRegistry):Void;
	@:native("createRiveImageSprite")
	public static function createRiveImageSprite(name:String, assetIndex:Int):Dynamic;
	@:native("getRiveImageAssetIndex")
	public static function getRiveImageAssetIndex(node:Dynamic):Int;
	@:native("getRiveImageTexture")
	public static function getRiveImageTexture(node:Dynamic):Null<Dynamic>;
	@:native("getRiveNestedArtboardIndex")
	public static function getRiveNestedArtboardIndex(node:Dynamic):Int;
	@:native("markRiveNestedArtboard")
	public static function markRiveNestedArtboard(node:Dynamic, artboardIndex:Int):Void;
	@:native("registerRiveAssetHandlers")
	public static function registerRiveAssetHandlers(registry:flight._js.RiveImportRegistry):Void;
	@:native("registerRiveClippingHandlers")
	public static function registerRiveClippingHandlers(pathBooleanKernel:flight._js.PathBooleanKernel, registry:flight._js.RiveImportRegistry):Void;
	@:native("getRiveCorePropertyFieldType")
	public static function getRiveCorePropertyFieldType(key:Int):Null<flight._js.RiveFieldType>;
	@:native("isRiveCoreBytesProperty")
	public static function isRiveCoreBytesProperty(key:Int):Bool;
	@:native("isReadableRive")
	public static function isReadableRive(source:Dynamic):Bool;
	@:native("getRiveCoreTypeName")
	public static function getRiveCoreTypeName(typeKey:Int):Null<String>;
	@:native("getRiveCoreTypeParent")
	public static function getRiveCoreTypeParent(typeKey:Int):Null<Int>;
	@:native("isRiveCoreTypeDerivedFrom")
	public static function isRiveCoreTypeDerivedFrom(typeKey:Int, ancestorTypeKey:Int):Bool;
	@:native("registerRiveDrawOrderHandlers")
	public static function registerRiveDrawOrderHandlers(registry:flight._js.RiveImportRegistry):Void;
	@:native("registerAllRiveHandlers")
	public static function registerAllRiveHandlers(pathBooleanKernel:flight._js.PathBooleanKernel, registry:flight._js.RiveImportRegistry):Void;
	@:native("createRiveImportRegistry")
	public static function createRiveImportRegistry():flight._js.RiveImportRegistry;
	@:native("importRiveCoreObjectAsData")
	public static function importRiveCoreObjectAsData():Null<Dynamic>;
	@:native("registerRiveLayoutHandlers")
	public static function registerRiveLayoutHandlers(registry:flight._js.RiveImportRegistry):Void;
	@:native("createRiveImportRegistryFromOptions")
	public static function createRiveImportRegistryFromOptions(options:flight._js.RiveImportOptions, pathBooleanKernel:flight._js.PathBooleanKernel):flight._js.RiveImportRegistry;
	@:native("applyRiveImportOptions")
	public static function applyRiveImportOptions(options:flight._js.RiveImportOptions, pathBooleanKernel:flight._js.PathBooleanKernel, registry:flight._js.RiveImportRegistry):Void;
	@:native("registerRiveShapeHandlers")
	public static function registerRiveShapeHandlers(registry:flight._js.RiveImportRegistry):Void;
	@:native("appendRiveShapeGeometry")
	public static function appendRiveShapeGeometry(shape:Dynamic, paths:Dynamic):Void;
	@:native("registerRivePaintHandlers")
	public static function registerRivePaintHandlers(registry:flight._js.RiveImportRegistry):Void;
	@:native("registerRivePathHandlers")
	public static function registerRivePathHandlers(registry:flight._js.RiveImportRegistry):Void;
	@:native("createRiveSkeleton2D")
	public static function createRiveSkeleton2d(artboard:flight._js.RiveArtboardGraph):Null<flight._js.RiveSkeleton2DImport>;
	@:native("registerRiveSkeletonHandlers")
	public static function registerRiveSkeletonHandlers(registry:flight._js.RiveImportRegistry):Void;
	@:native("registerRiveSoloHandlers")
	public static function registerRiveSoloHandlers(registry:flight._js.RiveImportRegistry):Void;
	@:native("registerRiveStateMachineHandlers")
	public static function registerRiveStateMachineHandlers(registry:flight._js.RiveImportRegistry):Void;
	@:native("registerRiveTextHandlers")
	public static function registerRiveTextHandlers(registry:flight._js.RiveImportRegistry):Void;
	@:native("hasUnmeasurableSvgText")
	public static function hasUnmeasurableSvgText(target:Dynamic):Bool;
	@:native("usesSvgObjectBoundingBoxUnits")
	public static function usesSvgObjectBoundingBoxUnits(element:Dynamic):Bool;
	@:native("registerSvgClipHandlers")
	public static function registerSvgClipHandlers(registry:flight._js.SvgRegistry):Void;
	@:native("parseSvgColor")
	public static function parseSvgColor(value:String):Null<flight._js.SvgColor>;
	@:native("resolveSvgColor")
	public static function resolveSvgColor(value:String, currentColor:String):Null<flight._js.SvgColor>;
	@:native("registerSvgElementHandlers")
	public static function registerSvgElementHandlers(registry:flight._js.SvgRegistry):Void;
	@:native("createSvgGeometryPath")
	public static function createSvgGeometryPath(element:flight._js.XmlElement, winding:Dynamic):Null<flight._js.Path>;
	@:native("createSvgGradientMatrix")
	public static function createSvgGradientMatrix(gradient:flight._js.SvgGradient, path:flight._js.Path):flight._js.Matrix;
	@:native("hasZeroAreaSvgGradientBox")
	public static function hasZeroAreaSvgGradientBox(gradient:flight._js.SvgGradient, path:flight._js.Path):Bool;
	@:native("registerAllSvgHandlers")
	public static function registerAllSvgHandlers(registry:flight._js.SvgRegistry):Void;
	@:native("createSvgRegistry")
	public static function createSvgRegistry():flight._js.SvgRegistry;
	@:native("getSvgClipHandler")
	public static function getSvgClipHandler(registry:flight._js.SvgRegistry, kind:String):Null<flight._js.SvgClipHandler>;
	@:native("getSvgElementHandler")
	public static function getSvgElementHandler(registry:flight._js.SvgRegistry, kind:String):Null<flight._js.SvgElementHandler>;
	@:native("registerSvgClipHandler")
	public static function registerSvgClipHandler(registry:flight._js.SvgRegistry, kind:String, handle:flight._js.SvgClipHandler):Void;
	@:native("registerSvgElementHandler")
	public static function registerSvgElementHandler(registry:flight._js.SvgRegistry, kind:String, handle:flight._js.SvgElementHandler):Void;
	@:native("unregisterSvgClipHandler")
	public static function unregisterSvgClipHandler(registry:flight._js.SvgRegistry, kind:String):Bool;
	@:native("unregisterSvgElementHandler")
	public static function unregisterSvgElementHandler(registry:flight._js.SvgRegistry, kind:String):Bool;
	@:native("isReadableSvg")
	public static function isReadableSvg(source:String):Bool;
	@:native("parseSvgRequirements")
	public static function parseSvgRequirements(source:String):flight._js.RequirementSet;
	@:native("collectCssRules")
	public static function collectCssRules(out:Dynamic, root:flight._js.XmlElement):Void;
	@:native("resolveSvgWinding")
	public static function resolveSvgWinding(value:Null<String>, fallback:Dynamic):Dynamic;
	@:native("createSvgViewBoxMatrix")
	public static function createSvgViewBoxMatrix(viewBox:Dynamic, viewport:flight._js.SvgViewport, preserveAspectRatioValue:String):flight._js.Matrix;
	@:native("createSvgViewportMatrix")
	public static function createSvgViewportMatrix(element:flight._js.XmlElement, viewport:Null<flight._js.SvgViewportOptions>):Null<flight._js.Matrix>;
	@:native("applySvgTransform")
	public static function applySvgTransform(target:Dynamic, matrix:Null<flight._js.Matrix>):Void;
	@:native("assignSvgTransform")
	public static function assignSvgTransform(target:Dynamic, transform:flight._js.Transform2D):Void;
	@:native("multiplySvgMatrices")
	public static function multiplySvgMatrices(out:flight._js.Matrix, a:flight._js.Matrix, b:flight._js.Matrix):Void;
	@:native("parseSvgTransform")
	public static function parseSvgTransform(value:Null<String>):Null<flight._js.Matrix>;
	@:native("parseSvgCoordinate")
	public static function parseSvgCoordinate(value:Null<String>, fallback:Float):Float;
	@:native("parseSvgCssNumber")
	public static function parseSvgCssNumber(value:Null<String>, fallback:Float):Float;
	@:native("parseSvgLength")
	public static function parseSvgLength(value:Null<String>, fallback:Float):Float;
	@:native("parseSvgNumberList")
	public static function parseSvgNumberList(value:String):Dynamic;
	@:native("parseUrlReference")
	public static function parseUrlReference(value:Null<String>):Null<String>;
	@:native("svgFirstNumber")
	public static function svgFirstNumber(value:Null<String>, fallback:Float):Float;
	@:native("svgLocalName")
	public static function svgLocalName(name:String):String;
	@:native("svgNumberAttribute")
	public static function svgNumberAttribute(element:flight._js.XmlElement, name:String, fallback:Float):Float;
	@:native("svgOptionalNumberAttribute")
	public static function svgOptionalNumberAttribute(element:flight._js.XmlElement, name:String):Null<Float>;
	@:native("visitSvgElements")
	public static function visitSvgElements(element:flight._js.XmlElement, visitor:Dynamic):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeLottieShapePath(ptr:flight._js.LottieShapePath):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeLottieGradientPaint(ptr:flight._js.LottieGradientPaint):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeLottieRegistry(ptr:flight._js.LottieRegistry):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeLottieLayerHandler(ptr:flight._js.LottieLayerHandler):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeLottieMaskHandler(ptr:flight._js.LottieMaskHandler):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeLottieShapeItemHandler(ptr:flight._js.LottieShapeItemHandler):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeRequirementSet(ptr:flight._js.RequirementSet):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeRiveFieldType(ptr:flight._js.RiveFieldType):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeRiveImportRegistry(ptr:flight._js.RiveImportRegistry):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeRiveSkeleton2Dimport(ptr:flight._js.RiveSkeleton2DImport):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSvgColor(ptr:flight._js.SvgColor):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSvgRegistry(ptr:flight._js.SvgRegistry):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSvgClipHandler(ptr:flight._js.SvgClipHandler):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSvgElementHandler(ptr:flight._js.SvgElementHandler):Void {}
}
