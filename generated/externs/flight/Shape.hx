package flight;

#if (js && flight_esm)
extern inline function compactStrokePath(out:Path, path:Path, style:StrokeStyle, tolerance:Null<Float>):Void {
	flight._js._fn.Shape.compactStrokePath(out, path, style, tolerance);
}
#else
extern inline function compactStrokePath(out:Path, path:Path, style:StrokeStyle, tolerance:Float):Void {
#if hl
	flight._hl._fn.Shape.compactStrokePath(out, path, style, tolerance);
#elseif cpp
	flight._cpp._fn.Shape.compactStrokePath(out, path, style, tolerance);
#elseif (js && flight_esm)
	flight._js._fn.Shape.compactStrokePath(out, path, style, tolerance);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableShapeBoundsGuards(state:Dynamic, logState:Dynamic, nowMs:Float):Void {
	flight._js._fn.Shape.enableShapeBoundsGuards(state, logState, nowMs);
}
#else
extern inline function enableShapeBoundsGuards(state:Dynamic, logState:Dynamic, nowMs:Float):Void {
#if hl
	flight._hl._fn.Shape.enableShapeBoundsGuards(state, logState, nowMs);
#elseif cpp
	flight._cpp._fn.Shape.enableShapeBoundsGuards(state, logState, nowMs);
#elseif (js && flight_esm)
	flight._js._fn.Shape.enableShapeBoundsGuards(state, logState, nowMs);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainMorphShapeGradientEndpoints(start:MorphShapeGradientEndpoint, end:MorphShapeGradientEndpoint):MorphShapeGradientEndpointExplanation {
	return flight._js._fn.Shape.explainMorphShapeGradientEndpoints(start, end);
}
#else
extern inline function explainMorphShapeGradientEndpoints(start:MorphShapeGradientEndpoint, end:MorphShapeGradientEndpoint):MorphShapeGradientEndpointExplanation {
#if hl
	return flight._hl._fn.Shape.explainMorphShapeGradientEndpoints(start, end);
#elseif cpp
	return flight._cpp._fn.Shape.explainMorphShapeGradientEndpoints(start, end);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.explainMorphShapeGradientEndpoints(start, end);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainShapeTessellation(commands:Dynamic, strokePathTessellationEnabled:Null<Bool>):ShapeTessellationExplanation {
	return flight._js._fn.Shape.explainShapeTessellation(commands, strokePathTessellationEnabled);
}
#else
extern inline function explainShapeTessellation(commands:Dynamic, commandsLen:Int, strokePathTessellationEnabled:Int):ShapeTessellationExplanation {
#if hl
	return flight._hl._fn.Shape.explainShapeTessellation(commands, commandsLen, strokePathTessellationEnabled);
#elseif cpp
	return flight._cpp._fn.Shape.explainShapeTessellation(commands, commandsLen, strokePathTessellationEnabled);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.explainShapeTessellation(commands, commandsLen, strokePathTessellationEnabled);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createMorphShape(morph:Dynamic):Dynamic {
	return flight._js._fn.Shape.createMorphShape(morph);
}
#else
extern inline function createMorphShape(morph:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Shape.createMorphShape(morph);
#elseif cpp
	return flight._cpp._fn.Shape.createMorphShape(morph);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.createMorphShape(morph);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createMorphShapeData(morph:Dynamic):MorphShapeData {
	return flight._js._fn.Shape.createMorphShapeData(morph);
}
#else
extern inline function createMorphShapeData(morph:Dynamic):MorphShapeData {
#if hl
	return flight._hl._fn.Shape.createMorphShapeData(morph);
#elseif cpp
	return flight._cpp._fn.Shape.createMorphShapeData(morph);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.createMorphShapeData(morph);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendMorphShapePath(shape:Dynamic, morph:Dynamic):Dynamic {
	return flight._js._fn.Shape.appendMorphShapePath(shape, morph);
}
#else
extern inline function appendMorphShapePath(shape:Dynamic, morph:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Shape.appendMorphShapePath(shape, morph);
#elseif cpp
	return flight._cpp._fn.Shape.appendMorphShapePath(shape, morph);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.appendMorphShapePath(shape, morph);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setMorphShapeProgress(shape:Dynamic, progress:Float):Void {
	flight._js._fn.Shape.setMorphShapeProgress(shape, progress);
}
#else
extern inline function setMorphShapeProgress(shape:Dynamic, progress:Float):Void {
#if hl
	flight._hl._fn.Shape.setMorphShapeProgress(shape, progress);
#elseif cpp
	flight._cpp._fn.Shape.setMorphShapeProgress(shape, progress);
#elseif (js && flight_esm)
	flight._js._fn.Shape.setMorphShapeProgress(shape, progress);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createMorphShapeAnimationTarget(shape:Dynamic):Dynamic {
	return flight._js._fn.Shape.createMorphShapeAnimationTarget(shape);
}
#else
extern inline function createMorphShapeAnimationTarget(shape:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Shape.createMorphShapeAnimationTarget(shape);
#elseif cpp
	return flight._cpp._fn.Shape.createMorphShapeAnimationTarget(shape);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.createMorphShapeAnimationTarget(shape);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyAnimationClipToMorphShape(clip:AnimationClip, time:Float):Void {
	flight._js._fn.Shape.applyAnimationClipToMorphShape(clip, time);
}
#else
extern inline function applyAnimationClipToMorphShape(clip:AnimationClip, time:Float):Void {
#if hl
	flight._hl._fn.Shape.applyAnimationClipToMorphShape(clip, time);
#elseif cpp
	flight._cpp._fn.Shape.applyAnimationClipToMorphShape(clip, time);
#elseif (js && flight_esm)
	flight._js._fn.Shape.applyAnimationClipToMorphShape(clip, time);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyMorphShapeAnimationSample(sampled:Dynamic, channel:AnimationChannel):Bool {
	return flight._js._fn.Shape.applyMorphShapeAnimationSample(sampled, channel);
}
#else
extern inline function applyMorphShapeAnimationSample(sampled:Dynamic, sampledLen:Int, channel:AnimationChannel):Bool {
#if hl
	return flight._hl._fn.Shape.applyMorphShapeAnimationSample(sampled, sampledLen, channel);
#elseif cpp
	return flight._cpp._fn.Shape.applyMorphShapeAnimationSample(sampled, sampledLen, channel);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.applyMorphShapeAnimationSample(sampled, sampledLen, channel);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendMorphShapeBeginFill(shape:Dynamic, start:MorphShapeColorEndpoint, end:MorphShapeColorEndpoint):Void {
	flight._js._fn.Shape.appendMorphShapeBeginFill(shape, start, end);
}
#else
extern inline function appendMorphShapeBeginFill(shape:Dynamic, start:MorphShapeColorEndpoint, end:MorphShapeColorEndpoint):Void {
#if hl
	flight._hl._fn.Shape.appendMorphShapeBeginFill(shape, start, end);
#elseif cpp
	flight._cpp._fn.Shape.appendMorphShapeBeginFill(shape, start, end);
#elseif (js && flight_esm)
	flight._js._fn.Shape.appendMorphShapeBeginFill(shape, start, end);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendMorphShapeBeginGradientFill(shape:Dynamic, gradientType:Dynamic, start:MorphShapeGradientEndpoint, end:MorphShapeGradientEndpoint, spreadMethod:Null<Dynamic>, interpolationMethod:Null<Dynamic>):Bool {
	return flight._js._fn.Shape.appendMorphShapeBeginGradientFill(shape, gradientType, start, end, spreadMethod, interpolationMethod);
}
#else
extern inline function appendMorphShapeBeginGradientFill(shape:Dynamic, gradientType:flight.GradientType, start:MorphShapeGradientEndpoint, end:MorphShapeGradientEndpoint, spreadMethod:Int, interpolationMethod:Int):Bool {
#if hl
	return flight._hl._fn.Shape.appendMorphShapeBeginGradientFill(shape, gradientType, start, end, spreadMethod, interpolationMethod);
#elseif cpp
	return flight._cpp._fn.Shape.appendMorphShapeBeginGradientFill(shape, gradientType, start, end, spreadMethod, interpolationMethod);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.appendMorphShapeBeginGradientFill(shape, gradientType, start, end, spreadMethod, interpolationMethod);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendMorphShapeBeginTextureFill(shape:Dynamic, texture:Dynamic, startMatrix:Null<Matrix>, endMatrix:Null<Matrix>):Void {
	flight._js._fn.Shape.appendMorphShapeBeginTextureFill(shape, texture, startMatrix, endMatrix);
}
#else
extern inline function appendMorphShapeBeginTextureFill(shape:Dynamic, texture:Dynamic, startMatrix:Matrix, endMatrix:Matrix):Void {
#if hl
	flight._hl._fn.Shape.appendMorphShapeBeginTextureFill(shape, texture, startMatrix, endMatrix);
#elseif cpp
	flight._cpp._fn.Shape.appendMorphShapeBeginTextureFill(shape, texture, startMatrix, endMatrix);
#elseif (js && flight_esm)
	flight._js._fn.Shape.appendMorphShapeBeginTextureFill(shape, texture, startMatrix, endMatrix);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendMorphShapeLineGradientStyle(shape:Dynamic, gradientType:Dynamic, start:MorphShapeGradientEndpoint, end:MorphShapeGradientEndpoint, spreadMethod:Null<Dynamic>, interpolationMethod:Null<Dynamic>):Bool {
	return flight._js._fn.Shape.appendMorphShapeLineGradientStyle(shape, gradientType, start, end, spreadMethod, interpolationMethod);
}
#else
extern inline function appendMorphShapeLineGradientStyle(shape:Dynamic, gradientType:flight.GradientType, start:MorphShapeGradientEndpoint, end:MorphShapeGradientEndpoint, spreadMethod:Int, interpolationMethod:Int):Bool {
#if hl
	return flight._hl._fn.Shape.appendMorphShapeLineGradientStyle(shape, gradientType, start, end, spreadMethod, interpolationMethod);
#elseif cpp
	return flight._cpp._fn.Shape.appendMorphShapeLineGradientStyle(shape, gradientType, start, end, spreadMethod, interpolationMethod);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.appendMorphShapeLineGradientStyle(shape, gradientType, start, end, spreadMethod, interpolationMethod);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendMorphShapeLineStyle(shape:Dynamic, start:MorphShapeLineEndpoint, end:MorphShapeLineEndpoint, pixelHinting:Null<Bool>, scaleMode:Null<Dynamic>, caps:Null<Dynamic>, joints:Null<Dynamic>, miterLimit:Null<Float>):Void {
	flight._js._fn.Shape.appendMorphShapeLineStyle(shape, start, end, pixelHinting, scaleMode, caps, joints, miterLimit);
}
#else
extern inline function appendMorphShapeLineStyle(shape:Dynamic, start:MorphShapeLineEndpoint, end:MorphShapeLineEndpoint, pixelHinting:Int, scaleMode:Int, caps:Int, joints:Int, miterLimit:Float):Void {
#if hl
	flight._hl._fn.Shape.appendMorphShapeLineStyle(shape, start, end, pixelHinting, scaleMode, caps, joints, miterLimit);
#elseif cpp
	flight._cpp._fn.Shape.appendMorphShapeLineStyle(shape, start, end, pixelHinting, scaleMode, caps, joints, miterLimit);
#elseif (js && flight_esm)
	flight._js._fn.Shape.appendMorphShapeLineStyle(shape, start, end, pixelHinting, scaleMode, caps, joints, miterLimit);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendMorphShapeLineTextureStyle(shape:Dynamic, texture:Dynamic, startMatrix:Null<Matrix>, endMatrix:Null<Matrix>):Void {
	flight._js._fn.Shape.appendMorphShapeLineTextureStyle(shape, texture, startMatrix, endMatrix);
}
#else
extern inline function appendMorphShapeLineTextureStyle(shape:Dynamic, texture:Dynamic, startMatrix:Matrix, endMatrix:Matrix):Void {
#if hl
	flight._hl._fn.Shape.appendMorphShapeLineTextureStyle(shape, texture, startMatrix, endMatrix);
#elseif cpp
	flight._cpp._fn.Shape.appendMorphShapeLineTextureStyle(shape, texture, startMatrix, endMatrix);
#elseif (js && flight_esm)
	flight._js._fn.Shape.appendMorphShapeLineTextureStyle(shape, texture, startMatrix, endMatrix);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerDefaultShapeBoundsCommands(state:Dynamic):Void {
	flight._js._fn.Shape.registerDefaultShapeBoundsCommands(state);
}
#else
extern inline function registerDefaultShapeBoundsCommands(state:Dynamic):Void {
#if hl
	flight._hl._fn.Shape.registerDefaultShapeBoundsCommands(state);
#elseif cpp
	flight._cpp._fn.Shape.registerDefaultShapeBoundsCommands(state);
#elseif (js && flight_esm)
	flight._js._fn.Shape.registerDefaultShapeBoundsCommands(state);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createScale9Shape(scale9Grid:ShapeScale9Grid):Dynamic {
	return flight._js._fn.Shape.createScale9Shape(scale9Grid);
}
#else
extern inline function createScale9Shape(scale9Grid:ShapeScale9Grid):Dynamic {
#if hl
	return flight._hl._fn.Shape.createScale9Shape(scale9Grid);
#elseif cpp
	return flight._cpp._fn.Shape.createScale9Shape(scale9Grid);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.createScale9Shape(scale9Grid);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createScale9ShapeData(scale9Grid:ShapeScale9Grid):Scale9ShapeData {
	return flight._js._fn.Shape.createScale9ShapeData(scale9Grid);
}
#else
extern inline function createScale9ShapeData(scale9Grid:ShapeScale9Grid):Scale9ShapeData {
#if hl
	return flight._hl._fn.Shape.createScale9ShapeData(scale9Grid);
#elseif cpp
	return flight._cpp._fn.Shape.createScale9ShapeData(scale9Grid);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.createScale9ShapeData(scale9Grid);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function mapScale9ShapeCommands(out:Dynamic, source:Dynamic, mapper:ShapeScale9Mapper):Void {
	flight._js._fn.Shape.mapScale9ShapeCommands(out, source, mapper);
}
#else
extern inline function mapScale9ShapeCommands(out:Dynamic, source:Dynamic, sourceLen:Int, mapper:ShapeScale9Mapper):Void {
#if hl
	flight._hl._fn.Shape.mapScale9ShapeCommands(out, source, sourceLen, mapper);
#elseif cpp
	flight._cpp._fn.Shape.mapScale9ShapeCommands(out, source, sourceLen, mapper);
#elseif (js && flight_esm)
	flight._js._fn.Shape.mapScale9ShapeCommands(out, source, sourceLen, mapper);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createShape():Dynamic {
	return flight._js._fn.Shape.createShape();
}
#else
extern inline function createShape():Dynamic {
#if hl
	return flight._hl._fn.Shape.createShape();
#elseif cpp
	return flight._cpp._fn.Shape.createShape();
#elseif (js && flight_esm)
	return flight._js._fn.Shape.createShape();
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createShapeData():ShapeData {
	return flight._js._fn.Shape.createShapeData();
}
#else
extern inline function createShapeData():ShapeData {
#if hl
	return flight._hl._fn.Shape.createShapeData();
#elseif cpp
	return flight._cpp._fn.Shape.createShapeData();
#elseif (js && flight_esm)
	return flight._js._fn.Shape.createShapeData();
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeShapeLocalBoundsRectangle(out:Rectangle, source:Dynamic):Void {
	flight._js._fn.Shape.computeShapeLocalBoundsRectangle(out, source);
}
#else
extern inline function computeShapeLocalBoundsRectangle(out:Rectangle, source:Dynamic):Void {
#if hl
	flight._hl._fn.Shape.computeShapeLocalBoundsRectangle(out, source);
#elseif cpp
	flight._cpp._fn.Shape.computeShapeLocalBoundsRectangle(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Shape.computeShapeLocalBoundsRectangle(out, source);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getShapeBounds(out:Rectangle, source:Dynamic, mode:Null<Dynamic>):Bool {
	return flight._js._fn.Shape.getShapeBounds(out, source, mode);
}
#else
extern inline function getShapeBounds(out:Rectangle, source:Dynamic, mode:Int):Bool {
#if hl
	return flight._hl._fn.Shape.getShapeBounds(out, source, mode);
#elseif cpp
	return flight._cpp._fn.Shape.getShapeBounds(out, source, mode);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.getShapeBounds(out, source, mode);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getShapeCommandCount(source:Dynamic):Int {
	return flight._js._fn.Shape.getShapeCommandCount(source);
}
#else
extern inline function getShapeCommandCount(source:Dynamic):Int {
#if hl
	return flight._hl._fn.Shape.getShapeCommandCount(source);
#elseif cpp
	return flight._cpp._fn.Shape.getShapeCommandCount(source);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.getShapeCommandCount(source);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isShapeEmpty(source:Dynamic):Bool {
	return flight._js._fn.Shape.isShapeEmpty(source);
}
#else
extern inline function isShapeEmpty(source:Dynamic):Bool {
#if hl
	return flight._hl._fn.Shape.isShapeEmpty(source);
#elseif cpp
	return flight._cpp._fn.Shape.isShapeEmpty(source);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.isShapeEmpty(source);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeShapeBoundsRectangle(out:Rectangle, source:Dynamic, mode:Null<Dynamic>):Bool {
	return flight._js._fn.Shape.computeShapeBoundsRectangle(out, source, mode);
}
#else
extern inline function computeShapeBoundsRectangle(out:Rectangle, source:Dynamic, mode:Int):Bool {
#if hl
	return flight._hl._fn.Shape.computeShapeBoundsRectangle(out, source, mode);
#elseif cpp
	return flight._cpp._fn.Shape.computeShapeBoundsRectangle(out, source, mode);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.computeShapeBoundsRectangle(out, source, mode);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainShapeBounds(source:Dynamic, mode:Null<Dynamic>):ShapeBoundsExplanation {
	return flight._js._fn.Shape.explainShapeBounds(source, mode);
}
#else
extern inline function explainShapeBounds(source:Dynamic, mode:Int):ShapeBoundsExplanation {
#if hl
	return flight._hl._fn.Shape.explainShapeBounds(source, mode);
#elseif cpp
	return flight._cpp._fn.Shape.explainShapeBounds(source, mode);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.explainShapeBounds(source, mode);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function normalizeShapeStrokeMiterLimit(miterLimit:Float):Float {
	return flight._js._fn.Shape.normalizeShapeStrokeMiterLimit(miterLimit);
}
#else
extern inline function normalizeShapeStrokeMiterLimit(miterLimit:Float):Float {
#if hl
	return flight._hl._fn.Shape.normalizeShapeStrokeMiterLimit(miterLimit);
#elseif cpp
	return flight._cpp._fn.Shape.normalizeShapeStrokeMiterLimit(miterLimit);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.normalizeShapeStrokeMiterLimit(miterLimit);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function normalizeShapeStrokeWidth(width:Float):Float {
	return flight._js._fn.Shape.normalizeShapeStrokeWidth(width);
}
#else
extern inline function normalizeShapeStrokeWidth(width:Float):Float {
#if hl
	return flight._hl._fn.Shape.normalizeShapeStrokeWidth(width);
#elseif cpp
	return flight._cpp._fn.Shape.normalizeShapeStrokeWidth(width);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.normalizeShapeStrokeWidth(width);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getShapeFillRegions(commands:Dynamic):Null<Dynamic> {
	return flight._js._fn.Shape.getShapeFillRegions(commands);
}
#else
extern inline function getShapeFillRegions(commands:Dynamic, commandsLen:Int):Dynamic {
#if hl
	return flight._hl._fn.Shape.getShapeFillRegions(commands, commandsLen);
#elseif cpp
	return flight._cpp._fn.Shape.getShapeFillRegions(commands, commandsLen);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.getShapeFillRegions(commands, commandsLen);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasNonSolidShapeFill(commands:Dynamic):Bool {
	return flight._js._fn.Shape.hasNonSolidShapeFill(commands);
}
#else
extern inline function hasNonSolidShapeFill(commands:Dynamic, commandsLen:Int):Bool {
#if hl
	return flight._hl._fn.Shape.hasNonSolidShapeFill(commands, commandsLen);
#elseif cpp
	return flight._cpp._fn.Shape.hasNonSolidShapeFill(commands, commandsLen);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.hasNonSolidShapeFill(commands, commandsLen);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasShapeFill(commands:Dynamic):Bool {
	return flight._js._fn.Shape.hasShapeFill(commands);
}
#else
extern inline function hasShapeFill(commands:Dynamic, commandsLen:Int):Bool {
#if hl
	return flight._hl._fn.Shape.hasShapeFill(commands, commandsLen);
#elseif cpp
	return flight._cpp._fn.Shape.hasShapeFill(commands, commandsLen);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.hasShapeFill(commands, commandsLen);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getShapeStrokeRegions(commands:Dynamic):Null<Dynamic> {
	return flight._js._fn.Shape.getShapeStrokeRegions(commands);
}
#else
extern inline function getShapeStrokeRegions(commands:Dynamic, commandsLen:Int):Dynamic {
#if hl
	return flight._hl._fn.Shape.getShapeStrokeRegions(commands, commandsLen);
#elseif cpp
	return flight._cpp._fn.Shape.getShapeStrokeRegions(commands, commandsLen);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.getShapeStrokeRegions(commands, commandsLen);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasNonSolidShapeStroke(commands:Dynamic):Bool {
	return flight._js._fn.Shape.hasNonSolidShapeStroke(commands);
}
#else
extern inline function hasNonSolidShapeStroke(commands:Dynamic, commandsLen:Int):Bool {
#if hl
	return flight._hl._fn.Shape.hasNonSolidShapeStroke(commands, commandsLen);
#elseif cpp
	return flight._cpp._fn.Shape.hasNonSolidShapeStroke(commands, commandsLen);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.hasNonSolidShapeStroke(commands, commandsLen);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getShapeStrokeOutlineRegions(commands:Dynamic):Null<Dynamic> {
	return flight._js._fn.Shape.getShapeStrokeOutlineRegions(commands);
}
#else
extern inline function getShapeStrokeOutlineRegions(commands:Dynamic, commandsLen:Int):Dynamic {
#if hl
	return flight._hl._fn.Shape.getShapeStrokeOutlineRegions(commands, commandsLen);
#elseif cpp
	return flight._cpp._fn.Shape.getShapeStrokeOutlineRegions(commands, commandsLen);
#elseif (js && flight_esm)
	return flight._js._fn.Shape.getShapeStrokeOutlineRegions(commands, commandsLen);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMorphShapeGradientEndpointExplanation(ptr:MorphShapeGradientEndpointExplanation):Void {
	flight._js._fn.Shape.freeMorphShapeGradientEndpointExplanation(ptr);
}
#else
extern inline function freeMorphShapeGradientEndpointExplanation(ptr:MorphShapeGradientEndpointExplanation):Void {
#if hl
	flight._hl._fn.Shape.freeMorphShapeGradientEndpointExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Shape.freeMorphShapeGradientEndpointExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Shape.freeMorphShapeGradientEndpointExplanation(ptr);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeShapeTessellationExplanation(ptr:ShapeTessellationExplanation):Void {
	flight._js._fn.Shape.freeShapeTessellationExplanation(ptr);
}
#else
extern inline function freeShapeTessellationExplanation(ptr:ShapeTessellationExplanation):Void {
#if hl
	flight._hl._fn.Shape.freeShapeTessellationExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Shape.freeShapeTessellationExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Shape.freeShapeTessellationExplanation(ptr);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMorphShapeData(ptr:MorphShapeData):Void {
	flight._js._fn.Shape.freeMorphShapeData(ptr);
}
#else
extern inline function freeMorphShapeData(ptr:MorphShapeData):Void {
#if hl
	flight._hl._fn.Shape.freeMorphShapeData(ptr);
#elseif cpp
	flight._cpp._fn.Shape.freeMorphShapeData(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Shape.freeMorphShapeData(ptr);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeScale9ShapeData(ptr:Scale9ShapeData):Void {
	flight._js._fn.Shape.freeScale9ShapeData(ptr);
}
#else
extern inline function freeScale9ShapeData(ptr:Scale9ShapeData):Void {
#if hl
	flight._hl._fn.Shape.freeScale9ShapeData(ptr);
#elseif cpp
	flight._cpp._fn.Shape.freeScale9ShapeData(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Shape.freeScale9ShapeData(ptr);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeShapeData(ptr:ShapeData):Void {
	flight._js._fn.Shape.freeShapeData(ptr);
}
#else
extern inline function freeShapeData(ptr:ShapeData):Void {
#if hl
	flight._hl._fn.Shape.freeShapeData(ptr);
#elseif cpp
	flight._cpp._fn.Shape.freeShapeData(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Shape.freeShapeData(ptr);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeShapeBoundsExplanation(ptr:ShapeBoundsExplanation):Void {
	flight._js._fn.Shape.freeShapeBoundsExplanation(ptr);
}
#else
extern inline function freeShapeBoundsExplanation(ptr:ShapeBoundsExplanation):Void {
#if hl
	flight._hl._fn.Shape.freeShapeBoundsExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Shape.freeShapeBoundsExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Shape.freeShapeBoundsExplanation(ptr);
#else
	#error "flight.Shape: no backend for this target."
#end
}
#end
