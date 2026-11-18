package flight._cpp._fn;

extern class Shape {
	@:native("flight_compact_stroke_path")
	public static function compactStrokePath(out:flight._cpp.Path, path:flight._cpp.Path, style:flight._cpp.StrokeStyle, tolerance:Float):Void;
	@:native("flight_enable_shape_bounds_guards")
	public static function enableShapeBoundsGuards(state:cpp.Star<cpp.Void>, logState:cpp.Star<cpp.Void>, nowMs:Float):Void;
	@:native("flight_explain_morph_shape_gradient_endpoints")
	public static function explainMorphShapeGradientEndpoints(start:flight._cpp.MorphShapeGradientEndpoint, end:flight._cpp.MorphShapeGradientEndpoint):flight._cpp.MorphShapeGradientEndpointExplanation;
	@:native("flight_explain_shape_tessellation")
	public static function explainShapeTessellation(commands:cpp.Star<cpp.Void>, commandsLen:Int, strokePathTessellationEnabled:Int):flight._cpp.ShapeTessellationExplanation;
	@:native("flight_create_morph_shape")
	public static function createMorphShape(morph:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_create_morph_shape_data")
	public static function createMorphShapeData(morph:cpp.Star<cpp.Void>):flight._cpp.MorphShapeData;
	@:native("flight_append_morph_shape_path")
	public static function appendMorphShapePath(shape:cpp.Star<cpp.Void>, morph:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_set_morph_shape_progress")
	public static function setMorphShapeProgress(shape:cpp.Star<cpp.Void>, progress:Float):Void;
	@:native("flight_create_morph_shape_animation_target")
	public static function createMorphShapeAnimationTarget(shape:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_apply_animation_clip_to_morph_shape")
	public static function applyAnimationClipToMorphShape(clip:flight._cpp.AnimationClip, time:Single):Void;
	@:native("flight_apply_morph_shape_animation_sample")
	public static function applyMorphShapeAnimationSample(sampled:cpp.Star<cpp.Void>, sampledLen:Int, channel:flight._cpp.AnimationChannel):Bool;
	@:native("flight_append_morph_shape_begin_fill")
	public static function appendMorphShapeBeginFill(shape:cpp.Star<cpp.Void>, start:flight._cpp.MorphShapeColorEndpoint, end:flight._cpp.MorphShapeColorEndpoint):Void;
	@:native("flight_append_morph_shape_begin_gradient_fill")
	public static function appendMorphShapeBeginGradientFill(shape:cpp.Star<cpp.Void>, gradientType:Int, start:flight._cpp.MorphShapeGradientEndpoint, end:flight._cpp.MorphShapeGradientEndpoint, spreadMethod:Int, interpolationMethod:Int):Bool;
	@:native("flight_append_morph_shape_begin_texture_fill")
	public static function appendMorphShapeBeginTextureFill(shape:cpp.Star<cpp.Void>, texture:cpp.Star<cpp.Void>, startMatrix:flight._cpp.Matrix, endMatrix:flight._cpp.Matrix):Void;
	@:native("flight_append_morph_shape_line_gradient_style")
	public static function appendMorphShapeLineGradientStyle(shape:cpp.Star<cpp.Void>, gradientType:Int, start:flight._cpp.MorphShapeGradientEndpoint, end:flight._cpp.MorphShapeGradientEndpoint, spreadMethod:Int, interpolationMethod:Int):Bool;
	@:native("flight_append_morph_shape_line_style")
	public static function appendMorphShapeLineStyle(shape:cpp.Star<cpp.Void>, start:flight._cpp.MorphShapeLineEndpoint, end:flight._cpp.MorphShapeLineEndpoint, pixelHinting:Int, scaleMode:Int, caps:Int, joints:Int, miterLimit:Float):Void;
	@:native("flight_append_morph_shape_line_texture_style")
	public static function appendMorphShapeLineTextureStyle(shape:cpp.Star<cpp.Void>, texture:cpp.Star<cpp.Void>, startMatrix:flight._cpp.Matrix, endMatrix:flight._cpp.Matrix):Void;
	@:native("flight_register_default_shape_bounds_commands")
	public static function registerDefaultShapeBoundsCommands(state:cpp.Star<cpp.Void>):Void;
	@:native("flight_create_scale9_shape")
	public static function createScale9Shape(scale9Grid:flight._cpp.ShapeScale9Grid):cpp.Star<cpp.Void>;
	@:native("flight_create_scale9_shape_data")
	public static function createScale9ShapeData(scale9Grid:flight._cpp.ShapeScale9Grid):flight._cpp.Scale9ShapeData;
	@:native("flight_map_scale9_shape_commands")
	public static function mapScale9ShapeCommands(out:cpp.Star<cpp.Void>, source:cpp.Star<cpp.Void>, sourceLen:Int, mapper:flight._cpp.ShapeScale9Mapper):Void;
	@:native("flight_create_shape")
	public static function createShape():cpp.Star<cpp.Void>;
	@:native("flight_create_shape_data")
	public static function createShapeData():flight._cpp.ShapeData;
	@:native("flight_compute_shape_local_bounds_rectangle")
	public static function computeShapeLocalBoundsRectangle(out:flight._cpp.Rectangle, source:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_shape_bounds")
	public static function getShapeBounds(out:flight._cpp.Rectangle, source:cpp.Star<cpp.Void>, mode:Int):Bool;
	@:native("flight_get_shape_command_count")
	public static function getShapeCommandCount(source:cpp.Star<cpp.Void>):Int;
	@:native("flight_is_shape_empty")
	public static function isShapeEmpty(source:cpp.Star<cpp.Void>):Bool;
	@:native("flight_compute_shape_bounds_rectangle")
	public static function computeShapeBoundsRectangle(out:flight._cpp.Rectangle, source:cpp.Star<cpp.Void>, mode:Int):Bool;
	@:native("flight_explain_shape_bounds")
	public static function explainShapeBounds(source:cpp.Star<cpp.Void>, mode:Int):flight._cpp.ShapeBoundsExplanation;
	@:native("flight_normalize_shape_stroke_miter_limit")
	public static function normalizeShapeStrokeMiterLimit(miterLimit:Float):Float;
	@:native("flight_normalize_shape_stroke_width")
	public static function normalizeShapeStrokeWidth(width:Float):Float;
	@:native("flight_get_shape_fill_regions")
	public static function getShapeFillRegions(commands:cpp.Star<cpp.Void>, commandsLen:Int):cpp.Star<cpp.Void>;
	@:native("flight_has_non_solid_shape_fill")
	public static function hasNonSolidShapeFill(commands:cpp.Star<cpp.Void>, commandsLen:Int):Bool;
	@:native("flight_has_shape_fill")
	public static function hasShapeFill(commands:cpp.Star<cpp.Void>, commandsLen:Int):Bool;
	@:native("flight_get_shape_stroke_regions")
	public static function getShapeStrokeRegions(commands:cpp.Star<cpp.Void>, commandsLen:Int):cpp.Star<cpp.Void>;
	@:native("flight_has_non_solid_shape_stroke")
	public static function hasNonSolidShapeStroke(commands:cpp.Star<cpp.Void>, commandsLen:Int):Bool;
	@:native("flight_get_shape_stroke_outline_regions")
	public static function getShapeStrokeOutlineRegions(commands:cpp.Star<cpp.Void>, commandsLen:Int):cpp.Star<cpp.Void>;
	@:native("flight_free_morph_shape_gradient_endpoint_explanation")
	public static function freeMorphShapeGradientEndpointExplanation(ptr:flight._cpp.MorphShapeGradientEndpointExplanation):Void;
	@:native("flight_free_shape_tessellation_explanation")
	public static function freeShapeTessellationExplanation(ptr:flight._cpp.ShapeTessellationExplanation):Void;
	@:native("flight_free_morph_shape_data")
	public static function freeMorphShapeData(ptr:flight._cpp.MorphShapeData):Void;
	@:native("flight_free_scale9_shape_data")
	public static function freeScale9ShapeData(ptr:flight._cpp.Scale9ShapeData):Void;
	@:native("flight_free_shape_data")
	public static function freeShapeData(ptr:flight._cpp.ShapeData):Void;
	@:native("flight_free_shape_bounds_explanation")
	public static function freeShapeBoundsExplanation(ptr:flight._cpp.ShapeBoundsExplanation):Void;
}
