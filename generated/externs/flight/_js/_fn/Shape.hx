package flight._js._fn;

@:jsRequire("@flighthq/shape")
extern class Shape {
	@:native("compactStrokePath")
	public static function compactStrokePath(out:flight._js.Path, path:flight._js.Path, style:flight._js.StrokeStyle, tolerance:Null<Float>):Void;
	@:native("enableShapeBoundsGuards")
	public static function enableShapeBoundsGuards(state:Dynamic, logState:Dynamic, nowMs:Float):Void;
	@:native("explainMorphShapeGradientEndpoints")
	public static function explainMorphShapeGradientEndpoints(start:flight._js.MorphShapeGradientEndpoint, end:flight._js.MorphShapeGradientEndpoint):flight._js.MorphShapeGradientEndpointExplanation;
	@:native("explainShapeTessellation")
	public static function explainShapeTessellation(commands:Dynamic, strokePathTessellationEnabled:Null<Bool>):flight._js.ShapeTessellationExplanation;
	@:native("createMorphShape")
	public static function createMorphShape(morph:Dynamic):Dynamic;
	@:native("createMorphShapeData")
	public static function createMorphShapeData(morph:Dynamic):flight._js.MorphShapeData;
	@:native("appendMorphShapePath")
	public static function appendMorphShapePath(shape:Dynamic, morph:Dynamic):Dynamic;
	@:native("setMorphShapeProgress")
	public static function setMorphShapeProgress(shape:Dynamic, progress:Float):Void;
	@:native("createMorphShapeAnimationTarget")
	public static function createMorphShapeAnimationTarget(shape:Dynamic):Dynamic;
	@:native("applyAnimationClipToMorphShape")
	public static function applyAnimationClipToMorphShape(clip:flight._js.AnimationClip, time:Float):Void;
	@:native("applyMorphShapeAnimationSample")
	public static function applyMorphShapeAnimationSample(sampled:Dynamic, channel:flight._js.AnimationChannel):Bool;
	@:native("appendMorphShapeBeginFill")
	public static function appendMorphShapeBeginFill(shape:Dynamic, start:flight._js.MorphShapeColorEndpoint, end:flight._js.MorphShapeColorEndpoint):Void;
	@:native("appendMorphShapeBeginGradientFill")
	public static function appendMorphShapeBeginGradientFill(shape:Dynamic, gradientType:Dynamic, start:flight._js.MorphShapeGradientEndpoint, end:flight._js.MorphShapeGradientEndpoint, spreadMethod:Null<Dynamic>, interpolationMethod:Null<Dynamic>):Bool;
	@:native("appendMorphShapeBeginTextureFill")
	public static function appendMorphShapeBeginTextureFill(shape:Dynamic, texture:Dynamic, startMatrix:Null<flight._js.Matrix>, endMatrix:Null<flight._js.Matrix>):Void;
	@:native("appendMorphShapeLineGradientStyle")
	public static function appendMorphShapeLineGradientStyle(shape:Dynamic, gradientType:Dynamic, start:flight._js.MorphShapeGradientEndpoint, end:flight._js.MorphShapeGradientEndpoint, spreadMethod:Null<Dynamic>, interpolationMethod:Null<Dynamic>):Bool;
	@:native("appendMorphShapeLineStyle")
	public static function appendMorphShapeLineStyle(shape:Dynamic, start:flight._js.MorphShapeLineEndpoint, end:flight._js.MorphShapeLineEndpoint, pixelHinting:Null<Bool>, scaleMode:Null<Dynamic>, caps:Null<Dynamic>, joints:Null<Dynamic>, miterLimit:Null<Float>):Void;
	@:native("appendMorphShapeLineTextureStyle")
	public static function appendMorphShapeLineTextureStyle(shape:Dynamic, texture:Dynamic, startMatrix:Null<flight._js.Matrix>, endMatrix:Null<flight._js.Matrix>):Void;
	@:native("registerDefaultShapeBoundsCommands")
	public static function registerDefaultShapeBoundsCommands(state:Dynamic):Void;
	@:native("createScale9Shape")
	public static function createScale9Shape(scale9Grid:flight._js.ShapeScale9Grid):Dynamic;
	@:native("createScale9ShapeData")
	public static function createScale9ShapeData(scale9Grid:flight._js.ShapeScale9Grid):flight._js.Scale9ShapeData;
	@:native("mapScale9ShapeCommands")
	public static function mapScale9ShapeCommands(out:Dynamic, source:Dynamic, mapper:flight._js.ShapeScale9Mapper):Void;
	@:native("createShape")
	public static function createShape():Dynamic;
	@:native("createShapeData")
	public static function createShapeData():flight._js.ShapeData;
	@:native("computeShapeLocalBoundsRectangle")
	public static function computeShapeLocalBoundsRectangle(out:flight._js.Rectangle, source:Dynamic):Void;
	@:native("getShapeBounds")
	public static function getShapeBounds(out:flight._js.Rectangle, source:Dynamic, mode:Null<Dynamic>):Bool;
	@:native("getShapeCommandCount")
	public static function getShapeCommandCount(source:Dynamic):Int;
	@:native("isShapeEmpty")
	public static function isShapeEmpty(source:Dynamic):Bool;
	@:native("computeShapeBoundsRectangle")
	public static function computeShapeBoundsRectangle(out:flight._js.Rectangle, source:Dynamic, mode:Null<Dynamic>):Bool;
	@:native("explainShapeBounds")
	public static function explainShapeBounds(source:Dynamic, mode:Null<Dynamic>):flight._js.ShapeBoundsExplanation;
	@:native("normalizeShapeStrokeMiterLimit")
	public static function normalizeShapeStrokeMiterLimit(miterLimit:Float):Float;
	@:native("normalizeShapeStrokeWidth")
	public static function normalizeShapeStrokeWidth(width:Float):Float;
	@:native("getShapeFillRegions")
	public static function getShapeFillRegions(commands:Dynamic):Null<Dynamic>;
	@:native("hasNonSolidShapeFill")
	public static function hasNonSolidShapeFill(commands:Dynamic):Bool;
	@:native("hasShapeFill")
	public static function hasShapeFill(commands:Dynamic):Bool;
	@:native("getShapeStrokeRegions")
	public static function getShapeStrokeRegions(commands:Dynamic):Null<Dynamic>;
	@:native("hasNonSolidShapeStroke")
	public static function hasNonSolidShapeStroke(commands:Dynamic):Bool;
	@:native("getShapeStrokeOutlineRegions")
	public static function getShapeStrokeOutlineRegions(commands:Dynamic):Null<Dynamic>;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMorphShapeGradientEndpointExplanation(ptr:flight._js.MorphShapeGradientEndpointExplanation):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeShapeTessellationExplanation(ptr:flight._js.ShapeTessellationExplanation):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMorphShapeData(ptr:flight._js.MorphShapeData):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeScale9ShapeData(ptr:flight._js.Scale9ShapeData):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeShapeData(ptr:flight._js.ShapeData):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeShapeBoundsExplanation(ptr:flight._js.ShapeBoundsExplanation):Void {}
}
