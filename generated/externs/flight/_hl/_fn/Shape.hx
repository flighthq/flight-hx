package flight._hl._fn;

extern class Shape {
	@:hlNative("flight", "flight_compact_stroke_path")
	public static function compactStrokePath(out:flight._hl.Path, path:flight._hl.Path, style:flight._hl.StrokeStyle, tolerance:Float):Void;
	@:hlNative("flight", "flight_enable_shape_bounds_guards")
	public static function enableShapeBoundsGuards(state:hl.Bytes, logState:hl.Bytes, nowMs:Float):Void;
	@:hlNative("flight", "flight_explain_morph_shape_gradient_endpoints")
	public static function explainMorphShapeGradientEndpoints(start:flight._hl.MorphShapeGradientEndpoint, end:flight._hl.MorphShapeGradientEndpoint):flight._hl.MorphShapeGradientEndpointExplanation;
	@:hlNative("flight", "flight_explain_shape_tessellation")
	public static function explainShapeTessellation(commands:hl.Bytes, commandsLen:Int, strokePathTessellationEnabled:Int):flight._hl.ShapeTessellationExplanation;
	@:hlNative("flight", "flight_create_morph_shape")
	public static function createMorphShape(morph:hl.Bytes):flight._hl.FlightNode;
	@:hlNative("flight", "flight_create_morph_shape_data")
	public static function createMorphShapeData(morph:hl.Bytes):flight._hl.MorphShapeData;
	@:hlNative("flight", "flight_append_morph_shape_path")
	public static function appendMorphShapePath(shape:flight._hl.FlightNode, morph:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_set_morph_shape_progress")
	public static function setMorphShapeProgress(shape:flight._hl.FlightNode, progress:Float):Void;
	@:hlNative("flight", "flight_create_morph_shape_animation_target")
	public static function createMorphShapeAnimationTarget(shape:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_apply_animation_clip_to_morph_shape")
	public static function applyAnimationClipToMorphShape(clip:flight._hl.AnimationClip, time:Float):Void;
	@:hlNative("flight", "flight_apply_morph_shape_animation_sample")
	public static function applyMorphShapeAnimationSample(sampled:hl.Bytes, sampledLen:Int, channel:flight._hl.AnimationChannel):Bool;
	@:hlNative("flight", "flight_append_morph_shape_begin_fill")
	public static function appendMorphShapeBeginFill(shape:flight._hl.FlightNode, start:flight._hl.MorphShapeColorEndpoint, end:flight._hl.MorphShapeColorEndpoint):Void;
	@:hlNative("flight", "flight_append_morph_shape_begin_gradient_fill")
	public static function appendMorphShapeBeginGradientFill(shape:flight._hl.FlightNode, gradientType:Int, start:flight._hl.MorphShapeGradientEndpoint, end:flight._hl.MorphShapeGradientEndpoint, spreadMethod:Int, interpolationMethod:Int):Bool;
	@:hlNative("flight", "flight_append_morph_shape_begin_texture_fill")
	public static function appendMorphShapeBeginTextureFill(shape:flight._hl.FlightNode, texture:hl.Bytes, startMatrix:flight._hl.Matrix, endMatrix:flight._hl.Matrix):Void;
	@:hlNative("flight", "flight_append_morph_shape_line_gradient_style")
	public static function appendMorphShapeLineGradientStyle(shape:flight._hl.FlightNode, gradientType:Int, start:flight._hl.MorphShapeGradientEndpoint, end:flight._hl.MorphShapeGradientEndpoint, spreadMethod:Int, interpolationMethod:Int):Bool;
	@:hlNative("flight", "flight_append_morph_shape_line_style")
	public static function appendMorphShapeLineStyle(shape:flight._hl.FlightNode, start:flight._hl.MorphShapeLineEndpoint, end:flight._hl.MorphShapeLineEndpoint, pixelHinting:Int, scaleMode:Int, caps:Int, joints:Int, miterLimit:Float):Void;
	@:hlNative("flight", "flight_append_morph_shape_line_texture_style")
	public static function appendMorphShapeLineTextureStyle(shape:flight._hl.FlightNode, texture:hl.Bytes, startMatrix:flight._hl.Matrix, endMatrix:flight._hl.Matrix):Void;
	@:hlNative("flight", "flight_register_default_shape_bounds_commands")
	public static function registerDefaultShapeBoundsCommands(state:hl.Bytes):Void;
	@:hlNative("flight", "flight_create_scale9_shape")
	public static function createScale9Shape(scale9Grid:flight._hl.ShapeScale9Grid):flight._hl.FlightNode;
	@:hlNative("flight", "flight_create_scale9_shape_data")
	public static function createScale9ShapeData(scale9Grid:flight._hl.ShapeScale9Grid):flight._hl.Scale9ShapeData;
	@:hlNative("flight", "flight_map_scale9_shape_commands")
	public static function mapScale9ShapeCommands(out:hl.Bytes, source:hl.Bytes, sourceLen:Int, mapper:flight._hl.ShapeScale9Mapper):Void;
	@:hlNative("flight", "flight_create_shape")
	public static function createShape():flight._hl.FlightNode;
	@:hlNative("flight", "flight_create_shape_data")
	public static function createShapeData():flight._hl.ShapeData;
	@:hlNative("flight", "flight_compute_shape_local_bounds_rectangle")
	public static function computeShapeLocalBoundsRectangle(out:flight._hl.Rectangle, source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_get_shape_bounds")
	public static function getShapeBounds(out:flight._hl.Rectangle, source:flight._hl.FlightNode, mode:Int):Bool;
	@:hlNative("flight", "flight_get_shape_command_count")
	public static function getShapeCommandCount(source:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_is_shape_empty")
	public static function isShapeEmpty(source:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_compute_shape_bounds_rectangle")
	public static function computeShapeBoundsRectangle(out:flight._hl.Rectangle, source:flight._hl.FlightNode, mode:Int):Bool;
	@:hlNative("flight", "flight_explain_shape_bounds")
	public static function explainShapeBounds(source:flight._hl.FlightNode, mode:Int):flight._hl.ShapeBoundsExplanation;
	@:hlNative("flight", "flight_normalize_shape_stroke_miter_limit")
	public static function normalizeShapeStrokeMiterLimit(miterLimit:Float):Float;
	@:hlNative("flight", "flight_normalize_shape_stroke_width")
	public static function normalizeShapeStrokeWidth(width:Float):Float;
	@:hlNative("flight", "flight_write_shape_geometry_command_end")
	public static function writeShapeGeometryCommandEnd(out:flight._hl.ShapeGeometryEnd, currentX:Float, currentY:Float, name:hl.Bytes, commands:hl.Bytes, commandsLen:Int, argumentIndex:Int):Bool;
	@:hlNative("flight", "flight_get_shape_fill_regions")
	public static function getShapeFillRegions(commands:hl.Bytes, commandsLen:Int):hl.Bytes;
	@:hlNative("flight", "flight_has_non_solid_shape_fill")
	public static function hasNonSolidShapeFill(commands:hl.Bytes, commandsLen:Int):Bool;
	@:hlNative("flight", "flight_has_shape_fill")
	public static function hasShapeFill(commands:hl.Bytes, commandsLen:Int):Bool;
	@:hlNative("flight", "flight_get_shape_stroke_regions")
	public static function getShapeStrokeRegions(commands:hl.Bytes, commandsLen:Int):hl.Bytes;
	@:hlNative("flight", "flight_has_non_solid_shape_stroke")
	public static function hasNonSolidShapeStroke(commands:hl.Bytes, commandsLen:Int):Bool;
	@:hlNative("flight", "flight_get_shape_stroke_outline_regions")
	public static function getShapeStrokeOutlineRegions(commands:hl.Bytes, commandsLen:Int):hl.Bytes;
	@:hlNative("flight", "flight_free_morph_shape_gradient_endpoint_explanation")
	public static function freeMorphShapeGradientEndpointExplanation(ptr:flight._hl.MorphShapeGradientEndpointExplanation):Void;
	@:hlNative("flight", "flight_free_shape_tessellation_explanation")
	public static function freeShapeTessellationExplanation(ptr:flight._hl.ShapeTessellationExplanation):Void;
	@:hlNative("flight", "flight_free_morph_shape_data")
	public static function freeMorphShapeData(ptr:flight._hl.MorphShapeData):Void;
	@:hlNative("flight", "flight_free_morph_shape_animation_target_ref")
	public static function freeMorphShapeAnimationTargetRef(ptr:flight._hl.MorphShapeAnimationTarget):Void;
	@:hlNative("flight", "flight_free_scale9_shape_data")
	public static function freeScale9ShapeData(ptr:flight._hl.Scale9ShapeData):Void;
	@:hlNative("flight", "flight_free_shape_data")
	public static function freeShapeData(ptr:flight._hl.ShapeData):Void;
	@:hlNative("flight", "flight_free_shape_bounds_explanation")
	public static function freeShapeBoundsExplanation(ptr:flight._hl.ShapeBoundsExplanation):Void;
}
