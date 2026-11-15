package flight._cpp._fn;

extern class Path {
	@:native("flight_clean_path")
	public static function cleanPath(source:flight._cpp.Path, tolerance:Float, out:flight._cpp.Path, flattenTolerance:Float):Void;
	@:native("flight_contains_path_point")
	public static function containsPathPoint(path:flight._cpp.Path, px:Float, py:Float, tolerance:Float):Bool;
	@:native("flight_clone_path")
	public static function clonePath(source:flight._cpp.Path):flight._cpp.Path;
	@:native("flight_copy_path")
	public static function copyPath(out:flight._cpp.Path, source:flight._cpp.Path):Void;
	@:native("flight_dash_path")
	public static function dashPath(source:flight._cpp.Path, dash:cpp.Star<cpp.Void>, dashLen:Int, dashOffset:Float, out:flight._cpp.Path, tolerance:Float):Void;
	@:native("flight_decimate_path")
	public static function decimatePath(source:flight._cpp.Path, tolerance:Float, out:flight._cpp.Path, flattenTolerance:Float):Void;
	@:native("flight_explain_path_morph_creation")
	public static function explainPathMorphCreation(start:flight._cpp.Path, end:flight._cpp.Path):flight._cpp.PathMorphCreationExplanation;
	@:native("flight_explain_stroke_path_tessellation")
	public static function explainStrokePathTessellation(path:flight._cpp.Path, style:flight._cpp.StrokeStyle, tolerance:Float):flight._cpp.StrokePathTessellationExplanation;
	@:native("flight_fit_path_curves")
	public static function fitPathCurves(source:flight._cpp.Path, tolerance:Float, out:flight._cpp.Path, flattenTolerance:Float):Void;
	@:native("flight_get_path_contour_lengths")
	public static function getPathContourLengths(path:flight._cpp.Path, tolerance:Float):cpp.Star<cpp.Void>;
	@:native("flight_get_path_curvature_at_distance")
	public static function getPathCurvatureAtDistance(path:flight._cpp.Path, distance:Float, tolerance:Float):Float;
	@:native("flight_get_path_length")
	public static function getPathLength(path:flight._cpp.Path, tolerance:Float):Float;
	@:native("flight_get_path_nearest_point")
	public static function getPathNearestPoint(path:flight._cpp.Path, px:Float, py:Float, out:flight._cpp.Vector2, tolerance:Float):Float;
	@:native("flight_get_path_point_at_distance")
	public static function getPathPointAtDistance(path:flight._cpp.Path, distance:Float, out:flight._cpp.Vector2, tolerance:Float):Bool;
	@:native("flight_get_path_position_at_distance")
	public static function getPathPositionAtDistance(path:flight._cpp.Path, distance:Float, pointOut:flight._cpp.Vector2, tangentOut:flight._cpp.Vector2, tolerance:Float):Bool;
	@:native("flight_get_path_tangent_at_distance")
	public static function getPathTangentAtDistance(path:flight._cpp.Path, distance:Float, out:flight._cpp.Vector2, tolerance:Float):Bool;
	@:native("flight_get_cubic_bezier_curvature")
	public static function getCubicBezierCurvature(x0:Float, y0:Float, c1x:Float, c1y:Float, c2x:Float, c2y:Float, x1:Float, y1:Float, t:Float):Float;
	@:native("flight_get_cubic_bezier_point")
	public static function getCubicBezierPoint(x0:Float, y0:Float, c1x:Float, c1y:Float, c2x:Float, c2y:Float, x1:Float, y1:Float, t:Float, out:flight._cpp.Vector2):Void;
	@:native("flight_get_cubic_bezier_tangent")
	public static function getCubicBezierTangent(x0:Float, y0:Float, c1x:Float, c1y:Float, c2x:Float, c2y:Float, x1:Float, y1:Float, t:Float, out:flight._cpp.Vector2):Void;
	@:native("flight_get_path_segment_curvature_at_parameter")
	public static function getPathSegmentCurvatureAtParameter(path:flight._cpp.Path, segmentIndex:Int, t:Float):Float;
	@:native("flight_get_path_segment_point_at_parameter")
	public static function getPathSegmentPointAtParameter(path:flight._cpp.Path, segmentIndex:Int, t:Float, out:flight._cpp.Vector2):Bool;
	@:native("flight_get_path_segment_tangent_at_parameter")
	public static function getPathSegmentTangentAtParameter(path:flight._cpp.Path, segmentIndex:Int, t:Float, out:flight._cpp.Vector2):Bool;
	@:native("flight_get_quadratic_bezier_curvature")
	public static function getQuadraticBezierCurvature(x0:Float, y0:Float, cx:Float, cy:Float, x1:Float, y1:Float, t:Float):Float;
	@:native("flight_get_quadratic_bezier_point")
	public static function getQuadraticBezierPoint(x0:Float, y0:Float, cx:Float, cy:Float, x1:Float, y1:Float, t:Float, out:flight._cpp.Vector2):Void;
	@:native("flight_get_quadratic_bezier_tangent")
	public static function getQuadraticBezierTangent(x0:Float, y0:Float, cx:Float, cy:Float, x1:Float, y1:Float, t:Float, out:flight._cpp.Vector2):Void;
	@:native("flight_get_path_contour_orientation")
	public static function getPathContourOrientation(path:flight._cpp.Path, tolerance:Float):Int;
	@:native("flight_get_path_signed_area")
	public static function getPathSignedArea(path:flight._cpp.Path, tolerance:Float):Float;
	@:native("flight_create_path")
	public static function createPath(winding:Int):flight._cpp.Path;
	@:native("flight_append_path_arc")
	public static function appendPathArc(path:flight._cpp.Path, centerX:Float, centerY:Float, radius:Float, startAngle:Float, endAngle:Float, anticlockwise:Int, connectToCurrent:Int):Void;
	@:native("flight_append_path_circle")
	public static function appendPathCircle(path:flight._cpp.Path, centerX:Float, centerY:Float, radius:Float):Void;
	@:native("flight_append_path_close")
	public static function appendPathClose(path:flight._cpp.Path):Void;
	@:native("flight_append_path_cubic_curve_to")
	public static function appendPathCubicCurveTo(path:flight._cpp.Path, controlX1:Float, controlY1:Float, controlX2:Float, controlY2:Float, x:Float, y:Float):Void;
	@:native("flight_append_path_ellipse")
	public static function appendPathEllipse(path:flight._cpp.Path, centerX:Float, centerY:Float, radiusX:Float, radiusY:Float):Void;
	@:native("flight_append_path_elliptical_arc_to")
	public static function appendPathEllipticalArcTo(path:flight._cpp.Path, radiusX:Float, radiusY:Float, xAxisRotation:Float, largeArc:Bool, sweep:Bool, endX:Float, endY:Float):Void;
	@:native("flight_append_path_line_to")
	public static function appendPathLineTo(path:flight._cpp.Path, x:Float, y:Float):Void;
	@:native("flight_append_path_move_to")
	public static function appendPathMoveTo(path:flight._cpp.Path, x:Float, y:Float):Void;
	@:native("flight_append_path_polygon")
	public static function appendPathPolygon(path:flight._cpp.Path, points:cpp.Star<cpp.Void>, pointsLen:Int):Void;
	@:native("flight_append_path_polyline")
	public static function appendPathPolyline(path:flight._cpp.Path, points:cpp.Star<cpp.Void>, pointsLen:Int):Void;
	@:native("flight_append_path_quadratic_curve_to")
	public static function appendPathQuadraticCurveTo(path:flight._cpp.Path, controlX:Float, controlY:Float, x:Float, y:Float):Void;
	@:native("flight_append_path_rectangle")
	public static function appendPathRectangle(path:flight._cpp.Path, x:Float, y:Float, width:Float, height:Float):Void;
	@:native("flight_append_path_rounded_rectangle")
	public static function appendPathRoundedRectangle(path:flight._cpp.Path, x:Float, y:Float, width:Float, height:Float, radius:Float):Void;
	@:native("flight_append_path_rounded_rectangle_with_corner_radii")
	public static function appendPathRoundedRectangleWithCornerRadii(path:flight._cpp.Path, x:Float, y:Float, width:Float, height:Float, topLeft:Float, topRight:Float, bottomRight:Float, bottomLeft:Float):Void;
	@:native("flight_append_path_tangent_arc_to")
	public static function appendPathTangentArcTo(path:flight._cpp.Path, x1:Float, y1:Float, x2:Float, y2:Float, radius:Float):Void;
	@:native("flight_create_path_morph")
	public static function createPathMorph(start:flight._cpp.Path, end:flight._cpp.Path):flight._cpp.PathMorph;
	@:native("flight_sample_path_morph")
	public static function samplePathMorph(out:flight._cpp.Path, morph:flight._cpp.PathMorph, progress:Float):Void;
	@:native("flight_reverse_path")
	public static function reversePath(source:flight._cpp.Path, out:flight._cpp.Path):Void;
	@:native("flight_stroke_path")
	public static function strokePath(path:flight._cpp.Path, style:flight._cpp.StrokeStyle, tolerance:Float):flight._cpp.Path;
	@:native("flight_tessellate_path")
	public static function tessellatePath(path:flight._cpp.Path, tolerance:Float):flight._cpp.PathMesh;
	@:native("flight_tessellate_path_into")
	public static function tessellatePathInto(path:flight._cpp.Path, out:flight._cpp.PathMesh, tolerance:Float):Void;
	@:native("flight_tessellate_path_typed")
	public static function tessellatePathTyped(path:flight._cpp.Path, tolerance:Float):flight._cpp.PathMeshTyped;
	@:native("flight_tessellate_path_typed_into")
	public static function tessellatePathTypedInto(path:flight._cpp.Path, out:flight._cpp.PathMeshTyped, tolerance:Float):Void;
	@:native("flight_tessellate_stroke_path")
	public static function tessellateStrokePath(path:flight._cpp.Path, style:flight._cpp.StrokeStyle, tolerance:Float):flight._cpp.PathMesh;
	@:native("flight_transform_path")
	public static function transformPath(source:flight._cpp.Path, matrix:flight._cpp.Matrix, out:flight._cpp.Path):Void;
	@:native("flight_translate_path")
	public static function translatePath(source:flight._cpp.Path, dx:Float, dy:Float, out:flight._cpp.Path):Void;
	@:native("flight_free_path")
	public static function freePath(ptr:flight._cpp.Path):Void;
	@:native("flight_free_path_morph_creation_explanation")
	public static function freePathMorphCreationExplanation(ptr:flight._cpp.PathMorphCreationExplanation):Void;
	@:native("flight_free_stroke_path_tessellation_explanation")
	public static function freeStrokePathTessellationExplanation(ptr:flight._cpp.StrokePathTessellationExplanation):Void;
	@:native("flight_free_path_morph")
	public static function freePathMorph(ptr:flight._cpp.PathMorph):Void;
	@:native("flight_free_path_mesh")
	public static function freePathMesh(ptr:flight._cpp.PathMesh):Void;
	@:native("flight_free_path_mesh_typed")
	public static function freePathMeshTyped(ptr:flight._cpp.PathMeshTyped):Void;
}
