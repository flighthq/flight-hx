package flight._js._fn;

@:jsRequire("flight")
extern class Shape {
	@:native("flight_compact_stroke_path")
	public static function compactStrokePath(out:flight._js.Path, path:flight._js.Path, style:flight._js.StrokeStyle, tolerance:Float):Void;
	@:native("flight_enable_shape_bounds_guards")
	public static function enableShapeBoundsGuards(state:Dynamic, logState:Dynamic, nowMs:Float):Void;
	@:native("flight_explain_morph_shape_gradient_endpoints")
	public static function explainMorphShapeGradientEndpoints(start:flight._js.MorphShapeGradientEndpoint, end:flight._js.MorphShapeGradientEndpoint):flight._js.MorphShapeGradientEndpointExplanation;
	@:native("flight_explain_shape_tessellation")
	public static function explainShapeTessellation(commands:Dynamic, commandsLen:Int, strokePathTessellationEnabled:Int):flight._js.ShapeTessellationExplanation;
	@:native("flight_create_morph_shape")
	public static function createMorphShape(morph:Dynamic):Dynamic;
	@:native("flight_create_morph_shape_data")
	public static function createMorphShapeData(morph:Dynamic):flight._js.MorphShapeData;
	@:native("flight_append_morph_shape_path")
	public static function appendMorphShapePath(shape:Dynamic, morph:Dynamic):Dynamic;
	@:native("flight_set_morph_shape_progress")
	public static function setMorphShapeProgress(shape:Dynamic, progress:Float):Void;
	@:native("flight_create_morph_shape_animation_target")
	public static function createMorphShapeAnimationTarget(shape:Dynamic):Dynamic;
	@:native("flight_apply_animation_clip_to_morph_shape")
	public static function applyAnimationClipToMorphShape(clip:flight._js.AnimationClip, time:Float):Void;
	@:native("flight_apply_morph_shape_animation_sample")
	public static function applyMorphShapeAnimationSample(sampled:Dynamic, sampledLen:Int, channel:flight._js.AnimationChannel):Bool;
	@:native("flight_append_morph_shape_begin_fill")
	public static function appendMorphShapeBeginFill(shape:Dynamic, start:flight._js.MorphShapeColorEndpoint, end:flight._js.MorphShapeColorEndpoint):Void;
	@:native("flight_append_morph_shape_begin_texture_fill")
	public static function appendMorphShapeBeginTextureFill(shape:Dynamic, texture:Dynamic, startMatrix:flight._js.Matrix, endMatrix:flight._js.Matrix):Void;
	@:native("flight_append_morph_shape_line_style")
	public static function appendMorphShapeLineStyle(shape:Dynamic, start:flight._js.MorphShapeLineEndpoint, end:flight._js.MorphShapeLineEndpoint, pixelHinting:Int, scaleMode:Int, caps:Int, joints:Int, miterLimit:Float):Void;
	@:native("flight_append_morph_shape_line_texture_style")
	public static function appendMorphShapeLineTextureStyle(shape:Dynamic, texture:Dynamic, startMatrix:flight._js.Matrix, endMatrix:flight._js.Matrix):Void;
	@:native("flight_register_default_shape_bounds_commands")
	public static function registerDefaultShapeBoundsCommands(state:Dynamic):Void;
	@:native("flight_create_scale9_shape")
	public static function createScale9Shape(scale9Grid:flight._js.ShapeScale9Grid):Dynamic;
	@:native("flight_create_scale9_shape_data")
	public static function createScale9ShapeData(scale9Grid:flight._js.ShapeScale9Grid):flight._js.Scale9ShapeData;
	@:native("flight_map_scale9_shape_commands")
	public static function mapScale9ShapeCommands(out:Dynamic, source:Dynamic, sourceLen:Int, mapper:flight._js.ShapeScale9Mapper):Void;
	@:native("flight_create_shape")
	public static function createShape():Dynamic;
	@:native("flight_create_shape_data")
	public static function createShapeData():flight._js.ShapeData;
	@:native("flight_compute_shape_local_bounds_rectangle")
	public static function computeShapeLocalBoundsRectangle(out:flight._js.Rectangle, source:Dynamic):Void;
	@:native("flight_get_shape_bounds")
	public static function getShapeBounds(out:flight._js.Rectangle, source:Dynamic, mode:Int):Bool;
	@:native("flight_get_shape_command_count")
	public static function getShapeCommandCount(source:Dynamic):Int;
	@:native("flight_is_shape_empty")
	public static function isShapeEmpty(source:Dynamic):Bool;
	@:native("flight_compute_shape_bounds_rectangle")
	public static function computeShapeBoundsRectangle(out:flight._js.Rectangle, source:Dynamic, mode:Int):Bool;
	@:native("flight_explain_shape_bounds")
	public static function explainShapeBounds(source:Dynamic, mode:Int):flight._js.ShapeBoundsExplanation;
	@:native("flight_normalize_shape_stroke_miter_limit")
	public static function normalizeShapeStrokeMiterLimit(miterLimit:Float):Float;
	@:native("flight_normalize_shape_stroke_width")
	public static function normalizeShapeStrokeWidth(width:Float):Float;
	@:native("flight_get_shape_fill_regions")
	public static function getShapeFillRegions(commands:Dynamic, commandsLen:Int):Dynamic;
	@:native("flight_has_non_solid_shape_fill")
	public static function hasNonSolidShapeFill(commands:Dynamic, commandsLen:Int):Bool;
	@:native("flight_has_shape_fill")
	public static function hasShapeFill(commands:Dynamic, commandsLen:Int):Bool;
	@:native("flight_get_shape_stroke_regions")
	public static function getShapeStrokeRegions(commands:Dynamic, commandsLen:Int):Dynamic;
	@:native("flight_has_non_solid_shape_stroke")
	public static function hasNonSolidShapeStroke(commands:Dynamic, commandsLen:Int):Bool;
	@:native("flight_get_shape_stroke_outline_regions")
	public static function getShapeStrokeOutlineRegions(commands:Dynamic, commandsLen:Int):Dynamic;
	@:native("flight_free_morph_shape_gradient_endpoint_explanation")
	public static function freeMorphShapeGradientEndpointExplanation(ptr:flight._js.MorphShapeGradientEndpointExplanation):Void;
	@:native("flight_free_shape_tessellation_explanation")
	public static function freeShapeTessellationExplanation(ptr:flight._js.ShapeTessellationExplanation):Void;
	@:native("flight_free_morph_shape_data")
	public static function freeMorphShapeData(ptr:flight._js.MorphShapeData):Void;
	@:native("flight_free_scale9_shape_data")
	public static function freeScale9ShapeData(ptr:flight._js.Scale9ShapeData):Void;
	@:native("flight_free_shape_data")
	public static function freeShapeData(ptr:flight._js.ShapeData):Void;
	@:native("flight_free_shape_bounds_explanation")
	public static function freeShapeBoundsExplanation(ptr:flight._js.ShapeBoundsExplanation):Void;
}
