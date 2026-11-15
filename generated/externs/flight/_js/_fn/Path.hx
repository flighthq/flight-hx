package flight._js._fn;

@:jsRequire("flight")
extern class Path {
	@:native("flight_clean_path")
	public static function cleanPath(source:flight._js.Path, tolerance:Float, out:flight._js.Path, flattenTolerance:Float):Void;
	@:native("flight_contains_path_point")
	public static function containsPathPoint(path:flight._js.Path, px:Float, py:Float, tolerance:Float):Bool;
	@:native("flight_clone_path")
	public static function clonePath(source:flight._js.Path):flight._js.Path;
	@:native("flight_copy_path")
	public static function copyPath(out:flight._js.Path, source:flight._js.Path):Void;
	@:native("flight_dash_path")
	public static function dashPath(source:flight._js.Path, dash:Dynamic, dashLen:Int, dashOffset:Float, out:flight._js.Path, tolerance:Float):Void;
	@:native("flight_decimate_path")
	public static function decimatePath(source:flight._js.Path, tolerance:Float, out:flight._js.Path, flattenTolerance:Float):Void;
	@:native("flight_explain_path_morph_creation")
	public static function explainPathMorphCreation(start:flight._js.Path, end:flight._js.Path):flight._js.PathMorphCreationExplanation;
	@:native("flight_explain_stroke_path_tessellation")
	public static function explainStrokePathTessellation(path:flight._js.Path, style:flight._js.StrokeStyle, tolerance:Float):flight._js.StrokePathTessellationExplanation;
	@:native("flight_fit_path_curves")
	public static function fitPathCurves(source:flight._js.Path, tolerance:Float, out:flight._js.Path, flattenTolerance:Float):Void;
	@:native("flight_get_path_contour_lengths")
	public static function getPathContourLengths(path:flight._js.Path, tolerance:Float):Dynamic;
	@:native("flight_get_path_curvature_at_distance")
	public static function getPathCurvatureAtDistance(path:flight._js.Path, distance:Float, tolerance:Float):Float;
	@:native("flight_get_path_length")
	public static function getPathLength(path:flight._js.Path, tolerance:Float):Float;
	@:native("flight_get_path_nearest_point")
	public static function getPathNearestPoint(path:flight._js.Path, px:Float, py:Float, out:flight._js.Vector2, tolerance:Float):Float;
	@:native("flight_get_path_point_at_distance")
	public static function getPathPointAtDistance(path:flight._js.Path, distance:Float, out:flight._js.Vector2, tolerance:Float):Bool;
	@:native("flight_get_path_position_at_distance")
	public static function getPathPositionAtDistance(path:flight._js.Path, distance:Float, pointOut:flight._js.Vector2, tangentOut:flight._js.Vector2, tolerance:Float):Bool;
	@:native("flight_get_path_tangent_at_distance")
	public static function getPathTangentAtDistance(path:flight._js.Path, distance:Float, out:flight._js.Vector2, tolerance:Float):Bool;
	@:native("flight_get_cubic_bezier_curvature")
	public static function getCubicBezierCurvature(x0:Float, y0:Float, c1x:Float, c1y:Float, c2x:Float, c2y:Float, x1:Float, y1:Float, t:Float):Float;
	@:native("flight_get_cubic_bezier_point")
	public static function getCubicBezierPoint(x0:Float, y0:Float, c1x:Float, c1y:Float, c2x:Float, c2y:Float, x1:Float, y1:Float, t:Float, out:flight._js.Vector2):Void;
	@:native("flight_get_cubic_bezier_tangent")
	public static function getCubicBezierTangent(x0:Float, y0:Float, c1x:Float, c1y:Float, c2x:Float, c2y:Float, x1:Float, y1:Float, t:Float, out:flight._js.Vector2):Void;
	@:native("flight_get_path_segment_curvature_at_parameter")
	public static function getPathSegmentCurvatureAtParameter(path:flight._js.Path, segmentIndex:Int, t:Float):Float;
	@:native("flight_get_path_segment_point_at_parameter")
	public static function getPathSegmentPointAtParameter(path:flight._js.Path, segmentIndex:Int, t:Float, out:flight._js.Vector2):Bool;
	@:native("flight_get_path_segment_tangent_at_parameter")
	public static function getPathSegmentTangentAtParameter(path:flight._js.Path, segmentIndex:Int, t:Float, out:flight._js.Vector2):Bool;
	@:native("flight_get_quadratic_bezier_curvature")
	public static function getQuadraticBezierCurvature(x0:Float, y0:Float, cx:Float, cy:Float, x1:Float, y1:Float, t:Float):Float;
	@:native("flight_get_quadratic_bezier_point")
	public static function getQuadraticBezierPoint(x0:Float, y0:Float, cx:Float, cy:Float, x1:Float, y1:Float, t:Float, out:flight._js.Vector2):Void;
	@:native("flight_get_quadratic_bezier_tangent")
	public static function getQuadraticBezierTangent(x0:Float, y0:Float, cx:Float, cy:Float, x1:Float, y1:Float, t:Float, out:flight._js.Vector2):Void;
	@:native("flight_get_path_contour_orientation")
	public static function getPathContourOrientation(path:flight._js.Path, tolerance:Float):Int;
	@:native("flight_get_path_signed_area")
	public static function getPathSignedArea(path:flight._js.Path, tolerance:Float):Float;
	@:native("flight_create_path")
	public static function createPath(winding:Int):flight._js.Path;
	@:native("flight_append_path_arc")
	public static function appendPathArc(path:flight._js.Path, centerX:Float, centerY:Float, radius:Float, startAngle:Float, endAngle:Float, anticlockwise:Int, connectToCurrent:Int):Void;
	@:native("flight_append_path_circle")
	public static function appendPathCircle(path:flight._js.Path, centerX:Float, centerY:Float, radius:Float):Void;
	@:native("flight_append_path_close")
	public static function appendPathClose(path:flight._js.Path):Void;
	@:native("flight_append_path_cubic_curve_to")
	public static function appendPathCubicCurveTo(path:flight._js.Path, controlX1:Float, controlY1:Float, controlX2:Float, controlY2:Float, x:Float, y:Float):Void;
	@:native("flight_append_path_ellipse")
	public static function appendPathEllipse(path:flight._js.Path, centerX:Float, centerY:Float, radiusX:Float, radiusY:Float):Void;
	@:native("flight_append_path_elliptical_arc_to")
	public static function appendPathEllipticalArcTo(path:flight._js.Path, radiusX:Float, radiusY:Float, xAxisRotation:Float, largeArc:Bool, sweep:Bool, endX:Float, endY:Float):Void;
	@:native("flight_append_path_line_to")
	public static function appendPathLineTo(path:flight._js.Path, x:Float, y:Float):Void;
	@:native("flight_append_path_move_to")
	public static function appendPathMoveTo(path:flight._js.Path, x:Float, y:Float):Void;
	@:native("flight_append_path_polygon")
	public static function appendPathPolygon(path:flight._js.Path, points:Dynamic, pointsLen:Int):Void;
	@:native("flight_append_path_polyline")
	public static function appendPathPolyline(path:flight._js.Path, points:Dynamic, pointsLen:Int):Void;
	@:native("flight_append_path_quadratic_curve_to")
	public static function appendPathQuadraticCurveTo(path:flight._js.Path, controlX:Float, controlY:Float, x:Float, y:Float):Void;
	@:native("flight_append_path_rectangle")
	public static function appendPathRectangle(path:flight._js.Path, x:Float, y:Float, width:Float, height:Float):Void;
	@:native("flight_append_path_rounded_rectangle")
	public static function appendPathRoundedRectangle(path:flight._js.Path, x:Float, y:Float, width:Float, height:Float, radius:Float):Void;
	@:native("flight_append_path_rounded_rectangle_with_corner_radii")
	public static function appendPathRoundedRectangleWithCornerRadii(path:flight._js.Path, x:Float, y:Float, width:Float, height:Float, topLeft:Float, topRight:Float, bottomRight:Float, bottomLeft:Float):Void;
	@:native("flight_append_path_tangent_arc_to")
	public static function appendPathTangentArcTo(path:flight._js.Path, x1:Float, y1:Float, x2:Float, y2:Float, radius:Float):Void;
	@:native("flight_create_path_morph")
	public static function createPathMorph(start:flight._js.Path, end:flight._js.Path):Dynamic;
	@:native("flight_sample_path_morph")
	public static function samplePathMorph(out:flight._js.Path, morph:flight._js.PathMorph, progress:Float):Void;
	@:native("flight_reverse_path")
	public static function reversePath(source:flight._js.Path, out:flight._js.Path):Void;
	@:native("flight_stroke_path")
	public static function strokePath(path:flight._js.Path, style:flight._js.StrokeStyle, tolerance:Float):flight._js.Path;
	@:native("flight_tessellate_path")
	public static function tessellatePath(path:flight._js.Path, tolerance:Float):flight._js.PathMesh;
	@:native("flight_tessellate_path_into")
	public static function tessellatePathInto(path:flight._js.Path, out:flight._js.PathMesh, tolerance:Float):Void;
	@:native("flight_tessellate_path_typed")
	public static function tessellatePathTyped(path:flight._js.Path, tolerance:Float):flight._js.PathMeshTyped;
	@:native("flight_tessellate_path_typed_into")
	public static function tessellatePathTypedInto(path:flight._js.Path, out:flight._js.PathMeshTyped, tolerance:Float):Void;
	@:native("flight_tessellate_stroke_path")
	public static function tessellateStrokePath(path:flight._js.Path, style:flight._js.StrokeStyle, tolerance:Float):Dynamic;
	@:native("flight_transform_path")
	public static function transformPath(source:flight._js.Path, matrix:flight._js.Matrix, out:flight._js.Path):Void;
	@:native("flight_translate_path")
	public static function translatePath(source:flight._js.Path, dx:Float, dy:Float, out:flight._js.Path):Void;
	@:native("flight_free_path")
	public static function freePath(ptr:flight._js.Path):Void;
	@:native("flight_free_path_morph_creation_explanation")
	public static function freePathMorphCreationExplanation(ptr:flight._js.PathMorphCreationExplanation):Void;
	@:native("flight_free_stroke_path_tessellation_explanation")
	public static function freeStrokePathTessellationExplanation(ptr:flight._js.StrokePathTessellationExplanation):Void;
	@:native("flight_free_path_morph")
	public static function freePathMorph(ptr:flight._js.PathMorph):Void;
	@:native("flight_free_path_mesh")
	public static function freePathMesh(ptr:flight._js.PathMesh):Void;
	@:native("flight_free_path_mesh_typed")
	public static function freePathMeshTyped(ptr:flight._js.PathMeshTyped):Void;
}
